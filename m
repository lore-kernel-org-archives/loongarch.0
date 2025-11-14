Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52E720298C
	for <loongarch@lists.linux.dev>; Fri, 14 Nov 2025 04:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763095212; cv=none; b=Y5XHJhGjH79Fue5TcvKCe/a2vThb4fkHVcmqyuv7vC4gVovgLFxuYtRNTkG3oN+Cq6S7v/qz7pQ5YoBVJLwKeeXEi5fxkSz7Y8oi0d5SW5ENcPHfKE+wpDeSTsJGFQRWo8sD3R5UBY89IbRlOXC6mtdapqf+5U9X5rZ9f7imdog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763095212; c=relaxed/simple;
	bh=v6HrqhBuy9+ldB7R8U+6TYaR2yT2dWsihoYbTvmupVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2xOS19o6JO1PXZzvJugmZBLVSQrHC8eMh1XW9OBGQB7/YdyWlv1YWwq+Ytxh/jCShkBSDFP/jQZdqxLxD17x5U6OtlnzcjeEhpZ10d+C+YZGjYGRZSIwfSepi/aAI3NAxzuNSYdlClulxwIN4O7Y8y9NayIzdTJWWki5Uk5MgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xb/yTNBe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xb/yTNBe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56C8C113D0
	for <loongarch@lists.linux.dev>; Fri, 14 Nov 2025 04:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763095211;
	bh=v6HrqhBuy9+ldB7R8U+6TYaR2yT2dWsihoYbTvmupVg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xb/yTNBeMGZevzMu1HMWRGDwUtt9I4fKTuT0yhMY9QDez4P7ypxhCeWJcs+nlaucz
	 hcPSByfN/Y69Vy/CD6behlkBeKF/tZJKiIUnn3ujG8wQrFUixOt4F6MtH8qsjy15Wf
	 W+eXVtm8R5ByTKdWNreZyHmk4V1E1is1+2Nhreigc8hFRMSBIDhpu9jW8vVWMGNBDf
	 qlXDFLMuw3z/7DvLx2aLSLUygLWmODVEcwsx/w7jbeX56xouehc/z07Z3s6QwUeUid
	 h78guwJVebIQljFb2o5yWkPHqtX5PkLiOqxFxZhHPyNLxDvHJFLeJWA84y3IPhSv16
	 1wjWga56lPrQA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b72b495aa81so187574666b.2
        for <loongarch@lists.linux.dev>; Thu, 13 Nov 2025 20:40:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUr4TZ2yHSEDQO5fhP3nWQ5OV3S4ScBAjUdsjPtWqrb3g/pYE3iYn20BwObORRNiL4/gDXpxlfde6Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqaNudsxV9fhVuaVoILtcjlY0KtbG/YkWy8frVj/OmmjSPF2hq
	YI0j4Mzx6BBlNW1co1PkX8haefNmeEdtRv33EYmnvIgm3N+p3r7qB2f4y2cMZJPUEjdfILAEcS2
	pZHfPvTX5G0umfO9luREkx9FjUBPa8/E=
X-Google-Smtp-Source: AGHT+IGXnHAz5CUsb5+wbFnNyJeY3qA/eOIm/7NMxjarB87Hebn2vhlrR3CZQDxzB2FrVBX9tAX15//1aMb8BgjCSXs=
X-Received: by 2002:a17:907:6eaa:b0:b70:52a0:f2b8 with SMTP id
 a640c23a62f3a-b7367828b73mr159408566b.16.1763095210424; Thu, 13 Nov 2025
 20:40:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251105151257.148530-1-xry111@xry111.site>
In-Reply-To: <20251105151257.148530-1-xry111@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 14 Nov 2025 12:40:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7_duGXebg+7upKcctPsSWPt5WTdk0aq=91dg148aR7UQ@mail.gmail.com>
X-Gm-Features: AWmQ_blgSGpbW3CmUB83t2g2DZ6wk8b0Yxx1nm5EueGvUN1owUiIzt9O8kfJ1sM
Message-ID: <CAAhV-H7_duGXebg+7upKcctPsSWPt5WTdk0aq=91dg148aR7UQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] LoongArch: Bit reverse improvements
To: Xi Ruoyao <xry111@xry111.site>
Cc: WANG Xuerui <kernel@xen0n.name>, Mingcong Bai <jeffbai@aosc.io>, 
	"open list:LOONGARCH" <loongarch@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Wed, Nov 5, 2025 at 11:14=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> Tie some loose ends in LoongArch bitrev.h to make it really useful.
>
> Xi Ruoyao (2):
>   LoongArch: Select HAVE_ARCH_BITREVERSE
>   LoongArch: Simplify __arch_bitrev32 implementation
>
>  arch/loongarch/Kconfig              | 1 +
>  arch/loongarch/include/asm/bitrev.h | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> --
> 2.51.2
>
