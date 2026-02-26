Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4B63AEF2F
	for <loongarch@lists.linux.dev>; Thu, 26 Feb 2026 14:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772114491; cv=pass; b=WNGZAFKGVVGFnxRH7FWjCUH3jbzyi9K3m+uRAEcMXPXStKIv2qU5T6Er081PmlxbZQLf7VLuz6F1WaYlTgEeZEPdpuD9VFjI6x9OLa43Ol/dL02Tuv8Jw+CGleGRcs7BpjxB0Ngb45AqXq+bWDGfwvbcwRSXFofXv3z4b6Qx28Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772114491; c=relaxed/simple;
	bh=BwyF0qpF0HcXt65zTqNvfpD96B+4qTUiKq0XX1e2ZeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qksN/moyxy9gyZtlIVawfP4M4Ahv9RNt+GmuKagkeV0qG0P0sJmqk4iSiH37AJNW6wismTOvj20K0w8JwDE9fUASC82Enk9br6tF7yxEoRfkqQUT8+PYYThGShe1DzyCzjexiKrM/vRKLnYQXhwrJejCRsYO10g0Xy8xcK84jaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caNk7ZHd; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caNk7ZHd"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5ff19e74779so570235137.0
        for <loongarch@lists.linux.dev>; Thu, 26 Feb 2026 06:01:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772114477; cv=none;
        d=google.com; s=arc-20240605;
        b=N8mUwBw7MrdxIzvgN/pKl6yD2gutcloksJrM+Hzm3QjdoqyGJ1xvYoms6sQVZ0EPlC
         3NfS7M5TLpGyHqIEnvtdvuh7qPnCFr1HiDGpXodXQyohTyO9cEiwXHNXwUd13gjlpgLQ
         vDLnVrUT3h9uCJuN2Lpy5/JckgI8Qrc+ADWpGExtWmgJl0d37PYPomjL/fvsjqQ7UaEV
         mzc/kihxDB5Exns4oLH6j2+a41iOYkZXN5fDFiS+lJXDvYEak3lZUsFkwfRew1rBdlgO
         7zu0bAtQMPh+OvrPUPRp89hnNVFbbGYy0yNUGw+yFiWjIq5INQn6opC3zcNFUWiw6+01
         lw7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=02AQeb96mxx7nVc5qFj3TJGlqoShlbe8RZjJHkcNMSQ=;
        fh=MKjpi4u6CwEUanzTVoMZCRxnM73kznBkWZo91Uv7bUI=;
        b=NEQZdlZlZRYb6JmavNSvsHnuJEfdfsRqiX3kBTTw6oy4/m7kMdIoMkTzHd2mXR3Xuw
         29EBba3ipkEF7QvUozp0VEWABv1qTfMn3aILSvEFIQ1Cmbsso7cap/JKaqymgaC0/rUo
         iRABKt6wqy+3YsUY0ZQXZtRaEoXYBiEq1FdkvyoVMUTj8r5rU+pQLhwVRGu03pKtVuM5
         /q27THQ4LcETmZbjBWtdinr8Yha/HTd82btmEsxduNt1D+8/e7KxclzikEmMkQjoq/b/
         Zs1sRkXQiOlo0LXpLZz0TSrOPjIQts6x0UznC1yWvoAzvXvPJUn/Vx6350SaYzi5Rneh
         KF0Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772114477; x=1772719277; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02AQeb96mxx7nVc5qFj3TJGlqoShlbe8RZjJHkcNMSQ=;
        b=caNk7ZHdP/5H4tSgjI11k53FC1N9q23L83kiVkLWyAjsfeXcXFTT7pfWZ1nY3pjjJL
         HkZxXYQtZCT7lnWF1wDXXt8hnvN3oSOSvRjISOa7MHFBTrFgrlY0sdHzQqwlcSxz3Y18
         xYb2sLLfPyaxA5iDH6PGeT/Sp7C7eT6xFl+To0k5ewEtfSoJGCF7SgIXORJM724XTuQH
         SUihMoN7a+jue/OV3oJMJRPsO9eaftE3yDh1sDFQpIwf4MRby1IblzwGAYE7b+EP2I3C
         QzCR4PFHGU4QM8CUoxZXikZ1yKwCtYSErs1Ld2wGrtii8YfLBHbVjvr9NudJCjMf5ZX9
         k2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772114477; x=1772719277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=02AQeb96mxx7nVc5qFj3TJGlqoShlbe8RZjJHkcNMSQ=;
        b=d5blhIbp5qhcTdh39T0nweHw7qxlBuAs22T9rJ6fWxTgy4rHih3s77gfL9Y0NzHumW
         /OOOfIB6Ok1IGyDbCmNT1Zr/teR+Jgygkez7cBhRGEbMkFrGVJYRo4BIeXri/whZ+gfZ
         APqtlW/LcxAKtaXTdRw0ra3yFMWHo2gCV/EAqZO/ZDutE8y/nDCqXVHgO2WcU/RjH2uS
         Y5sQCHCqEY1SoZ7ryKktTh1SudcULDDKIsvgLyc3L4eQd4PhVfEnLFcVvfhJrOBh9lkK
         LYBMIG+k1CYxv9joNwsV8TB1s0GFctc1cT6y5CYo2QnVaIII6nqHsJ+M5wtCyDU2AswB
         JbsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw/+eHbotHdHkfDSQ9nXbhPSP/xFlhVPhlWbdC+p3kIDTDBW2iyC5SNUF3iA4R17qEXNe/jixa5j8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx66EaOYXhfek0Eix+DKl4R/zZAs5IZ8V9J1lwlMFRTeIKI6vY2
	quzcq0VKoH8e746jP7Nh6L1P/zZ1oI6vrzvoCITjQQlGKq5X9hx+XAYcHIeEv2/4SEDKEexb9/U
	76l20DE2PkjPB+9a78kCWmFI/KRSphEk=
