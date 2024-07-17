Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2A41E51E;
	Wed, 17 Jul 2024 15:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721230459; cv=none; b=SxZjFAN5o3gLAnvE4knfxXcDG7wfarZfzOV2wkIZe1XbspVtPUJDbhWQS272SZRrigDWGVsTQwyVKQpOnoU/Joja1I9aRlp76IG7kZYSWa6u5d3PFEieWD11NMVoNfvt2Z4oWWhALlaFfyMhkEGw9BqG6Ncc0HaTj9oO1glTOEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721230459; c=relaxed/simple;
	bh=t4iPvhXVa3AMcXzBfJFgYS6s3OmUCR4MVqbnPIR6/kI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PtEcjG97eoZIuxyOyGCTaWSaivXW7osru6yQMRuCrt8QgU6k6sj4WicszwMqgQ0JIFndOIPEqiStQWKl9TjuLx85g1fptS0nNKhaKHAx8Ev+oWdyJl0BUizf6xXV3DBYfyHE/dok850AwseMNrQ+tTN+PvovDsk6YqsgPN+W5lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWQUvZKE; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWQUvZKE"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ee8cccf2bbso8699461fa.3;
        Wed, 17 Jul 2024 08:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721230456; x=1721835256; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4iPvhXVa3AMcXzBfJFgYS6s3OmUCR4MVqbnPIR6/kI=;
        b=MWQUvZKEFgV0CV6YcosyUH0WhH9BHBJ8sMwSeB5J7YWQrsRDuGeTE4HLoauQQATYtX
         UkV8NPbqZnENYJrLNi7jyrAvM7o5q02+3Qy/jdS8pIqwetRa6RUKkjz7J80l795daQ+/
         yL7UjwM4ycGSDlE7OSErjIfOXvxHEuhVrKF272pv8+LHSqdbw+AfpeHDr2F5a1y/jTq6
         UrkC+Vx2g+O2KPTsvJllLQo/a45FMjWKeoHqdY5+nOa1qfaVuUEnljLplZnMsNg2X98W
         Mr5L3QhP/yPzs0y4LRbXXDnMcriLoOp5MmDg7kZe8AHmMI2VRW1O/GDwmVMLpa2pIsnG
         FhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721230456; x=1721835256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4iPvhXVa3AMcXzBfJFgYS6s3OmUCR4MVqbnPIR6/kI=;
        b=CY6EXD3+LlW/+LXN/TlyxXkWrUnRSYea/3XJMnLJyGinmZv/0GYlg51hSBc138ZiEe
         SorFMb3QcvDWdOCIvCXE4oxcyH1ECKyObWbT1Ly9fSl9ogzkgMOMeZcyPnBdo+diFMr+
         QUoVgbtq8+7hSG4M4xWmm8FvZbKjC+JHeHZaC0533ozLiDjBkQ5oweAgf4cwq1TYKon5
         BiwV9R2xB8mxOgAgiMaPhqwCBfHqAAHbFnC2WRL6rO0f6u/gVLR5sd7Z/jZFGDamYBqe
         T1OdI/oZmu7CIVYBK2svYPMLVsnfeIiIDSa4rccok7/yPGV86byXzXK8QlaUXPPnRSLT
         2ZDA==
X-Forwarded-Encrypted: i=1; AJvYcCW0VHW29gger0IMyW7qfBuR5YsYLXX1n+G0ypYrnQSYl1WYzimTt+tzy2Y3WDbYzUHgQaXJfcxMQk5lzrY8PeDzTZATkHW+CNalzjUWG6F5eQFh7nKa2OZBM27rY48p
X-Gm-Message-State: AOJu0Yw8+7CERhlNNm2Kv6LkJpXItF6+MAu8M0SGHNUOS8l5q94gKK2T
	TSLq+x+NT5/Nf0TGn+tndEBPnh5/NL50/BXpOqEvWFy7jdmEl0iR9RZI1pSQt5+nwReKjcOZveK
	gmv7dKiATe31utabKjmr8xIOyWbA=
X-Google-Smtp-Source: AGHT+IFmkkq4f7VL86QzMTkqfkn1QPaCGg45UGmOuWB0BRvqpLJXZaINMT+NvWxqF4p/9Ea4jzkHPBRHbM/d6SY4tmE=
X-Received: by 2002:a2e:9b0b:0:b0:2ec:4ed6:f4a with SMTP id
 38308e7fff4ca-2eefd1521d2mr8120191fa.5.1721230455575; Wed, 17 Jul 2024
 08:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240717-anvil-ashy-544e80a1317c@spud> <20240717-parrot-malt-83cc04bf6b36@spud>
 <3870188.FjKLVJYuhi@diego> <CAP9ODKrpKDY91AFDYj7s++kU+=CSLw=F9mXyLZ621Mqq-8S6bw@mail.gmail.com>
In-Reply-To: <CAP9ODKrpKDY91AFDYj7s++kU+=CSLw=F9mXyLZ621Mqq-8S6bw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 17 Jul 2024 12:34:03 -0300
Message-ID: <CAOMZO5C7JknQaftquRWDetLs4W0CHMvs5PiJWBLyo0G1oo4rCA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] ARM: dts: rockchip: remove unlikly-to-exist DAC
 from elgin-r1
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
	Otavio Salvador <otavio@ossystems.com.br>, Conor Dooley <conor.dooley@microchip.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	imx@lists.linux.dev, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 11:38=E2=80=AFAM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:

> @Fabio Estevam can you check this patch?

Correct, the rv1108-elgin-r1.dts board does not contain the DAC.

There is an LCD controlled via spidev though.

Conor,

If spidev is needed, what is the recommended way to describe it in the
devicetree?

Thanks
