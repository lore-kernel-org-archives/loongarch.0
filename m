Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794189282;
	b=RvAKhQe8UIhLiBzYUKenahaVAiowwrsiBY6izF3Nc0uqZPhV6eRT0+KJlcx6vGQo4uqm
	 sEB3/ssRx27xM5407GfMl2P/KVCFjTAgGmB7CQeD3Z5/DIL7jI292d4z+mYvukvXgwE33
	 RisOTZs7Q6vHoqj32jk3D7ytB3oDUnWrdsWOhEAmeXL/qA8m39PlI4bc3cTKrIXKcN69C
	 ksfl0K32goRiPkmf+5PfVNzn6aI22IeeZ4g5H2mL74NZ/NRYLMc7Xt+hxgkBswHnwbJMC
	 PVhCTKCKXNkKq1SjFBnWYHBOBbutqKS3IJarY/aMg1VKlIIahIakyODr1WEIBfgn0qg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nEtIGyJBezdGLIxuour+D7woJTbOhHRcqzGvEkx1U0E=;
	b=vwyJ/W2Nw0F+11v+pyANICOaKHTOigV8gvEzUWcJ/Fe3Jrqwiq94VMLLwwzjVVWsOCpc
	 kpix/1EFxflJfQ7ardCQYVZ0GsJgjXtV4Z0Uu3yPX8R3U/ciusZ6WHS6BfnldRX7Lsf15
	 Hd4UrYDlFs8ZZeFWsM1oeWhIP5XEAMANFstpU/6U5RLcmCU1J6aXPpoI6Ib7qCO4pSox0
	 XZec7lf85EdI0f/yl3No/VgkDck9eUGW0P+yv78vyg/fWYkFmiDOMc6PM2MSqEiCbxlLW
	 oBAYaU6kEgflp6jDDarv1U8Ddkzat4ec2BgibLifNB20VRhBhCNJ2+iZy5Px+6hzM6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nXPandX6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D99A606A320
	for <loongarch@lists.linux.dev>; Mon,  9 Nov 2026 01:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D99A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nXPandX6
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d427836e9so48751966b.1
        for <loongarch@lists.linux.dev>; Sun, 08 Nov 2026 17:54:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794189280; cv=none;
        d=google.com; s=arc-20260327;
        b=WSDn86br8/bBrybwwdFKPTSkwgC9X+rtEOFpLSaTPOUjdootv3F+NJflhlyjkfc2H9
         XMfvr+QdKO3mUk6x53MLVqIVwGlAJBGzAt1QcU2Edtj95KhgDCrKdBCZH/7JKjScnPDJ
         I0wr0x390Z1JtGm1O6++QtgbFSNfkHjYXvVZ+vxeCvZCos98v1e3aN7ttFnaIV/ln2eK
         73pTGG6BvJIR0ph7pSuYwdTTtTlgBlvNmxAcCbVzo6phwfA56k90sgXXT1ozMmObCX0k
         HVapWV8Vw93bYoeEHc1UQZc7feVnxu6nADJQiAwD/0KxYfsleoZZKCO41chh651sS8ez
         ZkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nEtIGyJBezdGLIxuour+D7woJTbOhHRcqzGvEkx1U0E=;
        fh=2WFxunn84qYWKxa1CslSq+pHtGueDLQJuq65cLBA++g=;
        b=MSFKXXkEXSLug6AcQNC2CCVVTD6UHEe3ZB2lpGgSIugZM1DuBZOzSZO6cLINv//2AA
         QwypoUWrB0qYBAVZe0ZigNlBxr09CEL0XNSVyyQwLK9RhpVul6Vp+NqGqoGo3Dso/J3w
         BP2M+5WsLBvMCdd2kdmTxbxV7xGzpWVeJ10pH2GYJs+V0uZXTjKPbRraakum4RaIwbqw
         X2xpSP+xockL+8f4Q6c1E9aOA/WpWsm8dKg6CFf4hRnNXCpGMcvlP9sNueX23J6xxgUv
         A+pLT3BfX5JzMnHH1WBYG6eWebNQeq7DFOMJc/Heavlgj9uXcvmY8DUpGKbMr66pFla0
         ZZuw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794189280; x=1794794080; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nEtIGyJBezdGLIxuour+D7woJTbOhHRcqzGvEkx1U0E=;
        b=nXPandX6TaoiYHnvxSe7XBX5mFqoQr5IsbajB4i9QnTVC84dd5CxTAzQSfZy+cn4gP
         qgRM3FIKVdaS6AvPUVBZ/YpWcvmE5eXxFS15rqW/rvRHtHlzCl0etEEbQMq5CR5d28fj
         8wIQyuNOkiCsN666orQzyOsGKPQeVHH+cqIEFIz5xr0gGKsndZSN1Tl9ADmGniYcWPyX
         G5qR+JrSC9fAGytwHnPg/h8We8g1rVuxRbnJGH+LEMk9P7xuU2HaWYgC2HQ44cpRru+W
         FrglGTRq6UqV9/NbJwqGls8M1m75cBfIBumspYDf5zQU4F7j5Gy/khP52WEi4wJ1EZfN
         2/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794189280; x=1794794080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nEtIGyJBezdGLIxuour+D7woJTbOhHRcqzGvEkx1U0E=;
        b=iDkcAM/Vby/KWw4Jzo2cQmhaukUgekiHMaLURdI6dvU/IAT6hbOeMd2F4z7jbpd477
         rEE2Ht/h6ynXakuYI4fDQfDvu9ZEmbWjMxdgC+6PQVSvp6tF221THMleCVPSRJYguIO/
         dHQHBDHCKBxQjD5S8hfg+gNt+RpsnSJPn+tpiZ7fDPxi1ZETw6XgRCdADfEJOIGeI5eM
         KZr4kfLYNmb6f7Ig1L7rBGhZGpI0Fs3LlFxGW/XielQ00N2Lx9ZFhvbcz46uvMOGiso8
         0o7Zqxu0upgB2jkGP5ria/J8hJR873cSsLuXTNVzgyLCqNd/Uf1JUnL55nhCwwm055TN
         +IFg==
