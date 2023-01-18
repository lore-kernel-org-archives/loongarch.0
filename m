Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2EF1FCC
	for <loongarch@lists.linux.dev>; Wed, 18 Jan 2023 04:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D6CC433EF
	for <loongarch@lists.linux.dev>; Wed, 18 Jan 2023 04:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674015254;
	bh=DsHr7RdQAbFtpGhEJT3eP0apm6qi5+vRFlHbaxFyhQ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jZ8njg9P3UtpGk+oq6Y40yRF/26q6+k6tYknUABOAqyFffb2nYf52s9rQSWMvy4r8
	 XhxBUd5BBck2878aW4Acn0gxKHlo3ZyWbt348e6vWi7kVvidA0FmOayn4h81m67tyb
	 P2dgvNPq+ESPMvr6ethXcSQmwwJoyHoC8j6KGrVkfO/P0UUrSXxAPRSJ4zX0XF6T2w
	 hvVx8mou9yq+BPuXmON0B1ZOwUiOdObHGxuHf6uuyr6BCLxzwIbDaaeuUj/0RSXyIN
	 MGG1Ij4dnehyR/1qd7fjSsnUR0zaKntE8lWm5gPh/tbaZLvR2LU1y5Pa5Srcijnlmc
	 zcWG/12NXmxHA==
Received: by mail-ed1-f53.google.com with SMTP id m21so47942701edc.3
        for <loongarch@lists.linux.dev>; Tue, 17 Jan 2023 20:14:14 -0800 (PST)
X-Gm-Message-State: AFqh2kpll3UFDSq+uoBT3BXTn6WDx5D+q2FYW20Q2o6MI23ykth8Wy+f
	d0S5WS5TS8KA1xSciiaLlxXl7tK3qrcO7bFDfS4=
X-Google-Smtp-Source: AMrXdXtdZ2+j7klgm/3njYojLtWs1G75V8ZRsG1ljqoq6b61jBrU0xw9lHykItE+3ae6qL4NgDupJqVz4pm3QEDpftY=
X-Received: by 2002:a05:6402:40a:b0:49d:aca5:9ae0 with SMTP id
 q10-20020a056402040a00b0049daca59ae0mr674735edv.106.1674015252772; Tue, 17
 Jan 2023 20:14:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1674007261-9198-1-git-send-email-yangtiezhu@loongson.cn> <1674007261-9198-5-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1674007261-9198-5-git-send-email-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 18 Jan 2023 12:14:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7Dt5MhaMU1=D9HxPFR+xjjoQG6RguaYMydy=v_jvrtiA@mail.gmail.com>
Message-ID: <CAAhV-H7Dt5MhaMU1=D9HxPFR+xjjoQG6RguaYMydy=v_jvrtiA@mail.gmail.com>
Subject: Re: [PATCH v12 4/5] LoongArch: Mark some assembler symbols as non-kprobe-able
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Masami Hiramatsu <mhiramat@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

If memcpy should be blacklisted, then what about memset and memmove?

Huacai

On Wed, Jan 18, 2023 at 10:01 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> Some assembler symbols are not kprobe safe, such as handle_syscall
> (used as syscall exception handler), *memcpy* (may cause recursive
> exceptions), they can not be instrumented, just blacklist them for
> kprobing.
>
> Here is a related problem and discussion:
> Link: https://lore.kernel.org/lkml/20230114143859.7ccc45c1c5d9ce302113ab0a@kernel.org/
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/include/asm/asm.h | 10 ++++++++++
>  arch/loongarch/kernel/entry.S    |  1 +
>  arch/loongarch/lib/memcpy.S      |  3 +++
>  3 files changed, 14 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/asm.h b/arch/loongarch/include/asm/asm.h
> index 40eea6a..f591b32 100644
> --- a/arch/loongarch/include/asm/asm.h
> +++ b/arch/loongarch/include/asm/asm.h
> @@ -188,4 +188,14 @@
>  #define PTRLOG         3
>  #endif
>
> +/* Annotate a function as being unsuitable for kprobes. */
> +#ifdef CONFIG_KPROBES
> +#define _ASM_NOKPROBE(name)                            \
> +       .pushsection "_kprobe_blacklist", "aw";         \
> +       .quad   name;                                   \
> +       .popsection
> +#else
> +#define _ASM_NOKPROBE(name)
> +#endif
> +
>  #endif /* __ASM_ASM_H */
> diff --git a/arch/loongarch/kernel/entry.S b/arch/loongarch/kernel/entry.S
> index d53b631..55e23b1 100644
> --- a/arch/loongarch/kernel/entry.S
> +++ b/arch/loongarch/kernel/entry.S
> @@ -67,6 +67,7 @@ SYM_FUNC_START(handle_syscall)
>
>         RESTORE_ALL_AND_RET
>  SYM_FUNC_END(handle_syscall)
> +_ASM_NOKPROBE(handle_syscall)
>
>  SYM_CODE_START(ret_from_fork)
>         bl      schedule_tail           # a0 = struct task_struct *prev
> diff --git a/arch/loongarch/lib/memcpy.S b/arch/loongarch/lib/memcpy.S
> index 7c07d59..3b7e1de 100644
> --- a/arch/loongarch/lib/memcpy.S
> +++ b/arch/loongarch/lib/memcpy.S
> @@ -17,6 +17,7 @@ SYM_FUNC_START(memcpy)
>         ALTERNATIVE     "b __memcpy_generic", \
>                         "b __memcpy_fast", CPU_FEATURE_UAL
>  SYM_FUNC_END(memcpy)
> +_ASM_NOKPROBE(memcpy)
>
>  EXPORT_SYMBOL(memcpy)
>
> @@ -41,6 +42,7 @@ SYM_FUNC_START(__memcpy_generic)
>  2:     move    a0, a3
>         jr      ra
>  SYM_FUNC_END(__memcpy_generic)
> +_ASM_NOKPROBE(__memcpy_generic)
>
>  /*
>   * void *__memcpy_fast(void *dst, const void *src, size_t n)
> @@ -93,3 +95,4 @@ SYM_FUNC_START(__memcpy_fast)
>  3:     move    a0, a3
>         jr      ra
>  SYM_FUNC_END(__memcpy_fast)
> +_ASM_NOKPROBE(__memcpy_fast)
> --
> 2.1.0
>
