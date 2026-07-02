Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE0B2BDC26
	for <loongarch@lists.linux.dev>; Thu,  2 Jul 2026 01:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956347; cv=pass; b=VvfCpspox/EHuVnA+U0S/WvLrDdI1hq9uOzJS7U1Z5tCIgo6BUfEbJ3YncMcvWKcHNRPkFfviExkeYvNIYi/qpD8u4fugJLTd9vfxQS0L1/8tZ+EOgVd+SoEX1eatX+TC0yTW0J7OcAdc+U5Iu7USb9cjqLKDGPjE7xd7ly4LWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956347; c=relaxed/simple;
	bh=mVL87EttaNCUS0ArSfV9Dq8wYEb+97u4sdSR2BpS7RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZjOKzb1zR0WHNUaAc6+H0CazSGjTa04iLIMcpVy6a8kvl51v3+FADJp8nreSTmKVkLiE3euFOYXqo1X6htfbrN/ptvgayrodNKCAMYaEfK0Nw0WQauXBsZmaVymCyfvTS3dhKf+RqjVj15PVDHpLH+AZTJCjDa416a/xxkg5RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2LhoNOQ; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2LhoNOQ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c126e47a82cso160625766b.2
        for <loongarch@lists.linux.dev>; Wed, 01 Jul 2026 18:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782956343; cv=none;
        d=google.com; s=arc-20260327;
        b=NdfsomKmZjTsTit0EZWaYJnUoTo8MuSJp+wSleH8YK0ztqXvr4OMmJ3CcGTlzE36ze
         dXGR9W5H0IxoLn4MwIZBS9mmbAxJHxbddIWB1MrxXLjnUQLKw98YCmtrpeUUL3NNd0rK
         dL4bQWCIwVtkucJgUL1afKoHOuy6GlH7J83YBszk0LWsaLemW0yI9h1h3ruu9XPDzO8y
         8mH+FOmW2nqhL3V4Gy82IIARxIfEvYGrhtduiV53i7rMDWf2EOKpmnVzd793zlf9M0JK
         6dJPVobQzvZHJi4uU+TbxpeHR+slMfRhmWl0bc/HmkVX8pESXBgSGvSapgFaUrZwMXfl
         G0qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gqxqwLiGZi4KRbu+1ajZ1YFNLw0ON224oZgbthL9Ai4=;
        fh=/bhK0CcEaxLBL4ivFSjWwgo9IGYrD/jRnoCvACgz8jk=;
        b=An6t7J5DCLeIucJ0ifR5mGQOWTxCeCIzf3UJTihhvz7VUKy+x9l9NmJ4UEnX8bLaff
         9bZWRdgctayN2gGn6jlORJR9sA91s5iFBPIXnc8W85XusyMg+LvfcaQR9tmwWU+kZA0R
         5erB9fC3Nl0sITDQqgw8W0bTSA1SozJm1QzpGc3BJPrf38p7gUfDe9BSJ48jCRmHH7NC
         +ycD40mU/5TloEtrHdjvezoVZzzk6gnOIJVdojV7zapqkIKaqB6G39ZbMxnwkEolc7tX
         Rlpxq35/Rq//B5yIAdVkqf56eEuA3xBRDPFS2Wf+1v9ae39idRCrtqsW0w8ycRTGNE9G
         0vTg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782956343; x=1783561143; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqxqwLiGZi4KRbu+1ajZ1YFNLw0ON224oZgbthL9Ai4=;
        b=S2LhoNOQmdOU4kB/cU2Dfa51AOgNxRPsc4dtffxF62L/shSsj+70Kfg5ul2nTz4srD
         0XK9TPp2gCG0IxABIu4TLLzFjza3FLnTTrkyzGcnB7U3cQgAszkBVuWbn+/oX19Hasz2
         dHgjEOtyfI56+LjG024Az2pHoZermqXme38uAY3xrKWiPvCNeXWnwi+rSd7YDUVcM2ZL
         fMscfbZoh/G2IXj/yuFLhgK77mr6AfMSKPBwIO2pTjOMqlFmZdk4SAtqOwXDhCAC1eMo
         Yh5e/KqqLPi5ooa3YEE/ieSufVVz0O/eBJJyigqIknlU58Qxvyfm0w6tdvEtBLdrMYJM
         AFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782956343; x=1783561143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gqxqwLiGZi4KRbu+1ajZ1YFNLw0ON224oZgbthL9Ai4=;
        b=LDn2GKogchbM4XPBPoIuunH6J2/fIoGwyI38ADLQEp5MY4Tmg+aKl6haPuyw0HtsrK
         uZwlp/yk8Lh6iLoM7Ym1+okVgHzqZOnonJYq8vtafGjXtFr8Fx7QJrTkhJA5V8y/Tqty
         u72wIy5jM5P5MZX+tf8Tr+55fSdc0+I6VeWxUKN1TjGiUbkQppQfP3SjznhdznuzmlhF
         WP1xMFAfAI94L3kBjouphETK34DXrk94ylg9PlQ1+sap/T59JznFnzD5NKioC98Vc9iE
         wS/5yZ50YqCclVVNsS0CVQcRDDCziNnSPsN+FvUr00euvUVNxkbke+eZgbJdEJmOM6Tj
         1WvA==
