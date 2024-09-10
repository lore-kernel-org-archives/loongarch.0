Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352ED18308E
	for <loongarch@lists.linux.dev>; Tue, 10 Sep 2024 07:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725953835; cv=none; b=FhjMQgP9qSrLuIpPJ+DykjTpeKFRR0UcJYSb/kUkk8P73koCIeAJ3Haw0SosJ6Y7OhYAjbHW43JeQo3U+wxYOpLmTpwfi4mplpHr4Oe5d6NF/QK+4SwoUQXYeyNTgMrSrHyerhGBuUPsvFw644P6SRRhj6Vufr/N2FL/lcv5S28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725953835; c=relaxed/simple;
	bh=uL94oOPhR2uwajOdSxBzXW91Gbt1fLjYjFku5Rxlpd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSBp36cCz++fOVgEKJBF5sch5HprH0RnTBmYATIypbpCeMMrCLY6YqBEmQDPEFnbtGd+vBSG/D4RyPjpR0lotZWCdnEBuyP8vi7Uiq7jFzUAoa0ARtU7WfqZ0Yf/J7D1E6mPfpNTORq8WcrDJlsEyunTF06sNlaTbfe/JBpzsiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R53bvNmq; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R53bvNmq"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8d2b4a5bf1so56077566b.2
        for <loongarch@lists.linux.dev>; Tue, 10 Sep 2024 00:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725953830; x=1726558630; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvWiuTWFvMPcDlEcoADtQiBJ85qEz5AdFMmQSQGM8Uo=;
        b=R53bvNmqg3n5GIpFlu8dyO2VgJWuNH7LAm7Bne5ax4pMGBJ/UUsckHdHWcpJHOGvCd
         ZaGzPNfNotnbVLBgWtOYsrh6jCzz6mxIKiVSfX9WKxdj8Hl1BJIKP8xxitFKICjKMALo
         39wpFXhrWUFHhN12w8pQ9by9Ost6MWTfPkRY3wvL8/ztsSmw9ghmUnFyOQSscwP6T6pW
         tVOueNvhGFIyYt+whlkPCqnrCAqLjowJXuRrU+W1Vi4tjS2010Xgbt0PJV+BofgzUp2R
         z0S/XrnWJBv/SueWYmEooojYKrx4xbRGnZu1u79pcjMdbg8VB7bMuqHZbCqNfVuZZmyz
         bw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725953830; x=1726558630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvWiuTWFvMPcDlEcoADtQiBJ85qEz5AdFMmQSQGM8Uo=;
        b=thOYpb8Y/RWMGGBVjpaXBoTmtCMSymV0zS/ObkCXU79Y265UnViFt7N+iuqVZHJ2Lv
         lG7tDUGml5m6GP0SVEurJ1guws2pengCdXI8TzH9K7l/cgs9jlAZkexnlDbzeAZ8Knti
         Fz+eoGkR/XVYk5V3rpHKlMfMbSyYWfVzm8cssZmT2gHCiGzoDZbF3L8zfhBZg873TOx5
         l1n1Bm+bdBOTzXWvkUN2WmCxChk/cNGbUT8dVTaZVg7EYi/AdlZ3tWhYY5WUuW/o3WLj
         UeKMb36ec56BRYTufdc4u6oxp2tW/mf0k4Sgu+irzwWlACNNES2doBMiSgTWkZiURrr0
         7tnw==
X-Forwarded-Encrypted: i=1; AJvYcCUTjYMe42LaAx2bxDovNSDeXB+09QyFYZVeMftCj0T5bBouVxqBqs+BkCn2+ZYgqvLUAXpmyohekWo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgr44ytSNmgWMIdg/GwcJgxc26IwVwTl77v3Hg2YpHgONUIAm6
	Bt8+iTBNa+s9eHPC2uROeF0llqJByTueZcZbehbs6xdmVs6SoTHF++MwJPSjpcDNo5vojt5ewLh
	SSj6Dvks8vIn16ZS8p1XX8PeY00U=
X-Google-Smtp-Source: AGHT+IEnQh/fa4IE7ZagE7qLvLFgvwd1HWUxsftYL8OPLg+rC+19mM7cwdluLYSIUMKePWXEWmJvrz5j90iPF0Zctmg=
X-Received: by 2002:a17:906:db07:b0:a86:9776:ef40 with SMTP id
 a640c23a62f3a-a8a88667b5bmr1249364066b.36.1725953830116; Tue, 10 Sep 2024
 00:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <3fd0c3a04f5f3bd293168732db457f6854db706e.1725518229.git.zhoubinbin@loongson.cn>
 <eaeb0113-785c-4a41-b093-b352122b20ca@sirena.org.uk>
In-Reply-To: <eaeb0113-785c-4a41-b093-b352122b20ca@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 10 Sep 2024 13:36:57 +0600
Message-ID: <CAMpQs4LAsQhfrFnh_ABr4NqLbSMW532xyh991sLp9QsiwB2XsQ@mail.gmail.com>
Subject: Re: [PATCH v1 04/10] ASoC: codecs: Add uda1342 codec driver
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

Thanks for your detailed review.

