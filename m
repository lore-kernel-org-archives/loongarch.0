Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65DF3F9EC
	for <loongarch@lists.linux.dev>; Fri, 19 Jul 2024 06:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721371548; cv=none; b=QpICbuME48TCWG7c8pQLyFkO/FaYEMGg7/Fe7nsRl92V+rXpeIM9JhBnfcOlAAMxRNTPJlsEtAXOKak6Mr9G5MLz5eiE5XxLjG+5YaX/Nn0qF3q4gfvsuuSAIwTi43+RBdDlZkqFol9rb8VLZL/6nEhoP4bKOkeuo7MW9PtTY54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721371548; c=relaxed/simple;
	bh=SkLVjyhDJtKPnHPxsgYnNVisePA45H9X3fSc8dGWfUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uD5072f/WO258MUeOtSlbfIsyMu4rli2Vs+wHzkHU8/k/L5UwtZ4ZRkCvyGbrowFAgPSAYuzmbE3m3jne/mLRO7MoYtDMda9loETPbE7lx+UCp6hyr48Qag2IhfZ1gZ4guvekhP5sH+uROzetGWpT68Iy0p7rKu083vI2UJSEBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqFmOCn3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqFmOCn3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51EC9C4AF0E
	for <loongarch@lists.linux.dev>; Fri, 19 Jul 2024 06:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721371548;
	bh=SkLVjyhDJtKPnHPxsgYnNVisePA45H9X3fSc8dGWfUE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UqFmOCn3A0LcFE/TGlYjPUnv9yQZEAiXZH004HNud165ZedOL0KLJLHxxFouyYHEs
	 Tude8knwZuu18ga8TgCzHu98a8lTAprW0iGG7xrY9ax898P0RrT5ghdD7BwSrV3py2
	 YUp4KWCOY5+gvduRHfIbdKAWYoP0UpFNoCrolVFL71FRP4xQO5N33wGLFFGnrnGhJ4
	 DMLM8kVLXg6rDUL9NNaVQxGetwzZVb+43oCj/3OQJniLhdq9zfPNLhW9SmG3VtPh4r
	 f8M9mjGt7U8GEvyKnC+aRhPoVBH+2zwv+ssRNnXB+qixF08TuZkk/D82YYD8obyJ+r
	 IFD6RrbbwClCA==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5a2ffc34677so379341a12.2
        for <loongarch@lists.linux.dev>; Thu, 18 Jul 2024 23:45:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7ZI1ezLAgaPQAPm3DLY2A+LXYioM0d+2r96CRQsLbyo2cEiiZ4TLL0Ir3yo0334uJ4zfVG9Cit4yBYfbwNeHj/LhSfol2QIBO
X-Gm-Message-State: AOJu0Yy/00Db2vebchrwwzBfXCRPOqJJ32a+6jmOOdK4lLE17J0Dw3XQ
	5hUMhKf18wuKM4Or29ee7kFeblboA2WLnlIfIYrOtrkdp5ir8ripFD+gwiG9gqLdPgqS9YFbvcF
	xDTsM2hiUVYR2E4IU2ColfZrKyCQ=
X-Google-Smtp-Source: AGHT+IFI7UE4htQrB90kB6YM3G32cXHi+BrN+bUwAbDBQSouVE8j4kP/Asy9+Y6DecKitNlDpBrHtgvXnb+iwYTrpe8=
X-Received: by 2002:a05:6402:35ce:b0:5a2:fc48:db27 with SMTP id
 4fb4d7f45d1cf-5a2fc48e014mr783192a12.32.1721371546865; Thu, 18 Jul 2024
 23:45:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240719031427.119274-1-ruanjinjie@huawei.com>
In-Reply-To: <20240719031427.119274-1-ruanjinjie@huawei.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 19 Jul 2024 14:45:33 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6hCrm97eeFXGMQtUae+UHRkyE36byyEnjTae7=5Wou8A@mail.gmail.com>
Message-ID: <CAAhV-H6hCrm97eeFXGMQtUae+UHRkyE36byyEnjTae7=5Wou8A@mail.gmail.com>
Subject: Re: [PATCH v2] loongarch: Support RANDOMIZE_KSTACK_OFFSET
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kernel@xen0n.name, kees@kernel.org, gustavoars@kernel.org, arnd@arndb.de, 
	maobibo@loongson.cn, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied with small changes, thanks.