X-Forwarded-Encrypted: i=1; AHgh+RrryKUBvRiKCISZBSkftrrP8+r7bseO4wgUtEdmw+gcB7ldeNYs1DScTLJhiH+hdfpWT4dJKYkpogY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxxq2ccYyiqX51D6a9NffciTpUdnW8fL8r0MwovC5BzLwR22u5n
	FnPUfYvc4A2cjYO2mJXRE2OBKvmKoqxaQIcP4HpxD6Q+aJ0vT9Biy5x7tSmjf+WSfdwZIuTKfBp
	d+xnnWt5alK4fAlSF6XMPfS0z7ibBrcg=
X-Gm-Gg: AfdE7cn779cUTicoQv4AQPX9vJYMeIq8+L7VU19AtkLd/rFyZOhb1+4fcMAfym6nk4B
	FOAqQ5fYIoqCM9ID91RQ/2u4d5wGj1wCYMIES/0EWaks3RpH6WppDQxUIoV5+f2J9wQKpAMgeNO
	e63lpuXMvQdjCJNIfNwOB3H02mnDqaZTaKWHbet+Ce3Sxf1zrjgCVdKO1y6DinJydmzCR50Xv2e
	PQEU4dRriPbxncjXDmcpmRnIztQ2cAklcSTJZF5isAyGpohh6EuitWQ4T6EtMXui4VWel+blmM=
X-Received: by 2002:a17:906:b89a:b0:c12:1c9a:48a3 with SMTP id
 a640c23a62f3a-c12a9d8ffc2mr170080866b.22.1782956342673; Wed, 01 Jul 2026
 18:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1782439646.git.zhoubinbin@loongson.cn> <ed1314e1d3275fd20aff47397345a88fad6e9368.1782439646.git.zhoubinbin@loongson.cn>
 <c9361380-b28a-4f7d-9ae5-a00042189b79@sirena.org.uk>
In-Reply-To: <c9361380-b28a-4f7d-9ae5-a00042189b79@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 2 Jul 2026 09:38:50 +0800
X-Gm-Features: AVVi8CcmZHG289kX0-X2lVThLi6Vah5Fc-yy-AopmD9GwRf3FHHrHRDDZC-S9I0
Message-ID: <CAMpQs4+Za8=7hUm0SJ_Tp17_Hg+p=RHTsRPeutuPFfTs1rOABg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] ASoC: loongson: Add Loongson-2K0300 CTCISZ Forever
 Pi sound card support
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

Thanks for your reply.

On Wed, Jul 1, 2026 at 7:49=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Fri, Jun 26, 2026 at 10:27:27AM +0800, Binbin Zhou wrote:
>
> > The Loongson-2K0300 audio card uses a different DAI format compared to
> > existing Loongson platforms.
>
> >       },
> > @@ -177,6 +189,10 @@ static int loongson_asoc_card_probe(struct platfor=
m_device *pdev)
> >       if (!ls_priv)
> >               return -ENOMEM;
> >
> > +     ls_priv->cfg =3D (const struct loongson_card_config *)device_get_=
match_data(dev);
> > +     if (!ls_priv->cfg)
> > +             return -EINVAL;
> > +
>
> Does this do the right thing on ACPI systems?  I'm not seeing anything
> that'd get us match data there.

Yes, that's correct for ACPI. I tested it on the Loongson-2K2000.
The ACPI system for the LoongArch I2S card uses `PRP0001` as the
hardware ID, which also matches `loongson,ls-audio-card` compatible.

--=20
Thanks.
Binbin
