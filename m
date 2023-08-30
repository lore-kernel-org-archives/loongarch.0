Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3E5EA1
	for <loongarch@lists.linux.dev>; Wed, 30 Aug 2023 02:25:09 +0000 (UTC)
Received: from loongson.cn (unknown [209.85.128.179])
	by gateway (Coremail) with SMTP id _____8Cx77uCqO5kNPYcAA--.119S3;
	Wed, 30 Aug 2023 10:25:07 +0800 (CST)
Received: from mail-yw1-f179.google.com (unknown [209.85.128.179])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxbSN_qO5kT+dmAA--.3609S3;
	Wed, 30 Aug 2023 10:25:06 +0800 (CST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-58cbdf3eecaso57278457b3.0
        for <loongarch@lists.linux.dev>; Tue, 29 Aug 2023 19:25:06 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywhqj9zrZ8mKgLYuoAgeef0tZGy2o93R7Jn5z82BRHS40W1Yw+z
	nGRupzJmhRcfq0HyD70cVrQRgxNOB7M9ikCTbAlO8A==
X-Google-Smtp-Source: AGHT+IHwn3cnwbRbMtDklB0MxCXJuVfILjzfHk14nmRQkuifQSiZdsDYSve+CjViqkipLWbpIVFH0w8x/jg4DlRT1Cs=
X-Received: by 2002:a0d:d4c9:0:b0:595:863:3852 with SMTP id
 w192-20020a0dd4c9000000b0059508633852mr837392ywd.19.1693362303032; Tue, 29
 Aug 2023 19:25:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230830010435.2969785-1-liweihao@loongson.cn>
In-Reply-To: <20230830010435.2969785-1-liweihao@loongson.cn>
From: WANG Rui <wangrui@loongson.cn>
Date: Wed, 30 Aug 2023 10:24:51 +0800
X-Gmail-Original-Message-ID: <CAHirt9i0tcUCuQ5ZL657MOZ4CUg0bpfiNbo01WLhPAwsLjgM+g@mail.gmail.com>
Message-ID: <CAHirt9i0tcUCuQ5ZL657MOZ4CUg0bpfiNbo01WLhPAwsLjgM+g@mail.gmail.com>
Subject: Re: [PATCH 1/1] LoongArch: adjust copy/clear_user exception handler behavior
To: liweihao <liweihao@loongson.cn>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, masahiroy@kernel.org, 
	yijun@loongson.cn, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8CxbSN_qO5kT+dmAA--.3609S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWFykZFW5ZF45tr4rCw45Jwc_yoW5WFy3pr
	yYy3Z3KF4rWayfXa1Y9F1Dtr9xZr40grWDAr4xJryrJ3WUurnYkry5J39agFnxt3ykXryj
	qayrKF1rCF48trbCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	JVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
	UjIFyTuYvjxU7QzVUUUUU

Hello weihao,

On Wed, Aug 30, 2023 at 9:04=E2=80=AFAM liweihao <liweihao@loongson.cn> wro=
te:
>
> The copy/clear_user function should returns number of bytes that could
> not be copied/cleared. So, try to copy/clear byte by byte when ld.d/w/h
> and st.d/w/h trapped into an exception.
>
> Signed-off-by: liweihao <liweihao@loongson.cn>
> ---
>  arch/loongarch/lib/clear_user.S |  87 ++++++++---------
>  arch/loongarch/lib/copy_user.S  | 161 ++++++++++++++++----------------
>  2 files changed, 127 insertions(+), 121 deletions(-)
>
> diff --git a/arch/loongarch/lib/clear_user.S b/arch/loongarch/lib/clear_u=
ser.S
> index 0790eadce166..9b6eef569f89 100644
> --- a/arch/loongarch/lib/clear_user.S
> +++ b/arch/loongarch/lib/clear_user.S
> @@ -11,19 +11,6 @@
>  #include <asm/cpu.h>
>  #include <asm/regdef.h>
>
> -.irp to, 0, 1, 2, 3, 4, 5, 6, 7
> -.L_fixup_handle_\to\():
> -       sub.d   a0, a2, a0
> -       addi.d  a0, a0, (\to) * (-8)
> -       jr      ra
> -.endr
> -
> -.irp to, 0, 2, 4
> -.L_fixup_handle_s\to\():
> -       addi.d  a0, a1, -\to
> -       jr      ra
> -.endr
> -
>  SYM_FUNC_START(__clear_user)
>         /*
>          * Some CPUs support hardware unaligned access
> @@ -51,7 +38,7 @@ SYM_FUNC_START(__clear_user_generic)
>  2:     move    a0, a1
>         jr      ra
>
> -       _asm_extable 1b, .L_fixup_handle_s0
> +       _asm_extable 1b, 2b
>  SYM_FUNC_END(__clear_user_generic)
>
>  /*
> @@ -173,33 +160,47 @@ SYM_FUNC_START(__clear_user_fast)
>         jr      ra
>
>         /* fixup and ex_table */
> -       _asm_extable 0b, .L_fixup_handle_0
> -       _asm_extable 1b, .L_fixup_handle_0
> -       _asm_extable 2b, .L_fixup_handle_1
> -       _asm_extable 3b, .L_fixup_handle_2
> -       _asm_extable 4b, .L_fixup_handle_3
> -       _asm_extable 5b, .L_fixup_handle_4
> -       _asm_extable 6b, .L_fixup_handle_5
> -       _asm_extable 7b, .L_fixup_handle_6
> -       _asm_extable 8b, .L_fixup_handle_7
> -       _asm_extable 9b, .L_fixup_handle_0
> -       _asm_extable 10b, .L_fixup_handle_1
> -       _asm_extable 11b, .L_fixup_handle_2
> -       _asm_extable 12b, .L_fixup_handle_3
> -       _asm_extable 13b, .L_fixup_handle_0
> -       _asm_extable 14b, .L_fixup_handle_1
> -       _asm_extable 15b, .L_fixup_handle_0
> -       _asm_extable 16b, .L_fixup_handle_0
> -       _asm_extable 17b, .L_fixup_handle_s0
> -       _asm_extable 18b, .L_fixup_handle_s0
> -       _asm_extable 19b, .L_fixup_handle_s0
> -       _asm_extable 20b, .L_fixup_handle_s2
> -       _asm_extable 21b, .L_fixup_handle_s0
> -       _asm_extable 22b, .L_fixup_handle_s0
> -       _asm_extable 23b, .L_fixup_handle_s4
> -       _asm_extable 24b, .L_fixup_handle_s0
> -       _asm_extable 25b, .L_fixup_handle_s4
> -       _asm_extable 26b, .L_fixup_handle_s0
> -       _asm_extable 27b, .L_fixup_handle_s4
> -       _asm_extable 28b, .L_fixup_handle_s0
> +.Llarge_fixup:
> +       sub.d   a1, a2, a0
> +
> +.Lsmall_fixup:
> +29:    st.b    zero, a0, 0
> +       addi.d  a0, a0, 1
> +       addi.d  a1, a1, -1
> +       bgt     a1, zero, 1b

I'm sure the jump target here is 29b.

--=20
WANG Rui

