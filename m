Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA26D396579
	for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 07:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066777; cv=pass; b=S/Qpk5RXlS+Fx+OaAhpK3VQ5cNPiSZ3Voc4Ijq+D6bihh4XzhFY7lmR/FE+/YfM3Yz4o9zx3B3Ez8Gj73SKaf9gvMbpD1xFvLofkhB8xun9MHYf0eEoE41IbAhCBtbhRVWl6jU9l5F4OazfmtBiMalX3Yvsu4K/93t3A+LNDIyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066777; c=relaxed/simple;
	bh=8i76hr8Gj+RtGUBroSxVsQfLVKIuEs9W7G61OYrNzFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxPQtIjUK/+2v7P0WTbGmnWtxocjo8oPPBtbVWl460zoR4Taoa5UHxCIGUWdUpXWbpg6ngur31bZAnjZxptdI4fIpfQ3Kzmk74bwCvBVmkvL3x0RgWFTVb5SFRQrGd1koqN7Dymg/B4DrmsAVSAAByCGhss3UxD/eVpvW/S6F74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sMCuy1VQ; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sMCuy1VQ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b980b35534eso564914366b.1
        for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 00:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776066774; cv=none;
        d=google.com; s=arc-20240605;
        b=XYyhjuDsawGPW+mO6e9spziqhFvr1PFn/D1bOcelLtyf0Lefv1eAOfgZJL5qEn6hd+
         Sfu7oUjTJeR3j5cM4Lt4gmZKxuZsOZqOkMWEkIUdxGgc18UFaDBDK/fk7aqAtgVs7z2H
         VKlIS09/WkH3bgWQiEnpXP6aWIK3XUV4ME4fvFWyKWYqDlftBgrnUe0jjERyrJqmP3Hv
         nJ5rbU4HKcIqUvNENJvGF67kEMU32uU4AMFDetkY/dirUS2G77GxyyzUBM1LnCxcqaRI
         rYpeNT8x0mDKA0UVZr7JLtAjHj04j1rGNGPmxAAFrfpUBG6yIQBmLTPTI8xv/be39j4a
         XbQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sTeLoPuL69qtHikGrHVR6h29M/vzfp4S7SUKcSWz2wU=;
        fh=k+MNMoSXroOpgg5IPHvuudJ9z6XZ0yfPLaBgv1JSDjQ=;
        b=dIZZZZdU0PCDS2hlyZyZP18pz6zYuIzylXGl7bs/Rzu3k8iHowbtHpBPJs1gLwRqQp
         +OVmOtVz+eaZyabTT4LFw1H9FZFz5LviqqkHDYIpZS6vyRtcCe+lmLQTnZXkF5Lb1Vq0
         i6tTc9Ak2l/WNDVaWoFFZn9Zu+z2wiUMtFw+twEAHIKpCiPj59yygamf4skQklbve4OA
         iYS1nGZlfZyRVfqmHGvW+zPYbXA6+1ilvgVYOftdG/7Pv6zIDcNw7gvCwFtM+o3FtE0O
         wHRSoDHWQZ3R/Y+pBFhP4l+FWGLTQfiE2Q2S9o0QBK85zR4HekdtQevQ6ZnNh4rA2PIp
         cFWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066774; x=1776671574; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTeLoPuL69qtHikGrHVR6h29M/vzfp4S7SUKcSWz2wU=;
        b=sMCuy1VQwoQr7sOecV2GunVHOxmWLrzD8AvXAGuQPM4l0F47/6zpLdecBxkgZph6iv
         RtG84qQtCQ8+axGEeWGxrCXimWAqy72AyV7MUFVUrQFcMam3vt8NRbfKZtugX9hJPB4y
         5BRWiNE3I/EyCEXvtRG0TW/dh6vITKnEc0i9mbJvZ2/YF/4C6PkV3OyT1Qa1UaqvsJ7H
         aQmA0edfzAtI5jM8lB9E15MOPPCFJOau/NHxOtKlvgR5tI1gSpKZCVJXWFpzfSiapXy2
         dsbb9hRKlng4d67PPohvjwFK1gbo0juxJZcyRHMIfwQXehk7pe8grvzwOvvBg7S3WIgG
         OjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066774; x=1776671574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sTeLoPuL69qtHikGrHVR6h29M/vzfp4S7SUKcSWz2wU=;
        b=hH0LQ3IZcls4VLZ6WfJV7JOTVMlGUtS3Z7m5JwMcarKqmmIc0Fzabdw4tyycLYxc0K
         cQbJPSA5NCRr2FEEcyzfPOk9VESaG6xgOb1WFC9GDv/AiUDTZi/nhOPnzL2gWwxSwwA+
         7NmJrOjegPDS1AJCXV+yWIN7x9BiIq72C4iIQLGUAImfYD4fG6HyxiO3AzLI5rpqRO6O
         vxcyDBxFqffBk0IPc9WEmQ9zbN37yuUCVaa7J8MqlcdOJzhKgilEq6Dj9Zfrfq38krx7
         ElZHuSjJ7EOnbl+J2a4lORMHeP23TZWxhJj64OKPY9sOlaAYTm56OpZA8SqR+PlklfDp
         iMnw==
