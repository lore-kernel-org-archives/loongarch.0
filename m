Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67FB1D2784
	for <loongarch@lists.linux.dev>; Fri, 13 Sep 2024 02:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726192939; cv=none; b=JV59rs5YkrrxZDCAiA4tt2Nf+T7C3ee/VMv0Qx8WH0V+G2JGrVsxhScblFVVsLRxnBqc48xWF6pHQh9CFRLA0+XoxjNciwmYSaVayran2Jc4LrPZkOzZ+nyBcwnjEI/Ejkk2gX8Gq+6dyIgryeGsZQyRwAD/SQ9JbeTdLzEXfws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726192939; c=relaxed/simple;
	bh=Cz5zX1I9CzyGjxg/hnDfG1D8skWYZ4tTNIVZ5IfjHiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V1TdT1Ur6eKhPR4Rtt6HUZ7JYWEyvHMAtFTwx0/SKmUjpnTJd7gMnu5g+TNFqYBb9t/klSPcOpXB/zCQLvi9KiiBly8BcFFVDRLo+EtDLVNhYqw/XACp3bcfHf88U1yYQDXBJjnjtL+5mMFW+nqKfrIHZ5HhFpPvIeOpQycuEWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b27exjDL; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b27exjDL"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8a7cdfdd80so56008166b.0
        for <loongarch@lists.linux.dev>; Thu, 12 Sep 2024 19:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726192936; x=1726797736; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Za1VrBBRwn+rfA8pvyhHB+W1qLi3Bv4s93LHwXChOXM=;
        b=b27exjDLkuszxh4BLzRhl/qKIpjUc3BiDHobfpJp6/4ES1SlNWDp3v0M3PUw4FBX6Y
         zsxVrESiZVHJXSejp8+Yq3yDxBGato1Ovoht19tuim+ikS/SwDwZD5XkGPzOR8e6oleY
         mxCEH1OSonsbvMcetLQT7OfR5zOmVbI9jSCEUknho8thdsgcQEFqT1OFvidOL/TVP9FG
         sQfrvsU/8Vs0EGmdCT2C+yk1rIpQdsvHdXuY4Xazf2IiCmdzIjPNFT0FZle39WWbUU8O
         E2MMuC07sWF1M9HpSrp3yXMh9epulvsulKaRDyv7ORPsQ3C3W1j0eVgIX1iTepBLrYDo
         BvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726192936; x=1726797736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Za1VrBBRwn+rfA8pvyhHB+W1qLi3Bv4s93LHwXChOXM=;
        b=jejEj7zI+m0yS8vkjRnhSY10pbtiKbHVEWEqsvoQKrnGe1GQQ/6w9/B3L7lqXO83/w
         nekkFheSmUvU5hjGR8TaitiQ/tx4aHDjMv/0fT95ea4jLBZa/asGKAquU+M7QieSVXxy
         Y7LSLoqJ5QIjEvzdeSuLkweDHVE1qKBdTPZp5q+vc6Qcj2MyGVl423zQbeolK73bAbIh
         K2y3tNq2r2AnpC3PV0T2EBbAZLs7GGuSi/p/M6AywxoKlfltugVEo5OuN5YaMof2aYzZ
         NgfJqrMCX8DlltNkbcQLS90xgPF9mIEixhiDCtO5iMP1quBc4NnY34coZ3dQyUZYVd5o
         TMOg==
X-Forwarded-Encrypted: i=1; AJvYcCWHHKDz5K428dlVEglcucjpB1fnK9flxSdcj3Yts8oI7Y9/yUuHgRmn8gs6XloxsanY9WxwMn2vOfg=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt9xczJn6ymwDxrH67lOWloi2mnE+7u0cKFSJSr/tAyG9cEkws
	RcoSheRcUqprwzd5M6EOb5YaefGZvshYD28JxBmnsWSb7/iXgQH0kk/bceXD2HtVvTRj9bdoVI/
	V+8BGInWx/YAJgmA/63XoiDj5yh8=
