Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98F83195FD
	for <loongarch@lists.linux.dev>; Thu, 28 May 2026 07:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954014; cv=pass; b=CGxb0cm3rcCnsnajPH+jnFgVVAU2Ikb5AquUbgHmGfOdtxm0VjqiNbZTghYwm235oROokqHnuqwHoDjbkUzoMa3a6uql+IvW27p4uLIFVRXtmWqwEKWu1TV6IQfDNt+12TxpBUvWLhI1G7Y+kQOscJZF1qgU9AQZkm5fZQPWTlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954014; c=relaxed/simple;
	bh=j3a6kkTxZxaZI8wswoftHlBDrPw6NcrFuIHXjMRcuxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BBJ8JX00ohRnPjk8V85iMLdv0xRz5scTRSYJYzqx98saE6GnLz7Mb4XPsnEJVG487tmvV4LmdEEA0yJX5HvmbfqiGJ6QaJrqBMLcD48FftKklmywuN4D8erEc8/Rpmj8YxkEMjkqak3hFl9zU3foTaWjSijA2q+YmkC4uFb1W8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YU2jK8Pc; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YU2jK8Pc"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bd4f8260e4eso2210337366b.1
        for <loongarch@lists.linux.dev>; Thu, 28 May 2026 00:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779954011; cv=none;
        d=google.com; s=arc-20240605;
        b=WiIyXsghe73mhMIsDCQZx9mY6KTZo8drXZaFx7X2aXXEwE7j3YYPJ56yoJLos4Vcxp
         EWvc8v+DrygH2ONWsXQaianhs65pChxxp7CRvZdrmb/8Q359CZGa+M/8rb2Vf2AX0ERM
         rItpxjROv9XJlm6AOE5H2IjORQ3Tc0pLIA1hyQSZLUaY94mwprxn9v1Tc9nPOoXPv2/b
         AKpjG78keGlu528ambJmT18qtEl6An+IgV1tW4YJImoF4us5solfSKPuTzhmjcdzrGLu
         fvusffcvB26SauFT/JW91PprbjrULJ21gLeH6eTrDfWchR1Knq6sGqRooUgLwBcpRwN8
         0Pvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K4A4UI4OtEAg56yUjKb8IRThu2A+ZurcjAgnAugOSbo=;
        fh=64xZmNLq28gqLJKAZlcLFRkciElEK23Ji4M6Kb3dOgk=;
        b=YfTBZHLq5r/kooWHuP7rUsXKndlby94h7WLXVhWGYUepBvEKoo0LBoHpUn/Osj1osk
         HCQTAOoUNZE+gjxY6rqUGwowxtVExypzaS2fdvFg1NP7AXUxAWpGqUmMyaEzo5816ELR
         +7x8Pb9uKz9433bnN4FqhDmU2UjVFMTlZtjoMoi3xRpxP/KoPeBG2ANZS71zvIxMSrPg
         3i/ec1ECvhG+y8Hoe3dyaiZfonVsr1eA2+YXX9ByHk/RgAxoKg+HQscyrPX+KekTGrUx
         kZBGcil+m0B8p0OpViwSmwnqsqTsYeoRnbQxLfc+IAGOTgU9H+VPIu6OFUZz2H8P+pV5
         f1VA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779954011; x=1780558811; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4A4UI4OtEAg56yUjKb8IRThu2A+ZurcjAgnAugOSbo=;
        b=YU2jK8PcwdL0WanyBEO21Fm7s9ELPMG9PqnWS2OfULtCNXqeN3JE8TYIadNRX/zfe4
         rinBp7zHlYvDhDvKBSXbsB7PVvrCjlSV9ccmnlFID54JV32HhcESvxnjkQZDqLr/jBai
         bUMfZ3UHbtUETH6S4nKEaqg4Zsiz2594q8WZuUSt78Orq1577KPFos9ZVuGSy18TrOky
         Lwn31/dnYoJj1SlS5FzHJNE6UL7el0KVrgdxtXs1lCEtGbpkSOF73gos4wXoLBu13Bc8
         OrNkz7OooZan0OzeFXQtGQ1MKzC2hNEnKeraq7i1tgDxsC/ranQr2US9uWLLwd8ZCdu8
         0icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779954011; x=1780558811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4A4UI4OtEAg56yUjKb8IRThu2A+ZurcjAgnAugOSbo=;
        b=hr8+D3s2z3vDwkpeNo7UMVSr6brOeei+QKg5FEVq7oTnYdZlkNE00edzahjpbrrH5/
         nSn8YAdBCpTo04YiZut2pzj39mwCYUSza8wcrbOn8mcGL75xrrdiaEH9BhbjfsBWXHOj
         M32xXHvFakrV9hiQf5DNgSnK5pu+hr358ePGpVNNdv3RJzTdv1SS58zdMzlnsPObs6gB
         JRaTghEx1NtTp852xejjSkYRIF4crgyL/3poN9eq/rz6MH0GnfXyHFIfx/3Y6iLtKPhh
         aDTppTZzkrpenmEKmHTU/T2ZTJ6f/YqVPJl5cN8YjfSHiiRjlcv2JIeePSvcNlFoHPLG
         U+gg==
