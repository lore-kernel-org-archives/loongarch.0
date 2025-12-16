Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E903009E1
	for <loongarch@lists.linux.dev>; Tue, 16 Dec 2025 08:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765873882; cv=none; b=hS/tUKOe/wN7/LxU0GVaREa7E7GGESHXkTXEYZAybDEiwalitX4w5UW8vXu3nZGWx0LtEdq1SZFcYgbUYFVF+dK3bkZpk1ZCn0Enjn5k9J2dCyK7BecmxdIU0NCf+685ogLqVgzUGNuIroeDMnxhbddHoLR6wMz456DZp7hlKA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765873882; c=relaxed/simple;
	bh=Ne8lJ2W9R9L98LT3IXnbXQmyBQHpIK5exT1M5+MN3nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lf0QIoqryWFqAS74OtlPZWucF3vu21QOXH2dNHBclOiSKm/YD6Cr34WDKWuhpHvsaytI0DA7yvSn7sxa9Efrc2qDGIG7WJDB+V18NuM8N/6HOeXyEOZxkIv6HwQBIFbwMS3Pj7LfCDmUX0zLCNOjQsscqerXtw7YTtiSLmo7og0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ac73x9uC; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ac73x9uC"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7633027cb2so762893966b.1
        for <loongarch@lists.linux.dev>; Tue, 16 Dec 2025 00:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765873875; x=1766478675; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQojXGe1Xon9EVHvdwzM1mIfwrJqJkUgQsQeeW7RD5g=;
        b=Ac73x9uCaQgL30ef6Vo8n7wvGXx72aBF63q2EZcuVhOwa4hcAa7PEZaOXcmimeMQQG
         RrLPeIoJ9YaSVrdBQSYI/x1xlUDzHCCbwUzfaHbncoWeI5e3HuYaQo6HOEfoF2kVEt+J
         +Tvfvoj+1qneO2qInheHdin8CLhOr4YtX4qzSFf7KerBrk80rYm0DD5XTfoztAVDYAG5
         YuFeRNi8pNc2QEajTZ/GYJjOdpZ7flbWJDykToZhhUrEVkYgJKO+R6MysnPV/7Cnc0VI
         rFqxOYKoLInwlmXv/RInPw8Hi8jjorHa+ymmK8vgwKV0gWMhvihFNBbGzwQsryTTmw5m
         6Jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765873875; x=1766478675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GQojXGe1Xon9EVHvdwzM1mIfwrJqJkUgQsQeeW7RD5g=;
        b=PYaRjIiQ0iPIQf7r0MIHRvAxMudK3nDx/jPZi0S3l2HdsgfVJ7m2rniUNJ6wvyq07w
         wuqx0U8edibkxHDI/Jtc7LsEsdYdrAqmn3m/zMEm00VhJmGvKDjiT69bor7ujrSx5wlM
         JDjxsq26YL4jVRY2SwAehyf9Ym04TBOsGBDovBq+tdW06RQvbm+/WQnb4Deia2I5+xL5
         p2IWGJhHUVv8JSbWZBuUzwyCZytwGxXbnopQY4dVEKzkLEesaLVU/ZetE6U7xtTv2BTk
         y9EUlACXdZi4gbqvq0hLdi4qIxABBKcILrfpqu/huVtH5FAglrHX68iGFkNU7JvWHvTb
         obUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWei8ceW+lD4id1KZzATC9Nwxsn6JvtES8Kjiyn+Z4AzpMKQGxkJjdblaNM110Mj/GhYsl/ockQvso=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVtGKckUM0gkV6zRnvt41I/CoBNQ8WO1EhTJ13xPbP9XGl838e
	d5kYMmzZkVcZMzHW3bvz6PDS53Xe+kvD7PwKNL5cQ2fewAYk3iYMUwaWikwYQRLJ3CHxcoORcfo
	n0+frnyCA0HwnHGzLoSDIu23gMcyhoAw=
X-Gm-Gg: AY/fxX5w5Q9j8Gjk2G0T5pUW2NxcTXUQ7UPp/zVMveW4t1hnSrWhjOKBmwrQAOJiZ00
	jKUiC9nDfERW4VUYxvZBrHiz+8JBaLGrP/bFOofqlMi/q1gcYIWZu+El83zhe+aX8idIXtivLf0
	qeOX5/Qo07K7YPiTOC3ta2uR9Zi77nNVUb+V1iyKUnlaPLvVccpUI51FC4czmJrt49ZptrmbgaA
	aBQzF2DjEf51nN8GddaoHbpzfiHMJAzSeuUoY8ri2N99fPTtJbULzRN9IzoFIky9Nr7uoYydA==
X-Google-Smtp-Source: AGHT+IF9oQk2FiXL5zw3SFPOMjxnMAfpDixNAE5HmYPi/w8LYep12XKMVrteyQ+sNlIsL0XbXIk47PaTSEnkkhrP/LE=
X-Received: by 2002:a17:907:2dab:b0:b71:29f7:47dd with SMTP id
 a640c23a62f3a-b7d23a61d28mr1488792866b.46.1765873874874; Tue, 16 Dec 2025
 00:31:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1763018288.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1763018288.git.zhoubinbin@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 16 Dec 2025 16:31:03 +0800
X-Gm-Features: AQt7F2oYbSmMbrluLzV8GzEoG22ADpKx58O5i82UYBt5JYEe8XjPc_KZEsh9Cl0
Message-ID: <CAMpQs4+W+kLbbm2ELpLbZEFq0mK-x0ftLYJ+xd3MM1uDz+DUuA@mail.gmail.com>
Subject: Re: [PATCH 0/2] i2c: Add Loongson-2K0300 I2C controller support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all:

On Thu, Nov 13, 2025 at 4:48=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Hi all:
>
> This patch set describes the I2C controller integrated into the Loongson-=
2K0300 chip.
>
> It has a significantly different design from the previous I2C controller =
(i2c-ls2x),
> such as support for master-slave transfer mode, and DMA transfers (implem=
entation
> in progress), etc. Therefore, we try to name it i2c-ls2x-v2.
>
> Therefore we try to name it i2c-ls2x-v2.
>
> Thanks.
>
> Binbin Zhou (2):
>   dt-bindings: i2c: loongson,ls2x: Add ls2k0300-i2c compatible
>   i2c: ls2x-v2: Add driver for Loongson-2K0300 I2C controller

Gentle ping.
Any comments about this patchset ?

>
>  .../bindings/i2c/loongson,ls2x-i2c.yaml       |   1 +
>  MAINTAINERS                                   |   1 +
>  drivers/i2c/busses/Kconfig                    |  10 +
>  drivers/i2c/busses/Makefile                   |   1 +
>  drivers/i2c/busses/i2c-ls2x-v2.c              | 513 ++++++++++++++++++
>  5 files changed, 526 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-ls2x-v2.c
>
>
> base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
> --
> 2.47.3
>

--
Thanks.
Binbin
