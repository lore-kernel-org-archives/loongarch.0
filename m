Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16EC21ABAA
	for <loongarch@lists.linux.dev>; Thu, 11 Sep 2025 05:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757569479; cv=none; b=hpfscw5MJYROF2ebweiv7Ssclhkl1Tcu1Qhq3y6wYgHYX1jE95YHB6CuGP+VXqc4ovefzwg52NhEndSypAOShLq4Qr4osTKxNBX/QfqDZuKu790R0O58kHuKcHlA7PNzLooPDHZhskKk4bTMi2h7M7sDTbCb1BZZLbMKfWo1Oaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757569479; c=relaxed/simple;
	bh=OMtGTExh4pcQAOusF0QsuJQZIODVOUx8i1XlOSomzSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZgMuA/h9ubBhn0f80i/nDl0izxQa/oja+Ejp+tg/2Kat1h+yeag1xC0rYGBqwzWCbuTe5hps+pYKQrtgqLjGfKEYWEzteX9KAe54C92kV76g3wbJOJ0KGrlwk0CpSAG2tNOc2Bpn2qLaiSJxxOYar5rzMZQ1jY3utoG0Ks3USZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyK789mH; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyK789mH"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55f6bdcc195so1309674e87.0
        for <loongarch@lists.linux.dev>; Wed, 10 Sep 2025 22:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757569476; x=1758174276; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMIGN5Dtji/fICaLmPTyfkuwaheBNYfZUOrUfndT+g0=;
        b=OyK789mH7j9xd/5vtltP8HL3KOx2S+v2ZNe6gqERIGuvvlKuW8cAnrFqp+BtR8jVu4
         aAG15h8j9c2GbGWY+ZBP1b6zaUULwX2yo2tgmzgfx0x5sLbAaTYCEL/UEEvHGew4rsxo
         8VfBXC5sfTB1DgWRkUxl90+m2XvfRkbuf3ypkAxt3y90zUmfwQWrm1dQWBhtMgJy1Trl
         vwtn5U6Lx/bbeXbMSMce58NWH7wc/jl2YfIjqWb8XRzqwRYuKRQg3VssKAAhxshF6Ifm
         VlCfadv/QVAlN6xoE7TV+pYYJHIH3gE58LVbpT2teJPo/dFzDCEzddO3NzF+RxT3n1ET
         GzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757569476; x=1758174276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMIGN5Dtji/fICaLmPTyfkuwaheBNYfZUOrUfndT+g0=;
        b=rmV5utB0iUeBH+5reRIQbm6lDKTyII8zTrIxhuIOg7Wyq6LTZbPnDT2ooOu2YMiicm
         K3PswDE8iY09gE+kKlksATTi/H+d2UYbYQz4kRMYeJ0gBWJQiARlJ3NXu0wnZxB75SPA
         Sq9zMIeV8P2lBDODiq/ueqLZsDk/w0mTo2gPNgaHSoinbgygj2iX+B0HROEAFjPlTrMY
         XdNbPPOWY1EZoXWDdF+rzpL+U8g5x7n+yaiA2sDvVod8LXg3tZb2kdYCDMz2N5pt8FHU
         8/5sOAb8UBwf3OkfGNBP3RQP5Nom/WnyeKQX66Sc/C4f0+gnf12xkYsmZ2EccSHvYGHb
         jYpg==
X-Forwarded-Encrypted: i=1; AJvYcCXjVb9/ELS9ypXO4ME96abXDs9t9lh4UgLFdGLfL7/gLH60IbD571xavir7UMqFS1vMWz1HhQX6cKk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/AkhCjRLOBwoJHGGzXoJuXJESEzV2/zTIdveLS96k35P9jeLq
	9sJE9JtqfILhImSbDPelQtbnCqZQ9JTAgBeDoX9wVKj2lCbalHZrEanDdf4YSzdzGHJtHM3KoKe
	gxvWzpAef7S/QkX5thgLJCeHrvtfxSTM=
X-Gm-Gg: ASbGncs2qyT2AU5Ma3k4JAijLnzNYnDkf6Kx8eBAYAgq0tMPJxHb9YKcDkuYILqyPRT
	LbiD+nMbCkXjnbOW2PpD8A8b206YIdIOqcg1jtGkIeKhzOh5Qm6guqveq2Pwb9MeHTr40Q5Zarw
	5t5pMFEzw43zMyTopvgJdyBwZnpNbNYN48Ln65pjnZ6VRTngg1o1TGUMPmgGsU6G9o3er+QC39/
	N/j7IJKEESZklLoIXqWUAmcbFvW5g==
