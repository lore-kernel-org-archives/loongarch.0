Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF05639FEF
	for <loongarch@lists.linux.dev>; Tue, 30 Apr 2024 07:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714462410; cv=none; b=I1/Fbs757hr0UST9bNn3HFdkk6dr3U0+Jezdqa7K+0lx/SO1BAufC3JEi+OT5E4w4DR20pqA6W6Hbw5U2I4LPGONQFIDfcuhBFhGCCcMFhoj4vvlx/8qhrjDfed9b2ZDBdKH7l91M69tK3M9l9zzhQyD0RnAkT6opGni8vIGZxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714462410; c=relaxed/simple;
	bh=r3yZQOo7p6VsIe3U4P+tg3b/ZLhUdSJ+KRIWZpHmqME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kahqbWF2DHrpO/QDCUWPDqlCx+M4cgpvyll6Cf/Ls9X95ccGubfbEAod3zDw8+yDSGZezomB1nulYNd0n2+1sAEAK+FLja70cZYcMFS7LSKGW9dBuaypBbGDyVaep92vFItaipd+ozJv3Sa/y7Wuk3Yq5P2BtCMm93jnmG+N7ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7Vnw/MV; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7Vnw/MV"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-61be613d903so10610517b3.0
        for <loongarch@lists.linux.dev>; Tue, 30 Apr 2024 00:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714462407; x=1715067207; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1t1YtdVQhMuh5WLzKhqApsNSS87AIHqdVoWO4lvwyE=;
        b=M7Vnw/MVmOg5YE80HHq4eo/BaLX4GDqZP93rtQ1bubrKZu/en4iF5N+OzApg3JiBfT
         TcZNa6+7N7xfOAr69k4ifU1YGDyZOy6jq9CPk/zcLVEoJRw96WfiI8DvDGLjtXv0FEHA
         lmkRFUiWpkjfYLLNVf+1yJlW7WqeWEW63418WeTYbq6e7D63sVAvt6zEWL5xHavxhXsi
         4XdH6n5QzpGCvqZ84LgVH/aRkrCAGzRRxThVbgAW1Ti5YOJHw3QkMlvVryfiFwxHD1TC
         FdYLc8O9G78qkxm1jzdeXMWzWMy7pj2maz8PDCPYYUZb6ETnGDvJe2kGP0DEVDy+zTIR
         Ipdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714462407; x=1715067207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1t1YtdVQhMuh5WLzKhqApsNSS87AIHqdVoWO4lvwyE=;
        b=d+PxkLahq07kAh1EicZn2aVUdwOo9AGO6eOJ8knbT6r0Xfd4kXMXypWk5PNYBjn0h+
         VB8/V9Rf0N/2bv5jWN7iENPD9Eypt67KcolSzIREFhXJhYW9xqVnmwEmlYkzTM0SiHrT
         ZM1/DkPFCIH1rnn9rswisweBeF385Fqf2LFmedFyKngI8U6Q2GNtx7gA/m0X0wauCIQ0
         MjOllhSRBwfKVK9x+comM5vnuPPk6j8fbvtz7tQNg+6O9FxKq+GLizhWDPKkhP0lfXxq
         gae7w17HNPkDKJO0tfPLqX/M3gXcy+0m7yicBnuunbJNH/1/J/10GQc1r+3eXcq2BhVc
         lqjw==
X-Forwarded-Encrypted: i=1; AJvYcCUlTbYkpSNjSG+lJDbFs7YzwBA/pyoTEs7MSWo5bCAj7H1xaMw7T/CvRgtyMx4HvqDTCuKgJtsq3Xy9fPuI9IBsO2fbtdCP///7
X-Gm-Message-State: AOJu0YxB005SNLbj53KSY7IbyHJjK8NqJWze8t/xOcV/OkIu6Nfyn9Qu
	01tZy2jt+RjMH2Hv00pZ7t/J8nG0m1prwrhplU+IofS2meJkXBqRAxQqF0GoZsiOlVZZBivW+AC
	b9XierRmZSi4p+bp/tiLvDHSubrRlTfeTfpQ=
X-Google-Smtp-Source: AGHT+IGdaXe0AdtKqsfeXw6soP40M1C7YdJ1S/7IP5X2AoM2UtipL8sYJvRDlyY2qFs1/W7AObRd05SaPuE5W/+FjBw=
X-Received: by 2002:a05:690c:d1e:b0:618:2f6d:ca80 with SMTP id
 cn30-20020a05690c0d1e00b006182f6dca80mr2400093ywb.12.1714462407621; Tue, 30
 Apr 2024 00:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1713164810.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1713164810.git.zhoubinbin@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 30 Apr 2024 13:33:16 +0600
Message-ID: <CAMpQs4LD6R6TgcE_MJ4akwgtDFVA5VHh4oTSTy0bzuLxUDXWxw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] pwm: Introduce pwm driver for the Loongson family chips
To: Binbin Zhou <zhoubinbin@loongson.cn>, ukleinek@kernel.org
Cc: Huacai Chen <chenhuacai@loongson.cn>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Juxin Gao <gaojuxin@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 7:55=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Hi all:
>
> This patchset introduce a generic PWM framework driver for Loongson famil=
y.
> Each PWM has one pulse width output signal and one pulse input signal to =
be measured.
>
> It can be found on Loongson-2K series cpus and Loongson LS7A bridge chips=
.

Hi Uwe:

Gentle ping.
The dt-binding part of the patchset looks good now, do you have any
comments on the driver part?

Thanks.
Binbin
>
> Thanks.
>
> -------
> V3:
> patch (1/2):
>  - Add Reviewed-by tag from Krzysztof, thanks.
> patch (2/2):
>  - Several code stlye adjustments, such as line breaks.
>
> Link to V2:
> https://lore.kernel.org/all/cover.1712732719.git.zhoubinbin@loongson.cn/
>
> v2:
> - Remove the dts-related patches and update dts at once after all
> relevant drivers are complete.
> patch (1/2):
>  - The dt-binding filename should match compatible, rename it as
>    loongson,ls7a-pwm.yaml;
>  - Update binding description;
>  - Add description for each pwm cell;
>  - Drop '#pwm-cells' from required, for pwm.yaml makes it required alread=
y.
>
> Link to v1:
> https://lore.kernel.org/linux-pwm/cover.1711953223.git.zhoubinbin@loongso=
n.cn/
>
> Binbin Zhou (2):
>   dt-bindings: pwm: Add Loongson PWM controller
>   pwm: Add Loongson PWM controller support
>
>  .../bindings/pwm/loongson,ls7a-pwm.yaml       |  66 ++++
>  MAINTAINERS                                   |   7 +
>  drivers/pwm/Kconfig                           |  10 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-loongson.c                    | 298 ++++++++++++++++++
>  5 files changed, 382 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/loongson,ls7a-p=
wm.yaml
>  create mode 100644 drivers/pwm/pwm-loongson.c
>
> --
> 2.43.0
>
