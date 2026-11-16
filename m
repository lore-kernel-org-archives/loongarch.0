Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816102;
	b=zpDuXy1sFK/X2a/kqvQE2VTXI78Gw94QV0bECqGjd92Y8S7wa84OuWXj+GOvwnelxXSk
	 aaKtm3dfzIch2uiWI1VuPyXSmRFZvEwCg12OPshxqm4iCyR5fhV4xMDHEkWZMsJstZQkY
	 kWYhK1z5SJ1egyAF0YBR4uucmWJZeIkFpCXwRgZ+Te3VwuJRgETiL/ZYaC24LcBCL/6uz
	 aRk54JJ5uqINfkv5r87N+PBQymdfJsmY0LJIVPbg5LrXl1YvpcnBQLW4Q8W9d4WrJEzQT
	 OfOIJzDJvJKyt+/VZyg3qsrJEE3CEHOaTB4U0FkBDCB1Vkrs9ZYhBjK6zCngqDuQRPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=YsacxGE14wOKz6Pg8TZXlOHyLRTqOTqtvBl+xKa/O2U=;
	b=OGVchS/oCKNnrEfJ3ZIbnZPPTU4cSLZ0TMCosOIJ+orIdTPiA6kr1uD0L2SXzP9oDykO
	 tPQV0EJtlWRHZ0IzMUuCE7PdvZ7IAhTHfqkheJWW89ypjRgsT6t0JjX57Or7Yp0Iwrglb
	 opHw1GQxr0gv8BcsRogGxz2Y1pYGXboA95058MnRCdZ9nE0xfr0DmySgM8xGfgLjfaZfm
	 GmKrYGm0yrN/whO93iGnVkRGFxtkw5eOanuR7bJ7cHD9ujJjKTp8yHvNlzvDHFPsIHcGN
	 GEQsff9PxxHHe8ZGRDASkQRWWTpLSPE9s0is8YlAo8ZzzmO/bHLUEwe/U8lKipaQy/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Nk89zR6c;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B7F606A32C
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 08:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0B7F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Nk89zR6c
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5075fa7ed0so525086166b.2
        for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 00:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794816100; x=1795420900; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YsacxGE14wOKz6Pg8TZXlOHyLRTqOTqtvBl+xKa/O2U=;
        b=Nk89zR6cOJ1mybJZJMEaoB6i6ddYV+Q3uUHB+5wbLl0y8LfBI5JAgm4cr68kDG/z8K
         5mKcxATVeoyQ9iU8sZz2bd97OI6q16YvaPk4lXr39RN+x+lhUNn2v4/sExGUSgRKWoAz
         It7D/3nbEXe3gy5PJ01ZK/49vnaicN/VvMOMM6C7ESvN2cG9HGMtutnA1DXiipyuh/WA
         pvBuaQMWu4Nwlh3tjngOSbc9mGkq00g5xMK4sN9LeSLLVIpj7P//eU4tz7mqBSprCyFv
         JirtFhDC8LCsxzgwHjmo6rLpOBcwQ39xfjRsm35QiCVVfXGXxG91L9BwFxT+yjybOFr2
         u3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816100; x=1795420900;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YsacxGE14wOKz6Pg8TZXlOHyLRTqOTqtvBl+xKa/O2U=;
        b=g7Y74NmyTOubx+095r84Z4pz8iXAN/feZ9VNr10jyK1Zajjv8JYtMij62wr1ipGXR6
         1YeRr5vnVDGdJfgiUPGvwfNCDc+CH7mMl3jD/2AeraUVxuwtbS0XFTcH3zFAeOixwXxO
         y5bgnTfmeVSyRpXAfFmF6i2JuCIJmIQjXeUmhIpe/c34VJWUgjEodM4NCAu4vYzHk5+l
         vp3L6MV6Hsi3JUjgNJD0MNpfSpWSkaXAvSg5i4+zaIYzJJ1bfkL3HbNsmZZqs6zodgck
         EeJ+Yx7m3ye2WR5dwfeITlWrT0CO2Ru+lZTc9j1NxVlUXXOfBY3Mm7xGWqbncaisOKsz
         TarQ==
X-Forwarded-Encrypted: i=1; AL+hErFvF/uzBdZz442l//5M3BHx0klmWMNOWE+cIq/KJryvwwTyJanNB3wyCR4DX9yA9ftV3CYC88r99Sw=@lists.linux.dev
X-Gm-Message-State: APuU4Z8dd0M/D0BMSBsqE7pMjGVQBjoNlpBYKd/hExIsujWmnpy/Cp9h
	J/fKzlmHpkVlc4Y7A81uc86WjuHwwst78BytMkV4F2OgM/hudzGHg5xICIotLJEOc8+fjaqTzQr
	j5CZHjMFY