X-Google-Smtp-Source: AGHT+IFXXzbUmqfUVHrK9y+Tz+xUgPLo8Z/WQoqhWiJEUjVlgtHkwjMb8D/bEp5cJbkjZ9GKy8JPh87QF0toRaHkPG0=
X-Received: by 2002:a05:6512:31d2:b0:55f:45f7:f7a0 with SMTP id
 2adb3069b0e04-56d7b8f884bmr603188e87.28.1757569475645; Wed, 10 Sep 2025
 22:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1756991031.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1756991031.git.zhoubinbin@loongson.cn>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 11 Sep 2025 13:43:58 +0800
X-Gm-Features: AS18NWB5DuSI91t4oeMBT2UUvtcIx7VW5QEF-xbXLNgu0nfFPDPblbd44x_70lk
Message-ID: <CAJhJPsXwT45Q7j5XtEujsMnYgMMAbzg53d0T8YGCv1SuoYFJ_g@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] mtd: rawnand: loongson: Add Loongson-2K nand
 controller support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the whole series:

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>
Tested-by: Keguang Zhang <keguang.zhang@gmail.com> # on LS1B & LS1C

On Thu, Sep 4, 2025 at 9:07=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> Hi all:
>
> This patchset adds support for the Loongson-2K0500/Loongson-2K1000 NAND
> controllers, which are similar to the Loongson-1C NAND controller.
>
> They support a maximum capacity of 16GB FLASH per chip, with a maximum
> page size of 8KB. The chip supports up to 4 chip selects and 4 RDY signal=
s.
>
> The key difference between the Loongson-2K NAND controllers is that the
> Loongson-2K1000 explicitly configures the DMA controller routing, while
> the Loongson-2K0500 defaults to using APBDMA0.
>
> Summary of the patchset:
> Ptach 1: Rename all prefixes from ls1x to loongson
> Patch 2: Add 6-byte NAND ID reading
> Patch 3: Add chip select support
> Patch 4-5: Add Loongson-2K0500 NAND controller support
> Patch 6-7: Add Loongson-2K1000 NAND controller support
>
> Thanks.
>
> -------
> V4:
> Patch (5/7):
>   - Split the flags variable into dma_bits;
>   - Chip selects set before requesting the DMA channel;
>   - '|' should be last character on the previous line.
> Patch (7/7):
>   - Use devm_platform_ioremap_resource_byname();
>   - Add the dma_config() function pointer to replace the previous flags.
>
> Link to V3:
> https://lore.kernel.org/all/cover.1755757841.git.zhoubinbin@loongson.cn/
>
> V3:
> Patch (1/7):
>   - Merge the first two rename patches;
> Patch (3/7)
>   - Refact chip capacity calculation. Use a big switch-case
>     for writesize, and sort the big switch-case by writesize;
>   - Drop the redundant 'nand_cs =3D 0x0';
> Patch (6/7)
>   - Add Reviewed-by tag from Rob, thanks.
>
> Link to V2:
> https://lore.kernel.org/all/cover.1754890670.git.zhoubinbin@loongson.cn/
>
> V2:
> Patch (5/8):
>   - Add Acked-by tag from Rob, thanks;
> Patch (7/8):
>   - Update reg-names attribute description.
>
> Link to V1:
> https://lore.kernel.org/all/cover.1753166096.git.zhoubinbin@loongson.cn/
>
> Binbin Zhou (6):
>   mtd: rawnand: loongson1: Rename the prefix from ls1x to loongson
>   mtd: rawnand: loongson: Add nand chip select support
>   dt-bindings: mtd: loongson,ls1b-nand-controller: Document the
>     Loongson-2K0500 NAND controller
>   mtd: rawnand: loongson: Add Loongson-2K0500 NAND controller support
>   dt-bindings: mtd: loongson,ls1b-nand-controller: Document the
>     Loongson-2K1000 NAND controller
>   mtd: rawnand: loongson: Add Loongson-2K1000 NAND controller support
>
> Keguang Zhang (1):
>   mtd: rawnand: loongson: Add 6-byte NAND ID reading support
>
>  .../mtd/loongson,ls1b-nand-controller.yaml    |   56 +-
>  MAINTAINERS                                   |    2 +-
>  drivers/mtd/nand/raw/Kconfig                  |    8 +-
>  drivers/mtd/nand/raw/Makefile                 |    2 +-
>  .../mtd/nand/raw/loongson-nand-controller.c   | 1024 +++++++++++++++++
>  .../mtd/nand/raw/loongson1-nand-controller.c  |  836 --------------
>  6 files changed, 1083 insertions(+), 845 deletions(-)
>  create mode 100644 drivers/mtd/nand/raw/loongson-nand-controller.c
>  delete mode 100644 drivers/mtd/nand/raw/loongson1-nand-controller.c
>
>
> base-commit: c9f62564252c21d739a5003e9b2d6ad0828aa7bd
> --
> 2.47.3
>


--=20
Best regards,

Keguang Zhang
