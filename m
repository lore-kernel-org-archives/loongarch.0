Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A27390C8A
	for <loongarch@lists.linux.dev>; Fri,  5 Jun 2026 01:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780622739; cv=pass; b=eo7LaQyobXtqYS2f62WRY/jscQsrAI2RpXvvKcrzPCy39AAx7PDD1N3b+ZnXKKCuW/yrV8mpHPHtaMejwuLUfLtrrwvco5ISF8WL71i2cU3PrPXMufOQJIm2RD8w0PcfdMSpegWG4U9qICb6WgzuL9q+a0NdjwgeNqdJTBKp4GI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780622739; c=relaxed/simple;
	bh=yR9iPHQ7X1yMgWZrkr31stdQCeajq3KhlcULNx8kfWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7RmabVQL6TxxHLukngepa/MxnIpl9LTep7c/tIPK3Cs3CH6Ea4bHDGt/8EU0ZBvani+NuX3e70KpwHyx/J1yEGckrkv/rIc6NMiTIx/ERMRTRDDtkL2sZ8gfKWmBcZnKt4SCOWfUYpZCVCbnuSSkil67exEbHOq7CU/Cl9YPfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2NtMWGT; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2NtMWGT"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bebc80100efso136984766b.1
        for <loongarch@lists.linux.dev>; Thu, 04 Jun 2026 18:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780622730; cv=none;
        d=google.com; s=arc-20240605;
        b=VYZNK2wldMUW/y5nA6uWK/Chsz53+XY+LeWCh+Le9wNUpTK9/ZJ13shHUplR+wfYsK
         EkDIfuFrQj/LwzXAnsC+8Rtf1RMo/UElJAzxZr/bSxj2r96NcNHtSmHaIVXfQpFuDqJI
         snAXwqUrRdWX3h74/3S7Q2ASqj2ZTLNPeW7m0nkRWIuuO3Bxy9F9efrVsyw6KhOtnRKj
         aK+ws/CQ9W7wpc3gK/0CfsSngRsyLHoxJn6BeOoj1s6Pr+eudZz82Kev20JCdOVT+rIf
         kWtGU6y6IVz/R1UYDW8qE54tbAJuDqSJk7aQgWeai92sSJcCi7euIchIkTXrQR+BXV9R
         Uutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uokzk4V1WQNqzax8rM0zN70J5L37rNbhenhyeHDxJfg=;
        fh=UtVQb4FprB2ixZw41ezg75d6VHGUEO3x6OGIQcdyRjg=;
        b=O5xi1PqScwHgNdk6pnO9LQbyitMsQE/8GFNovBpGZTKbfvqMfk7RaB4sXpd/ILjiCj
         rtfdNC0rAclUPuuqjNHgSoZOvEnR1XLGUIWm2PJ0LhzJUvuzspt8JBe148mY06bIpWiv
         gnHGr6/837n+x5nBYl0GZCqG9QKTADK70n/F8zc8LbN57RyHPtw7EciCFzVpXvlWKMTO
         MHYcaVzyaogQ/2KM+nsQ7og1FoxjVwTK10PWnqEBecK7fGH0V+U3iDENumlF0pfvdhih
         9CRzeeeHGq5bV1ycwSHAve290lokRugeH9L/xA5RX1JI96ohd6lenN/XofWCL+06TUgm
         rdGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780622730; x=1781227530; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uokzk4V1WQNqzax8rM0zN70J5L37rNbhenhyeHDxJfg=;
        b=J2NtMWGT8Z0X4/P8/Udy+3MvpQ6oshzoaAaj/NgWcXRQbmjvq58ArtUeKZEhanhSAr
         cqZJ5Pmt7W8QKMloQlgg5ATIIc5YMsvCP925qNZtcvGTJ7hArMAU0vjDWKau+e4k6pGr
         QflL6OQhxzbfdkB2HuhviSS8yRVnvr4UoLngHRC4ZbZaUBIvO3gDwuSVB2PmiBJ3kUIi
         gwpQolhk0n3u2fnWUHonofCE3B49SvfgEVCiUIsodUg613ikiNn9jehxM5o9KUV6YGYy
         82JIJD4anVP11TCYlSP4nL5tyDNKUAh4szGIRf1stgaYtKJXaDv87GUhXSYi0LykYR1p
         Snsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780622730; x=1781227530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uokzk4V1WQNqzax8rM0zN70J5L37rNbhenhyeHDxJfg=;
        b=FH47YTPGj7eok04h4t2sLfXA5JKMym5lWCQRGe/U4OVw6++PUlwEPIQvWhMR06B+fR
         6dBfPImkemE7oBlXOfN1Oo75B9CDMvy6QlHCZJMTlPYSozJZkOTXB4DFSJjHdS8TTiVl
         nG5pCP9+7jrtGNdD3Lvie9l1tIJIHSpHB0Cv9iqq5ibq7qzZ25/lBBUDc7kSTGngzJ+6
         A2GUvBGJnaTS4nJpnDKjdMnL9eaA/Yq5ugmYlu8Ag1rYz/SzT2iGAL1Bt2juf+kpCmCr
         ekDiWwdYMwgf8aq7nw6bRrktV1bfPTxX+KyfPmp+Blvid2DIp07AkRJTgOlyeY2Gl7P+
         MYEA==
