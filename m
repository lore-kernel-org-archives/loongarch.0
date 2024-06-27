Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C86198A09
	for <loongarch@lists.linux.dev>; Thu, 27 Jun 2024 16:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719507109; cv=none; b=ldQkZGQK6vYRqNGFH7nR2Tq5zr7KtXH9SXjBSemBZvDbuQ8NYHIa1KbfV7qcDa/tiNJw9lb9svVZbFCoxhDcxclPfbR7DQTDwiAKMyP13ZNWwklg17mv9VCfHgepS5fAFrTYc7cPIrlpekpK2WuOZlTAJapjIR//42G6JqPhElY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719507109; c=relaxed/simple;
	bh=qIvu4g/bIBmBH2H9f4HwrUaLQ5grYwZpG98mYQbbVE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuNvdrwirQJAzktAP33rJNme+HrTBP0kusKzHg8DOUZP40d2O5w6bKCwHBRDh0IJ0Yq455HNkKAFdgDmrIHD3yPpX0WUPoD3X1WWqZMCSwfpOo2g8aM/xaaPVxM+n0tYfZdK+NvPA6Q8WAAXLD8UsnR3H6YAFpA+LkNIOpzhRjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZWQzrYJ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZWQzrYJ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-706738c209bso3716361b3a.3
        for <loongarch@lists.linux.dev>; Thu, 27 Jun 2024 09:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719507108; x=1720111908; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XSXQVstAeex/QLAPNBTMhwk+wqQDJE0LuUAT237zRI=;
        b=MZWQzrYJgABouWFfPPDRGFd+kA4iK2wzcJvWoJKzd3I0NzPOQG8rLcvuk/1HCg109u
         TNKVmYbIPoDChRT/5rvGSkZzbM7Ju6sX9uxJvlNOtmQSOBeIW5aLUYqNgsMbnmySEntT
         N11+KufgVf8XyPRVmUgTW0UdAJR73PTxGngc5nZ3beKJz9MfUZmoSdB8oZtw6efzBKK0
         26pJ+XLVDDRu+XMwbijBQd6QGyFUO5kRrHmhg/LcF27dfyyP0vhzf4qPplnAWAitXazB
         VziZtY6MdaQh7/u1YkxOP3qRK7WmE8VhJXmLAtuUFzohi5svC4QVQtJ+g38KW8HBalkO
         MeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719507108; x=1720111908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1XSXQVstAeex/QLAPNBTMhwk+wqQDJE0LuUAT237zRI=;
        b=tHEeUDRjjPsMSAqizBOtPgoXkyQHltwAqUr065THRCXTxHbm+RK6g0pk+nuUgqzfC4
         NPJV8fAJn59iFrOxJ6dozoMSbjrruTMB5pZlakHM8KDm1ZCbKyyVSayEalXtQdnsrsKV
         d5ZoiGJ8M2titqTX/vqehp4o1D7xWdoq8ZpJyMw2T8ttcQwJ9DpqsYyA1cNP9vNj57r7
         zVRLgS8jdRD7IYvD9xMVMfWhd40nPiHaJ52aH+tLmpPPT9VwQLPjNzGJFcz6PlhJTocW
         NzK16OvWeDuh8ebKtGAxDb7OhleRo7E/feyeD2bq1c44+BVy1jS7dhS96nj+7pj9O67R
         pccA==
X-Forwarded-Encrypted: i=1; AJvYcCWF65HI8HfbJmPpat+1cU2NPEAnZ8GwZPAz8KXOlDqEjrqTjrCcHW0MA3WLoA8Dlw/+zkeysPCT7C9pheBGfPbyrbe4FUHKEugs
X-Gm-Message-State: AOJu0Ywat5vIlWf3VLGfC8DnzdFk45XK4rqfbkZb2pdWNg64clFuXqde
	jizoGE8Eqs68C6zDcNaX1RjiMZ604O7HzKZu1NQIWS8rrLeG8Xg2Bt2FCZ0Siq2Ux1iEYx74bCj
	qGLrz2c5o/n9JJiwf1rdSKEW3evY=
