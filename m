Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0E72BD5BF
	for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767174755; cv=none; b=MK7t0vr3zBoLmMLhvyvKFHxANsctFmkBMvwxQj7Q2gX3w7dteEXZe8i+T2MEtmudixZlpd+JlfeGRH8bFzq/FF39vY3trqNtmcJH8lfijN1r6qR3IgLTfDpxL6M61GBQnkPOaaFxvhgMpVPYLlI/eRr7DsjbJ15KZRzdZFJk92g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767174755; c=relaxed/simple;
	bh=VdDmjQ4JAxoYuNrsN0+TyUAhdRxSy8F7hB9plr7UWrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y4cjBKx1qjeBQu/bVaKcLXRK/KHUBhVtti56awwHM+vbxs7jhpdKgfxHf0xVKghGgtxE7QVeEp1gbGFSe2ApV922KiClI64G9nvWSe3rrH79SC7JlOknZNGAd7wkxQ3FzSMZrOkCOGnGW4okB2tJTVmIAxHkb+JEtpvc8wnq0b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/3EfEEZ; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/3EfEEZ"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-45330fe6e1bso6381918b6e.2
        for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 01:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767174752; x=1767779552; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYkBJheeZCz4A/o1R3uoPvR1MpxvgYK6K0B73qt4Egk=;
        b=P/3EfEEZvuZMY8pcVrsqaWrarYWS32f/vLTJAu41lk0eq1WpNbGyxAfx/nluNsqGh1
         ZJ6a+SRYt+/HO/r6uzDxf6tnY5DvcAOKz6AL51hqMzC1kt+PSm39ScM/p+9q9D//nzEp
         ONbYbM5UCKjpHSV0VZNcCzM6HK7g8xigsh2w06ElY72Uw8FvnnRVwcmMsQxg05qdiIHC
         mdZPIexL3PBNX+XLl9yCnmSM50OMUoLkOwAb1XMKQ6ZeFX+ihAFiXFrTG5dbRL5sWlDy
         AezKK+ihCXzwWsZqq5LG3XzgUsAdybhTk28fn2J5mrru+b70qpR8kZRVl5UGsa2j5xhV
         Dzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767174752; x=1767779552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bYkBJheeZCz4A/o1R3uoPvR1MpxvgYK6K0B73qt4Egk=;
        b=BZwpvccjaN77rLhrURaDBsAKh8l/2ff8josOtPjIbgjMoEaqY/pNhu6b7g0mAFrJP7
         gldAycyAk8Qr9EKZ8sbvyYT36iR0J3BGL09Vwat3C/8gP83QsBzei/ercdpYffz1BVSq
         rjqVTdSEsgmBzef0OSnia7NwdzFGkt+L4TsxF1zXigZNzyoOVYmL/VjA+d0HaVeEQqdR
         NKZsN+dGDH2p9Z4q69tw1Y+xFBhdJDKHVx3vBmOZD516Pkv4Etj2OzG6/CXT98UgEjit
         0qUouMyG24fThETndT1qNvvaqr20KeDI6WByPfE/Fxk1pR7ct3Triuwz4EgzEzYwCXfp
         tuDA==
X-Forwarded-Encrypted: i=1; AJvYcCX+V+XGNJJQ+PhJceIkJXIY5ZFCiAP2+ngTjcWoiGDaFM1mZB7aDyrRS1ng+qDWQ/rZq4FyxyFzFTU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yya1LJjCVq7Fj4Q/9jwh32/KTXSiDZI/AeRNPypdAnGkBdN2hiq
	sx87tsZF5TPz6/YPW09J+dEtw+PtJpq+1dAmJMlh8kApOi/UiZ+zCgdOetXiruh3IcjDwTx088L
	HDPxdysYXaxlffMe3mN14A8JsK0r3QrU=
X-Gm-Gg: AY/fxX4iYgt9Nxar1MwoRk9ofD4am0l9yNefF9uhn4vd0L26KfuXiWqq7OY1v+wBrXR
	FDAS8DbXrrbqt5oAzQLRW8OsYLwdgfB4LW7LWRnovoaJ5ij4TS4fy9rapNpJgmH6dGyllMJS66g
	On+cCMWsNgfZjJEXajxHF3+BMEVJAt4+rPy3vSAGiTs3wPAwiatjHZ7mFupjZi/62E+3TY205O1
	1FNwr0y6iA4vuVLimjd0RjgsT7eYKVgY/HoxiB/+JFD5AufhA0Dil0+BK2A6PE2zsFR7bLb
X-Google-Smtp-Source: AGHT+IEpSiYoU4+fxBrvVnsK2b6+pCIzNeEu7EOnft50+VMESr8CNN11a9rNzKZLxWaS5m6tnQOIgXRkR3DWQC5F20A=
X-Received: by 2002:a05:6808:19a6:b0:43d:6a69:7752 with SMTP id
 5614622812f47-457b1e54ebbmr18591948b6e.2.1767174752360; Wed, 31 Dec 2025
 01:52:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEyhmHSi1LPW75Ovt=M8-8sv1S2LRmZw_YduJt9OUoy+OMSjKg@mail.gmail.com>
 <20251231034523.47014-1-dongtai.guo@linux.dev> <20251231034523.47014-4-dongtai.guo@linux.dev>
In-Reply-To: <20251231034523.47014-4-dongtai.guo@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 31 Dec 2025 17:52:21 +0800
X-Gm-Features: AQt7F2p2lw0Dv9RAghXy4xrSApINc5ktEh2CMRdUCMMWOkRUGLVrae8A6OFbjyk
Message-ID: <CAEyhmHThJUgJED4FcAB6waVadTNJzSx4bFfsUw-4TZEeRjcF3w@mail.gmail.com>
Subject: Re: [PATCH v8 loongarch-next 3/3] LoongArch: Enable 128-bit atomics
 cmpxchg support
To: George Guo <dongtai.guo@linux.dev>
Cc: chenhuacai@kernel.org, guodongtai@kylinos.cn, kernel@xen0n.name, 
	lianyangyang@kylinos.cn, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, r@hev.cc, xry111@xry111.site
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 31, 2025 at 11:45=E2=80=AFAM George Guo <dongtai.guo@linux.dev>=
 wrote:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> Add select HAVE_CMPXCHG_DOUBLE and select HAVE_ALIGNED_STRUCT_PAGE in Kco=
nfig
> to enable 128-bit atomic cmpxchg support on LoongArch.
>

Reviewed-by: Hengqi Chen <hengqi.chen@gmail.com>
Tested-by: Hengqi Chen <hengqi.chen@gmail.com>

> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  arch/loongarch/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 730f34214519..f9845ebec1a4 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -114,6 +114,7 @@ config LOONGARCH
>         select GENERIC_TIME_VSYSCALL
>         select GPIOLIB
>         select HAS_IOPORT
> +       select HAVE_ALIGNED_STRUCT_PAGE
>         select HAVE_ARCH_AUDITSYSCALL
>         select HAVE_ARCH_BITREVERSE
>         select HAVE_ARCH_JUMP_LABEL
> @@ -130,6 +131,7 @@ config LOONGARCH
>         select HAVE_ARCH_TRANSPARENT_HUGEPAGE
>         select HAVE_ARCH_USERFAULTFD_MINOR if USERFAULTFD
>         select HAVE_ASM_MODVERSIONS
> +       select HAVE_CMPXCHG_DOUBLE
>         select HAVE_CONTEXT_TRACKING_USER
>         select HAVE_C_RECORDMCOUNT
>         select HAVE_DEBUG_KMEMLEAK
> --
> 2.49.0
>
