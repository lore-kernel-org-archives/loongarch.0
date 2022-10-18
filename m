Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9757B
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 01:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D726C433B5
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 01:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666058364;
	bh=afqllA9B+pLQ3PQHZjpVZ98NziD/czmrfnB4F3JDvfY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nsfq06HSNWpqo/8lAVbttFBI+Ee1jSsAlYogNkalZXJHyDKO0GihPIbbo53psvYsH
	 scSQSVKz6/hGQa2PMClA8DgVmvUKZphQ5idYXf+VaH3yRTBLlnJ7boXm2bnJnlqIsy
	 iXdf/z39dDfx0MeKUWrOU1XZiyyzGhO4dM0B5JF7GKgAbPCQDAdg9JltHezdCQoOIu
	 OcYgbdso+KWq5tgBoB+vDS6pOi87/Ovz/WJ7HwtYUeKxbPo3ygyRpC/epH8Bircfyk
	 zcu8jD6rD0EpWUNoyEUPAVCzwN5dYLmHNO0wE6p1eo0htOTYN32zHKRnbEF8AsKbzn
	 9sBPlJZMH1YHQ==
Received: by mail-ej1-f46.google.com with SMTP id b2so28968402eja.6
        for <loongarch@lists.linux.dev>; Mon, 17 Oct 2022 18:59:24 -0700 (PDT)
X-Gm-Message-State: ACrzQf1RoA/pKiIrmtY331kwPWdJgRpiLtwlyDEamtFzlW+HgxQ+NDua
	32z2DzPuxnjFRg/kxHxUZBnjIlU0ChWbhVmdnII=
X-Google-Smtp-Source: AMsMyM6RoqfZP7DPHNWQUxMV6MeJZVtdRdzC5IoZxellyAfNsD9ory7aqVzhQEuYMWglSXx6948ZfSD1sT5OhQmKr3g=
X-Received: by 2002:a17:907:7f05:b0:78d:e869:f2fe with SMTP id
 qf5-20020a1709077f0500b0078de869f2femr452896ejc.684.1666058362517; Mon, 17
 Oct 2022 18:59:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221017125209.2639531-1-chenhuacai@loongson.cn>
 <39ea2a6fee654b68974ef38237a61e80@AcuMS.aculab.com> <b31086df86febba62f76ff9ec775b7a6e16c1933.camel@xry111.site>
In-Reply-To: <b31086df86febba62f76ff9ec775b7a6e16c1933.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 18 Oct 2022 09:59:09 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5XoJqbnh+DzX0Gsq_sDTLB7bK9H7-=fLTPuA4s7VY+Ug@mail.gmail.com>
Message-ID: <CAAhV-H5XoJqbnh+DzX0Gsq_sDTLB7bK9H7-=fLTPuA4s7VY+Ug@mail.gmail.com>
Subject: Re: [PATCH V3] LoongArch: Add unaligned access support
To: Xi Ruoyao <xry111@xry111.site>
Cc: David Laight <David.Laight@aculab.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Arnd Bergmann <arnd@arndb.de>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 17, 2022 at 10:20 PM Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Mon, 2022-10-17 at 13:11 +0000, David Laight wrote:
> > From: Huacai Chen
> > > Sent: 17 October 2022 13:52
> > >
> > > Loongson-2 series (Loongson-2K500, Loongson-2K1000) don't support
> > > unaligned access in hardware, while Loongson-3 series (Loongson-3A5000,
> > > Loongson-3C5000) are configurable whether support unaligned access in
> > > hardware. This patch add unaligned access emulation for those LoongArch
> > > processors without hardware support.
> > >
> > .....
> > > +       } else if (insn.reg2i12_format.opcode == fstd_op ||
> > > +               insn.reg3_format.opcode == fstxd_op) {
> > > +               value = read_fpr(insn.reg2i12_format.rd);
> > > +               res = unaligned_write(addr, value, 8);
> > > +               if (res)
> > > +                       goto fault;
> > > +       } else if (insn.reg2i12_format.opcode == fsts_op ||
> > > +               insn.reg3_format.opcode == fstxs_op) {
> > > +               value = read_fpr(insn.reg2i12_format.rd);
> > > +               res = unaligned_write(addr, value, 4);
> > > +               if (res)
> > > +                       goto fault;
> >
> > Are those right?
> > Shouldn't something be converting from 'double' to
> > 'float' in there?
> > And generating SIGFPE (?) if the exponent is out of range.
>
> To me it looks right.
>
> The semantic of FST.S does not include conversion.  It just stores the
> lower 32 bits of a floating-point register into the memory.  If someone
> attempts to use FST.S to convert a double into a float, it's a
> programming error.
Agree.

>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
