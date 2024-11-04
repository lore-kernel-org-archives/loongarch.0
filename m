Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3F71B0F2A
	for <loongarch@lists.linux.dev>; Mon,  4 Nov 2024 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730717818; cv=none; b=cFcnaFCgqQiJIQ7yc830sIpXZlT36MVsZWI2fppRQFT1ME5xht75WFY73G9faAUiPAl8Sm99WZsqy0BTWDHc1I5PI31PRqlRjoNHIONIgDlURtR/WqAWCKAHK/yaAZGGaIkkxQ7XUG9eeXK91BZL6r2V7+BYPUEDSH8v4KFP28g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730717818; c=relaxed/simple;
	bh=6qFxuwoqjmsBXA5afiRPckV6EYzE55EhM//TIyBTrQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eZB9v1QbIDnqxl3qgqw4O5Ct68WEd6oAYVDB3SIIM/hsAio9QQotxz87bB4r/OqGmjHvdx6dA4Mbmc1ZHO7cyC95kFLkejS/YR4h6/Jae4syNxuMmaRYmaL31TA+udz86QmYw5QJ2HI5z5sgMlW5Rw/8G7WjMxL2UWhXPeVxDAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EADOQrSt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EADOQrSt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4AAC4CED6
	for <loongarch@lists.linux.dev>; Mon,  4 Nov 2024 10:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730717818;
	bh=6qFxuwoqjmsBXA5afiRPckV6EYzE55EhM//TIyBTrQ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EADOQrSt03YURgotEa0RPC+Q+iLgiLTpyDunuCSyI8JrnJ8j4YEhKIdjW/X9XmfJY
	 sTCnqIY+Z2AkNeyzcvIvr+dGT6FfLBfZvlbrdb8z2SiV9hm+elSOB97O2rE7ro9EXq
	 0i/CQC7v2klAcuIyDxn2pg7/smSOsw0dT4Hhws9swr3/XRUtzPo+CxQGrrBX7df8D/
	 5J0t2oN4EkGyZAZoiEf4JRfD6nAiE3emF0OuGcBGMMWHNR23yXfKnSbJVb11OHm5BV
	 KUm+3gkbO7B14khPoblQ7uBvr3V7hMm9Omm80Fu2OU58gX+loUjMi/2DNHEoGYci8U
	 QgiPNae8TP/uQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so37097661fa.2
        for <loongarch@lists.linux.dev>; Mon, 04 Nov 2024 02:56:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpB8vGyC7qVtT4G9QVX5lzcYNnPbw362mMo+BcogIH6Bw4oY9auu4rMsBmlimKtI0l7xXkldGy02w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4L9ULf3bQBD4D6mFEMw55142Rt+XFNy5ZpctWCROm6lgPLvlY
	/szurXXKTIWvW0gyi9ppYTntQ2BQXJagS/o2RkZsBoQ3hU4MqKz74KpATiwV4HS4KQZQmwuBX5Q
	mlKvd7A+kQMYnPMNwlrjWzazRtiI=
X-Google-Smtp-Source: AGHT+IGbnKnh4aAfaULtSCmiukLUpnKZU5MlHxJghtOAuKX/zIcXfbKXe/xSvudBsLa83HeLXpJgE1iAQVUbiw2PNrM=
X-Received: by 2002:a05:651c:1508:b0:2fa:fc41:cf80 with SMTP id
 38308e7fff4ca-2fedb7ecd4amr43930581fa.43.1730717816511; Mon, 04 Nov 2024
 02:56:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241103223154.136127-1-ebiggers@kernel.org> <20241103223154.136127-5-ebiggers@kernel.org>
In-Reply-To: <20241103223154.136127-5-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 4 Nov 2024 11:56:45 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH3C1xP7865V-mJ+3=FDHTR-df909=7jift_Z6dmp58Gw@mail.gmail.com>
Message-ID: <CAMj1kXH3C1xP7865V-mJ+3=FDHTR-df909=7jift_Z6dmp58Gw@mail.gmail.com>
Subject: Re: [PATCH v3 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 3 Nov 2024 at 23:32, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Instead of registering the crc32-$arch and crc32c-$arch algorithms if
> the arch-specific code was built, only register them when that code was
> built *and* is not falling back to the base implementation at runtime.
>
> This avoids confusing users like btrfs which checks the shash driver
> name to determine whether it is crc32c-generic.
>
> (It would also make sense to change btrfs to test the crc32_optimization
> flags itself, so that it doesn't have to use the weird hack of parsing
> the driver name.  This change still makes sense either way though.)
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  crypto/crc32_generic.c  | 8 ++++++--
>  crypto/crc32c_generic.c | 8 ++++++--
>  2 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/crypto/crc32_generic.c b/crypto/crc32_generic.c
> index cc064ea8240e..783a30b27398 100644
> --- a/crypto/crc32_generic.c
> +++ b/crypto/crc32_generic.c
> @@ -155,19 +155,23 @@ static struct shash_alg algs[] = {{
>         .base.cra_ctxsize       = sizeof(u32),
>         .base.cra_module        = THIS_MODULE,
>         .base.cra_init          = crc32_cra_init,
>  }};
>
> +static int num_algs;
> +
>  static int __init crc32_mod_init(void)
>  {
>         /* register the arch flavor only if it differs from the generic one */
> -       return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
> +       num_algs = 1 + ((crc32_optimizations() & CRC32_LE_OPTIMIZATION) != 0);
> +
> +       return crypto_register_shashes(algs, num_algs);
>  }
>
>  static void __exit crc32_mod_fini(void)
>  {
> -       crypto_unregister_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
> +       crypto_unregister_shashes(algs, num_algs);
>  }
>
>  subsys_initcall(crc32_mod_init);
>  module_exit(crc32_mod_fini);
>
> diff --git a/crypto/crc32c_generic.c b/crypto/crc32c_generic.c
> index 04b03d825cf4..985da981d6e2 100644
> --- a/crypto/crc32c_generic.c
> +++ b/crypto/crc32c_generic.c
> @@ -195,19 +195,23 @@ static struct shash_alg algs[] = {{
>         .base.cra_ctxsize       = sizeof(struct chksum_ctx),
>         .base.cra_module        = THIS_MODULE,
>         .base.cra_init          = crc32c_cra_init,
>  }};
>
> +static int num_algs;
> +
>  static int __init crc32c_mod_init(void)
>  {
>         /* register the arch flavor only if it differs from the generic one */
> -       return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
> +       num_algs = 1 + ((crc32_optimizations() & CRC32C_OPTIMIZATION) != 0);
> +
> +       return crypto_register_shashes(algs, num_algs);
>  }
>
>  static void __exit crc32c_mod_fini(void)
>  {
> -       crypto_unregister_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
> +       crypto_unregister_shashes(algs, num_algs);
>  }
>
>  subsys_initcall(crc32c_mod_init);
>  module_exit(crc32c_mod_fini);
>
> --
> 2.47.0
>
>