X-Forwarded-Encrypted: i=1; AFNElJ9VA8rW+jUnJkGMPzFBTouMTaHhJQTemRlITDInsJhP7VfMP8XmRHBVOKg5vc9TSOba/8gH3KPQ4r8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhZFhNu5eiKE1GlQLkia24ickxeQR52b4av7ZO9PdYyKRttVte
	5wwH4jxuJWuh7b4Tr44WMC72jqrh4ntKIkiT12/Y7VWEus60+O5AVA9YsG9iMcH742xFnI6Ni55
	Zn4acdeneEVZDnQxKSITOg1xvP7p6NC8=
X-Gm-Gg: AeBDies5ACnv7MsDEMW8PWmuN/+B1qR/nPz5CpETAWB2L3F9dhz1D6MeDvMWNAOX1ze
	zFe+6HttgmkP7bah/YPp82GyUeU3oIh/PA2hr+h35c13TbQoHzyetLahtvgbgHOOaivAEYcHLa6
	ha69LipM14Z1EaygJN1x3kyeQZ4LDEqIp0/+WwdXAjFbEDCnH+xqcH/XiRuXzde7O6hLnsVb33v
	U5+pQf4mD/lIwjIgPkNl86mcDFFijmGIjthFX0JPD+qcwwyPLcXUBTrNRyjQ1KXiFK33x6rPmcn
	9yOeDRYpWFTIwC99WwGT2nANsk4CJqt33IL4lPlaT3e7/B2LnWHd79HbkOA8b6d1saJT0QLXJol
	muXrjgm4=
X-Received: by 2002:a17:907:3da8:b0:b9b:3b90:1047 with SMTP id
 a640c23a62f3a-b9d46381020mr686807966b.30.1776066773845; Mon, 13 Apr 2026
 00:52:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1775900045.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1775900045.git.zhoubinbin@loongson.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 10:52:17 +0300
X-Gm-Features: AQROBzDd7oISg4nKnjr8XlrN-YmlCPDBGxSBhjMNA29ixq3SfKpY3ltSGMuX2Jc
Message-ID: <CAHp75Ve59GPAFvKM6yOkPmr=kmHBjVL-Vz78X0WDikiWd+2arQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] i2c: Add Loongson-2K0300 I2C controller support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-i2c@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 12:58=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:

> This patch set describes the I2C controller integrated the
> Loongson-2K0300 chip.
>
> It has a significantly different design from the previous I2C
> controller(i2c-ls2x), such as support for master-slave transfer mode,
> and  DMA transfers (implementation in progress), etc. Therefore, we try
> to name it i2c-ls2x-v2.

...

>  - parent_rate_MHz -> parent_rate_mhz to avoid CamelCase.

Was it a special requirement from maintainers?

Note, the physical units are special. The m and M have quite a
different multiplier value. So, even if asked by somebody I think it's
still arguably should be kept as MHz.

--=20
With Best Regards,
Andy Shevchenko
