Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B987205ADD
	for <loongarch@lists.linux.dev>; Tue,  4 Mar 2025 13:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741096519; cv=none; b=u2IFbGLeTWXIteLuAFL8vV8J+VcBQUYUqWG8QGFU5TOyfINoawF3gCxr5HfBN0nzN1rXNa32GpNfHzNnS+9AWvkbUM7CEl2kNYH87cMYow4l6dhfpOn7QUP9HfLMV+OthLSUdEI29uLtq7zXTBUCwdkibpbwbnX/hwBeIpCXUNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741096519; c=relaxed/simple;
	bh=daPsAr0QyWYFS5jjyXv44luCd7G6VlWVIOU58rRGji8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKKCwOcT2snfXiK2iRc9Q6GkTItV/LTo9CZQXVyQYLH1jLKmMur4u1xfNLeX0oKyI/LKto9i1twy5vrnR0sQ5BXsBrj6WM9Gj8kjMgBBod000M4NCSf5V0TbuiwJdp65EDupMVgXTtM5zVwvoVyxUhJ4q7pJ/FQqVori5dqJLNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KP3bmxnb; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KP3bmxnb"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bb75492e4so23486611fa.1
        for <loongarch@lists.linux.dev>; Tue, 04 Mar 2025 05:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741096515; x=1741701315; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daPsAr0QyWYFS5jjyXv44luCd7G6VlWVIOU58rRGji8=;
        b=KP3bmxnbc5KIVX8caMtrjMYNoqy7wi1Jw+YFsmdUW/4Dc77ZdgiBENITpN3w4Y2wDk
         UttpixuLFV3Hzbry8ifQTmL2/1g7pmBpeGmTu6QFwkkZZeJp2kRJncBITU8nubXXOKyK
         pD0T0rYY3zUauDVhDj/rqq5Xzk68QQ0bBl6NOQ8LGWgf0mgVXHzN3iUdHrpl8xWYBxwx
         8qGcKNBNvsUKsLRUHvn1y0XPqgGrmvPewmfGhqKM0JiPJQK5jcO8Pwn4rghFSwnVDNYE
         CBIQVgpkhxWVq3ggOkdVQm9sWGWAD6HoBM3ZGVcfYSQwdodn2F6E5S6dHrNNTKA28e5Q
         URYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741096515; x=1741701315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daPsAr0QyWYFS5jjyXv44luCd7G6VlWVIOU58rRGji8=;
        b=UlH5z4/JAWIGg2MFNExkxiJ6YtzCKg4K61RYmbSp2qB+4nK3VwCyRM5SZaIAZd0XVi
         tp+Q1W13BPafe2eH/QHHHSHdbyL49PU2IDIS2r+bC3QNiSTMgiyY6yO8ylzgUIVyv3a6
         cd7rTIjad11qzAyGPXTjRnmdhZsbT/nDX7BtoLdxtLrJ20BGoJxwTBGuK6MCHzgMl3tX
         hOrcsCJXguOL21DugWPaKYxJJOBwZnTB9VJK9Ld8bx1gIbih5PI9BgJCS1xjRLJVcQMy
         6q/E6W6VHQ8QfMvRvwLdxUKCNE78e3OKgtwfEzXCisitRIiLNla7rUZ95HlxOaCbXPd6
         pifQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUKS8Hw7lq8MvSTahYHVb6Baz1fGVh24b3eTB0mBQKnZft//qZ3xV688k2c86Iu3uGgNc9D3kDtzU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxO61a2bsQH09/CtLqhObzajhurJtWRPuxdgV7WG72n2Mg77QPv
	uwM3VohMq8etfq3Swftjsqfsx9eX4Qdvk/Ni0sxM0gqeZvW3bT/6fp6w/U3LlaHSUBC9tiS4WwP
	wJCAL3btSijc5RnYzz226JPqLPvJE00S5aQD3BQ==
X-Gm-Gg: ASbGncuzvggQJBblfzyFgTPuIvWyAZShbFXLmfIrP9a43T0vtRcaO+lo0iu3S2wveR4
	vrphyEVwu5IPMAq1ZjXubIGapIxtAhbshucfpCAck7q+Po2gsZPC+y9A7nH3wed2QQNvpomGOf1
	ATq8CV0sZOM1n0O/Oa+O0r1yHo7H2X/O504YP+60tW7odTR479snCCJyvwFQ==
X-Google-Smtp-Source: AGHT+IGuRU1Vuf8+fuEHnhHSx+k25HlH5VEQgaMjDprBjLt370BR0zDP1aHnTzboH+gvPRQqy10QPp0xgCH/Kjy+Yeg=
X-Received: by 2002:a2e:bc12:0:b0:30b:cc6a:ffd9 with SMTP id
 38308e7fff4ca-30bcc6b0ebfmr11371201fa.0.1741096514955; Tue, 04 Mar 2025
 05:55:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
 <20250303074552.3335186-2-zhoubinbin@loongson.cn> <CAMRc=Mfr5PCuad28dL19iZrpA-qkL7x0W-4Lt3SZyVfXPP-ipw@mail.gmail.com>
 <CAMpQs4+5165E35oO_p-pE8zDNo2rPT-gBqueA_ynW8FYJHV18A@mail.gmail.com>
In-Reply-To: <CAMpQs4+5165E35oO_p-pE8zDNo2rPT-gBqueA_ynW8FYJHV18A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 14:55:02 +0100
X-Gm-Features: AQ5f1JrOEFVlIEX3WtfwovJiCXzyB6KvYp0MW4h0lr7l7aVdvgOyvVX7gpUTEeA
Message-ID: <CAMRc=Mc6Fz-HkFc58_a7iakhVAOBRN34JUHX93K6tCTUNkp_AQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: loongson-64bit: Add more gpio chip support
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linus.walleij@linaro.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 12:55=E2=80=AFPM Binbin Zhou <zhoubb.aaron@gmail.com=
> wrote:
>
> >
> > The naming convention here is a bit confusing, can't we have the
> > naming of variables reflect the compatibles they refer to?
> >
> Emm...
>
> I named them that way to be consistent with the previous naming.
> Of course, we could name them something like
> =E2=80=9Cls7a2000_acpi_gpio_data=E2=80=9D, which might be better understo=
od.
> Also, do we need to rename all instances of =E2=80=9Cloongson_gpio_chip_d=
ata=E2=80=9D?
>

Ah, nevermind then. I will apply it as is but yeah, we could consider
something better in the future.

Bart
