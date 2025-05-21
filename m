Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70A222B5AA
	for <loongarch@lists.linux.dev>; Wed, 21 May 2025 02:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747793692; cv=none; b=BZFv3RUxJMrF97JpFbBkVXSxhZ0cO4x3FZnZ8seoeaaZpF8h5XbFgTRvSr5g8lWD1fjMyhS/RjVHGCgHkA4aAwUX6aSu6pEawbANb45e4tuCZ5jDl1Cu6LgTPTHyiO0rQO7JJWwTzELysBdfLRN60UaFMj/CYPbS7DoQeD6LFug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747793692; c=relaxed/simple;
	bh=w6seKvwXm8BziGL08hbBiamW41TIhjfuzmyRfEKlM/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sP5UQDFCNzCexg8v7rKs5Bu+wbzzR+Ld2mXUyvv+Fqn67MRu5TyAfB9nZsO6lkXRHq7xQu6cec8uql1DE2uyW99RL7NVUA8a8TKrBIqgKhsb6OcXy3MDc+kOW93jTSy3N3HMffGRAZuVnTe0f0TJdXYNHR65pFEYVybDAXEqEco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKTFvtPA; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKTFvtPA"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2d5e5e21b92so2590811fac.0
        for <loongarch@lists.linux.dev>; Tue, 20 May 2025 19:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747793690; x=1748398490; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mJmo0Dl0cGeVj4tSJVjs9Ug1bxfEHf17wTTWjcn4i4=;
        b=nKTFvtPAB79JKhVxzzQifpnVM0Pc8VxEX3B9vXrTYpGuwBy7TN+0NDQgVRVwsojIDR
         uSSsXRyFaAPrkvtyO0q0N+iR0YczqjDcSMsNhe5woXUgYSYg3g8EFWjiI4Nf5oiCKGum
         QH9YM4JjU5EDKH13ESWszl3hYlguUMppT/dpF/8wRv7tBcm+9y42T7biEuEKFD1HX1zE
         ws4+DoQL2HJdAzllgqFa/JnjRZwHNjnjVRYMDvz01d68GyDqui8yLESkhIgdbJd+wx6j
         TiAhz8jN/OtDl2WGt8RrAdx0mFwdBEqBAMuRb5XxehqDyexbUAU5QWzVBCio2IBkph5K
         5zMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747793690; x=1748398490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mJmo0Dl0cGeVj4tSJVjs9Ug1bxfEHf17wTTWjcn4i4=;
        b=nfXV/NfYwOdfqSYkIuc8kST3Kz+yPuM7H/HA3AJS3J8QjP8HhBqXQ2iNVFOSmRwy0z
         GLWI2n4g1XoULHQkhBQ0LC15lsac2rcSry+wpswrR9k1QRwzpW6sGv+QlZdOGp1MRSLw
         1FbJGDHjzWX4mEsT5k2yn/YdB49gidYyupxRwho47L6BWJJ9WrY2t0Rfy4HWNyWxhWCA
         a3PaU/qxlUVcH1YewZu1bwTbWFNlHGni1bZLJAcaXbkPtSGkXUgftpJNm5BKi+rN5vhZ
         R4zQOnkTDbZ1IQF6teh900E45dZIgfUrdoh1k2OHTZzcTO5rePYtKuVoew4qJlSc8f7I
         KJ/g==
X-Forwarded-Encrypted: i=1; AJvYcCUr3N7Vm5bIDwz7sDkZ2PMEwUy9MpSgXFeSVp+EnVfZ+FIZvEd4u2l7Ih7ae0rQVG2LMzEN3TzqHIc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAFhMPeZtRJyDM9pfn4o1yfg6gaSdJ3yP/odg99nFgaBbXey9Z
	Jh3Q67jbe8fgA5OblcgaGacVVqCboEBd/mB1IwhN5GqVGMki7wLzKTn7dEA4wQtbtPbihFjg5v5
	JYjRQrhNithCESye3+Dx4hHeEZ9XDdTE=
X-Gm-Gg: ASbGncs/3hA81xoIBH0Yrnl0grppySAKQBmtoF6B4zMdixeBLW8CDAZOK3gada45bnp
	ifgapZhHskSOoC5XXUG6MvTaF7qqgMhJXvAhrM8WHIo4bmanhS0pv6hutEM47sy6iN4ya2rysVF
	kMX5aPe9Tdz2EokueM7oc9UzueV/sMLPhQnWzNPYfIKg==
X-Google-Smtp-Source: AGHT+IHuYLJczKqbxCXpT3fgGVae3G+zGZTTNY6ZCdNSKLk4ZVUQDhLPinU2zcuOeeLOEBKRRtajq324BfJXjBENvkA=
X-Received: by 2002:a05:6870:9107:b0:2df:7cb3:7530 with SMTP id
 586e51a60fabf-2e3c1ca491amr8315649fac.22.1747793689962; Tue, 20 May 2025
 19:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250520064936.32291-1-yangtiezhu@loongson.cn>
