Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815911;
	b=c2J54NDrwcVhOXbHmeojCPFCERXnXaF6McejkNV8060Y6X/oZ/VpeOuMqXvE19X19tl5
	 IWxjPCqMuqLyXyMu4wg06gOrOECWTBJVcwBl+M5zDFWzp1S7k0EtYld90b2z4EXw77eOW
	 YtoN9/jJxosxlySe2hMCIYoClf7xHu39lzM3LVsfiON8d2gg/BamiVTjPDE1Og51DSWuE
	 AKrhqQxazJgvNSJCEMNOBKEFVkkGm2R+gNPjsWqfCzpt/vAlsXWru2wP8J6wfVHG/CE0e
	 /mxc8cLJqEZuDH8g6SAAkZdqWkjxjcxAXuDyo5XwKafbBP8hUW2gXQehUDuVdS5JoIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=MJ7d3rNHeUtNAkSjUSjsQ3HRQiSBTnNiLXOBSu1liKw=;
	b=C/5CXyx2ev+31TT8N80ssk1G9U9LVySLMQr8udliaWoOZh9eYR82do/kDgIhnXO8Hja2
	 GTxqxRhfftBLolzp4LL/7RPka5W2iyTFR1gfTdz7MWIQh6GogH5dD5qDj5fAYi5PgEILi
	 UJC15GAyS3vP/rqTPNQ8oz+3moAH0nSeiuccnOYm7Xq/Yx3OFBQHZCC8g6uZGNPmXwp9n
	 GntZO23Q0YfQ2us7HeVB1CimmUZS80Xu2S2WNOByFfac0RejuF71jXh86QK4AgyytPtbS
	 Q1pTSUetaeKmvEBKgVlrXrst3N6VH3dIJw377RY6zo8mJ6uTMmWGLoIxG9Ofm+PjA8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=S2ueUYGp;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A89606A323
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 07:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A89606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=S2ueUYGp
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49412eb1474so1449596f8f.3
        for <loongarch@lists.linux.dev>; Sun, 15 Nov 2026 23:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794815909; x=1795420709; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MJ7d3rNHeUtNAkSjUSjsQ3HRQiSBTnNiLXOBSu1liKw=;
        b=S2ueUYGpD1uZilgYd/EJdmDK+c5ppHCqFaHeHD99lDJHkSDfoN9k1nJAofUEAY6HNG
         1qx45jR80eyu0ctM01HXR2oMt6zWA74bo1sC7Y5sMsvGIqFBk0tfCfl5cE1nP87rOeAR
         OqM5foR10KPE5Y+OFi15V3r/Nti8aJWjO4B/2qI0h+PJLCqI87OPnbwca2++0dhdcCTe
         H5B1XQsgWojrjv1CCtnFUiYke4G7t4qAeYDb96zDns/Q8VgZPQA16Ds1aFI1ed/fhBmj
         MINtQ9SHK/qAQU955aWktyq01K3ISosEdfyglVVloyl2Yss6hD9S6ruHW+eZUxUAJHSo
         OZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815909; x=1795420709;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJ7d3rNHeUtNAkSjUSjsQ3HRQiSBTnNiLXOBSu1liKw=;
        b=00mL/vuQiNVLaoEjjy9INd5QanMjd2ltSg5tnbforGK2NIYkg4wUYv4q8g/OXkW1Rz
         3GAf2wRKUoUFlVM/ZL9tkJDvnPdcyv2WaoPN402KJJ7x+9eKRbmc517McUr2SSVAb0yJ
         argY3Xsc0Fz0dYWZQwYznArRof1nm51BB+uCjLuHzQaOTIm7crVyZoWzdp4aj0oEuy3g
         MlEVtFUZ475Gxmx2XNWyZTb12xTS7LtK/8aE4dUzVMF4tI754yrcZ4DiBCZwlDQeLh0j
         0NETTjVoOeNddnpcfKk2S3K20EOW/vjNR6UCllk72xIGwIBOLbksd/cyoGmJ+K73yjiy
         XqEg==
