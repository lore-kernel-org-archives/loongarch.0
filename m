Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E838284A3B
	for <loongarch@lists.linux.dev>; Thu,  9 May 2024 02:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715221485; cv=none; b=bsruLrWB4AggeIB8NMfAthWw91EBtReBoMaSk8+KWkedCXZjPTfEqQH9Lrstih7vI9MoxzwD/DNhTUKtHPYfk00P9KrrixdSzKFoW/uT+Q1ppOjwpRthI+d1uyLESYX06Ixwy6Nvl69zHMXEzXl33qUgYmbVDl0dNPhqBJIAQ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715221485; c=relaxed/simple;
	bh=9rSPZR5cYVC/s/XK6Sl9HqlPQQom/UHopyaHLvwlDt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kq8STkqd9B7Zme9hJXgGgDCynu4De9aT8HyE6m1Nw8ENWGJnRmNW6BEudVFigAVJlxS2KA4O9nb97P8BOOCAXl5evH+CRSmlWoPjeKzDQyPAFzfobzxmFfEFkzlpxHPL8bhEf/Ae2/qc3RT50kZXGI+X0mhW1Jmo7gHpvqKPQLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPBqdIx5; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPBqdIx5"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5b2735f217aso48830eaf.2
        for <loongarch@lists.linux.dev>; Wed, 08 May 2024 19:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715221483; x=1715826283; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ODud8ohb8vpikiOmz/uYlWu4zxPb834x4SbMz1JshM=;
        b=NPBqdIx5/r74cYb1A5VJILMKKapTQc3Z9bZgItLUeZjZ/iFk/iIgH00QHqFMeIBZDl
         zbw9kehboaJAJ4Mk2aTh9GInewLK11awW6WD/6+HqxrwEjKBL8tyFHrp/gcoL9BkhRCK
         CqMo+J9ImeZex2O2seh7VqsPWoUl+PS6eAmaRnmjLY8O4Xt3CYIe7w9PXLl2MHHycTVr
         2x4W0YaJ5mBgSvzp+5JtDk6/mrVGj8SH/TFt3nHEN+q+T/MpQOqZC8U79neWnIoNxh49
         JPnuZ4ZZHA/HY3WR/rdSQ70nUP0VTXrBwm/OONHESCg92OE6BLAYQmSBlP7p0QwbcMQr
         7Nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715221483; x=1715826283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ODud8ohb8vpikiOmz/uYlWu4zxPb834x4SbMz1JshM=;
        b=Oq1irbygP1NNOimtsf5s6qIT+VjFWxd23AuHPCJhQh7HrqcFnYt5+rd6TaQqEw1dS+
         LwRE2yW6cbddt29kggNY3dX8VLiMC+Em7ZwXWIrxv/3Z6R03wimHYA67gy3vo2ba3Fpy
         nV1C0/HdkVB4HMZpG4lAb3Xf5tt1qKxLoSFp086XUFuvmRNArT77QTL4hZ2w4CSZrkXu
         ok7L/ben23Sk9d/3368Ka1zBiauIiqjm3v7zlW6QUTM7PwJButM43eUfN+uQVE3U48al
         vKEQkH0QuWpOz9+LADH3dVogmSBxRVBHGC3LGPuwQtaJfBUKrAVhxi6u4X4XPppzJo26
         WFPw==
X-Forwarded-Encrypted: i=1; AJvYcCWBI30bqn+16cnes8lqhdd4pzDRkPtLZaBh1eKli4Hr8+mafrthTosdnJXQbjzgYfBSMAvq4AgoyicE956gYdUGXARsIYkxXGDu
X-Gm-Message-State: AOJu0Yx9JHsyDdpFsPWEwMdjblgoLU5zqvOXmblHXeGjAhstAHb+Vmxz
	daPx+wCYkUuV3IBY4IzZju5E3cljMfopdqNpuNEnijYREhnnA2ppjIMbURObpFopkElviVEMZ6t
	ZJJynVI0+u/r0tHST2bi4ybDJckY=
X-Google-Smtp-Source: AGHT+IHPtJmrIA4PS0UqfTwetCTRC73/sxh2Pe5BaF4GGn+EKZ2xoKu1uQJfkBEJ9Pkx5GApEskitQZ/A4Vcd/cPG7o=
X-Received: by 2002:a4a:98a8:0:b0:5b2:bc0:f38b with SMTP id
 006d021491bc7-5b24d5c905amr4961812eaf.5.1715221482912; Wed, 08 May 2024
 19:24:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240507122228.5288-1-zhangtianyang@loongson.cn>
In-Reply-To: <20240507122228.5288-1-zhangtianyang@loongson.cn>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Thu, 9 May 2024 10:24:16 +0800
Message-ID: <CAD-N9QV82w1_7ksGAWJDNVcRDyKHLgiEbx13b3sr4cTazobW5g@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: Add advanced extended IRQ model description
To: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, 
	siyanteng@loongson.cn, loongarch@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 8:24=E2=80=AFPM Tianyang Zhang <zhangtianyang@loongs=
