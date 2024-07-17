Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEDB1DFCB;
	Wed, 17 Jul 2024 16:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721234776; cv=none; b=rq2ZiG9EgoQqVEU4L5VX20cp+lW3pwo7j1rwpHh09PxkNbQZH2iSg0HgT77Y+x3RtzgTivzsqF4hDkCbq9a0taLVU5BBsp3oRYIgUbgbnlUsnqeR5EIBiK7BpHUujCmCKsV6GnZ53DHYBlrDG/co44t0Jyak1iC/IRal2XMICzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721234776; c=relaxed/simple;
	bh=2S0ab5SdmVZu6CHXw0oDlN+TBmAuaYsarb+i1qS+Q+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YbgIy8xJSic0IJNYQicmyZbZPD4NnhmNx3++flzbHGQbKC9UvM/g34FNTlK0SW0txqmuirhkUQbklukGJetxMtnpklDUmbCQdkOVzzdEH+G2L8cC7uxuFLdYqtE7CgEFtKpGNjmqR+OTb383DaJxki5GZdq9fh3aFy4aey9qDx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFAJXqCH; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFAJXqCH"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ee98a224b8so10900651fa.2;
        Wed, 17 Jul 2024 09:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721234773; x=1721839573; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2S0ab5SdmVZu6CHXw0oDlN+TBmAuaYsarb+i1qS+Q+I=;
        b=gFAJXqCHqFjXcWfHbKp2pzBsIFOEkZeWtPABU22OjatxK1anymY6XfY3nTJldfhdKe
         DoVTL6Hu8sW91dFye27LLccH0IB1pgEfeZL6KgnNhHJ/krEQXket6L8gBzQNsWhPDVle
         0FN3oNFI68Ei5dqHVuqz6ngcTuw2XM00glBfXoaoaw4SGWxFl6fSZ9Op3zs6MO1h1nA5
         7LBh60gRS/Gaf3IFaQ8Zk04EzGs4MgurFdaYCwEGwELE1mADthc6O37A+7E1rkgVxssx
         TI/GDrHLLlzmr9Z8elKP7BhnfjfCJ4qTCwg4bLIgY7EK1qolqJFcr41QDh8lRamZ9RfU
         L8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721234773; x=1721839573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2S0ab5SdmVZu6CHXw0oDlN+TBmAuaYsarb+i1qS+Q+I=;
        b=FTuO+0Qf7aHzPBCXi1ogUdgFfh8elhTb1fNf8ipnJGbL/eLUiahixy/7eocSZ+3gSL
         y4az6PCRiz2XVuHsboarVpU3RoxzrTpNm0J9ptwPaf4aVzyr4kZpOhKhlgggE/jw55zN
         egnpnP8K6NE14ov6scuossEim2/gZTo/fRI2FjP3mA1XSXQ/1yZDi+/8oddgLd0zhehr
         dBGTECqkFMDFQVS+W9REAm/iL4PMMIPIzZHGmslXsiXFvHObwPoSicc+SW7ILB47GpHR
         33cYL3Ukh48BsQDsuyOknJ8SDx1klwp0dxFMbHQJY4CvPWNW6TXs7JmHcdd5PTpiWSUC
         SIQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUzOf9jzi/gDMQVCsMC4LuNS1ui9MgFC4Tk1vPkxUEBLzuE0qmrtOKKxQO3l1QkKS9JYI=@lists.linux.dev, AJvYcCXjbAClEVO3FS0ekx/ZqrZbskhVhHdb7GXgJpIX842a3QBpVo2LD9Wyib8qOZP+31pCYDVg1JWDH4Gc@lists.linux.dev
X-Gm-Message-State: AOJu0YyrcC/QXLV+Cc7eE3WUDnnoWOeloF2/Yjj95MDloti4LMsIsGR+
	MGT4HCCjwx+NuqhOy3cO1p1d6ay6QbX9haEuGeIrM66TI6mAFstkCGu9LjN/ja1MV8xpaofQN7a
	eu9IzIxPl0WTaagV58f5oV8kedaE=
X-Google-Smtp-Source: AGHT+IHoe46620+UsVuITlGPh3/c/KNcEkZ5F6Uq8F7R6XszLx9r5KYDXHcT2MQwJr48RLgG03dD62MwkhoqroWKBWc=
X-Received: by 2002:a2e:6e15:0:b0:2ec:4399:9bfc with SMTP id
 38308e7fff4ca-2ef05997667mr23791fa.0.1721234772478; Wed, 17 Jul 2024 09:46:12
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240717-anvil-ashy-544e80a1317c@spud> <20240717-parrot-malt-83cc04bf6b36@spud>
In-Reply-To: <20240717-parrot-malt-83cc04bf6b36@spud>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 17 Jul 2024 13:46:00 -0300
Message-ID: <CAOMZO5DuwjQxMG4dT-_HcLjA_4U-+B2kR8FW1580RFiHcxo6OQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] ARM: dts: rockchip: remove unlikly-to-exist DAC
 from elgin-r1
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	imx@lists.linux.dev, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 6:38=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The Rohm dh2228fv (really the bh2228fv, the compatible in the kernel has
> a typo) does not support frequencies above 10 MHz, nor per the
> datasheet appear to use either CPOL or CPHA. I suspect that this
> devicetree is abusing the compatible in order to bind the spidev driver
> in Linux. Pretending to have devices on a board for this purpose is not
> acceptable, so remove it.

In the Subject: s/unlikly/unlikely

Reviewed-by: Fabio Estevam <festevam@gmail.com>
