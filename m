Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AA37B
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 02:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1907C433B5
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 02:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666059893;
	bh=ahqzlzV/Qs05A5nah1C8yqsfOcgXxjdWa7D1s6LX56A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gUi+StEhvBq2q0qcN80YsWcyC6zImKAg2cJeg5Pm+h+9odraviFOXsN2Uy2zaInlB
	 gcOg965LxPFUARopqwhQTMGJVxaP9AJyHUVlaPlD4wobUj5ELmdw2b/MV1M0HcJCe/
	 iXwVPUBocwD5qDfVB2o9oZlh8Ur+lkO9J+8lG69d4PS3GMKxCPkBFrJhnI2/3QaBWx
	 xHLjpWXFOt6lxWGdwl+eywbgTou6oOG6P00fELRmSSziJ6WlEAaqNxrYaxI32/SegG
	 9g78zkFlOrkOlLtw6z6vJit3p+wqqfKtyr/pfaPCYx8c3X//wHX7EHlSqW48+4CMcr
	 x4joWn3ZXBw2Q==
Received: by mail-ed1-f44.google.com with SMTP id a67so18489544edf.12
        for <loongarch@lists.linux.dev>; Mon, 17 Oct 2022 19:24:52 -0700 (PDT)
X-Gm-Message-State: ACrzQf3pZ5CihlYaKIKEv2xrAVoWXoakUUn7bURHCCS9d1c6POsRh5cA
	LWKktDwIr4zqhQZ+mrQiFZhTUeM5GiccyZZr/uc=
X-Google-Smtp-Source: AMsMyM6ogI6gORLAlleouq3SQebnILswU8F5xU0WqsJklBQ5vAvtAZEsSOKr5m3tcxJxST8XyXnq7YkEbgI+jjnuloE=
X-Received: by 2002:a05:6402:550e:b0:456:f79f:2bed with SMTP id
 fi14-20020a056402550e00b00456f79f2bedmr576124edb.106.1666059891208; Mon, 17
 Oct 2022 19:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221017022330.2383060-1-chenhuacai@loongson.cn> <b8792b1a71754d6eb88debe4d6c2c419@AcuMS.aculab.com>
In-Reply-To: <b8792b1a71754d6eb88debe4d6c2c419@AcuMS.aculab.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 18 Oct 2022 10:24:36 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5WM97+Um9ULjv7gT3i5pJ3GfQ8ex6NRNr6uzmMgdVY_Q@mail.gmail.com>
Message-ID: <CAAhV-H5WM97+Um9ULjv7gT3i5pJ3GfQ8ex6NRNr6uzmMgdVY_Q@mail.gmail.com>
Subject: Re: [PATCH V2] LoongArch: Add unaligned access support
To: David Laight <David.Laight@aculab.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi, David,

On Mon, Oct 17, 2022 at 8:58 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Huacai Chen
> > Sent: 17 October 2022 03:24
> >
> > Loongson-2 series (Loongson-2K500, Loongson-2K1000) don't support
> > unaligned access in hardware, while Loongson-3 series (Loongson-3A5000,
> > Loongson-3C5000) are configurable whether support unaligned access in
> > hardware. This patch add unaligned access emulation for those LoongArch
> > processors without hardware support.
> >
> ...
> > +     /*
> > +      * This load never faults.
> > +      */
> > +     __get_inst(&insn.word, pc, user);
>
> On what basis does it never fault?
> Any user access can fault.
> If nothing else another thread of the process can unmap
> the page.
Yes, this can happen, since __get_inst() handles fault, we can just
remove the comment.

>
> > +     if (user && !access_ok(addr, 8))
> > +             goto sigbus;
>
> Surely that is technically wrong - a two or four byte
> access is valid right at the end of valid user addreeses.
Yes, this check should be moved to each case.

>
> > +
> > +     if (insn.reg2i12_format.opcode == ldd_op ||
> > +             insn.reg2i14_format.opcode == ldptrd_op ||
> > +             insn.reg3_format.opcode == ldxd_op) {
> > +             res = unaligned_read(addr, &value, 8, 1);
>
> That is the most horrid indentation of long lines I've
> ever seen.
> I'd also guess you can common up some of this code
> by looking at the instruction field that include the
> transfer width.
>
> The long elsif list will generate horrid code.
> But maybe since you've just taken a fault it really
> doesn't matter.
> Indeed just emulating in C using byte accesses
> it probably fine.
I want to keep the assembly, because we can use more efficient methods
with the upcoming alternative mechanism.

Huacai
>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>