X-Forwarded-Encrypted: i=1; AL+hErEg1HvRcrEPVXO5alwt3pjMTMOW97s2fnRmYT5CKYKo8tpOSgSHDYLNll1T9axiEDe7jyHqVv/ESoY=@lists.linux.dev
X-Gm-Message-State: APuU4Z82BEzEVd+DngHJSVvU27jTGgjIUdVq5Qy5F/HZN9ZhsC8M6CBv
	KW0awZQx5J7N/HUfLcspNGClIhcG/m2sti3eMiWLdZGNvF44+32kLquEDbgqKV0O2GQ0074oGbT
	qh1hyZQhBYz/nBX71z2K5C+CEVuL1FTQ=
X-Gm-Gg: AYBFou0Dy1S+ut0l3NDXWkERGWAbhv1zlTomwc8f+uwsqTgD3/+1/rBr9+WnOOVEAID
	ZS7/NrYrHVBpKHoGE36Tn8DcpIvya11IgU+cUEpFkbQKhfl8vf+za9r5XK0N+wvoHC2rpUgELmJ
	cKsW1oaK5+1BnUCA0XimsaYmjP8syuFHrkBMdNKGs9pXE7f2aWWjzIx+HhGv7v6ZkFSPCYJ94eS
	WcoIKqfI7aX1mTqmE/TgmCoEbx6+Uxx7Htzn/dU9JUfyHwYFt17QkmPk8kTrRic72YKb+aCBqWs
	UL+zVKhrGO+wGBvvjtuYKrNVH5FGT0RLz3SqADeuClt26uNSx45B1cV084nreGMxgUDos5BYMdj
	D+8NZp8LBErN1EYkuW6zwnL/zsd4r7Rnn8sgLcg==
X-Received: by 2002:a17:906:c106:b0:c2b:f3d5:2090 with SMTP id
 a640c23a62f3a-c4d6db5e6a6mr158843666b.27.1794189279792; Sun, 08 Nov 2026
 17:54:39 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1793689461.git.zhoubinbin@loongson.cn> <4b36ba4220b30e5dcc1dccf4db3a49a57c65122a.1793689461.git.zhoubinbin@loongson.cn>
 <179406466807.3424803.15440704784819901040.b4-review@b4>
In-Reply-To: <179406466807.3424803.15440704784819901040.b4-review@b4>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 9 Nov 2026 09:54:26 +0800
X-Gm-Features: AclHuK9sQ15Njn9dcE238QYk0OOW35_g1OnBC1YFjlWFkhfF7av3tfo76_-1uxY
Message-ID: <CAMpQs4Kj2HcECfgYuQzEg7UKsEMbe6BxY_g56YuLtGsa69F_uw@mail.gmail.com>
Subject: Re: [PATCH 4/8] spi: loongson: Fix clock divider calculation with
 explicit table
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

Thanks for your review.

On Sat, Nov 7, 2026 at 11:17=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> > loongson_spi_set_clk() previously converted the requested divider into
> > SPCR.SPR/SPER.SPRE using rdiv[] and fls(div - 1).  The rdiv[] mapping d=
id
> > not match the actual divider encoding, so the programmed divider was
> > usually one step larger than requested, and the maximum divider could
> > index past the end of rdiv[].
>
> > -static void loongson_spi_set_clk(struct loongson_spi *loongson_spi, un=
signed int hz)
> > +static int loongson_spi_set_clk(struct loongson_spi *loongson_spi, uns=
igned int hz)
> >  {
>
> > -     div =3D clamp_val(DIV_ROUND_UP_ULL(loongson_spi->clk_rate, hz), 2=
, 4096);
> > -     div_tmp =3D rdiv[fls(div - 1)];
> > +     if (!hz || !loongson_spi->clk_rate)
> > +             return -EINVAL;
>
> Does this DTRT for ACPI systems without the rest of the series, where do
> we learn the clock rate from them?  This is tagged as a fix but not all
> of the series is.

It's true=E2=80=94as a more reasonable approach, I should have placed patch=
-5
before this patch and added the `fix` tag.

>
> > +     if (i =3D=3D ARRAY_SIZE(loongson_spi_div_table))
> > +             return -EINVAL;
>
> The driver should really set a min_speed_hz so drivers know they can't
> lower the speed too much (though it's unlikely they'd want to).

I think both `max_speed_hz` / `min_speed_hz` need to be added to `probe()`.

/* Expose controller capabilities to the SPI core */
  controller->max_speed_hz =3D spi->clk_rate / LOONGSON_SPI_DIV_MIN;
  controller->min_speed_hz =3D DIV_ROUND_UP_ULL(spi->clk_rate,
LOONGSON_SPI_DIV_MAX);
>
> --
> Mark Brown <broonie@kernel.org>

--
Thanks.
Binbin
