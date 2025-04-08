Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115B926F47C
	for <loongarch@lists.linux.dev>; Tue,  8 Apr 2025 12:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115871; cv=none; b=MSOXhLrTsMq1YSMRWx2jalzWkel6pALLQTtU6l5U061N/dEumaafXFPL0Lq3R4jDhWgCddpqnnXBBzfj07ccWBi4Qyg8qi19FUjuP/cRAuvAEAbtO5G8X2Fo51d/hCnB1/h6jhRdfr8RUu0XY3FB0iS9YbH9SV+GCCrYFlbei6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115871; c=relaxed/simple;
	bh=n5yY3c/M7DGrAou208VOkwvsGsTS780Xs0GL0+1p0Rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=px5KRGZs5AO3AThCgL27vJUQr/Zthi83/gLRdXUIlNsigjxho6Y9n5Bg/ScFW395oaXqAGRKKeW1yfU9QVcMt/TOwUG9jFmrlE/h18bMuy4gQwH50huuP7KW/eAPupxCcpM6p8Ksebcye0OQtd5Tb394IObORclc5Xji6prN+4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBz6ZOYv; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBz6ZOYv"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so728998366b.0
        for <loongarch@lists.linux.dev>; Tue, 08 Apr 2025 05:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744115868; x=1744720668; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XDdHAFVrIm9VYmfrBSLGHN4jyk7mQe9dLRJj0l1S2A=;
        b=gBz6ZOYvuZYG8cU88Z9R0E6rLLmH68UOhCAc3bdRLq93ESVh8O+0M5MVIlQxDiDgee
         SOHsXCMlAcj9T6m2OQgBoaTsz8HBz8eqMtasYklm8f6j9i80dYTarj0mSIjvtOGxEu9U
         eLwHAvv9kDvW9wSmwnzdosGAqcHf7JgeKTbPrJAClBeA/bEii6as/L3oXKaPLCG2n7Hb
         32qHavDgW9cNIyrVzz1PtfzGc+94DgZ5rxOXdkLR1muowmaoHtuy/Bi75HqiDIx+mQGG
         vpb1E3OA67gb+VubN4e8lzZ7bfcfkE7uSlz4JsUW+wgOgvhn7Oncy27edGFo2+IS6bTA
         HSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744115868; x=1744720668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XDdHAFVrIm9VYmfrBSLGHN4jyk7mQe9dLRJj0l1S2A=;
        b=t89wJyUOLzNNGxZqnd6VmbLO2vYJTfbF985/48nrKvMzm1JNCnvA/erxAPR3cmNiMV
         3yk33LGnVniZrqjA7a1JrA2GCsaJyx5hX8IWlpZTGcD15EUFl3jreyFTnyKcZvoVVQ8b
         zJUFS7S4CwIxW1YuBc6K4JEuMwiQ56g9WGMSY2uqpjZxlqYosLo0j0udqbygZOtnc5TX
         Aju2MwGwSwwmSO8PXGjgS4BAI4YoP3dmFFQ8ZtaXmKNs0ibrnVekS+JX6O+cioPmk3kj
         /RaJ45m1OLeTKGbv8TuN+wXOO3MQroTtyLWUj7kCo7ipRQy/KVnSwI2h6dbUL/SctArX
         li2g==
X-Forwarded-Encrypted: i=1; AJvYcCXKx9w/i+1vKQM0jGVlXxZyQH8AYEIJXTunj4qxaaNjA144An8YgDZa4u/q5NIkWoHfGPF2NfAHLkA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6CcTN8tzM6CrjsB+EPalal3J34FKm4KISNJRyEGkO7eQ01uyY
	LPd4/Cf0vmCp7tqZlNEQli3d2jqEzuTFwT/EptJ/EhMi7sqRJ9ym/3md7+kub1JYm9TY+otZwHK
	zEqdcjA2iu7mRpz7pnSq2mjS4hn4=
X-Gm-Gg: ASbGncsMhdO9dAr89WOakRv53JHP1Qhpp6v5he+FfFxvDOcqcoL7DGRE0yyJLzfG/cP
	j7+n1Zy9W/04r/rAk5dkY+HINHIwVwA8kZK/QWq2/t+BPR7e+avVHPG9iK8y3C3JaqusN3j3Zcd
	S2misfG7pg+LpTsNOcSF5KFguIxd4CTd2tBHJObw==
