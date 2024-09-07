Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BFD12E5B
	for <loongarch@lists.linux.dev>; Sat,  7 Sep 2024 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725696505; cv=none; b=GQoz1XI6X4gXkzrDS8nm7smNAe60I8BbkJvKfeto5pb6lLf3Wf/7JmJVQUxzz8wQTMLr0XT07AY/87+JeNrn2BoUE3BJIJ4bF1nl8/xjXHb0af0MAj+MoZUEBJLp773NzP6XyqWONoFgtK2qW5qHPa9WFYYe0bLouPSMwccCx7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725696505; c=relaxed/simple;
	bh=kSHDYLqAQsR2WoHVJicKWQRllhivKq7SL+0aQ1x8Tzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=al/LsbAX5DANdILWsiy4l741gzBCBE7DmIbglOWX3tP06ueSVmZwW7wibWId4vf1WvrXtm1vI9+tpK+uzvW8P/qd16Z3fnfN1OZy35+ftDe7ahZ5cT3H4peJaNmRgLZCAETBezed4BghEshwlMJ9LfmKP+V6pY4U/OaPEgqJ0Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7UuP5Kj; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7UuP5Kj"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso293467566b.0
        for <loongarch@lists.linux.dev>; Sat, 07 Sep 2024 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725696502; x=1726301302; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSHDYLqAQsR2WoHVJicKWQRllhivKq7SL+0aQ1x8Tzk=;
        b=U7UuP5KjVKolu8IxTBfNHWiLp4TEt1Hom9vxL+9eTFYfwI0XsVdh6mEAc2zY6WQc0N
         vhe0AgWkQkluH5iDRIBQAZArEVCPnewitUqRNrO+pL7oGrslgflQJznk7VuyUwJYzEcK
         NUta4YEt5J7giM9gTUz9pRyRgtopBxH9exGHzoETCu3iwMlnCFa9TCpynCohQhX/QFd7
         JtJK04iZEwsFdi7KpegMYdytnBJSy1clajaVLyCUEIIJ9/CupNamLhZnkH+Lka3CtNeS
         fb7+h4tNPi1b1Iz5J7T/Qfi35vJTNAAhg9L7tp3Beh8gYSVCnipr79rLbK+Od85/5Qbd
         wXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725696502; x=1726301302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSHDYLqAQsR2WoHVJicKWQRllhivKq7SL+0aQ1x8Tzk=;
        b=cAqhirWqA2WrXM6An22VBLYt6ihU3mZFuO5xsXqgmZWlxA8u39GN1CULyOKCzn4ge1
         Dpt1MJSN0sAafNWVIMRLIJJMTjQOTC7AAgvcP3neFASgWbQZ6SufIOuP9ewYmY0LGDyO
         LT6y3uOZ7s1k3dadRw8ccxavIjmIucAx3+Ix5XQk+izNzB3ws9vpB75/elxQ3DcuvvpF
         St6XGQwIMUk9jEnYn3JDGNRklYuPz5yQNuxo0rI5ycHwDqhV33sWKKcyXx/Y6EONbRtW
         lRSRtYZ4j5Igp1Pf8Yy8t0CqemBYZJpqfkimXiKUD1YBqiJ6Q22DEDx5rNP3vPznGYoG
         tPsw==
X-Forwarded-Encrypted: i=1; AJvYcCUkIudf8+TJm89nw/SybTQ4cbDB2xgW/esAOhgEOtQaHsVQTy8zeVnWZz3/Dqq0JhBEQZCX/cUZp8o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr/sML5D7EUASG5adDsnPvRqFnamXliEIfFgAw7ZIjYOf68G7y
	TWepFLfwHFzgpAgMjxTIoNe1f1AVxUFNMPDN0HHAB4fe9H/WFo+tI33UkN31ayfI+2vL+savsYE
	sZtdlzv8373iC5vtFKcKcEYiErRQ=
X-Google-Smtp-Source: AGHT+IGPTkO39hgErmS+Z3Xr8V3YRQhXuxzN+qzRN7M1pY9F102PaN1oqqJJk5oNCHR9jmilkr0WjSzr7xdwGQPGCIo=
X-Received: by 2002:a17:907:5007:b0:a8a:9195:922d with SMTP id
 a640c23a62f3a-a8a919597cfmr238991366b.0.1725696501579; Sat, 07 Sep 2024
 01:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <282dadefdaac7917fd681a6e84a5f0f07d0557bc.1725518229.git.zhoubinbin@loongson.cn>
 <76612fdc-996c-4cfd-b5f7-04acb5b717be@sirena.org.uk>
In-Reply-To: <76612fdc-996c-4cfd-b5f7-04acb5b717be@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 7 Sep 2024 14:08:08 +0600
Message-ID: <CAMpQs4KedjHVK=Y87beuc0M_DadrXWWgcC5ob+wXfdy4XtCdWw@mail.gmail.com>
Subject: Re: [PATCH v1 08/10] ASoC: loongson: Add I2S controller driver as
 platform device
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 8:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Sep 05, 2024 at 03:07:21PM +0800, Binbin Zhou wrote:
> > The Loongson I2S controller exists not only in PCI form (LS7A bridge
> > chip), but also in platform device form (Loongson-2K1000 SoC).
> >
> > This patch adds support for platform device I2S controller.
>
> Can some of this be shared with the PCI version - is it the same IP in a
> different wrapper, or is it a new IP?

Hi Mark:

Thanks for your reply.

To be exact, they are similar, such as the definition of the
controller registers.
But for example, DMA data processing is different. In the pci version
of i2s, the DMA controller is built-in, while the DMA controller here
is external, using ls2x-apbdma (drivers/dma/ls2x-apb-dma.c)

Thanks.
Binbin