On Thu, Sep 5, 2024 at 8:28=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Sep 05, 2024 at 03:02:53PM +0800, Binbin Zhou wrote:
>
> > The UDA1342 is an NXP audio codec, support 2x Stereo audio ADC (4x PGA
> > mic inputs), stereo audio DAC, with basic audio processing.
>
> This looks basically fine overall, there's some issues below but they're
> mostly fairly small and stylistic rather than anything major.
>
> > --- /dev/null
> > +++ b/sound/soc/codecs/uda1342.c
> > @@ -0,0 +1,397 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * uda1342.c  --  UDA1342 ALSA SoC Codec driver
>
> Please keep the entire comment a C++ one so things look more
> intentional.
>
> > +static int uda1342_mute(struct snd_soc_dai *dai, int mute, int directi=
on)
> > +{
> > +     struct snd_soc_component *component =3D dai->component;
> > +     struct uda1342_priv *uda1342 =3D snd_soc_component_get_drvdata(co=
mponent);
> > +     unsigned int mask;
> > +     unsigned int val =3D 0;
> > +
> > +     dev_info(&uda1342->i2c->dev, "mute: %d\n", mute);
>
> This is far too noisy to be logged and will DoS the logs, please just
> remove it.

OK, I will drop it.
>
> > +
> > +     /* Master mute */
> > +     mask =3D BIT(5);
> > +     val =3D mute ? mask : 0;
>
> Please use normal conditional statements to improve legibility.

OK, the code as following:

if (mute)
                val =3D mask;
>
> > +static void uda1342_shutdown(struct snd_pcm_substream *substream,
> > +                          struct snd_soc_dai *dai)
> > +{
> > +     struct snd_soc_component *component =3D dai->component;
> > +     struct uda1342_priv *uda1342 =3D snd_soc_component_get_drvdata(co=
mponent);
> > +
> > +     if (uda1342->master_substream =3D=3D substream)
> > +             uda1342->master_substream =3D uda1342->slave_substream;
>
> Please avoid using master/slave terminology, we've tended to go for
> provider/consumer in ASoC.

OK, I see, I will  rename it.
>
> > +static int uda1342_hw_params(struct snd_pcm_substream *substream,
> > +                          struct snd_pcm_hw_params *params, struct snd=
_soc_dai *dai)
> > +{
> > +     struct snd_soc_component *component =3D dai->component;
> > +     struct uda1342_priv *uda1342 =3D snd_soc_component_get_drvdata(co=
mponent);
> > +     struct device *dev =3D &uda1342->i2c->dev;
> > +     unsigned int hw_params =3D 0;
> > +
> > +     if (substream =3D=3D uda1342->slave_substream) {
> > +             dev_info(dev, "ignoring hw_params for slave substream\n")=
;
> > +             return 0;
> > +     }
>
> This is also too noisy, it should be _dbg() at most.

OK, I will drop it.
>
> > +     /* codec supports only full slave mode */
> > +     if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) !=3D SND_SOC_DAIFMT_CBS_CF=
S) {
> > +             dev_err(dev, "unsupported slave mode.\n");
> > +             return -EINVAL;
> > +     }
>
> Use the more modern _CBC_CFC.

OK, it should be replaced by SND_SOC_DAIFMT_BC_FC.
>
> > +     /*
> > +      * We can't setup DAI format here as it depends on the word bit n=
um,
> > +      * so let's just store the value for later
> > +      */
> > +     uda1342->dai_fmt =3D fmt;
>
> No need to even store it if only one value is supported.

Emm, I will put the fmt setting here from the hw_param function.
Also, the dai_fmt could be dropped.
>
> > +static int uda1342_set_bias_level(struct snd_soc_component *component,
> > +                               enum snd_soc_bias_level level)
> > +{
> > +     switch (level) {
> > +     case SND_SOC_BIAS_ON:
> > +             break;
> > +     case SND_SOC_BIAS_PREPARE:
> > +             break;
> > +     case SND_SOC_BIAS_STANDBY:
> > +             break;
> > +     case SND_SOC_BIAS_OFF:
> > +             break;
> > +     }
> > +
> > +     return 0;
> > +}
>
> This does nothing so it can just be removed.

I will drop it.
>
> > +static const struct soc_enum uda1342_mixer_enum[] =3D {
> > +     SOC_ENUM_SINGLE(0x10, 3, 0x04, uda1342_deemph),
> > +     SOC_ENUM_SINGLE(0x10, 0, 0x04, uda1342_mixmode),
> > +};
>
> This doesn't seem to be referenced anywhere so can be removed, or should
> be added to the controls or DAPM?

I will drop it.
>
> > +static int uda1342_soc_probe(struct snd_soc_component *component)
> > +{
> > +     struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(=
component);
> > +
> > +     snd_soc_add_component_controls(component, uda1342_snd_controls,
> > +                                    ARRAY_SIZE(uda1342_snd_controls));
> > +     snd_soc_dapm_new_controls(dapm, uda1342_dapm_widgets,
> > +                               ARRAY_SIZE(uda1342_dapm_widgets));
> > +     snd_soc_dapm_add_routes(dapm, uda1342_dapm_routes,
> > +                             ARRAY_SIZE(uda1342_dapm_routes));
>
> You can point to these arrays from the component struct and have the
> core register them for you.

OK, I will do it.

Thanks.
Binbin
>
> > +static const struct regmap_config uda1342_regmap =3D {
> > +     .reg_bits =3D 8,
> > +     .val_bits =3D 16,
> > +     .max_register =3D 0x21,
> > +     .reg_defaults =3D uda1342_reg_defaults,
> > +     .num_reg_defaults =3D ARRAY_SIZE(uda1342_reg_defaults),
> > +     .cache_type =3D REGCACHE_RBTREE,
>
> In general _MAPLE is preferred for new things unless you have a specific
> reason to use _RBTREE, it uses a more modern data structure and should
> generally do better.