X-Forwarded-Encrypted: i=1; AL+hErGm7Bfvhcv9NAN1GR+CmKuRyuGLZiXm7SEMwedk1rxqjD4T0twm+wJRuBBtxkLFpS/H4a48maAYw1k=@lists.linux.dev
X-Gm-Message-State: APuU4Z9/1c2TbCU7bCngL7S8sV1jcEKSduEW/4E3EhG519WdTYtQPhIC
	dPSAq3cl4h92Xdz4xUM7NYRVGDfsHnyEZLIjO1b1/0VYYm00Ne87CGP6iZayhfdR6ULb
X-Gm-Gg: AYBFou2g0n2FtZXxdCuaWtOEVqPpWlzHubqL/9sUFrjjivU2Mifj+/Aeiqj2nTnKsWI
	yPohFaCIXG2io4e9ohcHYHtvPSMrYz8bhJGg4tbRT87LcHRBWa6hxEpn5F3u+md8EtjnIYrPkDc
	2he4X300IIEwVSqIixztuEFHDYSz9tyZWolXg79I4IIuZ1oS8jN37GA8C0TfrDmR9nYpJT3we0d
	S1ARblsf7LtbnLTEr3IM2GLgGGPZrmj37Nn8g4Edd3T6SoMmLj9V1U2nlxeJXOpQRCXOfq9SwpN
	0VuXL6ZMJerI2uOPEr+s4cEN/J9RjIackX8PFCb83wjSwwUtdN6uQmUre0LtDEi6XVZLmareBPw
	a1JhHTRt2Q0DD9h3dpJqKXvbHi73odl8kzCBhLJa8/Aa9a1FQ5JkIi9cd7rR1153hPfJ0hgw8+Q
	a5l7/Fh8J4jYi6GoVuXolZ464ZYr3oOnpwYsexWwPyc0yXwNmw+iVFPCAjpWj4XfYpGr9c1NsJe
	cZWo189Ix8Sfgmuly9896Hg6y0ahDR8YYjirmF78xFUa1P4f8V6n0Tk5xCCTNpYbskZrlstCXxL
	yR4xcBUhgUk4ry/IyDuqUYXdcOYmD2fAkYsicYxs3HskmG7F1BkcLJWfTOy3co0=
X-Received: by 2002:a05:6000:3108:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-49c7353c415mr20084703f8f.45.1794815908942;
        Sun, 15 Nov 2026 23:58:28 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm21124748f8f.28.2026.11.15.23.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:58:28 -0800 (PST)
Message-ID: <19b4c35c016a91302bf6bc3380bfcd3d21dc50c0.camel@amutable.com>
Subject: Re: [PATCH RFC 1/4] powerpc/crash_dump: check ioremap_cache() in
 copy_oldmem_page()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao
	 <leitao@debian.org>, Chris Mason <mason@kernel.org>, Thomas Gleixner
	 <tglx@kernel.org>, x86@kernel.org, kexec@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, 
	stable@vger.kernel.org
Date: Mon, 16 Nov 2026 08:58:26 +0100
In-Reply-To: <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org>
	 <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
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
> copy_oldmem_page() maps a page of the old kernel that isn't in the
> linear mapping with ioremap_cache() and copies from it without
> checking
> whether the mapping worked. If it didn't, the copy reads from an
> offset
> into the NULL page. That oopses unless the copy happens to be a user
> copy, whose exception table entries turn the fault into a short copy.
>=20
> Return -ENOMEM like the other architectures do. read_from_oldmem()
> turns that into -EFAULT like any other short copy.
>=20
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 54c32021eb6f ("[PATCH] powerpc: Add arch-dependent
> copy_oldmem_page")
> Cc: stable@vger.kernel.org
> Reviewed-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0arch/powerpc/kernel/crash_dump.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/crash_dump.c
> b/arch/powerpc/kernel/crash_dump.c
> index 103b6605dd68f..1543917bd3e1d 100644
> --- a/arch/powerpc/kernel/crash_dump.c
> +++ b/arch/powerpc/kernel/crash_dump.c
> @@ -86,6 +86,8 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
> unsigned long pfn,
> =C2=A0		csize =3D copy_to_iter(vaddr + offset, csize, iter);
> =C2=A0	} else {
> =C2=A0		vaddr =3D ioremap_cache(paddr, PAGE_SIZE);
> +		if (!vaddr)
> +			return -ENOMEM;
> =C2=A0		csize =3D copy_to_iter(vaddr + offset, csize, iter);
> =C2=A0		iounmap(vaddr);
> =C2=A0	}
