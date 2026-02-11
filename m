Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA42F340262
	for <loongarch@lists.linux.dev>; Wed, 11 Feb 2026 04:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770783839; cv=pass; b=qKkVFPJfzAzBZp5TWdVRUAf98tP1YhaRDXxGVBaTw5F+DaiPXNrL2yLF5uDfumK06eo+6e2S7FyDq3QEnIaL5A2ePRsK7q7AnQTZTm73wV0u/IEInSBzB4Pwm5VQFxUVg9BUBWlxGH50xe7y9NcZwxdmodi4MOO2N5hB2Qoh8dI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770783839; c=relaxed/simple;
	bh=AYf9PzYvGROYCkBsZp+oebw62lOGvJB1aK9owXm/Xl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mEtpBy4+2d8APEHdIoYhzLGVvKJv5GL5NXmstCuT13+otq9Q5mCw1tgrlkXtgJDaaylvh9kMQ+ey72xc5h0f0dVjTheAizybfZH+bCq8/cboNib4zhCNK3SofF62LRy3IVWSRq6gLn1ZDPHlBGALoiSJeBESRkGJv6Gc+r7BunQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9xTumUF; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9xTumUF"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65a11e565a9so1388203a12.3
        for <loongarch@lists.linux.dev>; Tue, 10 Feb 2026 20:23:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770783837; cv=none;
        d=google.com; s=arc-20240605;
        b=MS/5Z+1ziK8aSVdYUN4lRlLR9jxLUeHwn9iTcuttL287BOvobFyDDen/+5JmU2nx9O
         0mqmyhyujIEphO8MFgB7V8zQaN9xm/3Dj8+jqMr5aanVTJYAVZkv9sAzKQpdVVf4oH7F
         RvdAl1kggstfdcD2uHd1++EwWDkPfFN4kO6nFl83sGAcBQrV3khVKcwLjEPTXGi4nwCR
         fIgo8yNtjepGB+PF/WDTI7FJBTUI7dAxmGlC2XwnWrh0uMlxr6jRQl37lctp9cdu8BGQ
         QtFaFdjVJGKN+J5wpNI7gA4cJ8/1s90IjC2MDC1xpPcGnqBn17RkFFh9wI5UcCum0XPi
         ppMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BIWA8RluXGR6oQRlAJWI5a2TCkKeGW1RA568WY8/pdo=;
        fh=7pbTYnro/WDHwlbUYGg9MZknLuvDzhnAwcQNIYTRiFg=;
        b=ClIUch1vX8N+xUIU0/Hhy6tSP9EQH0yEkkThB9TO9BZVRt8D9bWOlOojBy0MyxyB0/
         gL5YI+bQ7OZm+a011oFh9eWepw6ljpSLklDtaZgdQkNruWzrCHS/f7r6EBIhj31f6nEc
         1ZbjMZnhrz7YBDfM2jWuQqtireGMtZ24BFa5dVxCNYeQTEdoeDPapzzwestOGsz/5PEe
         bgHasR9X2pauBO2/O6agmzfJh4kbg4IeGL7F84Vw55C48jqVu8P+XQ0GWsytXs5hDavD
         oRVLPTziQ5GXYMQTffGfKgfN7ZlZdGYBY12SdISBANXbqNlDDISuVTh98qpUPiTvu47r
         HpIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770783837; x=1771388637; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIWA8RluXGR6oQRlAJWI5a2TCkKeGW1RA568WY8/pdo=;
        b=L9xTumUFr7oT3b7Zds0zrVyOrRuhLMDst9IPFI4QYHJGD3WxzCPHDWXdon4vrji+Sh
         GCBEQ6ABtvfpobwNpMYFw5XkdKjEm88Y7bQaezRm0ZunDnoYDAbs/ZIbmTytX7I3cNFp
         H/hsoJ6bwolGIj+54UhlN2FcCI7/RzjZE8PeSikSPP7qtjfNBEYe5lXR/dMi9xEU+cJK
         Y7o1RJWI72lur5jClRU4ittyBv8H7m7GAebolhlNkoC0QgHMr/Na5NWEZIGnQG9KIUvC
         GXqMp4iix7I+Ajj7AXdcZ18NqFQiuTNsnl4uLnvxIHXsZx7yNZt146Tusn0g/RHpXT78
         bAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770783837; x=1771388637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BIWA8RluXGR6oQRlAJWI5a2TCkKeGW1RA568WY8/pdo=;
        b=lpN/Zu5gKswnvZK2Wn+dZJ2UsSj5RpZorRO7/eV5eB83JYJyMhzRwoFw0O+MQ+K+Lm
         sTY3KjxCrb3uWTCil6SRJMzVrda0d+jlTc/wuKEFpxi6+PEjYLrP5AEhrSaaIcKsOzIp
         BERvOoKMBexuyE7Tvd5X6LgsWUuPz6KUXrE7+Ub4ESwPdWi8N6aRvmM2xUKaRVjQ3SQ6
         k/jACrhpSdq1gIfLFkCI2RCHtZdcWrkWLQo8DAOcBHd6gkaIzIidh7pEKCl54X+In9wg
         tklx6gumVVneOpSKI7ISrHlGUR0x5PpX/anUKaAuQSTTvT2b5e4gwCIR/o2cT4JHo+Wb
         PtUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVOXVL4CNRrNvY6N2pRQJ7xQ5Xiq+6SaPPhdw5FiUyNynivTRGJ7DWz0xedIo49ruxMLqdpc5vxDY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOR70pBDY17E9UpLpmstNYaCImDnKvdwmosLBG9xgkCPP4PCyu
	cSGyTSr/ayeT23CsuaWkkx3Xb7HA8y9q6zcV258WMxOZ6tw3b39Htj404QCyvQ41YpvCcHLqzWG
	Rmj8yXRJ5KDTt92csjbHJNdWLI7mF/js=
