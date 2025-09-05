Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB5D21FF55
	for <loongarch@lists.linux.dev>; Fri,  5 Sep 2025 04:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757046992; cv=none; b=tH90xThiAaL7LSWH4lHkT76ziJ/p/DKpRUCQdYLIL9vONk5QboCjP/tjHNJU0zfnYfclnE3kHRSAP5wuZ0hbBl9IwDdg/uV4I5EYYEzKAWFq4zeJkz9d8VfL8h0ooGZcreaVmfUDy7tC52Lm1CL7bSjgEY/6ESpmhgk/E+EuTCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757046992; c=relaxed/simple;
	bh=yPCY3lVmywqDkbOmEn53ZKo6Bn/QGuG7ByGf4+wtExM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sOusVzGCWhMYWt1y9Qx9KceFigoMewHCrspvadNea3R+EtHkhsyE6eWnu7JaOlDaqSnrCpe5hfw4jY1jrOPg/3kZWQ5t7H68RHx3J06osiVExJ6n9Oo1oygOZ8W15SuIMswk6gTxJHaK0gMrMEVBTpNyLAsJyFiz4rUbPuqBKSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uKaYSqtP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uKaYSqtP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533DEC4CEFA
	for <loongarch@lists.linux.dev>; Fri,  5 Sep 2025 04:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757046992;
	bh=yPCY3lVmywqDkbOmEn53ZKo6Bn/QGuG7ByGf4+wtExM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uKaYSqtP9smPhhSCZidz78a6QxH+dttpBub/t2qBY9ov//1OJUAFh4sJk/2bY16rb
	 wlxi7/J53gzkwWlUf0TVxGn4kS0kIxccBoeT+MEKt5LIhBudNC9Vw4Dyzk+YasrMpN
	 OY/YqVcLna9qf8aQO6CwhYrYTxQ/ig/01OjwzwVxXbHaF6BhfMHL8qknY6ZHwfarO+
	 HsYldM2DOcrf9MFExGrmLK2bz3nAa7FrcUhWIanATQ4Twz528QJe0v3tCvFsbyjKFH
	 O7auJBCG6yOvfDiWhtemVxTg0+tj9T9QQmsVMrSxBw9FrZyB9n/ISyuGWr3LBs+VAB
	 4E+RtBPDTJ9JQ==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61a8c134533so3188882a12.3
        for <loongarch@lists.linux.dev>; Thu, 04 Sep 2025 21:36:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoZyP2g2hpz9YoyIF6pqg603Nqk9SFmLA9JlddTXA37VDiPdTjEYVGHwbKRCiw2zp9X7sl6KBzXfg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHMXOlE1V5fyS2MwPXN1H5PmKCJF9Cd1B/xY1QAI9CNnjWJJzN
	tZ+L/Kk4KxXMVlfZZ4IOsOQjCHstW2STDef6wcyGLzpW2chMox/Ce9GaRjdFJBzzWrGDxeX7khU
	TOQgD317zP09y6OWYr4EDtyIZDMD6Utk=
X-Google-Smtp-Source: AGHT+IHPAGa1sckTb6ehpoUalUQEhlunhpypz7EyS3aWkqsVSyz9d23QdzUyYH3FwjOwTr5LGVpOaOIwvtsPZanjpyQ=
X-Received: by 2002:a05:6402:84e:b0:61c:f0cb:94f1 with SMTP id
 4fb4d7f45d1cf-61d26fd1008mr19027061a12.18.1757046990861; Thu, 04 Sep 2025
 21:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250901072156.31361-1-yangtiezhu@loongson.cn>
 <20250901072156.31361-3-yangtiezhu@loongson.cn> <20250901081904.GB4067720@noisy.programming.kicks-ass.net>
 <82c913b9-4403-cde9-0542-5bd6e04415f5@loongson.cn> <wt4qpgi5isj5m6wq33pomvm6borvafuzktekc7lgtoitscar5q@brixzj3lccbw>
 <ccbb40c1-5f2d-77e9-e8d2-52f2fdbad645@loongson.cn> <CAAhV-H5qhKepa-8sz3_AC=_RCChbVeEmnHKESMqpiJ0phMORbg@mail.gmail.com>
 <52056c29-4f21-83c9-db1f-ebd1875a3675@loongson.cn> <CAAhV-H47VKERJCKRi7uAS7OmCWaE4yxZ07Hwz_si2DMVRDrsag@mail.gmail.com>
 <ybv2ndrzbqztkctzwhfphpdqrqbxlougs75glm22rcuzdmnrfp@lqwcms3j2d55> <4thrzifl6ntk7kdf65egt4srzkbrxqoqf7yzmasblwvaq3qwmt@vigfgpbxzjkq>
