Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77772168483
	for <loongarch@lists.linux.dev>; Sat,  2 Nov 2024 09:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730541554; cv=none; b=ntH0ZvaEulSfPynB2B/fC7XgwnQyHNGMEKa432p6tB0tfvwBK1jAkU1/LdqQXVAZqo8WlYMWPh5S7S0LmN9llRkFjGljRNvN+pkXo0wqIwafAqM9xTUCg0LgkSDmL/v1DaqHKSEy9ZOdBtv1JW5noy3npWup8ge0om3JISEcMZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730541554; c=relaxed/simple;
	bh=jzcc2qtlo3q2yjXZFmDXUgFRfJJPX4XAPzkwICumNQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHsCuvXgo8mdg93T3COf7sPg62Zm/AxNTK4Da0DrIORa6W/NXqwymTXtEfpE3mcLpQItlN17MFrH2bA+hII5I6IFfpmfdZO0S6n3waDu6jgePT4QeT5y4emTahOJaXWh5zFLMbK5Zrn8ktCAsMi9nCAnYcl+i3ueue9Qrayz1Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pTAZ258u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pTAZ258u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 135B5C4AF0B
	for <loongarch@lists.linux.dev>; Sat,  2 Nov 2024 09:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730541554;
	bh=jzcc2qtlo3q2yjXZFmDXUgFRfJJPX4XAPzkwICumNQI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pTAZ258u/Bm55mgKfduPxcJ4+l7utIbI96FN3uHiYroZBZHAbnvfCZty3m5Rr2XH+
	 F9H9kpY23mllFcm03reDqSDwYlj6z0PqW6iPcayBoJoKDOej6utxzDbE1LxiDgLJej
	 urb0cE+UNWmcsBfRHpQmITbawEzxNGoWVLCC3Y8Sm8pFGBsK9d4GCjck+Inw9773Iv
	 K9VihTfRaPahcmoyEauQixFxZyTUMGJWDTOfYvXPoPOgSsyaIxQpyV/cg9HQXOUiLk
	 wu2j/IQnCytheMbmA1fvWXZkbzI7ui/5dw0pO/X8IJ8Hh4LoxB9jvG2GJ0onELclPL
	 6WJfZCxg2RXng==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2feeb1e8edfso1544451fa.1
        for <loongarch@lists.linux.dev>; Sat, 02 Nov 2024 02:59:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVE+IUHiOKe2g5BI9VC+G6qk7/nEI3ecIBd97FpduLIYu1pXe/QIXPGqO0l0Ly6K2V7V7P+KzbPyfc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7zpE/yVYd0prLnX9J0ShzmQx91hFux8MVupvxA8TwHWpsOa0d
	LN1RQGn2cu2AzI1OwSUz5lwtMvFfOTSacSzJA78b7st5F3IctGFKKmTqyi+U3fNkNET7lQwpU/k
	Bj6cpDCEZC9pQFT9q6lx4T3FemSA=
X-Google-Smtp-Source: AGHT+IEqeG8VCff0uhjP4V5ORLaNGD6KRrpJIJXC1kxDqwtW+gAEc3mfRLYGB8V+37TlYDdzVpYd4mw53pqQuHqGPG8=
X-Received: by 2002:a05:651c:19a5:b0:2fa:de13:5c34 with SMTP id
 38308e7fff4ca-2fedb7c7ad4mr47293611fa.19.1730541552417; Sat, 02 Nov 2024
 02:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241026040958.GA34351@sol.localdomain> <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
In-Reply-To: <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 2 Nov 2024 10:58:53 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
Message-ID: <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 Nov 2024 at 10:45, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > While testing this patchset I notice that none of the crypto API drivers for
> > crc32 or crc32c even need to be loaded on my system anymore, as everything on my
> > system that uses those algorithms (such as ext4) just uses the library APIs now.
> > That makes the "check /proc/crypto" trick stop working anyway.
>
> What's stopping us from removing them altogether?
>

At least btrfs supports a variety of checksums/hashes (crc32c, xxhash,
sha) via the shash API.

There are some other remaining uses of crc32c using shash or sync
ahash where the algo is hardcoded (NVMe, infiniband) so I imagine
those might be candidates for conversion as well.