X-Forwarded-Encrypted: i=1; AFNElJ/irecvqAA6UFuuBWdWO+aQYL9ea+2SLCHy8CPbquexSzpAu1e1yyTH5Cq7lm6ca8jMKzl5OuFWcko=@lists.linux.dev
X-Gm-Message-State: AOJu0YyACug6JRUbe7V0vMWGpHXUCzQwnFQjNijbZMzaZp+173yRt3sx
	hDCDFpDJuTfBDrSLw2VajZ6x2mFZPbJBjRTBIq4UEIzuaFgKyLxKKdXwlFJvTPLWbTzB1q7JlfQ
	BOwld0cEfdVATX7xIqVEg+sd5tUz8dV4=
X-Gm-Gg: Acq92OHk626BfvTA2gportLTYMzog/bCVH8RchP5tVYO+keD1Y92JoneyJ9+pcqSiUk
	OnMwqwlmxmyuuDkLd1701tuG4nRnL17ZETKlHu6/nSqn8WIjpF0S+q/hhXuhA4FzcEvMm7aZF/8
	/P9TMykj1iiFIIc6X3alp74vHDkpFKtPtRYBg2Zn1RdZn3H4XuqPOnvxkdxM2mdwOq9a+0/KTyh
	fivYqpTUb0W87rQ6nmbGAxr+ICh7nWAaQ9iztAzXCvuFnc043IwmmelHwf/2TUf34YtZeHmD5di
	M/lQaYtHFdFqda8puKZQ
X-Received: by 2002:a17:907:a80c:b0:bd1:1391:c331 with SMTP id
 a640c23a62f3a-bdd269b65c9mr1635356066b.43.1779954011153; Thu, 28 May 2026
 00:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1779796354.git.zhoubinbin@loongson.cn> <738268f7409fafdb65cd25214114fbde4d7e25c5.1779796354.git.zhoubinbin@loongson.cn>
 <45a5b690-e7ff-454b-9120-1eb906bdd0a2@sirena.org.uk>
In-Reply-To: <45a5b690-e7ff-454b-9120-1eb906bdd0a2@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 28 May 2026 15:39:58 +0800
X-Gm-Features: AVHnY4LRyLMudRpfBuRmx1dOKz6oP1vsVr9Q7TPRk_gXDKB28ha0RhJmvj7vJPU
Message-ID: <CAMpQs4LJmjMw257Kgf=DJkZpJr3MdW=wz-yr+ekskykWyy6CYQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] ASoC: codecs: es8323: Adjust the initialization of
 certain registers
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

Thanks for your reply.

On Wed, May 27, 2026 at 1:36=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, May 26, 2026 at 07:56:26PM +0800, Binbin Zhou wrote:
> > A few additional register initializations are required for proper
> > operation.
>
> > - During hw_params, write ES8323_DACPOWER (0x3c) to ensure DAC power
> >   is correctly configured for the selected sample rate.
>
> Is it just a write that's needed (even if the DAC is already enabled),
> or is it that we need the DAC to be powered?  If it's the latter should
> this be managed using DAPM?  What does this write actually do?

This doesn't seem to be necessary; I checked, and it was being
affected by the preceding I2S_CTRL.

>
> > - In the probe function, initialize DACCONTROL17, DACCONTROL20,
> >   ADCCONTROL10, LOUT1_VOL, and ROUT1_VOL to improve analog output
> >   stability and volume level.
>
> The volumes should be left at the chip defaults, users can adjust them
> via the existing Output 1 Playback Volume control and UCM can be used to
> provide defaults.  We don't configure this in the kernel because the
> settings needed for different boards can be very different and tweaking
> the configuration in the kernel causes them all to collide with each
> other.  The chip defaults might not always be helpful but at least
> they're a concrete thing that provides a fixed point for configuration.
>
> We also seem to already have volume controls exposed in at least
> DACCONTROL17 and DACCONTROL20.

Thanks for the explanation.
I tried adjusting the relevant controls with `amixer`, and both
recording and playback are working fine. My initial idea was to preset
the relevant registers, but this seems to differ from the standard
approach for I2S.
>
> > - In set_bias_level, set CHIPPOWER to 0x00 when powering up and
> >   to 0xff when powering off, fully controlling the chip's power
> >   state.
>
> It looks like this register is managed by DAPM already, presumably
> there's some bug or missing configuration there but

This doesn't seem to be necessary; I checked, and it was being
affected by the preceding I2S_CTRL.

Sorry, please ignore this patch.

--
Thanks.
Binbin