on.cn> wrote:
>
> From 3C6000, Loongarch began to support advanced extended
> interrupt mode, in which each CPU has an independent interrupt
> vector number.This will enhance the architecture's ability
> to support modern devices
>
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> ---
>  .../arch/loongarch/irq-chip-model.rst         | 33 +++++++++++++++++
>  .../zh_CN/arch/loongarch/irq-chip-model.rst   | 37 +++++++++++++++++--
>  2 files changed, 67 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/arch/loongarch/irq-chip-model.rst b/Documentat=
ion/arch/loongarch/irq-chip-model.rst
> index 7988f4192363..79228741d1b9 100644
> --- a/Documentation/arch/loongarch/irq-chip-model.rst
> +++ b/Documentation/arch/loongarch/irq-chip-model.rst
> @@ -85,6 +85,39 @@ to CPUINTC directly::
>      | Devices |
>      +---------+
>
> +Advanced Extended IRQ model
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +In this model, IPI (Inter-Processor Interrupt) and CPU Local Timer inter=
rupt go
> +to CPUINTC directly, CPU UARTS interrupts go to LIOINTC, MSI interrupts =
go to AVEC,
> +and then go to CPUINTC, Other devices interrupts go to PCH-PIC/PCH-LPC a=
nd gathered
> +by EIOINTC, and then go to CPUINTC directly::
> +
> + +-----+     +--------------------------+     +-------+
> + | IPI | --> |           CPUINTC        | <-- | Timer |
> + +-----+     +--------------------------+     +-------+
> +              ^        ^             ^
> +              |        |             |
> +      +--------+  +---------+ +---------+     +-------+
> +      | AVEC   |  | EIOINTC | | LIOINTC | <-- | UARTs |
> +      +--------+  +---------+ +---------+     +-------+
> +           ^            ^
> +           |            |
> +         +---------+  +---------+
> +         |   MSI   |  | PCH-PIC |
> +         +---------+  +---------+
> +            ^          ^       ^
> +            |          |       |
> +    +---------+ +---------+ +---------+
> +    | Devices | | PCH-LPC | | Devices |
> +    +---------+ +---------+ +---------+
> +                     ^
> +                     |
> +                +---------+
> +                | Devices |
> +                +---------+
> +
> +
>  ACPI-related definitions
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-mod=
el.rst b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
> index f1e9ab18206c..7ccde82dd666 100644
> --- a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
> +++ b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
> @@ -9,9 +9,8 @@
>  LoongArch=E7=9A=84IRQ=E8=8A=AF=E7=89=87=E6=A8=A1=E5=9E=8B=EF=BC=88=E5=B1=
=82=E7=BA=A7=E5=85=B3=E7=B3=BB=EF=BC=89
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> -=E7=9B=AE=E5=89=8D=EF=BC=8C=E5=9F=BA=E4=BA=8ELoongArch=E7=9A=84=E5=A4=84=
=E7=90=86=E5=99=A8=EF=BC=88=E5=A6=82=E9=BE=99=E8=8A=AF3A5000=EF=BC=89=E5=8F=
=AA=E8=83=BD=E4=B8=8ELS7A=E8=8A=AF=E7=89=87=E7=BB=84=E9=85=8D=E5=90=88=E5=
=B7=A5=E4=BD=9C=E3=80=82LoongArch=E8=AE=A1=E7=AE=97=E6=9C=BA
> -=E4=B8=AD=E7=9A=84=E4=B8=AD=E6=96=AD=E6=8E=A7=E5=88=B6=E5=99=A8=EF=BC=88=
=E5=8D=B3IRQ=E8=8A=AF=E7=89=87=EF=BC=89=E5=8C=85=E6=8B=ACCPUINTC=EF=BC=88CP=
U Core Interrupt Controller=EF=BC=89=E3=80=81LIOINTC=EF=BC=88
> -Legacy I/O Interrupt Controller=EF=BC=89=E3=80=81EIOINTC=EF=BC=88Extende=
d I/O Interrupt Controller=EF=BC=89=E3=80=81
> +LoongArch=E8=AE=A1=E7=AE=97=E6=9C=BA=E4=B8=AD=E7=9A=84=E4=B8=AD=E6=96=AD=
=E6=8E=A7=E5=88=B6=E5=99=A8=EF=BC=88=E5=8D=B3IRQ=E8=8A=AF=E7=89=87=EF=BC=89=
=E5=8C=85=E6=8B=ACCPUINTC=EF=BC=88CPU Core Interrupt Controller=EF=BC=89=E3=
=80=81
> +LIOINTC=EF=BC=88Legacy I/O Interrupt Controller=EF=BC=89=E3=80=81EIOINTC=
=EF=BC=88Extended I/O Interrupt Controller=EF=BC=89=E3=80=81
>  HTVECINTC=EF=BC=88Hyper-Transport Vector Interrupt Controller=EF=BC=89=
=E3=80=81PCH-PIC=EF=BC=88LS7A=E8=8A=AF=E7=89=87=E7=BB=84=E7=9A=84=E4=B8=BB=
=E4=B8=AD
>  =E6=96=AD=E6=8E=A7=E5=88=B6=E5=99=A8=EF=BC=89=E3=80=81PCH-LPC=EF=BC=88LS=
7A=E8=8A=AF=E7=89=87=E7=BB=84=E7=9A=84LPC=E4=B8=AD=E6=96=AD=E6=8E=A7=E5=88=
=B6=E5=99=A8=EF=BC=89=E5=92=8CPCH-MSI=EF=BC=88MSI=E4=B8=AD=E6=96=AD=E6=8E=
=A7=E5=88=B6=E5=99=A8=EF=BC=89=E3=80=82
>
> @@ -87,6 +86,38 @@ PCH-LPC/PCH-MSI=EF=BC=8C=E7=84=B6=E5=90=8E=E8=A2=ABEIO=
INTC=E7=BB=9F=E4=B8=80=E6=94=B6=E9=9B=86=EF=BC=8C=E5=86=8D=E7=9B=B4=E6=8E=
=A5=E5=88=B0=E8=BE=BECPUINTC::
>      | Devices |
>      +---------+
>
> +=E9=AB=98=E7=BA=A7=E6=89=A9=E5=B1=95IRQ=E6=A8=A1=E5=9E=8B
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E5=9C=A8=E8=BF=99=E7=A7=8D=E6=A8=A1=E5=9E=8B=E9=87=8C=E9=9D=A2=EF=BC=8C=
IPI=EF=BC=88Inter-Processor Interrupt=EF=BC=89=E5=92=8CCPU=E6=9C=AC=E5=9C=
=B0=E6=97=B6=E9=92=9F=E4=B8=AD=E6=96=AD=E7=9B=B4=E6=8E=A5=E5=8F=91=E9=80=81=
=E5=88=B0CPUINTC=EF=BC=8C
> +CPU=E4=B8=B2=E5=8F=A3=EF=BC=88UARTs=EF=BC=89=E4=B8=AD=E6=96=AD=E5=8F=91=
=E9=80=81=E5=88=B0LIOINTC=EF=BC=8CMSI=E4=B8=AD=E6=96=AD=E5=8F=91=E9=80=81=
=E5=88=B0AVEC,=E8=80=8C=E5=90=8E=E9=80=9A=E8=BF=87AVEC=E9=80=81=E8=BE=BECPU=
INTC=EF=BC=8C=E8=80=8C

