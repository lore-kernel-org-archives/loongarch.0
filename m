Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475408;
	b=KGG+QfNHxej8e7IQXAdG+bcF9/vmJTmSccGU24ZKEIdWxpbapfNV1R+y0Bll8I7nSbTA
	 DZfDV9gYtXAN7Pi4Rg6XjjtAFnFXsaFjZBsZOJjKbq9/t6FQDkVEa5pOo4h/9ZurS5pPe
	 43765j2ISSIafaX1uLohMcUNiQ7DaY7qykankY7Zon1n63f9ZP5VfPqGmrw8r+UtKA/0D
	 AZSWJRsFYdqYdHluAYJWUo7kBhBPR5M0EgYzkRQ2hl1FOIlsBRHxX6wyhKjOTlCe5bhBz
	 V1u7EBnJN3c0V3MiLm9qmRq7WdBSKzQjLwA35HtMmwqCf9hJeAfoNiN15nh5++gGZ0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:X-Google-Original-Date:Subject:In-Reply-To:CC:From:To:Message-ID:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=omPzYJsyHFXBTWaYCXRuHKP+shwbFJ7ykCdiwHLxPZA=;
	b=TeaVCK78tlW/mx3ArMDBQvKdhn2gmWUY77s3i9+pX2mIZk3MrrkmUVqDXFqKiyLJHqyr
	 iDrOepIdmhauKV8K5EP0vptK0PtRENOn0D2OVN/n0DcfduhJjf9b7m2A7EJfZzvqRWSQe
	 MsBYmu9R2/bi7ZhNlwJYt8HBVKQ/mzxNoLUxcxT9w5g9yzGyzbZPzwAmJ0lzNt6PeBq+V
	 zVbJhbYBgTSUMwsJJiiV/mlZOemb84+6hNBJKNFmINP2tDbH+x7ssHDmC4LeVi7f3ff1V
	 rp0q7FQHCM+e9tioXvLjFEJRlEpNnfY0I8xgyJY2wzFx2OIc6ZMCX2wGzHBZb8Ivpdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dabbelt.com;
	spf=pass smtp.mailfrom=dabbelt.com;
	dkim=pass header.d=dabbelt-com.20260707.gappssmtp.com header.i=@dabbelt-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EvVhhyOF;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A05C606A338
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 23:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A05C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20260707.gappssmtp.com header.i=@dabbelt-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EvVhhyOF
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-18818daa3e7so2279461c88.0
        for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 15:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20260707.gappssmtp.com; s=20260707; t=1795475406; x=1796080206; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=omPzYJsyHFXBTWaYCXRuHKP+shwbFJ7ykCdiwHLxPZA=;
        b=EvVhhyOF1QJ9XKMvDvFEixTTqFnRI47w9mjeud4zXdwGonv3NnmYC8iZ4+nfJkBmx3
         hgVkmMGiGdbDE8yzW/MCOVzFOwEyYJaGbkU1aixc/seaBfL325pv2GYHP5CeDJrkFDXU
         2XgFoe4MJLfCgGcF/CcIAtEAbYlNsVrllIo/VLQ6uVwngDd7Yw+I3xtggd4vp/NpkmPq
         WsKjg7+O9qp9nTLnvyQTTEGuorByMyMZ2N1CVi2m7mENRuGla59sJWZuAZsIiOIfKwrL
         ZvBmshB9JYtzUoTAKfwzZawcl7HFQ3+pmFkVD+y5nwroYpwMBrhxHJA03kcpv8AJb0Gb
         cPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475406; x=1796080206;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=omPzYJsyHFXBTWaYCXRuHKP+shwbFJ7ykCdiwHLxPZA=;
        b=aqtnvBEsqBsaAJi2L4okS03NKuJWHOizUlKs0+1+gycfAPlAUY/Vt6rFg62JrphTql
         DpSqAS66mgA2UwiOJMPJ6UVE+Q0+BR5CSjx/zOMDTWKDHOYX+Ll0cHAEn8gfELkhgIxu
         T56E1VgWS2NWJFqXPaVeY57sid9Sw35UFfuU7RWvrp4J54dVwcuzhlLVag+llD0BN+kW
         6Vz+YOyWxlbrYT+9UdSVtIZecTDXEUeM7sXNYU1T/og7whO0XewGGwXWCR4Klht60K2D
         +fqJ8a1ZEJcL8KFcGrBQUpaRO8azva0yBhtYHLUdF4fX107wBUReVrA2ilDqlogLK/TO
         lZNg==
X-Forwarded-Encrypted: i=1; AL+hErHpZTXAchvADu8cbu21xi+MLG1MdXXXy0iyPG2y/TYHm9kNDSNj8uakm8HNjzMGi2xcocsjdGA25Eo=@lists.linux.dev
X-Gm-Message-State: APuU4Z9uR9xfgPa5sVWWp00ehkqIqXJvRCUUxGiFAHbBBNweA7bNS7Rt
	TNl0RaYjpxR5cbcX7dkA0ZHwtycr4ynNa+pp0mIA8MvTGq0nXDVuxY6KGPxpu7hs8hg=
