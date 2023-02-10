Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006F3A29
	for <loongarch@lists.linux.dev>; Fri, 10 Feb 2023 09:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF31C433A4
	for <loongarch@lists.linux.dev>; Fri, 10 Feb 2023 09:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676019908;
	bh=9U7CAvxUS1c6VeuyWWZ3cZARkJIL/0IO53QbqxCET9U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ql0iGiaOSKr1ANSwRtZLRZt02O4DtpdBeg5JVRlMlGVFTZW67xxSOXU6LrKY8l28h
	 NRbcd5Mp3tpY6HEqg0sLBa4KyvRzRwqlsEiz1Fp+1sfMG0t1AzKQ1N1mz8cmwzJaM3
	 rXtzhv9GSj2UCyvde2hztc3UutaUzoMDGlanj4JKisxx+sNR9gO/yAvavu4FNiDDo2
	 b37wTVoVfOTvrlYjdRaw47sBOze77sLlZoWYiBk7ESyne8i0rfA40AJx+0YEvI4D79
	 WN2xUQ1rohh1co5aMrZnAxhjMzM4yyZwUqm68xv90dlxbytWCBQ1qRbZBo4BHztS+D
	 rOn2fjJ2/+bIA==
Received: by mail-ej1-f51.google.com with SMTP id m2so13967054ejb.8
        for <loongarch@lists.linux.dev>; Fri, 10 Feb 2023 01:05:08 -0800 (PST)
X-Gm-Message-State: AO0yUKXcL8rtssg7seFBhPdGEJkAsZIh+1B27slKn54AqC9VM5s2ipl1
	OC9TSqsIgJCibkFCASFj49ETQsm1odzPIsg42SQ=
X-Google-Smtp-Source: AK7set9plhZBOmVMfSwgksajA1QtuS8dBN87wF4hZN1kxaK4auVE8/wT4XPf2Q4IupvW6dsq6Vpmf9yEnKwQ08bpPO8=
X-Received: by 2002:a17:907:366:b0:88d:ba79:4310 with SMTP id
 rs6-20020a170907036600b0088dba794310mr1286469ejb.0.1676019906867; Fri, 10 Feb
 2023 01:05:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1676018856-26520-1-git-send-email-tangyouling@loongson.cn> <1676018856-26520-2-git-send-email-tangyouling@loongson.cn>
In-Reply-To: <1676018856-26520-2-git-send-email-tangyouling@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 10 Feb 2023 17:04:55 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4VqA0HmrG1B_NNsX=7Stnun1B_TCQiKa-3h1Y_Y1JqOA@mail.gmail.com>
Message-ID: <CAAhV-H4VqA0HmrG1B_NNsX=7Stnun1B_TCQiKa-3h1Y_Y1JqOA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] LoongArch: Use la.pcrel instead of la.abs when
 it's trivially possible
To: Youling Tang <tangyouling@loongson.cn>
Cc: Xi Ruoyao <xry111@xry111.site>, Jinyang He <hejinyang@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, Youling,

On Fri, Feb 10, 2023 at 4:47 PM Youling Tang <tangyouling@loongson.cn> wrote:
>
> From: Xi Ruoyao <xry111@xry111.site>
>
> Let's start to kill la.abs inpreparation for the subsequent support of the
> PIE kernel.
>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  arch/loongarch/include/asm/stackframe.h | 2 +-
>  arch/loongarch/include/asm/uaccess.h    | 1 -
>  arch/loongarch/kernel/entry.S           | 2 +-
>  arch/loongarch/kernel/head.S            | 2 +-
>  arch/loongarch/mm/tlbex.S               | 3 +--
>  5 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/stackframe.h b/arch/loongarch/include/asm/stackframe.h
> index 4ca953062b5b..7deb043ce387 100644
> --- a/arch/loongarch/include/asm/stackframe.h
> +++ b/arch/loongarch/include/asm/stackframe.h
> @@ -90,7 +90,7 @@
>         .endm
>
>         .macro  set_saved_sp stackp temp temp2
> -       la.abs    \temp, kernelsp
> +       la.pcrel  \temp, kernelsp
>  #ifdef CONFIG_SMP
>         LONG_ADD  \temp, \temp, u0
>  #endif
> diff --git a/arch/loongarch/include/asm/uaccess.h b/arch/loongarch/include/asm/uaccess.h
> index 255899d4a7c3..0d22991ae430 100644
> --- a/arch/loongarch/include/asm/uaccess.h
> +++ b/arch/loongarch/include/asm/uaccess.h
> @@ -22,7 +22,6 @@
>  extern u64 __ua_limit;
>
>  #define __UA_ADDR      ".dword"
> -#define __UA_LA                "la.abs"
>  #define __UA_LIMIT     __ua_limit
>
>  /*
> diff --git a/arch/loongarch/kernel/entry.S b/arch/loongarch/kernel/entry.S
> index d53b631c9022..2566977f2f68 100644
> --- a/arch/loongarch/kernel/entry.S
> +++ b/arch/loongarch/kernel/entry.S
> @@ -20,7 +20,7 @@
>         .align  5
>  SYM_FUNC_START(handle_syscall)
>         csrrd   t0, PERCPU_BASE_KS
> -       la.abs  t1, kernelsp
> +       la.pcrel        t1, kernelsp
Retab the whole function to align the first parameter, please.

Huacai
>         add.d   t1, t1, t0
>         move    t2, sp
>         ld.d    sp, t1, 0
> diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
> index 57bada6b4e93..aa6181714ec3 100644
> --- a/arch/loongarch/kernel/head.S
> +++ b/arch/loongarch/kernel/head.S
> @@ -117,7 +117,7 @@ SYM_CODE_START(smpboot_entry)
>         li.w            t0, 0x00                # FPE=0, SXE=0, ASXE=0, BTE=0
>         csrwr           t0, LOONGARCH_CSR_EUEN
>
> -       la.abs          t0, cpuboot_data
> +       la.pcrel        t0, cpuboot_data
>         ld.d            sp, t0, CPU_BOOT_STACK
>         ld.d            tp, t0, CPU_BOOT_TINFO
>
> diff --git a/arch/loongarch/mm/tlbex.S b/arch/loongarch/mm/tlbex.S
> index 58781c6e4191..3dd2a9615cd9 100644
> --- a/arch/loongarch/mm/tlbex.S
> +++ b/arch/loongarch/mm/tlbex.S
> @@ -24,8 +24,7 @@
>         move            a0, sp
>         REG_S           a2, sp, PT_BVADDR
>         li.w            a1, \write
> -       la.abs          t0, do_page_fault
> -       jirl            ra, t0, 0
> +       bl              do_page_fault
>         RESTORE_ALL_AND_RET
>         SYM_FUNC_END(tlb_do_page_fault_\write)
>         .endm
> --
> 2.37.3
>
>