X-Gm-Gg: AZuq6aJpBfmsDvrCA35bBnkoLlI10YKM5cF5+QU958ZJ6XSJ+fWR42ErmONt2ALG0eO
	sH16j8vujJbdvLtvteNt6J5G2RA13mrp4YZi/9Dmxf+eOeACJShkVOiM1hyIJHFUu2m+cvTu4c9
	NScC9ahSYyP1Z8JgVRzFtyNxuNzebjLqm8fh2v9M2kWo1G2tTOJbHwcLXgeEUVoCgn3VuUYo5zY
	wA613GwaBiAOv9XtAHQgg2DfnUArLWOGOuCccSgZAjDjaSHnnknYlfHhk7JrT82egjdY5VuHxKI
	StKE59ZRtuflBYMwwWd4
X-Received: by 2002:a05:6402:1e88:b0:658:c11e:44dc with SMTP id
 4fb4d7f45d1cf-6598418449dmr8359535a12.32.1770783836845; Tue, 10 Feb 2026
 20:23:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260211025057.29746-1-wanghongliang@loongson.cn>
In-Reply-To: <20260211025057.29746-1-wanghongliang@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 11 Feb 2026 12:23:45 +0800
X-Gm-Features: AZwV_Qjs2S_8KaNapnjsnLabauF-uP__2B7rU_oiaYXijjPm1jJP5WmfKCg6UMk
Message-ID: <CAMpQs4LeFNEXyg-fVDiSDpEVdbPAY5Z5gL7-5s5uZ52BWmXP5w@mail.gmail.com>
Subject: Re: [PATCH v1] LoongArch: add i2c clocks and clock-div parameter parsing.
To: Hongliang Wang <wanghongliang@loongson.cn>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hongliang:


Bad commit subject, it should start with:
i2c: ls2x:

On Wed, Feb 11, 2026 at 10:51=E2=80=AFAM Hongliang Wang
<wanghongliang@loongson.cn> wrote:
>
> On 3A/7A/2K platform, i2c ref clocks and clock divisor maybe
> different, through firmware parameter passing, "clocks" and
> "clock-div" are used to describe i2c ref clocks and divisor.

I feel it's necessary to specify which platforms are different in the
commit message.
>
> Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
> ---
>  drivers/i2c/busses/i2c-ls2x.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-ls2x.c b/drivers/i2c/busses/i2c-ls2x.=
c
> index b475dd27b7af..562bf32a9d6c 100644
> --- a/drivers/i2c/busses/i2c-ls2x.c
> +++ b/drivers/i2c/busses/i2c-ls2x.c
> @@ -96,6 +96,8 @@ static irqreturn_t ls2x_i2c_isr(int this_irq, void *dev=
_id)
>  static void ls2x_i2c_adjust_bus_speed(struct ls2x_i2c_priv *priv)
>  {
>         u16 val;
> +       u32 pclk;
> +       u32 div;

Place them in a single line.
>         struct i2c_timings *t =3D &priv->i2c_t;
>         struct device *dev =3D priv->adapter.dev.parent;
>         u32 acpi_speed =3D i2c_acpi_find_bus_speed(dev);
> @@ -107,12 +109,16 @@ static void ls2x_i2c_adjust_bus_speed(struct ls2x_i=
2c_priv *priv)
>         else
>                 t->bus_freq_hz =3D LS2X_I2C_FREQ_STD;
>
> +       if (!device_property_read_u32(dev, "clocks", &pclk) &&
> +               !device_property_read_u32(dev, "clock-div", &div) && div =
!=3D 0)
> +               val =3D (pclk * 10) / (div * t->bus_freq_hz) - 1;

I think you should update dt-binding synchronously and verify whether
the existing i2c node in DTS{i} requires updating.
> +       else
> +               val =3D LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1;
>         /*
>          * According to the chip manual, we can only access the registers=
 as bytes,
>          * otherwise the high bits will be truncated.
>          * So set the I2C frequency with a sequential writeb() instead of=
 writew().
>          */
> -       val =3D LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1;
>         writeb(FIELD_GET(GENMASK(7, 0), val), priv->base + I2C_LS2X_PRER_=
LO);
>         writeb(FIELD_GET(GENMASK(15, 8), val), priv->base + I2C_LS2X_PRER=
_HI);
>  }
> --
> 2.47.2
>
>

--=20
Thanks.
Binbin