X-Gm-Gg: AZFdTZeIml2juuv/hIIPUlrvT0QGwJ1kZtLIX5xrz3nQJrvr7k3QY5bzgz7ZQFugfsL
	PGQK5J9DxfmqpMvvJq6i/54kpCmh8EoXqdf0r/ofCFwQvVslyMsa0qAnEYQhCmlPrdKDBGxZv+S
	w11O3BseK0RfBxgH0ZVyEFdGAOfa2VrhwBkECSb/2/25AKZV1gBtgtC4wIW/R3esZojQ1DdZR9T
	KO8yybijfRCyD6b1qo2QbXqyO67hqpt2BHPeEgKwtvGtuiGeBxbOKK43kWAQbNueCnD8roivZ60
	chA6CxmbJ+S9D5rkcdgc1TCaQwVKZOi5RPz72Qf7HolJXy1qg7+F3yLLUvdwdns+TZRXXIOfv5/
	wKhaKrVKCudYUeRI9YjUcHdFLqlBbF3WZRxuNUTdaofuwDDrTGdSRTzZym7peaoo+xf+KuvJ7az
	8WJZA+VpfrXXsy3YFGdP3RUJmKlpwjE1mFL1KRu2VNLjj4xH/YtC3kYqGLaQmiJzK8h7k/T0gMT
	rxFPQ1irlIfN1M0M974VRjz545lxhnkxYf0aSeY2aEHs6wDk3WPFdwemjGrRqmRwgGa55BhCeUD
	S9rpzY4hh2c8ptL5LIIt0n3yFtFaCl50kiVu7oG2nIeWXdalP3nV5PU3QYMkcWW7Q6LzYP7iuxw
	WJBeHTswhjB6bEzto0NBF1rXfiBc=
X-Received: by 2002:a05:7022:4181:b0:14a:a6dc:9cbf with SMTP id a92af1059eb24-1b5568abf0bmr18844780c88.4.1795475406085;
        Mon, 23 Nov 2026 15:10:06 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm33422877c88.6.2026.11.23.15.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:10:05 -0800 (PST)
Date: Mon, 23 Nov 2026 15:10:05 -0800 (PST)
X-Google-Original-Date: Mon, 23 Nov 2026 15:09:50 PST (-0800)
Subject:     Re: [PATCH v4 04/19] efi/riscv: Rename __init_text_end to __inittext_end like other archs
In-Reply-To: <20261118182105.1633603-25-ardb+git@google.com>
CC: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  Ard Biesheuvel <ardb@kernel.org>, jgg@nvidia.com, pjw@kernel.org, aou@eecs.berkeley.edu, chenhuacai@kernel.org,
  loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ardb+git@google.com
Message-ID: <mhng-D54B7D56-AACE-456E-AF40-670E83DF8B47@Palmers-Mini.rwc.dabbelt.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 18 Nov 2026 10:21:10 PST (-0800), ardb+git@google.com wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Align RISC-V with arm64, LoongArch and x86, and drop the underscore
> between 'init' and 'text' in the section markers. This allows the value
> to be captured by generic EFI stub code that can be shared between all
> those architectures.
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/riscv/include/asm/sections.h         | 2 +-
>  arch/riscv/kernel/image-vars.h            | 2 +-
>  arch/riscv/kernel/vmlinux.lds.S           | 4 ++--
>  drivers/firmware/efi/libstub/riscv-stub.c | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
> index a393d5035c54..4a882a28f414 100644
> --- a/arch/riscv/include/asm/sections.h
> +++ b/arch/riscv/include/asm/sections.h
> @@ -11,7 +11,7 @@
>  extern char _start[];
>  extern char _start_kernel[];
>  extern char __init_data_begin[], __init_data_end[];
> -extern char __init_text_begin[], __init_text_end[];
> +extern char __inittext_begin[], __inittext_end[];
>  extern char __alt_start[], __alt_end[];
>  extern char __exittext_begin[], __exittext_end[];
>
> diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
> index 7b44b94f1283..bf703eba3fa5 100644
> --- a/arch/riscv/kernel/image-vars.h
> +++ b/arch/riscv/kernel/image-vars.h
> @@ -27,7 +27,7 @@ __efistub__start		= _start;
>  __efistub__start_kernel		= _start_kernel;
>  __efistub__end			= _end;
>  __efistub__edata		= _edata;
> -__efistub___init_text_end	= __init_text_end;
> +__efistub___inittext_end	= __inittext_end;
>  #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
>  __efistub_sysfb_primary_display	= sysfb_primary_display;
>  #endif
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index 9849a3e4d102..0ec1b4b55e41 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -46,7 +46,7 @@ SECTIONS
>
>  	. = ALIGN(SECTION_ALIGN);
>  	__init_begin = .;
> -	__init_text_begin = .;
> +	__inittext_begin = .;
>  	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) ALIGN(SECTION_ALIGN) { \
>  		_sinittext = .;						\
>  		INIT_TEXT						\
> @@ -72,12 +72,12 @@ SECTIONS
>  	}
>  	__exittext_end = .;
>
> -	__init_text_end = .;
>  	. = ALIGN(SECTION_ALIGN);
>  #ifdef CONFIG_EFI
>  	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
>  	__pecoff_text_end = .;
>  #endif
> +	__inittext_end = .;
>  	/* Start of init data section */
>  	__init_data_begin = .;
>  	INIT_DATA_SECTION(16)
> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> index 725b634c5179..5cbc50a814e1 100644
> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> @@ -34,7 +34,7 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
>  	efi_status_t status;
>
>  	kernel_size = _edata - _start;
> -	kernel_codesize = __init_text_end - _start;
> +	kernel_codesize = __inittext_end - _start;
>  	kernel_memsize = kernel_size + (_end - _edata);
>  	*image_addr = (unsigned long)_start;
>  	*reserve_size = kernel_memsize;

Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
Acked-by: Palmer Dabbelt <palmer@dabbelt.com>