X-Google-Smtp-Source: AGHT+IGmaOVz9eWZVBmnkUFctSYHbKgcUw492jRbUuzTOMojrpripRNj32SgNyGp+C1Af+8TAqbpm3AcRWf/z4hTLp4=
X-Received: by 2002:a17:906:c109:b0:a86:7a84:abb7 with SMTP id
 a640c23a62f3a-a9047ca076emr61223666b.20.1726192935634; Thu, 12 Sep 2024
 19:02:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725518229.git.zhoubinbin@loongson.cn> <c44a6525d77941ef235825a58a9ea91f9f7d7042.1725518229.git.zhoubinbin@loongson.cn>
 <5a7357f7-da3b-4532-b055-ad33eb93fe1c@sirena.org.uk>
In-Reply-To: <5a7357f7-da3b-4532-b055-ad33eb93fe1c@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 13 Sep 2024 08:02:02 +0600
Message-ID: <CAMpQs4JRz8x=zfB-DuDSxbcYDR=mtVET_AwawU+J9Vn=sx9LNw@mail.gmail.com>
Subject: Re: [PATCH v1 02/10] ASoC: codecs: Add support for ES8323
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

On Thu, Sep 5, 2024 at 8:05=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Sep 05, 2024 at 03:02:15PM +0800, Binbin Zhou wrote:
>
> This looks like it was based on some *extremely* old code and needs
> quite a few updates to bring it up to modern standards.
>
> > + * Author: Mark Brown <will@everset-semi.com>
>
> Oh?
>
> > +/*
> > + * es8323 register cache
> > + * We can't read the es8323 register space when we
> > + * are using 2 wire for device control, so we cache them instead.
> > + */
> > +static u16 es8323_reg[] =3D {
> > +     0x06, 0x1C, 0xC3, 0xFC, /*  0 */
> > +     0xC0, 0x00, 0x00, 0x7C, /*  4 */
>
> There's a bunch of regmap reimplementation in the driver, the cache and
> I/O code all looks totally generic.  Just use regmap.

Sorry, I don't really understand this point.
Do you mean to use regmap_read()/regmap_write() instead of
snd_soc_component_read()/snd_soc_component_write()?

If so, are there any rules for using snd_soc_component_xxx()?
>
> > +static const struct soc_enum es8323_enum[] =3D {
> > +     SOC_VALUE_ENUM_SINGLE(ES8323_DACCONTROL16, 3, 7, ARRAY_SIZE(es832=
3_line_texts),
> > +                           es8323_line_texts, es8323_line_values),   /=
* LLINE */
> > +     SOC_VALUE_ENUM_SINGLE(ES8323_DACCONTROL16, 0, 7, ARRAY_SIZE(es832=
3_line_texts),
> > +                           es8323_line_texts, es8323_line_values),   /=
* RLINE */
>
> Use named variables for the enums rather than putting them into an array
> that's not otherwise used...

OK, I will use macro like SOC_ENUM_SINGLE_DECL() to define them.
>
> > +static const struct snd_kcontrol_new es8323_snd_controls[] =3D {
> > +     SOC_ENUM("3D Mode", es8323_enum[4]),
> > +     SOC_ENUM("ALC Capture Function", es8323_enum[5]),
>
> ...it's *vastly* more readable and maintainable.
>
> > +     SOC_SINGLE("Capture Mute", ES8323_ADC_MUTE, 2, 1, 0),
>
> On/off switches should end in Switch, see control-names.rst.
>
> > +     /* gModify.Cmmt Implement when suspend/startup */
> > +     SND_SOC_DAPM_DAC("Right DAC", "Right Playback", SND_SOC_NOPM, 6, =
1),
>
> gModify.Cmmt?
>
> > +/*
> > + * Note that this should be called from init rather than from hw_param=
s.
> > + */
> > +static int es8323_set_dai_sysclk(struct snd_soc_dai *codec_dai,
> > +                              int clk_id, unsigned int freq, int dir)
>
> Why?
>
> > +     /* set master/slave audio interface */
> > +     switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> > +     case SND_SOC_DAIFMT_CBM_CFM:    /* MASTER MODE */
> > +             iface |=3D 0x80;
> > +             break;
> > +     case SND_SOC_DAIFMT_CBS_CFS:    /* SLAVE MODE */
>
> Please use the modern naming with _CBP_CFP and so on.

Get. SND_SOC_DAIFMT_BC_FP/SND_SOC_DAIFMT_BC_FC will be used.
>
> > +static int es8323_mute(struct snd_soc_dai *dai, int mute,  int stream)
> > +{
> > +     struct snd_soc_component *component =3D dai->component;
> > +     struct es8323_priv *es8323 =3D snd_soc_component_get_drvdata(comp=
onent);
> > +
> > +     if (mute) {
> > +             es8323_set_gpio(ES8323_CODEC_SET_SPK,
> > +                             !es8323->spk_gpio_level, es8323->spk_ctl_=
gpio);
> > +             usleep_range(2000, 3000);
> > +             snd_soc_component_write(component, ES8323_DAC_MUTE, 0x06)=
;
> > +     } else {
> > +             snd_soc_component_write(component, ES8323_DAC_MUTE, 0x02)=
;
> > +             usleep_range(2000, 3000);
> > +             if (!es8323->hp_inserted)
> > +                     es8323_set_gpio(ES8323_CODEC_SET_SPK,
> > +                                     es8323->spk_gpio_level, es8323->s=
pk_ctl_gpio);
>
> This appears to be controlling the speaker based on jack detection.
> Unless there is some hardware restriction this should be done via DAPM
> and the user allowed to manage when the speaker is used depending on
> their use case.

In this version of the patch, I plan to remove the jack related
functions, and I will add them later.
>
> > +static int es8323_suspend(struct snd_soc_component *component)
> > +{
> > +     snd_soc_component_write(component, ES8323_DAC_MUTE, 0x06);
> > +     snd_soc_component_write(component, ES8323_LOUT1_VOL, 0x00);
> > +     snd_soc_component_write(component, ES8323_ROUT1_VOL, 0x00);
> > +     snd_soc_component_write(component, ES8323_LOUT2_VOL, 0x00);
> > +     snd_soc_component_write(component, ES8323_ROUT2_VOL, 0x00);
>
> This will overwrite user settings when suspending, the controls should
> be unaffected by suspend.  If the device needs this then use cache
> bypass to do the writes during suspend and resync the cache on resume.

regcache_cache_only() and regcache_sync() will be used.
>
> > +     snd_soc_component_write(component, ES8323_CONTROL1, 0x06);
> > +     snd_soc_component_write(component, ES8323_CONTROL2, 0x58);
> > +     usleep_range(18000, 20000);
>
> Use fsleep().
>
> > +static void es8323_init_component_regs(struct snd_soc_component *compo=
nent)
> > +{
>
> > +     snd_soc_component_write(component, ES8323_ADCCONTROL1, 0x88);
> > +     snd_soc_component_write(component, ES8323_ADCCONTROL2, 0xF0);
> > +     snd_soc_component_write(component, ES8323_ADCCONTROL3, 0x02);
> > +     snd_soc_component_write(component, ES8323_ADCCONTROL4, 0x0C);
> > +     snd_soc_component_write(component, ES8323_ADCCONTROL5, 0x02);
> > +     snd_soc_component_write(component, ES8323_LADC_VOL, 0x00);
> > +     snd_soc_component_write(component, ES8323_RADC_VOL, 0x00);
>
> User visible controls should use the chip defaults as standard,
> userspace can configure what it needs and this avoids us worrying about
> individual use cases in the driver.
>
> > +static int es8323_resume(struct snd_soc_component *component)
> > +{
> > +     es8323_init_component_regs(component);
> > +     /* open dac output */
> > +     snd_soc_component_write(component, ES8323_DACPOWER, 0x3c);
> > +
> > +     return 0;
> > +}
>
> This doesn't restore any user settings.
>
> > +static int es8323_i2c_probe(struct i2c_client *i2c)
> > +{
> > +     struct es8323_priv *es8323;
> > +     struct i2c_adapter *adapter =3D to_i2c_adapter(i2c->dev.parent);
> > +
> > +     if (!i2c_check_functionality(adapter, I2C_FUNC_I2C)) {
> > +             dev_warn(&adapter->dev,
> > +                      "I2C-Adapter doesn't support I2C_FUNC_I2C\n");
> > +             return -EIO;
> > +     }
>
> Does the device really need this?  It seems to be doing very basic I/O
> which should be SMBus compatible.  In any case when you move to regmap
> this should be redundant.

Emm, I will drop it.

Thanks.
Binbin
