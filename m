Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA84C23C50A
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752656508; cv=none; b=bgv6fPRMHcNZR9t6kvWBd6bQv0aiyMzn1pep4MnTY316h5Vffki/iTLXldFeMgVwFdjKjfQCurNFZy9HTyV3ZHRrgSZEY5LBgS7fkfIZeAowgOGNjLYDdL6PCtUQaB28AD+9AErabTmw3ce+ABBxLSI23qvk7+zyB1YnewZu17Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752656508; c=relaxed/simple;
	bh=BBcKoS7mi4jDnSONYu8FV3REiwngoHRNGrFQArPrUNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tv1iqpSAvT29j9WRxeIp6X11N/UkcqByG/cpLT9DQilpBM6PLyeWzJCkiAsB204HOsB4FIz1Pd2v94YTJmMOPezG+rjwon737SuokKEO4Vdl60m+XXPzbkW9r7uNM7WVUKWTbxwnkUZVOg4Wb/tuM3qS14QBHdUPrlyxHWfSSKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=M1fPW4ha; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="M1fPW4ha"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso6703871e87.2
        for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 02:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752656505; x=1753261305; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBcKoS7mi4jDnSONYu8FV3REiwngoHRNGrFQArPrUNY=;
        b=M1fPW4haBXnhWAGbpNmjs/NLmdlQXTxo3K3CR5Qcvu1EWquS2JpF14Dg9IWq3qaTUu
         lLlRU0kadq+BcnrJGbvHehvQWi1nXWg4tj7djgZMm6Pc9Im9mGV8AxEe/Hytw1mNQbZd
         flcjdZeOII6AtNoSv+c65DvSK22NN9hRsFG1SVyiCJClRZuAlvDWFtTfrBTX5gM+rA4T
         9arZZ7yNKBaC/qN4o2lrpKFgRMKae7NBLJnllA+YufTEmWqyUUnQVc8PC5Jg13d4aYfu
         yhFEyiduPeqSqEkskaxLuqh1RblyH4kk2L2So1PmS7HjVzTCcWPgGJO/rRnTWL0i4vF6
         oYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752656505; x=1753261305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBcKoS7mi4jDnSONYu8FV3REiwngoHRNGrFQArPrUNY=;
        b=QVKW2HK3bJPiZ2ZR5iIUOcwvn7PsfrlLABS2WxeTtKVpMyAmE3qTrsGJEhik4Bs0OY
         wPlOrH90rgqRYWMvlIKO3/xqDj8HE4AZK/BvWfQTC6A18vsuJuMVk3k8J57boMcXk6vH
         /LtgmK8MS4Y4AAV799SoG7sRkxzmK6n9xoNkyPKjHVALIH4awCyX4n72FqOKJydmLMHi
         3zsdFjpdQ9bnpKWap9+pLZJXlQg4aqgbsW09FS3JW0cPvtTtcw1ze8VKHGf1hHy+He86
         kx6tBM2uJx8N0b3dD268KBx/K5QhdsAZxViHc3/FPkroH/VRK9UJ1Xqsqoh/8WDgQY/t
         klSA==
X-Forwarded-Encrypted: i=1; AJvYcCWdo5diVLlnE0C47dHj5oOLNEqw3OfKUAeeGMwImVWioPI8X9M4n0y2P9UAlDqFVzEhd0ziz4GXV0E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3DEvsqK11io5X3OishV/J5xPhtoOY6tEwl1gtwuH3Hdx61M3z
	F6SrbAQ/yO6JtypkJBtvC7Ezk1s6rMEjo4/52qasP3eyr3U684KPMmWxbgnPpZYsxq7EPXE34Tt
	OMj38CR3uDinCBJdfJZVKm+QMFB27UZG5DIIaJxL7cQ==
X-Gm-Gg: ASbGncuF/e2yWQJFvMcD5SVM4J7VyCrb9LGTT3q9AkYQ3xFVLaCC9wqkICyapWGGtaD
	TBPGEJlZJEVrtLphuKkCRmN/1nsPSU0aWvH/ipFLUaynlbJtNFfmSlgwk0gzsURTGYBjMwhhQe4
	TrTEL0WFaH9AkqxMygv6ZA6ElAwaM0dA9iuYM2QGfXwHwpjmUuRfZFbuKWW06myK1GfVMX7XHV4
	uUya0Duf+ozKXbNh3aAMjd94ux1yf/zpVkYqhs=
X-Google-Smtp-Source: AGHT+IH/HqqTPSA+WjjhNwxXEZwMLBXc7WD1Wy0HoAW8jP2TlQfLe3IFGFYU6dKiGmXNLufx3R4vkNSthgn67WJdtOs=
X-Received: by 2002:a05:6512:61cb:20b0:553:6570:1999 with SMTP id
 2adb3069b0e04-55a23313441mr550901e87.13.1752656504801; Wed, 16 Jul 2025
 02:01:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714064542.2276247-1-zhoubinbin@loongson.cn>
In-Reply-To: <20250714064542.2276247-1-zhoubinbin@loongson.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 16 Jul 2025 11:01:33 +0200
X-Gm-Features: Ac12FXyKoTxRlLERg0vHtq1S74vPG2R2khlX23aGf2OGOaYX8tkkvgqZ8Tb9bCU
Message-ID: <CAMRc=Mch5d3=vbRqCohh8viPpp_dTOd8iQBD1fEQVeZrRJD90w@mail.gmail.com>
Subject: Re: [PATCH] gpio: loongson-64bit: Add loongson gpio irq support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Linus Walleij <linus.walleij@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 8:45=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Add the interrupt enable register offset (inten_offset) so that GPIO
> interrupts can be enabled normally.
>
> According to the latest interface specifications, the definition of GPIO
> interrupts in ACPI is similar to that in FDT. The GPIO interrupts are
> listed one by one according to the GPIO number, and the corresponding
> interrupt number can be obtained directly through the GPIO number
> specified by the consumer.
>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---

Seems like the message should say: "Extend loongson gpio irq support"
or "Add loongson gpio irq support for mode models"? The driver already
supports interrupts, you just seem to extend the support. Tell me if
I'm right and I can amend the message when applying.

Bart