X-Gm-Gg: ATEYQzxD1UIuOZmW2GXYqOQvfTyUV07b1HAe4YzRpf/t2AZHTDVBc+aIw1p3loIGRdT
	nGIZhTF5acHURYNkv7NHFTS/ea5SQJmUaBoOHwldoNaqN9ZX0hbeHHytCZlB8lDxGgouvxnZLW4
	kaFL6xzamEz3rIeXZK4/nDcBpCekIZ05JXFWtE4mioXAnsMP16U/uZNISYrsFP2BVmoy8npyDGj
	uSudrDNWZTEO444b9JQzIVoDG+jYV6JRvkklh5Pxl5L3FsO06169JEc6Xlf7PLfjqvv66Bw7tVH
	GUba/LJL1Cvv5Eep6ME=
X-Received: by 2002:a05:6102:94d:b0:5fd:faf5:bc7a with SMTP id
 ada2fe7eead31-5ff20caf80fmr1039579137.41.1772114476573; Thu, 26 Feb 2026
 06:01:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260225-loongarch-scq-v1-1-47acc2e45ec2@linutronix.de>
In-Reply-To: <20260225-loongarch-scq-v1-1-47acc2e45ec2@linutronix.de>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 26 Feb 2026 22:01:04 +0800
X-Gm-Features: AaiRm50ZU6anVyxfGx856SeSGod9RQJsxhSEsUiPo0miVMukWok53I-87oZ52NA
Message-ID: <CAEyhmHSOtpcDpeKqZw0zWuYFq746xqx96RRhe5Mp8ctEJivU=Q@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Only use SC.Q when supported by the assembler
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	George Guo <guodongtai@kylinos.cn>, Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 6:09=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> The 128-bit atomic cmpxchg implementation uses the SC.Q instruction.
> Older versions of GNU AS do not support that instruction, erroring out:
>
> ERROR:root:{standard input}: Assembler messages:
> {standard input}:4831: Error: no match insn: sc.q       $t0,$t1,$r14
> {standard input}:6407: Error: no match insn: sc.q       $t0,$t1,$r23
> {standard input}:10856: Error: no match insn: sc.q      $t0,$t1,$r14
> make[4]: *** [../scripts/Makefile.build:289: mm/slub.o] Error 1
>
> (Binutils 2.41)
>
> Test support for SC.Q in kconfig and disable the atomics if the
> instruction is not available.
>
> Fixes: f0e4b1b6e295 ("LoongArch: Add 128-bit atomic cmpxchg support")
> Closes: https://lore.kernel.org/lkml/20260216082834-edc51c46-7b7a-4295-8e=
a5-4d9a3ca2224f@linutronix.de/
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>
Tested-by: Hengqi Chen <hengqi.chen@gmail.com>

>  arch/loongarch/Kconfig               | 3 +++
>  arch/loongarch/include/asm/cmpxchg.h | 5 +++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index d211c6572b0a..92068ff38685 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -304,6 +304,9 @@ config AS_HAS_LBT_EXTENSION
>  config AS_HAS_LVZ_EXTENSION
>         def_bool $(as-instr,hvcl 0)
>
> +config AS_HAS_SCQ_EXTENSION
> +       def_bool $(as-instr,sc.q \$t0$(comma)\$t1$(comma)\$t2)
> +
>  config CC_HAS_ANNOTATE_TABLEJUMP
>         def_bool $(cc-option,-mannotate-tablejump)
>
> diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/includ=
e/asm/cmpxchg.h
> index 58cabab6d90d..909f9274fe71 100644
> --- a/arch/loongarch/include/asm/cmpxchg.h
> +++ b/arch/loongarch/include/asm/cmpxchg.h
> @@ -238,6 +238,8 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsi=
gned long new, unsigned int
>         arch_cmpxchg((ptr), (o), (n));                                  \
>    })
>
> +#ifdef CONFIG_AS_HAS_SCQ_EXTENSION
> +
>  union __u128_halves {
>         u128 full;
>         struct {
> @@ -290,6 +292,9 @@ union __u128_halves {
>         BUILD_BUG_ON(sizeof(*(ptr)) !=3D 16);                            =
 \
>         __arch_cmpxchg128(ptr, o, n, "");                               \
>  })
> +
> +#endif /* CONFIG_AS_HAS_SCQ_EXTENSION */
> +
>  #else
>  #include <asm-generic/cmpxchg-local.h>
>  #define arch_cmpxchg64_local(ptr, o, n) __generic_cmpxchg64_local((ptr),=
 (o), (n))
>
> ---
> base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122
> change-id: 20260218-loongarch-scq-2434ec5aec4d
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>
