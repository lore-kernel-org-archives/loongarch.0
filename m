Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C73EEAA
	for <loongarch@lists.linux.dev>; Fri, 27 Sep 2024 01:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727400449; cv=none; b=QFLA1gmxZLhs2hGn1ItvhkOBN6JV/BdCOB1nX4Z7gFre3owmjCnGlw+UR07Itg0/k6Pg5NKlRACoGOpvF9UhWDJaBz6h3SqrP8hGqHwPcZ9PS7HGeaSAGnp9RRvMvpI5yu6ztNVq3DfJQVEBvqCXlf8NaAuxj8LDwdvqa/CYTWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727400449; c=relaxed/simple;
	bh=qhgGQFVcz7EDccATsvoa20zSMUCCY46FyvNGoiZYRgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UuTmjJSI9oTQD3E415IaWe2YET3owSqS+nR7qTweOEjDpwHrd3d3ujm0p3v67U+ESbAFXPjh0YlfVQ0NmZHfDpsCm1ZaRWU6UO+ybVt8FEDxhDslmINwSzvKY+AqvvWShJZcjdYSGUUdQeEszp7n5DOw4nDS07sD3HJJMssbR14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrYL35vB; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrYL35vB"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c26815e174so1984418a12.0
        for <loongarch@lists.linux.dev>; Thu, 26 Sep 2024 18:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727400446; x=1728005246; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/74tZKXei/PQf3stuS2/+bfqua3T6SsFCgnQTSmqVk=;
        b=YrYL35vBPbzrqhTdYkd9Rk/YG8NpH9RGkDJv880RVPcQ50OPt3/EDwaQ5NT5jCVg2N
         FCfq9C6zkt+wo700vE5QS38lhV+4bpTSsuvmPvjTXsm3dxiuu8O3p9oWGZPtecRQtf9a
         q9ipNECpXvrsSv+gUF7Bq0m5lbq4/G7r1kBsOy9IoQPYvvZlhu/oqCFKs4aNK3m/WTek
         yAp3GqegV3KUWcka0NGGHQYIHO8dR9U3D5swz3Smb9jV2x2ZoWioAX2OmSoXtXCNiYU4
         uE3AEsoC4ErpjdK096du156CNug8+cIX3GVdSz8YGH/4Wohm/95bbxUiQz+RMvQg2zy0
         7Vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727400446; x=1728005246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/74tZKXei/PQf3stuS2/+bfqua3T6SsFCgnQTSmqVk=;
        b=vgoqE02ZioRERyQMX2X6W8JxCPc2wHWMwrqo2RNpeZIxbU8Li1VBgvNugdHHny/QXc
         C07Z+hwdFKxchejBbLwet45NdyV5kf6AlafW2MoJpjXehI3LmSykSg38wZlJzS3Mzc6x
         vCjSGCydMSZ92O95OkIcFJrgzk7IGj2bu17XlW9rJCaTt5xOAwPkAw2lbEzM5eG03aOT
         FaPV3KLx8E50URMXWdwFnM2sALajBUwgNOQo88o35U2O37cMaqM2iOVGhyw3X9EwVO6e
         91VDdMBtQoHhn9wF0TgLMcuyNwnTf+47eTXnIdikpG2rk1LpO1JIRVhmDQ+ZfA3UMUGu
         IzSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2V9IVd+QGSlRfk+VqFN80m6fnGpLeMfp2b5/1uA+AtA033yFZ3DZVikPskyeWPT+p3TAxQsSwLYY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfWEahBjoiX0F24hO/piMGzuVJs5T1cTo5UeJY6dCOFoysWfQG
	iSLPLICXHSX/F51WMkqt++OngUy9vbLss5Qs/IZgr4fU4IIbt+AYTkiu/rPNIoR9Rn8pH2pwxXE
	6FNq08olF7pMWsauukwYM1/EDGW0=
X-Google-Smtp-Source: AGHT+IFqqzZ/ufqBjVvvEX1p/TYcSBM6KPMz4eSVy+RenIlKAPslIo4SXJMKwDVNx64HLS5kq7C6lCTKNfmHIAegsUo=
X-Received: by 2002:a05:6402:24a4:b0:5c8:79fa:2e3e with SMTP id
 4fb4d7f45d1cf-5c882603bd9mr1181944a12.28.1727400446082; Thu, 26 Sep 2024
 18:27:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1727056789.git.zhoubinbin@loongson.cn> <fd3989d15546502b47f580e6a2c3a59cb628ce93.1727056789.git.zhoubinbin@loongson.cn>
 <ZvKDBc2Kohx9kPfQ@finisterre.sirena.org.uk> <CAMpQs4+xP7wMSm4wgE97hnbmrS5oVtQTQWXNLvK=O+SkeZnEsw@mail.gmail.com>
 <ZvURC1KniEo67XKl@finisterre.sirena.org.uk>
In-Reply-To: <ZvURC1KniEo67XKl@finisterre.sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 27 Sep 2024 07:27:12 +0600
Message-ID: <CAMpQs4+xxoThbEzmZ-mYsQ_3XUD=T_B0PgBj+fs9fNzVCjTDZw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] ASoC: loongson: Add I2S controller driver as
 platform device
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, Prasad Kumpatla <quic_pkumpatl@quicinc.com>, 
	Herve Codina <herve.codina@bootlin.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Shuming Fan <shumingf@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

On Thu, Sep 26, 2024 at 1:45=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Sep 26, 2024 at 08:03:55AM +0600, Binbin Zhou wrote:
>
> > I will rewrite the dependency between the card and the DAI driver, as f=
ollows:
>
> > config SND_SOC_LOONGSON_CARD
> >         tristate "Loongson Sound Card Driver"
> >         depends on LOONGARCH || COMPILE_TEST
> >         select SND_SOC_LOONGSON_I2S_PCI if PCI
> >         select SND_SOC_LOONGSON_I2S_PLATFORM if OF
>
> > config SND_SOC_LOONGSON_I2S_PCI
> >         tristate "Loongson I2S-PCI Device Driver"
> >         select REGMAP_MMIO
>
> > config SND_SOC_LOONGSON_I2S_PLATFORM
> >         tristate "Loongson I2S controller as platform device"
> >         select REGMAP_MMIO
> >         select SND_SOC_GENERIC_DMAENGINE_PCM
>
> That looks good apart from the PCI and platform drivers should probably
> also have a
>
>         depends on LOONGARCH || COMPILE_TEST
>
> so they're not shown on architectures where they can't be used unless
> doing testing.

OK, I will add it in the V3 patchset.

Thanks.
Binbin