X-Forwarded-Encrypted: i=1; AFNElJ+A8WeHjgIqKRMp8nd1N0ELmZ4X1s7BvM0tlJBAuCjZP95ItM3rKb7B4zj++47iqTtRemDBGzAZVr0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9wOQq2EA5X0atVjYA8pnaX/mJ6RcHd61GzA5738RTLoYGb/qu
	GTAeFjYEki4owIHffLbu4Mexl8nd4Jojdb4MXU5JxGt0i6JneravYaSW2BCh7r7jX3iP1gFp0LR
	kdIEvIumKePaOfF9LY63qJh36PeFPlcw=
X-Gm-Gg: Acq92OFKL4m5jUwVwYsgcEqPK70Ajz0K5iP71NDhI1MbOuuOURnc2Uyl+in2lv0iwAZ
	Iz0xR3D/urdOz/CerVrqdWTNstDWK9YOudVP1bYLtF3+2GXJxM0WPT9arUmLlEsbfT8run9C5gS
	WLqw5PvZk+DBg9PtcZ2sR+kUYYUnKtKXmaSjf9YEKcONPgfLkNVo7w85O+909KwwSIf4ejOz/mc
	I3fEB9iH4QvBaR7OpnQrebpmZTfIcySwUtXVG/yvOBt9uN/t4KQafpk4zFpS4Fsb7ZiUv7Xws6l
	OssW+xEI+ueGBr+HfShL
X-Received: by 2002:a17:907:dac:b0:baa:6847:af9 with SMTP id
 a640c23a62f3a-bf37234c8c5mr52264866b.28.1780622729733; Thu, 04 Jun 2026
 18:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1780538113.git.zhoubinbin@loongson.cn> <2736a44ee11bcc0bbf282c69e99cb05b12469207.1780538113.git.zhoubinbin@loongson.cn>
 <bae028cd-c77b-4238-8b62-330a1c3c46ed@sirena.org.uk>
In-Reply-To: <bae028cd-c77b-4238-8b62-330a1c3c46ed@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 5 Jun 2026 09:25:17 +0800
X-Gm-Features: AVVi8CfdW5IUTOMPP78y2fnXmkP4Q2-oxn8x6qdRtekrt5cj2B0jDWhtd_sOa5w
Message-ID: <CAMpQs4LCQmp1-Rw6W0jf=h9Rub1iK8BYCYi_jhB7updSKMfCSA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] ASoC: loongson: Add headphone jack detection and
 DAPM routing
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

Thanks for your reply.

On Thu, Jun 4, 2026 at 10:56=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Jun 04, 2026 at 10:11:47AM +0800, Binbin Zhou wrote:
>
> > +     ret =3D snd_soc_of_parse_audio_routing(card, "audio-routing");
> > +     if (ret)
> > +             dev_warn(dev, "Unable to parse routing\n");
>
> The routing is optional in the schema but the helper will return an
> error if it's missing AFAICT (the of_property_count_strings() won't find
> the property).  I'm wondering if it makes more sense to have the check
> for a missing property here or in the helper...

Yes, I noticed that too.

In the next version, I'll add an `add_dapm_routes` field to `struct
loongson_card_config` to indicate whether `dapm_routes` needs to be
parsed, in order to avoid unnecessary warning output.

Also, since the newly added parsing items only apply to FDT, I=E2=80=99ll m=
ove
them to `loongson_card_parse_of()` as well, which should make the code
clearer.

--=20
Thanks.
Binbin
