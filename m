Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2650148316
	for <loongarch@lists.linux.dev>; Fri, 18 Apr 2025 14:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744985972; cv=none; b=hhpB68ucaIcfQRJOEdZYY5qM0rUEQHxZYy/IYQQuQdlXm+WKz9hrsHIKLwlB7NkKgAczWYPjRrp6/BODxUxf+Cf2TAY+TsNLDcYjT82CsJKLXQDskVoLviEsUYbWar8OE8D8yRBRRW6lHrACwmwH6ubE57Dg7/XuGoe0ILpUgP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744985972; c=relaxed/simple;
	bh=om+Vna/2GFvSm09tdyvQMrH5gELgac15SstCZnvcK14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQv6Fge8LkDTIUffMw6dYfoNbG9yr19cTM0Gta89booGMwvCbfLAOfaqC9hgsPllUYw+d9HYCFR/1wTffkFSqbxdJPrABtNDwLWeKBmqNdiuDKliV/w6hfbkUvh+sMKwvESzJo7Zm/1Vias2bPzaIIlOSeYWuJ9XbpUjnpQWW00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRV/mjio; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRV/mjio"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A86C4CEEE
	for <loongarch@lists.linux.dev>; Fri, 18 Apr 2025 14:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744985972;
	bh=om+Vna/2GFvSm09tdyvQMrH5gELgac15SstCZnvcK14=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RRV/mjioS01PV47nXvZ0TWue3NIWYz4g3TvMtcGSc9SzDjv5ENiZxjjzbX9r29B3r
	 9/rQJy4n6bGeoy4ykbB+W4/4F7W0D3C9D3cINHvpgD0y02oiSDkrEm5G7Vf1UOSJNB
	 RQpnb5utZNxuqYFRuG86JaRbyR2LQdUMJyr2qEc11qUB69jHurGTthMhKqWn9Y9PcS
	 Nzl/cYyfucM8in2jji8Q98Ls2NeNC3pWDwx+RpeSSgWLOWSWmRB1nmRVItasiBs5Oy
	 j4ge2AaFjDu59Ljk0ccoDDlfXsh5ZyrSwgoTZOaXCcDebHhf0VadkqEJMQ5k7pZQjU
	 NX/2hSLrgVIsw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso18405141fa.3
        for <loongarch@lists.linux.dev>; Fri, 18 Apr 2025 07:19:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUASwNkfzyMsmDAy0CxTfhQJRc5pa5BTaDyGcSfXkVgSA/FYQ+KI3oBuRH2fpkmbKhue8BmckICubc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVxR+cXBsltFVehbXUeIf21fXxml0OYP6W4XIvxsDoxlALtyba
	2gH886zJTEc0kGylJk/ts9MB8laeSBOZgy3M2rHZCp7NLFg6HlvOyB2P9mG57JyVEiDS+zDtQBT
	Kii9Ynbj4bIp9AG0jSCS9AtLBRf4=
X-Google-Smtp-Source: AGHT+IFnh+q+URrFYgeso0knkjqFFZnTfGmXzWjvKWHdUWW3YHckdLRG/cd76/RqwZUrPe+JG12yfp7YED1LQQgVI5I=
X-Received: by 2002:a05:651c:241:b0:310:779b:9ef1 with SMTP id
 38308e7fff4ca-310904d4972mr9346751fa.13.1744985970634; Fri, 18 Apr 2025
 07:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250417182623.67808-1-ebiggers@kernel.org>
In-Reply-To: <20250417182623.67808-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 18 Apr 2025 16:19:19 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE4T4p7iCkfo=4RoMeU4sHh47EZyBUSdWv7HTqdAY2oCA@mail.gmail.com>
X-Gm-Features: ATxdqUG3NGrAHvWSlyQ9Wx2CgTU0VxdHzlcc8yhyIdwCb_viAAYGMbAHFukqzA8
Message-ID: <CAMj1kXE4T4p7iCkfo=4RoMeU4sHh47EZyBUSdWv7HTqdAY2oCA@mail.gmail.com>
Subject: Re: [PATCH 00/15] Finish disentangling ChaCha, Poly1305, and BLAKE2s
 from CRYPTO
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Apr 2025 at 20:27, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series removes the unnecessary dependency of the ChaCha, Poly1305,
> and BLAKE2s library functions on the generic crypto infrastructure, i.e.
> CONFIG_CRYPTO.  To do this, it moves arch/*/crypto/Kconfig from a
> submenu of crypto/Kconfig to a submenu of arch/*/Kconfig, then re-adds
> the CRYPTO dependency to the symbols that actually need it.
>
> Patches 14-15 then simplify the ChaCha and Poly1305 symbols by removing
> the unneeded "internal" symbols.
>
> Note that Curve25519 is still entangled.  Later patches will fix that.
>
> Eric Biggers (15):
>   crypto: arm - remove CRYPTO dependency of library functions
>   crypto: arm64 - drop redundant dependencies on ARM64
>   crypto: arm64 - remove CRYPTO dependency of library functions
>   crypto: loongarch - source arch/loongarch/crypto/Kconfig without
>     CRYPTO
>   crypto: mips - remove CRYPTO dependency of library functions
>   crypto: powerpc - drop redundant dependencies on PPC
>   crypto: powerpc - remove CRYPTO dependency of library functions
>   crypto: riscv - remove CRYPTO dependency of library functions
>   crypto: s390 - drop redundant dependencies on S390
>   crypto: s390 - remove CRYPTO dependency of library functions
>   crypto: sparc - source arch/sparc/crypto/Kconfig without CRYPTO
>   crypto: x86 - drop redundant dependencies on X86
>   crypto: x86 - remove CRYPTO dependency of library functions
>   crypto: lib/chacha - remove INTERNAL symbol and selection of CRYPTO
>   crypto: lib/poly1305 - remove INTERNAL symbol and selection of CRYPTO
>

This seems like a good idea.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
