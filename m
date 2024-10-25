Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253E620C334
	for <loongarch@lists.linux.dev>; Fri, 25 Oct 2024 20:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729888348; cv=none; b=g2Ik+nj1IDUs6ToAvrpW2urDTec0faObLDBVxjPdmQvMFxYIil4f3Pur9888iiDRag2ltoQF5V0G6NxA2ftLrQ3TADqnkj88pU763hXLS4DcLrnmb9fAmp3TTOYa5wqhMBmpncWGYJl3tMaQnY9Ihl+WzOs1YbjjhpsGO68vlDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729888348; c=relaxed/simple;
	bh=ZOwjJ8kzzckhcIYE8j5hMZsSJUKc5cYu8yXf20E0HuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eN7mzVwPJh4mjS8BlNnYLAlTcl/BFHz6MAZbqbPjuHfZMCCQ6PA+qFgLNUoyP0r+HPlX4PQs19sXC8Rm9oZ687jEIIArnpzpq7DzLhM50+YOJN5oMQXWE0dbGWO7EV9bIKXyVowzbnBy5OdrPgWloMxGEJ0OpAtUcqAAHRYLduY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qQe2ZQ+t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qQe2ZQ+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8A05C4AF0B
	for <loongarch@lists.linux.dev>; Fri, 25 Oct 2024 20:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729888347;
	bh=ZOwjJ8kzzckhcIYE8j5hMZsSJUKc5cYu8yXf20E0HuM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qQe2ZQ+tSWetaoVGslaOuLKxN45AkmR2qZL3ILBwg0inR1U0Bmqzc2I/H0SPNy1q+
	 xqhvZ1lVsaUgvK+i94ztGpOyctfsh9xsUmDl7oWGF8DsRY0dU+ALpo3kC2CFzgTRCs
	 d1Gn2syKnR1u3PGOMFPA5PNTxrRkzCzY8B16NsRjasHVCOlyrTHAR42WYFBMOtUfdG
	 GuwI0SitSv5h2cI0j6gOREAiw+lsj8YMWu7ap7hTnjYpP9sp1h+2oosiZ+DKa4ioms
	 DkdlTrqAnhayaHpQbacjuHAxvBZczD1BLzN5cmfWkxHDMqhlulxn98YRbq9P+Xq7+2
	 Z2GT/dJ3wtK6A==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb443746b8so25475841fa.0
        for <loongarch@lists.linux.dev>; Fri, 25 Oct 2024 13:32:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbXjZzO5/efpMdQnbhdxlbEaNjxAzaMiJ5tUaCDMK1J98x+RKUCxd9We7l4hXd5B33rbNBhR5Iqto=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdNyU+vNmZGnNBZBzSVXirFqcFN9H8h6umDHkJJHSqD0c5HUVn
	FQQiHQqij7tsr1puor9ZfatpKxGKX1LdxnnJIxDXc3Oa/eqADbPBF9AJu908KZWzygWKCVk64kv
	qK/1uNeMeLVyIER78ZTI/01+98S0=
X-Google-Smtp-Source: AGHT+IHWDYSNqGzTxA1yucLBJm6V+3waey3TQHM3kNvlUas/obIoVX4SuU3pAE8hqdaCjuOs8zy+d7cgGIIryFN5WyY=
X-Received: by 2002:a05:651c:50b:b0:2f9:cc40:6afe with SMTP id
 38308e7fff4ca-2fcbdfae574mr3209411fa.14.1729888345976; Fri, 25 Oct 2024
 13:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241025191454.72616-1-ebiggers@kernel.org> <20241025191454.72616-4-ebiggers@kernel.org>
In-Reply-To: <20241025191454.72616-4-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 25 Oct 2024 22:32:14 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFoer+_yZJWtqBVYfYnzqL9X9bbBRomCL3LDqRcYJ6njQ@mail.gmail.com>
Message-ID: <CAMj1kXFoer+_yZJWtqBVYfYnzqL9X9bbBRomCL3LDqRcYJ6njQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] lib/crc32: expose whether the lib is really
 optimized at runtime
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Make the CRC32 library export some flags that indicate which CRC32
> functions are actually executing optimized code at runtime.  Set these
> correctly from the architectures that implement the CRC32 functions.
>
> This will be used to determine whether the crc32[c]-$arch shash
> algorithms should be registered in the crypto API.  btrfs could also
> start using these flags instead of the hack that it currently uses where
> it parses the crypto_shash_driver_name.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/arm64/lib/crc32-glue.c  | 15 +++++++++++++++
>  arch/riscv/lib/crc32-riscv.c | 15 +++++++++++++++
>  include/linux/crc32.h        | 15 +++++++++++++++
>  lib/crc32.c                  |  5 +++++
>  4 files changed, 50 insertions(+)
>
...
> diff --git a/include/linux/crc32.h b/include/linux/crc32.h
> index 58c632533b08..bf26d454b60d 100644
> --- a/include/linux/crc32.h
> +++ b/include/linux/crc32.h
> @@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
>         if (IS_ENABLED(CONFIG_CRC32_ARCH))
>                 return crc32c_le_arch(crc, p, len);
>         return crc32c_le_base(crc, p, len);
>  }
>
> +/*
> + * crc32_optimizations contains flags that indicate which CRC32 library
> + * functions are using architecture-specific optimizations.  Unlike
> + * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
> + * variants and also whether any needed CPU features are available at runtime.
> + */
> +#define CRC32_LE_OPTIMIZATION  BIT(0) /* crc32_le() is optimized */
> +#define CRC32_BE_OPTIMIZATION  BIT(1) /* crc32_be() is optimized */
> +#define CRC32C_OPTIMIZATION    BIT(2) /* __crc32c_le() is optimized */
> +#if IS_ENABLED(CONFIG_CRC32_ARCH)
> +extern u32 crc32_optimizations;
> +#else
> +#define crc32_optimizations 0
> +#endif
> +

Wouldn't it be cleaner to add a new library function for this, instead
of using a global variable?

>  /**
>   * crc32_le_combine - Combine two crc32 check values into one. For two
>   *                   sequences of bytes, seq1 and seq2 with lengths len1
>   *                   and len2, crc32_le() check values were calculated
>   *                   for each, crc1 and crc2.
> diff --git a/lib/crc32.c b/lib/crc32.c
> index 47151624332e..194de73f30f8 100644
> --- a/lib/crc32.c
> +++ b/lib/crc32.c
> @@ -336,5 +336,10 @@ u32 __pure crc32_be_base(u32 crc, const u8 *p, size_t len)
>  {
>         return crc32_be_generic(crc, p, len, crc32table_be, CRC32_POLY_BE);
>  }
>  #endif
>  EXPORT_SYMBOL(crc32_be_base);
> +
> +#if IS_ENABLED(CONFIG_CRC32_ARCH)
> +u32 crc32_optimizations;
> +EXPORT_SYMBOL(crc32_optimizations);
> +#endif
> --
> 2.47.0
>
>