X-Google-Smtp-Source: AGHT+IGXhQGVZd2LJiMpsrXL71XDxbNoacHQmSsuRaKegbY7AIu6gYcF5MN/YCRWVrZjSANHroTFUHFWhELa89DiLk4=
X-Received: by 2002:a05:6a20:8c24:b0:1bd:2acd:d175 with SMTP id
 adf61e73a8af0-1bd2acdd201mr5372076637.32.1719507107687; Thu, 27 Jun 2024
 09:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240618194306.1577022-1-jolsa@kernel.org> <20240627160255.GA25374@redhat.com>
In-Reply-To: <20240627160255.GA25374@redhat.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 27 Jun 2024 09:51:35 -0700
Message-ID: <CAEf4BzZVmKjfQD1zKMDOD-Zc4pVp+EGgb8h2veg=bXe1Pjn_Uw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: uprobes: make UPROBE_SWBP_INSN/UPROBE_XOLBP_INSN
 constant
To: Oleg Nesterov <oleg@redhat.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Jiri Olsa <jolsa@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 9:04=E2=80=AFAM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> LoongArch defines UPROBE_SWBP_INSN as a function call and this breaks
> arch_uprobe_trampoline() which uses it to initialize a static variable.
>
> Fixes: ff474a78cef5 ("uprobe: Add uretprobe syscall to speed up return pr=
obe")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/all/20240614174822.GA1185149@thelio-3990X=
/
> Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  arch/loongarch/include/asm/uprobes.h | 6 ++++--
>  arch/loongarch/kernel/uprobes.c      | 8 ++++++++
>  2 files changed, 12 insertions(+), 2 deletions(-)
>

LGTM.

Acked-by: Andrii Nakryiko <andrii@kernel.org>


> diff --git a/arch/loongarch/include/asm/uprobes.h b/arch/loongarch/includ=
e/asm/uprobes.h
> index c8f59983f702..18221eb9a8b0 100644
> --- a/arch/loongarch/include/asm/uprobes.h
> +++ b/arch/loongarch/include/asm/uprobes.h
> @@ -6,13 +6,15 @@
>
>  typedef u32 uprobe_opcode_t;
>
> +#define __emit_break(imm)      (uprobe_opcode_t)((imm) | (break_op << 15=
))
> +
>  #define MAX_UINSN_BYTES                8
>  #define UPROBE_XOL_SLOT_BYTES  MAX_UINSN_BYTES
>
> -#define UPROBE_SWBP_INSN       larch_insn_gen_break(BRK_UPROBE_BP)
> +#define UPROBE_SWBP_INSN       __emit_break(BRK_UPROBE_BP)
>  #define UPROBE_SWBP_INSN_SIZE  LOONGARCH_INSN_SIZE
>
> -#define UPROBE_XOLBP_INSN      larch_insn_gen_break(BRK_UPROBE_XOLBP)
> +#define UPROBE_XOLBP_INSN      __emit_break(BRK_UPROBE_XOLBP)
>

this looks correct (but based on pure code inspection)

>  struct arch_uprobe {
>         unsigned long   resume_era;
> diff --git a/arch/loongarch/kernel/uprobes.c b/arch/loongarch/kernel/upro=
bes.c
> index 87abc7137b73..90462d94c28f 100644
> --- a/arch/loongarch/kernel/uprobes.c
> +++ b/arch/loongarch/kernel/uprobes.c
> @@ -7,6 +7,14 @@
>
>  #define UPROBE_TRAP_NR UINT_MAX
>
> +static __init int check_emit_break(void)
> +{
> +       BUG_ON(UPROBE_SWBP_INSN  !=3D larch_insn_gen_break(BRK_UPROBE_BP)=
);
> +       BUG_ON(UPROBE_XOLBP_INSN !=3D larch_insn_gen_break(BRK_UPROBE_XOL=
BP));
> +       return 0;
> +}
> +arch_initcall(check_emit_break);
> +

I wouldn't even bother with this, but whatever.

>  int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe,
>                              struct mm_struct *mm, unsigned long addr)
>  {
> --
> 2.25.1.362.g51ebf55
>
>