https://github.com/chenhuacai/linux/commit/a55a07439613689f0890c9482b9c5f76=
dec255dd

Huacai

On Fri, Jul 19, 2024 at 11:09=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com=
> wrote:
>
> Add support of kernel stack offset randomization while handling syscall,
> the offset is defaultly limited by KSTACK_OFFSET_MAX().
>
> In order to avoid trigger stack canaries (due to __builtin_alloca) and
> slowing down the entry path, use __no_stack_protector attribute to
> disable stack protector for do_syscall() at function level.
>
> With this patch, the REPORT_STACK test show that:
>         `loongarch64 bits of stack entropy: 7`
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Suggested-by: Huacai Chen <chenhuacai@kernel.org>
> ---
> v2:
> - get_random_u16() -> drdtime().
> - Add Suggested-by.
> ---
>  arch/loongarch/Kconfig          |  1 +
>  arch/loongarch/kernel/syscall.c | 17 ++++++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index ddc042895d01..fcf6451b4e38 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -106,6 +106,7 @@ config LOONGARCH
>         select HAVE_ARCH_KFENCE
>         select HAVE_ARCH_KGDB if PERF_EVENTS
>         select HAVE_ARCH_MMAP_RND_BITS if MMU
> +       select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
>         select HAVE_ARCH_SECCOMP
>         select HAVE_ARCH_SECCOMP_FILTER
>         select HAVE_ARCH_TRACEHOOK
> diff --git a/arch/loongarch/kernel/syscall.c b/arch/loongarch/kernel/sysc=
all.c
> index ec17cd5163b7..9df81197a09b 100644
> --- a/arch/loongarch/kernel/syscall.c
> +++ b/arch/loongarch/kernel/syscall.c
> @@ -9,11 +9,13 @@
>  #include <linux/entry-common.h>
>  #include <linux/errno.h>
>  #include <linux/linkage.h>
> +#include <linux/randomize_kstack.h>
>  #include <linux/syscalls.h>
>  #include <linux/unistd.h>
>
>  #include <asm/asm.h>
>  #include <asm/exception.h>
> +#include <asm/loongarch.h>
>  #include <asm/signal.h>
>  #include <asm/switch_to.h>
>  #include <asm-generic/syscalls.h>
> @@ -39,7 +41,7 @@ void *sys_call_table[__NR_syscalls] =3D {
>  typedef long (*sys_call_fn)(unsigned long, unsigned long,
>         unsigned long, unsigned long, unsigned long, unsigned long);
>
> -void noinstr do_syscall(struct pt_regs *regs)
> +__no_stack_protector void noinstr do_syscall(struct pt_regs *regs)
>  {
>         unsigned long nr;
>         sys_call_fn syscall_fn;
> @@ -55,11 +57,24 @@ void noinstr do_syscall(struct pt_regs *regs)
>
>         nr =3D syscall_enter_from_user_mode(regs, nr);
>
> +       add_random_kstack_offset();
> +
>         if (nr < NR_syscalls) {
>                 syscall_fn =3D sys_call_table[nr];
>                 regs->regs[4] =3D syscall_fn(regs->orig_a0, regs->regs[5]=
, regs->regs[6],
>                                            regs->regs[7], regs->regs[8], =
regs->regs[9]);
>         }
>
> +       /*
> +        * This value will get limited by KSTACK_OFFSET_MAX(), which is 1=
0
> +        * bits. The actual entropy will be further reduced by the compil=
er
> +        * when applying stack alignment constraints: 16-byte (i.e. 4-bit=
)
> +        * aligned, which will remove the 4 low bits from any entropy cho=
sen
> +        * here.
> +        *
> +        * The resulting 6 bits of entropy is seen in SP[9:4].
> +        */
> +       choose_random_kstack_offset(drdtime());
> +
>         syscall_exit_to_user_mode(regs);
>  }
> --
> 2.34.1
>
