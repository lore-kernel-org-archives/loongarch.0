Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8262D396D1C
	for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067712; cv=pass; b=bl23G/53mjZmp7E5Zr49dKJZnFF3cxiYUp7a2HObjlwRoaBl5Aee8ws6b9imBjEVUj5xnL4BXIA2CEAUACgjKaFN+lp1+dZ+O9y7wVdgTExvP074R5p8AfoJm0VRfjuxhkZZzfUiDkQRzVZ9tW8OyBiQglE5y5vYK7iYZctXqic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067712; c=relaxed/simple;
	bh=8VnhIoj02WULflqqgWqAu3E/FZcCIYMP+zvbnxKj2aI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kuJG4bbjtPX87ROx1wNtJWJpObhjd2PkNwSN706KL+Xw222LcVdfIMI45vTpX5+5XvzRieIhYnAgXN4Wegkmo0LeBU0FO1r2CLRIaozM1LHRDOGA2Tufhr+efe7B4HmMoNXigWGwGbWG3xwjkUdAq7qK2r+HH1HP+c3EIwsMnig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpnlsd9E; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpnlsd9E"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9c6680aaf8so690152766b.3
        for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 01:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776067709; cv=none;
        d=google.com; s=arc-20240605;
        b=B8DmLyF7hnvk9c2xdEtx6FxJSawincMDiDuDMX0H9dbuJCLJkz2oX5IMqHJCFbMmAi
         u0C6HFfiNdDNyH0PuwMj64mihMm1AmNuaEgUvQ3Ftd1PrllINePOhPhppnoVrREMTEOC
         ucT9M/1y2j4aGtmtI618QSEy0u+7sKz6KRnDLIjMwILZLWbQEEKWnrIWSOFuvfcr8EfN
         etIKqHuQu6flWmudo5V+U0Mj1kSgrHCxyj1QteZVjhjT0vsfy9MYvtqbtukenTziIYKY
         PbjSwOysVeUrdS5Z8d3YNV8Bw4eMWSAD+pKMXBMIMKJYpp1zdtUEXO8wf2BEiGeVPBHZ
         ksVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fvkP8KzDKek7CehUY4JTh8N+6Hv3yrPu4Ys2u/4PdPc=;
        fh=nU2j1ZNdoqEoA/23e+OrKJ7olxm9CgfHDGHAw6mWJP0=;
        b=jFLBgKw8fxB45NX7cIy//4b2YPSbPyMOFcAm136O7h6s2G737giVUewzxUqAwJjMs2
         P+8HzGfvMsdHs7HVW5Ge08jq/sH8NlaOOklRkBLxlYiirro27ja0f+NNwqiKlir1rUN9
         G/VXEAAfpDFlUYiMcDtXC+27wvYFqa1/qZW7LuHYYW+9hOB9UhT7ZiOoOsxELSc/FAVF
         DtERAiNV33SG5cs3HcP0cSiDurKt50bNVNNIKO9CViffwBb5moczkTPc5Z/HJaPrQlCh
         jMl1nXMV/4W8IQqOGKLQyWVqhqaf00yQdLygsdmWAZkCdfz5KRou2MY9hC1hWTd++WrO
         +npQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067709; x=1776672509; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvkP8KzDKek7CehUY4JTh8N+6Hv3yrPu4Ys2u/4PdPc=;
        b=dpnlsd9EGbkujCtaDWKsecc4loMFN2yPQO4k8l4engySuH9zciYxTZfY9gaVZHDuf2
         /qGIGrH/3WpMjJFsO79rJsApT23seFIr6+oLcZO5Cam5YFAGtooGPuq3+Y+ks+lq7Kur
         Qr/2+rsMD+mJnt0aok/qt5K+rn/XLTv45fVAXvxaBgjfjxODF2Fqnfq0r8tZY/Y2XdV4
         T4KiEaSqjCtZHAkrPFfONvvS/ItEha0NVrjE+DX7JAZsagary62nJGkXWAU8z+p1up/a
         vpQ6dPO9X9kzaO5ymwFeJhp9KvQZYOxLPWaNJWYk2g0FTZohLmsFWnbHK3Xj6LkECz5j
         crlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067709; x=1776672509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fvkP8KzDKek7CehUY4JTh8N+6Hv3yrPu4Ys2u/4PdPc=;
        b=ClifWCsRjQsJKqhW5UQBtRa+120TUzuCoutFiM7mLLj7X2vMawGs4v1uJSsLk8R1Tc
         56I6qmsR5ana5eZYnHWy6AGxuDrMlYNfG+L5h5iXK3/Xu51PotbAZCyD2fkP89q2pdYj
         /EzwBnhNvQC+0K6tkoJLHQok20cJm46DTknQaOKq1Doc5Tkw4wM6pPues2tdtimhdZto
         5xT6cC0VjDuTD/Uo5iWV3T7Z43AHchzsI2OvsVxnlz8rXRb5pP+6RljSRzEE7j2xUsW1
         39eLe7GJ7nix7X0BY5jC5MHQRW+HdVcUQ4kgL2vtUnGFBpOGMxahO92V3o2TGNPFyUzu
         /6ig==
