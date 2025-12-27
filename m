Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126D12F1FD0
	for <loongarch@lists.linux.dev>; Sat, 27 Dec 2025 12:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838919; cv=none; b=OjKKvLSx0RPkOeV9iINJIKEXPT/YBmAy5CvQkP7tOtciCIw1CNFm9ReIzKNyD/Y1JghS/83qE1OtIr5RNVjABKP1mjCH9wmlCOeqa7lgjBOCtpq0YKAp1TVTOTgVNKWDGsd+X4Gzz7A5tps+gygMgxRD8ceo2FHOzapqpZneE4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838919; c=relaxed/simple;
	bh=5rv8ZuRUcwRsB8tSgDo2rGfZTe5zbB/xJ2QT9vObhQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CAkUjLbhMIMyh+UJhD10gc44vQTIGgE6c4J4y3k3xF46fBLox3Be1TvPgySDomp5MkMPYSoUynVy9UXW5j6ycO5/D1hUpesGIYVszrpA7uZd2GBa2MGp5gqdEmRS1q+ihu1bw3LIlhdTIja8b2y0BtS6DO3dV2Tbta8Z+HKeO/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DtuJC2hK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DtuJC2hK"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so62021435e9.3
        for <loongarch@lists.linux.dev>; Sat, 27 Dec 2025 04:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766838916; x=1767443716; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rv8ZuRUcwRsB8tSgDo2rGfZTe5zbB/xJ2QT9vObhQE=;
        b=DtuJC2hKrDVyN31xDqcg7wZD8F/V/NLLMIKfI6Eu3El2gs86ElPV4FzQ97Yd75pXjT
         Z0GoX83qt1hkQvc3ITjuvjeE/pIuwgZiyhYjNUX3Kwhm3MfM9dq901M2QjN53nbGmO10
         OBWN9nsyfzh+CrG+l1vK9vNfUkc5lfWS+urlygKBbhOiQvk1Usa8ljjGnCSI+6wd0RiL
         YKRPAOj86ESCSnQJMEnOWXcVY0jeamGRfIZWM78zaYf10XAM0Ue4D3GQZVOQZxxFgYW1
         sxm4M25jJ+zyNoEOmIEe9E+ls5HNA1TjtEqS/0TGt9T4G2NHL9eVD7VU1xMhZXqsMQZ2
         Y5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838916; x=1767443716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5rv8ZuRUcwRsB8tSgDo2rGfZTe5zbB/xJ2QT9vObhQE=;
        b=cwGtwGkreOP9fQ0L3hNo0Qi3yVygSBMKnw5UBJT/O9KOrciShyoVaimxn43OeCoXDt
         xbzNqYTt1km1W7wZ9VOImGBkxFLRHoaKZrj839brimutBgi/45ppEv2yNQLdlCQzOR7V
         tvFi36dcvhAFunILovEUL/7eRd/cYv7txy+QH5f1M8gp4BKpHdfubHPTX6Q9cL0FZx2q
         CZZtWY+ekpw+Phms3F7aDURCBtxreKi7JdxELjmp0U7snQRibUNwB4rY7Cl7iOlewFFG
         uSMu4crvdUp3gj++9Jv6Oz08Eun/yFc0SN2bUWa3KRcU5abo68JMebVMM2N4+160AFgD
         OVRA==
X-Forwarded-Encrypted: i=1; AJvYcCXC7doWBgW1og8fcv6Yg87EZHYmXfPcZ1MA6ETn89bPuRM5HAOCvjOWdVv0FEcBzYm8kn9fOnIN4jk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yymjhg9yqGsvDGhw1WvjFvtaidIag4ZKmjsskXRDvEev9RE/IfQ
	YYQjoIFzuwW6NlE1yr9Pg7cqdFm7uS7N5ZjVXxK8jykWNAQLNr3JGPwkbCEPr5+ygObMyVdm9Kn
	J8JE0sjBIjs3TSbs4tQzamhazBYEP48EKGwAzKV8j
X-Gm-Gg: AY/fxX4Bn1h1QDlegF/4/9T9cxhlRujvf+y2FZ1ES7B0I5MbRk5bKOMOP1FyQEJDx24
	/zv+b+0C61dFlTKgZ7o2TaC8hycvT9DLoyZg3lRN7Zbsog3m+oglT10UBgPkDbVLPCKRGvp1hgk
	cT26m0unLWtxmoXrtzE59X0u8UvJn+UgwQR+ZN6XXTTNQTV8gJ5VjnyK++rVBQnWh0xMxdi6ato
	WYVV26dVAAYT2CnFDGkBFCDUOInA4ySu4WAsj5WijxYaJ9C5VGUuwXhVocgRI6cnMY35nKFAcKN
	5RN+HTRgGVtsxPrpFga5bAxL/4WjPIJ72YhI
X-Google-Smtp-Source: AGHT+IHD+31hirNZG9pghcdmiqkhL3abzhaVNHz0IuIz2/TEZouNajKTxcGNeXuXg5qcUtE86dEfdWdgULiHUZ3yxTQ=
X-Received: by 2002:a05:600c:4fcf:b0:477:9650:3175 with SMTP id
 5b1f17b1804b1-47d194d17a8mr276446575e9.0.1766838916256; Sat, 27 Dec 2025
 04:35:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209125029.1117897-1-xry111@xry111.site> <aTodrqABDzBQXUXD@google.com>
In-Reply-To: <aTodrqABDzBQXUXD@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 27 Dec 2025 13:35:04 +0100
X-Gm-Features: AQt7F2prQGkQbU0mlNCgtuDxrxrcifGVuzMo87i8Q70IXJbsYfi1bCijpyuQMnI
Message-ID: <CAH5fLgjNz7jep3jrMCRNykrjbPydkOH10O+62HD3Z-8Q=GdqSA@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: Fix build failure if !CONFIG_COMPAT
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Mingcong Bai <jeffbai@aosc.io>, loongarch@lists.linux.dev, hev <r@hev.cc>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	"open list:ANDROID DRIVERS" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 2:26=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Tue, Dec 09, 2025 at 08:50:19PM +0800, Xi Ruoyao wrote:
> > The bindgen utility cannot handle "#define compat_ptr_ioctl NULL" in th=
e
> > C header, so we need to handle this case on our own.
> >
> > Simply skip this field in the initializer when !CONFIG_COMPAT as the
> > SAFETY comment above this initializer implies this is allowed.
> >
> > Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

this should use Miguel's kernel.org email address for the Reported-by tag.
