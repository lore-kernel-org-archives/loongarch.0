Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C5B366
	for <loongarch@lists.linux.dev>; Tue, 30 Aug 2022 07:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92942C433D6
	for <loongarch@lists.linux.dev>; Tue, 30 Aug 2022 07:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661843441;
	bh=aUwZvFPgGPgQxLQm3ylFwunvJW/D4Qz/bEeYplvQR78=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c9uSxjfDl4qaLcZ5MadHTwWSPttIIsyGGo1y4xC+NBR8tZYA3CxmYRCiCBPNTquC3
	 R8YxLsncJx0AFoFck02ZSI7FZ4SUi9ePD2hKJyhF/9OTl+ORliLaO+mPu7snTvDLnN
	 mWR6d8YWFDL2bVgvlqlJnyIV+2HPdwB7vfmf3W0D8H5aGqX0wLSYg34dlMouF3aacN
	 WIujNiA8fpmuKM38YpqRcFjUVg7PqtBvr1MM6YthTuZZ4U5gfGI/Z1J584Wp3YHGdN
	 XRwKXSiqC2/VuCukQR27DmS2XbfPNu7WEFkAmR0Ho+SemFYw+Mr9kZMaslJWW5qUGj
	 TNAPWA2MGiWRw==
Received: by mail-vs1-f44.google.com with SMTP id m66so10588020vsm.12
        for <loongarch@lists.linux.dev>; Tue, 30 Aug 2022 00:10:41 -0700 (PDT)
X-Gm-Message-State: ACgBeo22ZLvnBy3vebACUVS1QaxaADrDbtP6tNLAj5z29Ygn4V8Cn63U
	9PzuVEfIUQOXYV3bg9HouaLCTDKB/b451F8EUqI=
X-Google-Smtp-Source: AA6agR5eMH6mzqudoP6EpTbEAAsSK9Tmk7AaUu96e4Qa164/wnyTqJOVYvqpClplpYFGtKtF3OHjJzDFAc/IcngWzbY=
X-Received: by 2002:a05:6102:30bc:b0:390:da09:3a8c with SMTP id
 y28-20020a05610230bc00b00390da093a8cmr2867659vsd.84.1661843440489; Tue, 30
 Aug 2022 00:10:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220829133146.15236-1-xry111@xry111.site> <20220829133146.15236-6-xry111@xry111.site>
 <CAAhV-H77jQvcJL=LF0dknd7EjiWYMZL3ZRMM1drsGkO33UM_Jg@mail.gmail.com> <4033aec9-8df5-53ae-59e1-9ec3ade5f6d7@xen0n.name>
In-Reply-To: <4033aec9-8df5-53ae-59e1-9ec3ade5f6d7@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 30 Aug 2022 15:10:29 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4PXsBop6c3or92hv01YCiY=JFLnTwjSykaeN21+YvwFQ@mail.gmail.com>
Message-ID: <CAAhV-H4PXsBop6c3or92hv01YCiY=JFLnTwjSykaeN21+YvwFQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] LoongArch: Support PC-relative relocations in modules
To: WANG Xuerui <kernel@xen0n.name>
Cc: Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, Youling Tang <tangyouling@loongson.cn>, 
	Jinyang He <hejinyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 30, 2022 at 9:42 AM WANG Xuerui <kernel@xen0n.name> wrote:
>
> On 2022/8/29 23:08, Huacai Chen wrote:
> > [snip]
> >> +static int apply_r_larch_pcala(struct module *mod, u32 *location, Elf_Addr v,
> >> +                       s64 *rela_stack, size_t *rela_stack_top, unsigned int type)
> >> +{
> >> +       union loongarch_instruction *insn = (union loongarch_instruction *)location;
> >> +       /* Use s32 for a sign-extension deliberately. */
> >> +       s32 offset_hi20 = (void *)((v + 0x800) & ~0xfff) -
> >> +               (void *)((Elf_Addr)location & ~0xfff);
> >> +       Elf_Addr anchor = (((Elf_Addr)location) & ~0xfff) + offset_hi20;
> >> +       ptrdiff_t offset_rem = (void *)v - (void *)anchor;
> >> +
> >> +       switch (type) {
> >> +       case R_LARCH_PCALA_HI20:
> >> +               v = offset_hi20 >> 12;
> >> +               break;
> >> +       case R_LARCH_PCALA64_LO20:
> >> +               v = offset_rem >> 32;
> >> +               break;
> >> +       case R_LARCH_PCALA64_HI12:
> >> +               v = offset_rem >> 52;
> >> +               break;
> >> +       default:
> >> +               /* Do nothing. */
> >> +       }
> >> +
> >> +       switch (type) {
> >> +       case R_LARCH_PCALA_HI20:
> >> +       case R_LARCH_PCALA64_LO20:
> >> +               insn->reg1i20_format.immediate = v & 0xfffff;
> >> +               break;
> >> +       case R_LARCH_PCALA_LO12:
> >> +       case R_LARCH_PCALA64_HI12:
> >> +               insn->reg2i12_format.immediate = v & 0xfff;
> >> +               break;
> >> +       default:
> >> +               pr_err("%s: Unsupport relocation type %u\n", mod->name, type);
> >> +               return -EINVAL;
> >> +       }
> > Can we merge the two switch here?
>
> IMO leaving as-is or even splitting into two functions would be
> acceptable, as the two switches are performing two different things --
> namely "adjustFixupValue" (in LLVM-speak) and actually inserting the
> value into the insn word. But an argument for merging the two can be
> made too, because the v2.00 reloc types are purposely designed with
> unique use case for each, meaning there is actually no flexibility in
> between the fixup value's calculation and application. So I think this
> eventually comes down to coder's preference?
Merging them can just make me understand the logic better, and save
some lines. :)

Huacai
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