AVEC is followed by an English comma (Translation: AVEC =E5=90=8E=E9=9D=A2=
=E4=B8=80=E4=B8=AA=E8=8B=B1=E6=96=87=E9=80=97=E5=8F=B7)
Dongliang Mu

> +=E5=85=B6=E4=BB=96=E6=89=80=E6=9C=89=E8=AE=BE=E5=A4=87=E7=9A=84=E4=B8=AD=
=E6=96=AD=E5=88=99=E5=88=86=E5=88=AB=E5=8F=91=E9=80=81=E5=88=B0=E6=89=80=E8=
=BF=9E=E6=8E=A5=E7=9A=84PCH-PIC/PCH-LPC=EF=BC=8C=E7=84=B6=E5=90=8E=E7=94=B1=
EIOINTC=E7=BB=9F=E4=B8=80=E6=94=B6=E9=9B=86=EF=BC=8C=E5=86=8D=E7=9B=B4
> +=E6=8E=A5=E5=88=B0=E8=BE=BECPUINTC::
> +
> + +-----+     +--------------------------+     +-------+
> + | IPI | --> |           CPUINTC        | <-- | Timer |
> + +-----+     +--------------------------+     +-------+
> +              ^        ^             ^
> +              |        |             |
> +      +--------+  +---------+ +---------+     +-------+
> +      | AVEC   |  | EIOINTC | | LIOINTC | <-- | UARTs |
> +      +--------+  +---------+ +---------+     +-------+
> +              ^        ^
> +              |        |
> +      +---------+  +-------------+
> +      |   MSI   |  |   PCH-PIC   |
> +      +---------+  +-------------+
> +            ^          ^       ^
> +            |          |       |
> +    +---------+ +---------+ +---------+
> +    | Devices | | PCH-LPC | | Devices |
> +    +---------+ +---------+ +---------+
> +                     ^
> +                     |
> +                +---------+
> +                | Devices |
> +                +---------+
> +
>  ACPI=E7=9B=B8=E5=85=B3=E7=9A=84=E5=AE=9A=E4=B9=89
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> --
> 2.20.1
>
>