In-Reply-To: <20250520064936.32291-1-yangtiezhu@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 21 May 2025 10:14:39 +0800
X-Gm-Features: AX0GCFug5F17gutXJTiQNZoAprTF2DD1xq-yLOXz4NGnhLZrI44eVhn0fv9RmFI
Message-ID: <CAEyhmHSkZmV3B6y8eqkESGH_EAXCER64JJ9noz=KsX64w74mFQ@mail.gmail.com>
Subject: Re: [RFC PATCH] LoongArch: Do not include larchintrin.h
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 2:49=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> larchintrin.h is a system header of compiler, include it in the
> kernel header may lead to the fatal error "'larchintrin.h' file
> not found".
>
> There are two related cases so far:
>
> (1) When compiling samples/bpf, it has been fixed in the latest
> kernel [1].
>
> (2) When running bcc script, it has been fixed in the latest
> bcc [2] [3], like this:
>
> $ /usr/share/bcc/tools/filetop
> In file included from <built-in>:4:
> In file included from /virtual/include/bcc/helpers.h:54:
> In file included from arch/loongarch/include/asm/page.h:7:
> In file included from arch/loongarch/include/asm/addrspace.h:9:
> arch/loongarch/include/asm/loongarch.h:11:10: fatal error: 'larchintrin.h=
' file not found
>    11 | #include <larchintrin.h>
>       |          ^~~~~~~~~~~~~~~
> 1 error generated.
>
> Maybe there are same errors for the other unknown projects, it is
> annoyance to add the include path each time. In order to avoid such
> errors once and for all, do not include larchintrin.h, just use the
> builtin functions directly.
>

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

> [1] https://git.kernel.org/torvalds/c/548762f05d19
> [2] https://github.com/iovisor/bcc/commit/8aa9f7072d53
> [3] https://github.com/iovisor/bcc/commit/af8258c21004
>
> Cc: stable@vger.kernel.org # 6.6+
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/include/asm/loongarch.h | 31 +++++++++++---------------
>  1 file changed, 13 insertions(+), 18 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/incl=
ude/asm/loongarch.h
> index 52651aa0e583..b33e4c9cb903 100644
> --- a/arch/loongarch/include/asm/loongarch.h
> +++ b/arch/loongarch/include/asm/loongarch.h
> @@ -9,14 +9,6 @@
>  #include <linux/linkage.h>
>  #include <linux/types.h>
>
> -#ifndef __ASSEMBLY__
> -#include <larchintrin.h>
> -
> -/* CPUCFG */
> -#define read_cpucfg(reg) __cpucfg(reg)
> -
> -#endif /* !__ASSEMBLY__ */
> -
>  #ifdef __ASSEMBLY__
>
>  /* LoongArch Registers */
> @@ -173,19 +165,22 @@
>
>  #ifndef __ASSEMBLY__
>
> +/* CPUCFG */
> +#define read_cpucfg(reg) __builtin_loongarch_cpucfg(reg)
> +
>  /* CSR */
> -#define csr_read32(reg) __csrrd_w(reg)
> -#define csr_read64(reg) __csrrd_d(reg)
> -#define csr_write32(val, reg) __csrwr_w(val, reg)
> -#define csr_write64(val, reg) __csrwr_d(val, reg)
> -#define csr_xchg32(val, mask, reg) __csrxchg_w(val, mask, reg)
> -#define csr_xchg64(val, mask, reg) __csrxchg_d(val, mask, reg)
> +#define csr_read32(reg) __builtin_loongarch_csrrd_w(reg)
> +#define csr_read64(reg) __builtin_loongarch_csrrd_d(reg)
> +#define csr_write32(val, reg) __builtin_loongarch_csrwr_w(val, reg)
> +#define csr_write64(val, reg) __builtin_loongarch_csrwr_d(val, reg)
> +#define csr_xchg32(val, mask, reg) __builtin_loongarch_csrxchg_w(val, ma=
sk, reg)
> +#define csr_xchg64(val, mask, reg) __builtin_loongarch_csrxchg_d(val, ma=
sk, reg)
>
>  /* IOCSR */
> -#define iocsr_read32(reg) __iocsrrd_w(reg)
> -#define iocsr_read64(reg) __iocsrrd_d(reg)
> -#define iocsr_write32(val, reg) __iocsrwr_w(val, reg)
> -#define iocsr_write64(val, reg) __iocsrwr_d(val, reg)
> +#define iocsr_read32(reg) __builtin_loongarch_iocsrrd_w(reg)
> +#define iocsr_read64(reg) __builtin_loongarch_iocsrrd_d(reg)
> +#define iocsr_write32(val, reg) __builtin_loongarch_iocsrwr_w(val, reg)
> +#define iocsr_write64(val, reg) __builtin_loongarch_iocsrwr_d(val, reg)
>
>  #endif /* !__ASSEMBLY__ */
>
> --
> 2.42.0
>
>
