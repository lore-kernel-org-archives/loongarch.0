Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAF478F26
	for <loongarch@lists.linux.dev>; Wed,  7 Jan 2026 01:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767748977; cv=none; b=sMT8rXE/mqNtTw4Byc3sjVyvZE9jkV5NOSoZZV95xDa0Eo9ZaasuCutvHpiIYhqoLJfyYLZTbpf+kqwXfOkMxQeBx1kGQ+b6E0eZfjroPdKS/au9yKnjjLe80sOzqDEUocFUXNj3TB0SFfpr1Xf2CPvcsgMHrYK9EhSTQR6EzHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767748977; c=relaxed/simple;
	bh=w68wXr5ticdVcWVVKaG3ZzO4fx1vzPS9uhBCrz5e59U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5sSSkjzjM2V6iaUf1N5U9g0uuS+EQqFTWhA3FYLx0ucisxKJd7uXWCHjLhFMJ2Xw3/Fs4gMGbMOtYyb2z4vpyUYh/HW3SOvT3uQV5+krfGtjkgkbXkWYo0zwUxCTqnGCek2Dg51YrJ7zs6CjUsU2OjwGEXkFJvFqHs7leJubQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzb6uWJ0; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzb6uWJ0"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b804646c718so231267766b.2
        for <loongarch@lists.linux.dev>; Tue, 06 Jan 2026 17:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767748974; x=1768353774; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tsd9UwM4vLqBKUeV9xw/hj4H2ka06I0/7uWJwrkW5U=;
        b=jzb6uWJ0aDL8aMhH63WcWrJiSRFTB+IJ0I6e/FcMZcEFQ68qLB+6bUcXjjPNgLvVf5
         K44/lvh4WnJCyJEj9pu4vAMzJG3ACLFLfylxzh2UA0nCblfhvdQ8jsg5pZK4Bwx38dog
         Vpu+92VJnQdxoQwRgb6viXbDGwElCGUn0n0PfHr3sQa5L5q5I33EEBZotNzdFFaBAbn9
         19a68s0oWwy6ncj9Jb3OIvE9VHJ/XqP3T76W7GB9lSfpAd2X7py3z+tOlFXsEGR1OQ+K
         roREqVvhtHHAQHoJCKpGSrnA1RFXdkuc6SwzeyMERyky7BB8FK64srQLP8VjqqKkWK5t
         8Ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767748974; x=1768353774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0tsd9UwM4vLqBKUeV9xw/hj4H2ka06I0/7uWJwrkW5U=;
        b=l/8BHuOdE7LBClWSE1GsIIf3CNhWFQBh/WL4El4bwNl5iw8yk8l2yQV9vOu6dtB9da
         zvLQS0JarRwKwALI+7YZu8xEOIySRzDs1mRNzzmNQeri1aqOJnVi4a0CWbRYPty7b9/N
         ttQcaiBn8FU18N2V8XG9F0Ja6cX+23dYnDXydmCDIhWWqupJOupa3NLKVXXgh0H9kaKc
         NQ2Bejwc/strsuhpcXs1TGVZL4w8wBXWK33kx7BFyPUoSWUZorafuiGBYMUwWKl+X8uZ
         1K7fwdvTmLOCfzh81s1pfpX7r8NeFKmPogKMzl28TArOfRxqjAXMi0jBZthvLqAtGz/q
         zWxA==
X-Forwarded-Encrypted: i=1; AJvYcCXdnQFqTW9uamjEiT8YI87LtAF/SO0Pa//YzzUx3+fmY8SkvIKtmiiqN+byd5f00LgT2XbUvIXugbo=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz4K91Bb1sREyfEy1NDcZQN/34lZCORX18kkKOOBQF7p/xrlMA
	zeaIHmyt9UeyoRk6hrndj9c15UZ67v06TbniVVkZ7uG/GN/Bq1gLdmdP2qBWfbyyISR6BJhsWRq
	8JpyHU3IzI5LIGCOWekwfXryCrW9YnD0=
X-Gm-Gg: AY/fxX4TMczO5oCstVXFhPYgum9Bgoog9rHmYasV3YSX7qk9RqTB3IzNZmpdF0GKsYn
	nFZOSn9cQNWqhodG9lt1yuap9Je3AGiu69+kVdByyJ3AJFThEyN9fq7b03L8ouEbcT6XwhHb0dj
	oRjWES8DRW8nQqdSGChtFIMhGlrUXupxI9E83UJZDwJMEN80oSwGHpvnFW7mf2CtpULOA9zHYjS
	yOy3clzi2b77Z4xNCIH5S/mLRmJ9K8UXP3mZXFa0W29Nnzyxu2rps+IbQKTF33vdscu0qvN
X-Google-Smtp-Source: AGHT+IHAqq5ImNkLGtB8Y1d2kLRKMdYzQ9MRuExrpqABDFBjUdXj3NxrF87jFkiZlC4Jeb6TBNib1kZQOqxBCF1a1Z8=
X-Received: by 2002:a17:907:70e:b0:b73:758c:c96f with SMTP id
 a640c23a62f3a-b844539fc89mr86070866b.52.1767748974057; Tue, 06 Jan 2026
 17:22:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1767663073.git.zhoubinbin@loongson.cn> <8876bebaf08121bb5edd2500f5289284b75df011.1767663073.git.zhoubinbin@loongson.cn>
 <20260106191314.GA2568583-robh@kernel.org>
In-Reply-To: <20260106191314.GA2568583-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 7 Jan 2026 09:22:41 +0800
X-Gm-Features: AQt7F2rx2FP62gHMLs01g481K6zXg39jS3zpWijBpVZVQd9ZycV4AZkWto4-qZQ
Message-ID: <CAMpQs4LpKSLGKySmzHeysS3x78inUQy9DF4dShneNymDvAi4Ew@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-binding: rtc: loongson: Document
 Loongson-2K0300 compatible
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob:

Thanks for your review.

On Wed, Jan 7, 2026 at 3:13=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jan 06, 2026 at 09:33:32AM +0800, Binbin Zhou wrote:
> > Add "loongson,ls2k0300-rtc" dedicated compatible to represent the RTC
> > interface of the Loongson-2K0300 chip.
> >
> > Its hardware design is similar to that of the Loongson-1B, but it does
> > not support the alarm feature.
>
> But you are requiring the interrupt property for it? Isn't it no alarm
> feature means no interrupt?

Yes, the `interrupts` attribute is not required without the alarm feature.

But my judgment condition is `not contains` (added in patch-1[1]).
There are only a few SoCs on the Loongson platform that don't support
the RTC alarm feature, so I think `not contains` looks cleaner and
simpler.

[1]: https://lore.kernel.org/all/8876bebaf08121bb5edd2500f5289284b75df011.1=
767663073.git.zhoubinbin@loongson.cn/

>
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  Documentation/devicetree/bindings/rtc/loongson,rtc.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml b/=
Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > index 8a2520f963d8..b62419c33fd5 100644
> > --- a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > @@ -23,6 +23,7 @@ properties:
> >            - loongson,ls1b-rtc
> >            - loongson,ls1c-rtc
> >            - loongson,ls7a-rtc
> > +          - loongson,ls2k0300-rtc
> >            - loongson,ls2k1000-rtc
> >        - items:
> >            - enum:
> > @@ -49,6 +50,7 @@ if:
> >          contains:
> >            enum:
> >              - loongson,ls1c-rtc
> > +            - loongson,ls2k0300-rtc
> >
> >  then:
> >    required:
> > --
> > 2.47.3
> >

--=20
Thanks.
Binbin
