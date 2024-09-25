Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25284156222
	for <loongarch@lists.linux.dev>; Wed, 25 Sep 2024 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727255126; cv=none; b=Q51krkli0YNjnHYJwOnQuNFuqTn2jf8By9pRGcs98A4rhEK4SU9DDp8SQzw3AWY0PKh9ahCbIPnEojr/qq6RkiYLnoRNZk4gwTFcOa2mV4chehNqZPoQPC0ke+XZU3FFKuH4TF7JK4penFhWPd9s34ondHvYjAaBzvOn0LxEfaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727255126; c=relaxed/simple;
	bh=1QZUsUnnAE3WSKe8mRvALmjWQTDijRw4NHVHntQSucE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=caWvEO0BiH6o4mgezTusNLd1pNLt9SgbiY6jtPZZU9MPTSNwLuHoSI9is9nCrWy5aIn1AbxxBO9CZICl3V8XnwSe8yaXZTpi8HslT90C1qmxcwR/09qahroZOEYmP1guWvO2z8lfZgus6rZFM/8hUouWXysqPVNxVDt0HNPj7Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/GVtCTz; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/GVtCTz"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c26815e174so8011243a12.0
        for <loongarch@lists.linux.dev>; Wed, 25 Sep 2024 02:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727255123; x=1727859923; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpSxoOSH8sGRYYBVpsIkEfJWqz3E/EfZFQTLjHzT1H0=;
        b=Q/GVtCTzq59QevYvQ18bJCMlAh0YgJJZYOzX3bGk+YcIwPZKrryi6yCFqE4QL62SDv
         nasfK5uDiJfMrqBwgd4CKC5Uzil1c2r5F932fcJZ0uRnfFCZF4T/cjL4i4F4wjQ4J68J
         l5KjQdhqtv4LYQzAk2VT49xv/3Thc5bj/718r6MoIEVnWB9xoD+3NKO2jaro9pwBilGq
         EJgZTOvpsm7/e+w+J4k527RgjtP+52cYr69uLp25piEZqzIM/rz0J4LcJW0fHUfxG5dp
         BKEsQzcyzIdGCM/4FhGM8Z2iSDCzcXNIFtMRJdXcee0KpobPQ1MV/S39702oT0mFYRZa
         HHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727255123; x=1727859923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpSxoOSH8sGRYYBVpsIkEfJWqz3E/EfZFQTLjHzT1H0=;
        b=OPAHhOKftqbe3Jyh7zpPbN2+fFVEsPGDp9XOtut07r+AMIUVkGBMXscs0NuMBw2aPI
         +JEzFj8z2af/q89VmT/tyyC6n1d8qH0PAqVEwZny3qTD9D9/aI2XMv7UZr1g99bBR+qf
         DbPw7Xqx/XnhRA6kt7pXSqaBRUqSvJulkqXAb2ik0TJr3QZC7ZfdHxpU/ieyZnWnPfom
         IjWCibYd/s/cR0VKmwpb4n5MPXwmfwAxWCidh7WM/e7aAXDxyx4NXeAj69A79+FXH1fr
         EBox6RBh2q/EpTEuL22vaoY0dsQ8X9b1TdUz79c8oE1KexSRg+8STXLsn4ku/DPO/yG0
         Khmw==
X-Forwarded-Encrypted: i=1; AJvYcCW+rvV7+0Fj7zKt3UmaR4OM5Cvrk9Y6mwr25MMAaLtYv2loNuPDR1Due2BmjQehAOLM1ikmm9SKbMM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXIJOMRbrfGe7NkDlYTpQfm9X10n8nZded+aeV77mzIaJfgSck
	BDJkVukhoKbiJt/eByQMjY3/qEyo255+FmMRqb6Ux483I2qozrs7HWH2jOv2t9IpZokq/nKWMNV
	hJTcpyploHnvtHY7RuIl0fHlcq6s=
X-Google-Smtp-Source: AGHT+IHMhDBD4VbH/gs1euQafiviuUglJ4RhEofIOUHa7Z/aaoxmzI3ZTPxOSwo9aMR6U646AGZcuD6vs83g04COppE=
X-Received: by 2002:a05:6402:40c5:b0:5c0:c10c:7c1d with SMTP id
 4fb4d7f45d1cf-5c72073c6bfmr1772969a12.23.1727255123097; Wed, 25 Sep 2024
 02:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1727056789.git.zhoubinbin@loongson.cn> <9a286537a20f0f96597090f59165b4532e41bdb8.1727056789.git.zhoubinbin@loongson.cn>
 <ZvKEFlARvbFFWI83@finisterre.sirena.org.uk>
In-Reply-To: <ZvKEFlARvbFFWI83@finisterre.sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 25 Sep 2024 15:05:09 +0600
Message-ID: <CAMpQs4KW7P0soeTw0Bi_OpcGXjk8EBjcNmHFeAi=MCauhwanYA@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] ASoC: loongson: Fix codec detection failure on FDT systems
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

On Tue, Sep 24, 2024 at 3:19=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Sep 24, 2024 at 03:00:32PM +0800, Binbin Zhou wrote:
>
> > When the Codec is compiled into a module, we can't use
> > snd_soc_of_get_dlc() to get the codec dai_name, use
> > snd_soc_get_dai_name() instead.
>
> What is the issue with using snd_soc_of_get_dlc()?  Shouldn't we fix the
> helper instead?

I'm very sorry for this part, I checked and tested it again and I
should have over-modified it as well as the use of
snd_soc_of_get_dlc() is correct.

In fact, what's really being missed here is the assignment of
snd_soc_dai_link.platforms->of_node, which causes component_empty for
soc_dai_link_sanity_check().

I'll rewrite this part in the next patch set.

Thanks.
Binbin