X-Gm-Gg: AYBFou0G+0IiQYyv2F9FiuXlmcTEyLHhjHsshemLrm67eAge76oZGDZaMv2o6C69OUY
	v5UbGACqHw90+bZ7L4OaEAX4VneomssikZnB8vViIFlnxuNNGKUsuHb1zBhG69Ec0geWfaOQ907
	8PxTX0sz3r6t4adHRTnZLlpI6kiGuAh3qLR3gzsbQKa1iAl70sm0mxGA+4NHy0W3NJLnX+P7s1y
	j9qblsSS4/mwGFIA9D+xyfprzXBbqJ/R7vuzVCG6Xh/wu7/Uub/bNQFjYSbIMvvUq3KrRuV23b7
	fIzTgwXeMC6tXlTbKWL9lDpBbAGoGMGXENvoKTxarnIUmq9BzSvY7UC1AyDD/ZsYxJqLSMyBapO
	Sz1JIKkQdm2f+hmi32U4pLZNWo6LPz2q6AFEItDVj8xw/GhiP479J56z5JhEu4folXUzAO26E6U
	jTwLtXYmQYo91nl6UF8C1h7+lpc/YrBCuIcns/7cEO1zpoeupQ+VUAbqtUaICq9aLeqc9m0lHq8
	KiFNpZqSU/YAY8XC3FLT0cjd+5J8OjOXytm2wfbfiY5LE63DFCrPCCuWnYR+EW9HQX1NWxKZBm9
	i7fKtZfufndJR323zN39YTytZuFCkyQ8gM0olEaUHNB/4TK4bsqHnjusCSRCA68=
X-Received: by 2002:a17:907:1c90:b0:c2e:63ba:1f90 with SMTP id a640c23a62f3a-c50963bc4f0mr777600066b.48.1794816099924;
        Mon, 16 Nov 2026 00:01:39 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7b2c9sm385795866b.73.2026.11.16.00.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:01:39 -0800 (PST)
Message-ID: <dfdd6f4437cbf8f55458b908ec5347f3189bce80.camel@amutable.com>
Subject: Re: [PATCH RFC 4/4] crash_dump: use copy_oldmem_to_iter() everywhere
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao
	 <leitao@debian.org>, Chris Mason <mason@kernel.org>, Thomas Gleixner
	 <tglx@kernel.org>, x86@kernel.org, kexec@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>
Date: Mon, 16 Nov 2026 09:01:37 +0100
In-Reply-To: <20261112-work-procfs-oldmem-v1-4-ecdcafd99265@kernel.org>
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org>
	 <20261112-work-procfs-oldmem-v1-4-ecdcafd99265@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-12 at 17:37 +0100, Christian Brauner wrote:
> Make the remaining copy_oldmem_page() implementations copy the page
> of
> the crashed kernel with copy_oldmem_to_iter() like x86_64 and powerpc
> do. None of these architectures has a machine check safe copy today,
> so
> for them this is copy_to_iter() under another name. But the copy of a
> page of the old kernel is in one place now, and an architecture that
> gains ARCH_HAS_COPY_MC later gets the recovery without touching its
> crash dump code.
>=20
> s390 stays as it is. It copies the old kernel's memory through its
> real
> address mode window in memcpy_real_iter(), and an uncorrected storage
> error is fatal on s390 anyway (cf. s390_handle_damage()).
>=20
> No functional changes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0arch/arm/kernel/crash_dump.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
2 +-
> =C2=A0arch/arm64/kernel/crash_dump.c=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0arch/loongarch/kernel/crash_dump.c | 2 +-
> =C2=A0arch/mips/kernel/crash_dump.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0arch/riscv/kernel/crash_dump.c=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0arch/sh/kernel/crash_dump.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2 +-
> =C2=A0arch/x86/kernel/crash_dump_32.c=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A07 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/arm/kernel/crash_dump.c
> b/arch/arm/kernel/crash_dump.c
> index 938bd932df9a0..0f2628872b00c 100644
> --- a/arch/arm/kernel/crash_dump.c
> +++ b/arch/arm/kernel/crash_dump.c
> @@ -28,7 +28,7 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
> unsigned long pfn,
> =C2=A0	if (!vaddr)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	csize =3D copy_to_iter(vaddr + offset, csize, iter);
> +	csize =3D copy_oldmem_to_iter(vaddr + offset, csize, iter);
> =C2=A0
> =C2=A0	iounmap(vaddr);
> =C2=A0	return csize;
> diff --git a/arch/arm64/kernel/crash_dump.c
> b/arch/arm64/kernel/crash_dump.c
> index 670e4ce818223..c774b3aba107d 100644
> --- a/arch/arm64/kernel/crash_dump.c
> +++ b/arch/arm64/kernel/crash_dump.c
> @@ -24,7 +24,7 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
> unsigned long pfn,
> =C2=A0	if (!vaddr)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	csize =3D copy_to_iter(vaddr + offset, csize, iter);
> +	csize =3D copy_oldmem_to_iter(vaddr + offset, csize, iter);
> =C2=A0
> =C2=A0	memunmap(vaddr);
> =C2=A0
> diff --git a/arch/loongarch/kernel/crash_dump.c
> b/arch/loongarch/kernel/crash_dump.c
> index e559307c10929..03a136b8be8da 100644
> --- a/arch/loongarch/kernel/crash_dump.c
> +++ b/arch/loongarch/kernel/crash_dump.c
> @@ -15,7 +15,7 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
> unsigned long pfn,
> =C2=A0	if (!vaddr)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	csize =3D copy_to_iter(vaddr + offset, csize, iter);
> +	csize =3D copy_oldmem_to_iter(vaddr + offset, csize, iter);
> =C2=A0
> =C2=A0	memunmap(vaddr);
> =C2=A0
> diff --git a/arch/mips/kernel/crash_dump.c
> b/arch/mips/kernel/crash_dump.c
> index 6e50f49024094..078c0d1e8df46 100644
> --- a/arch/mips/kernel/crash_dump.c
> +++ b/arch/mips/kernel/crash_dump.c
> @@ -12,7 +12,7 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
> unsigned long pfn,
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	vaddr =3D kmap_local_pfn(pfn);
> -	csize =3D copy_to_iter(vaddr + offset, csize, iter);
> +	csize =3D copy_oldmem_to_iter(vaddr + offset, csize, iter);
> =C2=A0	kunmap_local(vaddr);
> =C2=A0
> =C2=A0	return csize;
> diff --git a/arch/riscv/kernel/crash_dump.c
> b/arch/riscv/kernel/crash_dump.c
> index ea2158cee97b3..0820e3db12603 100644
> --- a/arch/riscv/kernel/crash_dump.c
> +++ b/arch/riscv/kernel/crash_dump.c
> @@ -21,7 +21,7 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
> unsigned long pfn,
> =C2=A0	if (!vaddr)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	csize =3D copy_to_iter(vaddr + offset, csize, iter);
> +	csize =3D copy_oldmem_to_iter(vaddr + offset, csize, iter);
> =C2=A0
> =C2=A0	memunmap(vaddr);
> =C2=A0	return csize;
> diff --git a/arch/sh/kernel/crash_dump.c
> b/arch/sh/kernel/crash_dump.c
> index 85c0e58f1a59f..2a5988b6e9d7a 100644
> --- a/arch/sh/kernel/crash_dump.c
> +++ b/arch/sh/kernel/crash_dump.c
> @@ -23,7 +23,7 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
> unsigned long pfn,
> =C2=A0	if (!vaddr)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	csize =3D copy_to_iter(vaddr + offset, csize, iter);
> +	csize =3D copy_oldmem_to_iter(vaddr + offset, csize, iter);
> =C2=A0	iounmap(vaddr);
> =C2=A0
> =C2=A0	return csize;
> diff --git a/arch/x86/kernel/crash_dump_32.c
> b/arch/x86/kernel/crash_dump_32.c
> index 5f4ae5476e193..cb202d4e1f703 100644
> --- a/arch/x86/kernel/crash_dump_32.c
> +++ b/arch/x86/kernel/crash_dump_32.c
> @@ -40,7 +40,7 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
> unsigned long pfn, size_t csize,
> =C2=A0		return -EFAULT;
> =C2=A0
> =C2=A0	vaddr =3D kmap_local_pfn(pfn);
> -	csize =3D copy_to_iter(vaddr + offset, csize, iter);
> +	csize =3D copy_oldmem_to_iter(vaddr + offset, csize, iter);
> =C2=A0	kunmap_local(vaddr);
> =C2=A0
> =C2=A0	return csize;