In-Reply-To: <4thrzifl6ntk7kdf65egt4srzkbrxqoqf7yzmasblwvaq3qwmt@vigfgpbxzjkq>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 5 Sep 2025 12:36:16 +0800
X-Gmail-Original-Message-ID: <CAAhV-H53DkR6oK1chXQtoczqxYBCU-FMKrD99bjEvfXapND1Vw@mail.gmail.com>
X-Gm-Features: Ac12FXzyaxEAfv0tGTmiXTq2qXlqAh3gd8BmwcT2vD2WrTQ69D2Xh_g7cxepTEA
Message-ID: <CAAhV-H53DkR6oK1chXQtoczqxYBCU-FMKrD99bjEvfXapND1Vw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] objtool/LoongArch: Fix unreachable instruction
 warnings about EFISTUB
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Josh,

On Fri, Sep 5, 2025 at 5:46=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.org>=
 wrote:
>
> On Thu, Sep 04, 2025 at 10:39:30AM -0700, Josh Poimboeuf wrote:
> > On Thu, Sep 04, 2025 at 11:59:30AM +0800, Huacai Chen wrote:
> > > This is from RISC-V code.
> > >
> > > __HEAD
> > > SYM_CODE_START(_start)
> > >         /*
> > >          * Image header expected by Linux boot-loaders. The image hea=
der data
> > >          * structure is described in asm/image.h.
> > >          * Do not modify it without modifying the structure and all b=
ootloaders
> > >          * that expects this header format!!
> > >          */
> > > #ifdef CONFIG_EFI
> > >         /*
> > >          * This instruction decodes to "MZ" ASCII required by UEFI.
> > >          */
> > >         c.li s4,-13
> > >         j _start_kernel
> > > #else
> > >         /* jump to start kernel */
> > >         j _start_kernel
> > >         /* reserved */
> > >         .word 0
> > > #endif
> > >
> > > The HEAD section has instructions, if you change it into a data
> > > section then it loses the "x" attribute.
>
> Actually, the "x" attribute isn't needed for vmlinux.  The vmlinux
> linker script places it in the text region regardless.
>
> Moving the data to a data section should be really simple, something
> like the below.
>
> And yes, even the above RISC-V code can be in a data section.  Those
> instructions are part of the 'struct riscv_image_header' data structure.
This may work but also look strange (code in data section), it is more
like a "workaround". :)

Huacai

>
> diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
> index e3865e92a917a..c42500d9fad81 100644
> --- a/arch/loongarch/kernel/head.S
> +++ b/arch/loongarch/kernel/head.S
> @@ -17,7 +17,7 @@
>
>  #include "efi-header.S"
>
> -       __HEAD
> +       __HEADDATA
>
>  _head:
>         .word   IMAGE_DOS_SIGNATURE     /* "MZ", MS-DOS header */
> diff --git a/arch/loongarch/kernel/vmlinux.lds.S b/arch/loongarch/kernel/=
vmlinux.lds.S
> index 08ea921cdec16..fc35ef349aba6 100644
> --- a/arch/loongarch/kernel/vmlinux.lds.S
> +++ b/arch/loongarch/kernel/vmlinux.lds.S
> @@ -38,6 +38,7 @@ SECTIONS
>         . =3D VMLINUX_LOAD_ADDRESS;
>
>         _text =3D .;
> +       HEAD_DATA_SECTION
>         HEAD_TEXT_SECTION
>
>         . =3D ALIGN(PECOFF_SEGMENT_ALIGN);
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmli=
nux.lds.h
> index 6b2311fa41393..c74492e1baa5a 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -629,6 +629,11 @@
>                 *(.static_call.text)                                    \
>                 __static_call_text_end =3D .;
>
> +#define HEAD_DATA_SECTION                                              \
> +       .head.data : AT(ADDR(.head.data) - LOAD_OFFSET) {               \
> +               KEEP(*(.head.data))                                     \
> +       }
> +
>  /* Section used for early init (in .S files) */
>  #define HEAD_TEXT  KEEP(*(.head.text))
>
> diff --git a/include/linux/init.h b/include/linux/init.h
> index 331886205049e..fcb02ab3faae2 100644
> --- a/include/linux/init.h
> +++ b/include/linux/init.h
> @@ -98,6 +98,7 @@
>
>  /* For assembly routines */
>  #define __HEAD         .section        ".head.text","ax"
> +#define __HEADDATA     .section        ".head.data","aw"
>  #define __INIT         .section        ".init.text","ax"
>  #define __FINIT                .previous
>
>