X-Forwarded-Encrypted: i=1; AJvYcCUA3FctnrHil/95u8QceAPtF+gt2qKLkljWrHCWr5kbbVX/rqpS0+8eNwrkRfXx5lwETfZ132cpZ7o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEEj5PPoaVxPZLqqlneQ0LfxIQbHZd3vFGHXddKXWZqlm1nErN
	5z9wCscJe8yQCnzBl0NXYrAiydeGBtimEvdlgMsoJWgOwWYRtY9Vw+mQmUdkW0OvLqJCCsFnZ8h
	oJaxksghJ5mPnZBviSJ05cNl36k40nFU=
X-Gm-Gg: AeBDieuDwJq+n41qYh5wlizkiewUad8sGz4kq2mtEWINswFoP5fROpTsVY77/HQhUTQ
	TcyQEOX0HvgawHQ/tIe95uTYJ6MuNzD1KXmDamVUpA67nt44Aljw5FPva7w5ngJduCFukqBo3uf
	qEx6X0mLgP9VwJjaOASA44+b3h5XFum9SbV8LrSGBLt00JrAtrBsIzYGhvck2w4X3cK6rg7NppP
	PYAovRfh6thkg8Fd9a6GjJwzzPiBa+OKax+0WY9UBrMmjVq3qALchRo949badPyt+jsOZELEp8i
	mwPLxuJ/7B211lGGfpg=
X-Received: by 2002:a17:907:7281:b0:b9c:eede:adba with SMTP id
 a640c23a62f3a-b9d7248aa85mr708424466b.13.1776067708140; Mon, 13 Apr 2026
 01:08:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1775900045.git.zhoubinbin@loongson.cn> <CAHp75Ve59GPAFvKM6yOkPmr=kmHBjVL-Vz78X0WDikiWd+2arQ@mail.gmail.com>
In-Reply-To: <CAHp75Ve59GPAFvKM6yOkPmr=kmHBjVL-Vz78X0WDikiWd+2arQ@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 13 Apr 2026 16:08:14 +0800
X-Gm-Features: AQROBzBp1_1f83xVVf78iSav36n4yOfOrZ9Vhqu0U5oqBm33LFFYkL6t-qaEFjA
Message-ID: <CAMpQs4+QmyAObvCcJOFnfTuufG8=M0q5m+XMkaP6-SOp-8wq9w@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] i2c: Add Loongson-2K0300 I2C controller support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-i2c@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy:

On Mon, Apr 13, 2026 at 3:52=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Apr 11, 2026 at 12:58=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson=
.cn> wrote:
>
> > This patch set describes the I2C controller integrated the
> > Loongson-2K0300 chip.
> >
> > It has a significantly different design from the previous I2C
> > controller(i2c-ls2x), such as support for master-slave transfer mode,
> > and  DMA transfers (implementation in progress), etc. Therefore, we try
> > to name it i2c-ls2x-v2.
>
> ...
>
> >  - parent_rate_MHz -> parent_rate_mhz to avoid CamelCase.
>
> Was it a special requirement from maintainers?

I=E2=80=99m actually a bit confused, because when I submitted the v6 patchs=
et,
checkpatch didn=E2=80=99t issue this warning.
But now, it produces the following output:

scripts/checkpatch.pl --strict i2c-ls2k0300-v6/v6-0002*
CHECK: Avoid CamelCase: <parent_rate_MHz>
#512: FILE: drivers/i2c/busses/i2c-ls2x-v2.c:437:
+       priv->parent_rate_MHz =3D clk_get_rate(priv->clk);

total: 0 errors, 0 warnings, 1 checks, 574 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplac=
e

>
> Note, the physical units are special. The m and M have quite a
> different multiplier value. So, even if asked by somebody I think it's
> still arguably should be kept as MHz.
>
> --
> With Best Regards,
> Andy Shevchenko

--=20
Thanks.
Binbin