X-Google-Smtp-Source: AGHT+IFnh++FCRpnlhvrWegLUR+La0yffyAijO55u8NHyZxWVOF15mHkPKXDFhuFgNXjtR3SujjYNEfhlW/FnTHrSHE=
X-Received: by 2002:a17:907:3d87:b0:abf:6aa4:924c with SMTP id
 a640c23a62f3a-ac7d17747cfmr1453840866b.17.1744115868044; Tue, 08 Apr 2025
 05:37:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250402092500.514305-1-chenhuacai@loongson.cn>
 <87jz81uty3.ffs@tglx> <CAAhV-H5sO0x1EkWks5QZ8ah-stB7JbDk6eFFeeonXD6JT9fHAw@mail.gmail.com>
 <87bjt9wq3b.ffs@tglx> <CAAhV-H6r_iiKauPB=7eWhyTetvsTvxt5O9HtmmKb72y62yvXnA@mail.gmail.com>
 <875xjhwewg.ffs@tglx>
In-Reply-To: <875xjhwewg.ffs@tglx>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Tue, 8 Apr 2025 20:37:36 +0800
X-Gm-Features: ATxdqUFI9fVaIwXUxf1Igx0gCLAe6stGaO29HAebgaBrjAmfEMADUOm1aVbUZ1k
Message-ID: <CAAhV-H6tUvwN9UejTRf0zKXdhGG4o5X4ZOppE+1oQhL-rADFHg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/loongson-liointc: Support to set IRQ_TYPE_EDGE_BOTH
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org, 
	Yinbo Zhu <zhuyinbo@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 6, 2025 at 10:20=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Sun, Apr 06 2025 at 20:46, Huacai Chen wrote:
> > On Sun, Apr 6, 2025 at 6:18=E2=80=AFPM Thomas Gleixner <tglx@linutronix=
.de> wrote:
> >> On Sun, Apr 06 2025 at 17:46, Huacai Chen wrote:
> >> > On Thu, Apr 3, 2025 at 11:48=E2=80=AFPM Thomas Gleixner <tglx@linutr=
onix.de> wrote:
> >> >> But it won't trigger on both. So no, you cannot claim that this fix=
es
> >> >> anything.
> >> > Yes, it won't trigger on both (not perfect), but it allows drivers
> >> > that request "both" work (better than fail to request), and there ar=
e
> >>
> >> By some definition of 'work'. There is probably a good technical reaso=
n
> >> why those drivers expect EDGE_BOTH to work correctly and otherwise fai=
l
> >> to load.
> > The real problem we encounter is the MMC driver. In
> > drivers/mmc/core/slot-gpio.c there is
> > devm_request_threaded_irq(host->parent, irq,
> >                         NULL, ctx->cd_gpio_isr,
> >                         IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
> > IRQF_ONESHOT,
> >                         ctx->cd_label, host);
> >
> > "IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING" is an alias of
> > "IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING", and
> > "IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING" is
> > "IRQ_TYPE_EDGE_BOTH".
>
> I know that.
>
> > Except MMC, "grep IRQ_TYPE_EDGE_BOTH drivers" can give some more exampl=
es.
>
> Sure, but you still do not explain why this works even when the driver
> is obviously depending on EDGE_BOTH. If it does not then the driver is
> bogus.
>
> Looking at it, there is obviously a reason for this particular driver to
> request BOTH. Why?
>
> This is the card change detection and it uses a GPIO. Insert raises one
> edge and remove the opposite one.
>
> Which means whatever edge you chose randomly the detection will only
> work in one direction. Please don't tell me that this is correct by any
> meaning of correct. It's not.
From experiments, either setting to EDGE_RISING or EDGE_FALLING, card
detection (inserting and removing) works. Maybe the driver request
"BOTH", but it really need "ANY"? I've searched git log, but I haven't
get any useful information.


Huacai

>
> The driver is perfectly fine, when the request fails. It then does the
> obvious right thing to poll the card detection pin.
>
> So your change makes it worse as it screws up the detection mechanism.
>
> What are you actually making "work"?
>
> Thanks,
>
>         tglx
