Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F942069
	for <loongarch@lists.linux.dev>; Sun,  6 Apr 2025 12:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743943583; cv=none; b=P9mnYQe6m0R11FYo5pgQE7FHUUfJYSQYUkl1TgSqmaM64bGzob/t2BOOJTVQtjL+M7nOVOG3+apNvK0fhRdvVkU1MO5j14TVFGVUCdt1C9+y/hJ4/zGGABPLqq4gEypQ0+zMgUO8GzAxGMdv7MwDZBgPsj8PzpvCNZJjaiOWhwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743943583; c=relaxed/simple;
	bh=gDRUi0NI8kQYwmKuZl0m+Ur9O2Fc5C+GFVFGTF5IwGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1Pj2JJ9XuBBluNZB6eycoAIoQbk66/MFXwbLTP4VV5yKnt+r2MAdysaCF12DC76/7EXDpfnO2FkR9jOHkUz1yEnn45ijHx+TY0dNVOivBsuRzHNgeNbJEGrgFnjYraSPSEop1vuwoMmL3QFtebIKlpkuPsgEG5PheZy1r3iIvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1BbMW0a; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1BbMW0a"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab78e6edb99so506024166b.2
        for <loongarch@lists.linux.dev>; Sun, 06 Apr 2025 05:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743943580; x=1744548380; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ircvmU6AcvisynzACHzv5i+leKz+5HUrSfkvcOot0M=;
        b=M1BbMW0adW2sOBANq7nihbUdIJj/JqbPNL7YMkkvETdYw1JJPvgR2fwQSIQygMC+oq
         MoCglt8Vidriqs+RWhnSsSLM4Aq0YiRXi36034nEo87RUylBy0O9iicp+KeAbjoC6Tov
         AtoZ3AuP1sTV2w2IU7G1QQSVEZiGjtb2/ShEBGxOoCHS8giDuNFxDXKCoLBxkT+/WwKp
         6M51hu1Ch/PFh1Fo0LBGWaVjJvCRIlPWFyh+QTXBTlpBdLUaMCLCms+EXmBUZd+6EbwQ
         YnjnWarakmEM+uYHi/T3FB8zBIzEKz+1l+YqLslZ4UelZ2QfsDlhxg8YDqiwncaKlKB5
         U0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743943580; x=1744548380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ircvmU6AcvisynzACHzv5i+leKz+5HUrSfkvcOot0M=;
        b=gRJyLtISG6AAlwaIH0iUGPVykNqOAYt+lVSevjU2Sq3Fdk7To0Krz2oLDUyr6/RKuW
         9Lhw/nQZgal/Gca/b3BDjg9PV/W4Sibd9R5Yyh1Zf3Cu6uEg0QmejwGw3agidyFxdL3Q
         R6mxBePoUkk0AuvGOmWPcrGx37xfHtvqCJd3bkzxqMY0QPfLSMsgCqitFH4v2Pa08CE+
         Rymj6l+itelEzpf4lz5pD5F1GqJ6Jx/L5aXKEV4YM7EJW11talO8YA/QRjBI9gS4wza8
         19Wls0SoMIOLjBolszuHBStwhuDlVV1UkFWwcPv0lZ64XyygBQ2UOChyujp7GbclJNiB
         RFKA==
X-Forwarded-Encrypted: i=1; AJvYcCUfzK/7EoviUAVlm7XZ8Vpv+V0sDuWZN7ixY4CCtvXKYN049IZFxvIvFQf8vWqxrc1gz0Oik5rmuPY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQT9TjYiX41RVI1tk9VspanAXfOnXFpGywymfNLxEMk18mhTkt
	pFtZo8hfBtWTOVcUCzhQF++B55WeMAYnHDxtNtvnzlLRAdggW+uM3ZNflNQf+v2IfLYFbZ0y4Uk
	FXJsSmOEyCHSUzTQIJcOXdWkYKkM=
X-Gm-Gg: ASbGncsOTcAtHmwCw/+zTScvifZSiLFV2R9LUOx4qjnhTxxWgCPcVr6MtI6Wx3VVzbZ
	AKikzuqOs1hIse0DmOA9+W9iIBK69uiE6UzkdRjzdWymhbWgyr1vjHzIzDQ3ZSBrpkrojz5wq5n
	d0PKbruV7KmW149xMUeJWknr+S
X-Google-Smtp-Source: AGHT+IGitcGraUpEzeGPayo9yp88AFDu4vcwiHo9XtmluhHdkA/424R1XEhpG0A0l6iLG8NPlldSEUx5kp3+sw1SFDQ=
X-Received: by 2002:a17:907:72c3:b0:ac7:9acf:4ef with SMTP id
 a640c23a62f3a-ac7d6e9fe06mr730495366b.56.1743943579980; Sun, 06 Apr 2025
 05:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250402092500.514305-1-chenhuacai@loongson.cn>
 <87jz81uty3.ffs@tglx> <CAAhV-H5sO0x1EkWks5QZ8ah-stB7JbDk6eFFeeonXD6JT9fHAw@mail.gmail.com>
 <87bjt9wq3b.ffs@tglx>
In-Reply-To: <87bjt9wq3b.ffs@tglx>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Sun, 6 Apr 2025 20:46:12 +0800
X-Gm-Features: ATxdqUHAzOTUEtG6B6EooHmEZYykWnMr9U5FR11OuJop70kp4nyf68vPoNg1nrY
Message-ID: <CAAhV-H6r_iiKauPB=7eWhyTetvsTvxt5O9HtmmKb72y62yvXnA@mail.gmail.com>
Subject: Re: [PATCH] irqchip/loongson-liointc: Support to set IRQ_TYPE_EDGE_BOTH
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org, 
	Yinbo Zhu <zhuyinbo@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 6, 2025 at 6:18=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Sun, Apr 06 2025 at 17:46, Huacai Chen wrote:
> > On Thu, Apr 3, 2025 at 11:48=E2=80=AFPM Thomas Gleixner <tglx@linutroni=
x.de> wrote:
> >> But it won't trigger on both. So no, you cannot claim that this fixes
> >> anything.
> > Yes, it won't trigger on both (not perfect), but it allows drivers
> > that request "both" work (better than fail to request), and there are
>
> By some definition of 'work'. There is probably a good technical reason
> why those drivers expect EDGE_BOTH to work correctly and otherwise fail
> to load.
The real problem we encounter is the MMC driver. In
drivers/mmc/core/slot-gpio.c there is
devm_request_threaded_irq(host->parent, irq,
                        NULL, ctx->cd_gpio_isr,
                        IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
IRQF_ONESHOT,
                        ctx->cd_label, host);

"IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING" is an alias of
"IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING", and
"IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING" is
"IRQ_TYPE_EDGE_BOTH".

Except MMC, "grep IRQ_TYPE_EDGE_BOTH drivers" can give some more examples.

Huacai

>
> You completely fail to explain, why this hack actually 'works' and what
> the implications are for such drivers.
>
> > other irqchip drivers that do similar things.
>
> Justifying bogosity with already existing bogosity is not a technical
> argument.
>
> Thanks,
>
>         tglx
