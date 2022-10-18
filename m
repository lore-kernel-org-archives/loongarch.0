Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC2D1FAF
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 07:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86476C43470
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 07:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666078384;
	bh=6z4CPekj7hTwI5sK/ixrNU0u46ED2T3OOl2ihGXLEvQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SZMx413c3O46ZdgfI78d5dSuFk9B+zjNi2wWVHcl1/k4xn7Xm4P1Xd+odT0pZD6R8
	 df3b1VA2zDVNSA9kNh9llLDPdFlc47dC2M+0U65CDmo5qcU6SFKPMoL9l/sVeEZNSq
	 BEhPTLjOUSo8j9ZB4blppUVPAhPciBTuZcsXHWf6zM+2Stiowkhho6TloqG68pKdo8
	 fBT/ffSe1IILLFMwAtT93NQVgpNnPEIZ6XdjkGskWpFl9v5Gd3vgGPQjOSUFKxMkRz
	 8WreaWYEtEuSrPVUmY4CS+YxQcSmM2YHy6RSYll+YRSX2fwxCFafgFjOPuWG+juxd+
	 VZ5CM7dXoBm6g==
Received: by mail-ej1-f52.google.com with SMTP id d26so30103804ejc.8
        for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 00:33:04 -0700 (PDT)
X-Gm-Message-State: ACrzQf07f2qoA2q79yJ3yS22dDSdBknTiHCfaJJE8osiqONQ8ZWcL19j
	uNyovWYlL9h0+AnBoK5JW8vWR158Es/+wShKeRg=
X-Google-Smtp-Source: AMsMyM5fXnkItSLnziOitdoWO/zKeZi/s2QdJYrZD3n85vKn1dXRue12RPoUR18BnXpemMGHvll6jUbdrZNSu00SGyU=
X-Received: by 2002:a17:907:a044:b0:78d:b569:b891 with SMTP id
 gz4-20020a170907a04400b0078db569b891mr1268765ejc.224.1666078382731; Tue, 18
 Oct 2022 00:33:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221017022330.2383060-1-chenhuacai@loongson.cn>
 <b8792b1a71754d6eb88debe4d6c2c419@AcuMS.aculab.com> <CAAhV-H5WM97+Um9ULjv7gT3i5pJ3GfQ8ex6NRNr6uzmMgdVY_Q@mail.gmail.com>
 <c34a277a-1735-65e6-c97d-fcc2ac3d57e6@xen0n.name>
In-Reply-To: <c34a277a-1735-65e6-c97d-fcc2ac3d57e6@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 18 Oct 2022 15:32:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5y5wz0VzFEHrkDpap4wczWXBn_ibL3LW_JQyYkMzjDXQ@mail.gmail.com>
Message-ID: <CAAhV-H5y5wz0VzFEHrkDpap4wczWXBn_ibL3LW_JQyYkMzjDXQ@mail.gmail.com>
Subject: Re: [PATCH V2] LoongArch: Add unaligned access support
To: WANG Xuerui <kernel@xen0n.name>
Cc: David Laight <David.Laight@aculab.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 18, 2022 at 11:29 AM WANG Xuerui <kernel@xen0n.name> wrote:
>
> On 2022/10/18 10:24, Huacai Chen wrote:
> > Hi, David,
> >
> > On Mon, Oct 17, 2022 at 8:58 PM David Laight <David.Laight@aculab.com> wrote:
> >>
> >> From: Huacai Chen
> >>> Sent: 17 October 2022 03:24
> >>>
> >>> Loongson-2 series (Loongson-2K500, Loongson-2K1000) don't support
> >>> unaligned access in hardware, while Loongson-3 series (Loongson-3A5000,
> >>> Loongson-3C5000) are configurable whether support unaligned access in
> >>> hardware. This patch add unaligned access emulation for those LoongArch
> >>> processors without hardware support.
> >>>
> >> ...
> >>> +     /*
> >>> +      * This load never faults.
> >>> +      */
> >>> +     __get_inst(&insn.word, pc, user);
> >>
> >> On what basis does it never fault?
> >> Any user access can fault.
> >> If nothing else another thread of the process can unmap
> >> the page.
> > Yes, this can happen, since __get_inst() handles fault, we can just
> > remove the comment.
> >
> >>
> >>> +     if (user && !access_ok(addr, 8))
> >>> +             goto sigbus;
> >>
> >> Surely that is technically wrong - a two or four byte
> >> access is valid right at the end of valid user addreeses.
> > Yes, this check should be moved to each case.
> >
> >>
> >>> +
> >>> +     if (insn.reg2i12_format.opcode == ldd_op ||
> >>> +             insn.reg2i14_format.opcode == ldptrd_op ||
> >>> +             insn.reg3_format.opcode == ldxd_op) {
> >>> +             res = unaligned_read(addr, &value, 8, 1);
> >>
> >> That is the most horrid indentation of long lines I've
> >> ever seen.
> >> I'd also guess you can common up some of this code
> >> by looking at the instruction field that include the
> >> transfer width.
> >>
> >> The long elsif list will generate horrid code.
> >> But maybe since you've just taken a fault it really
> >> doesn't matter.
> >> Indeed just emulating in C using byte accesses
> >> it probably fine.
> > I want to keep the assembly, because we can use more efficient methods
> > with the upcoming alternative mechanism.
>
> What about my more structured approach in another reply that avoids the
> huge else-if conditions? Both the terrible line wraps and codegen could
> be avoided.
OK, let me try.

Huacai
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
