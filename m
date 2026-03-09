Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B39434D390
	for <loongarch@lists.linux.dev>; Mon,  9 Mar 2026 08:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043518; cv=pass; b=q3LZhp5M6u8EXprxgi6qotsnGQXtDdLspzu3ndrqHxLVa2Vf0wGw1AuxF+7gEWbqEiDKxOEEaafr5dgCYSmEE5OcTwjgvSNACJCDWpZ5VhKeDGMLboDt0feLuYUdkr4xcELxca+IPnUB5y9BV9MtkbxS19+KWVs+ErH2fXXUiw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043518; c=relaxed/simple;
	bh=9rRUzy7I4Yn9TKSxdiDUjmYRtwSYsMyZ7fp/5IbO/q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AteJVxq50UzgW8ny4OFfVZqRNh2YvjSTPRfqr6fU/oOD72QDA43OYfC1B8B+EclqBw1/nSdX1uVPmT9Za3k9u/EHxnqz7e8a4T1lVc8cfLFRkAaSmU74mqFKl0tHO78fUGsHtM9kRVFfWNIBlTdgv+NoDz8gF13uIx8EMHC6nGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jA79zuWv; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jA79zuWv"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b95c0fc928bso282291666b.0
        for <loongarch@lists.linux.dev>; Mon, 09 Mar 2026 01:05:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773043516; cv=none;
        d=google.com; s=arc-20240605;
        b=h0/LW1w5SOICyur2qF1RY02TxafdzmFPFjfTxvDpACoWOgUxC1qDcLhqtP22yMU2T6
         0f8XfB2/25aTv3aGwTctd+S5JRSdaO+qp2MyKX68Zwbc+XFP/A9AtQy1Ot+fTt7Xok/r
         ZXd6wsvytbLGcgZy6QnL2sopK4uApCJDFS0ZQjKtJV4zA7pYn2sStj9WT0RE6IF7h0Ps
         6F42lwhq2IQdJSrELLpdxJQ6ZpvzSelYz8XBTfGKSvjh0PnpGVuRLMQ3lkBBVqu+PxCf
         GTcPWVzq6fVAtyoCFkqwQ2qmpQfNlY2i+mH1mT2wPhE7m6wp3fE2faaJleMJypflztlD
         MjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fRzvHdv5ruH/JD72yB5V1Ivp7J4AaqZR7aIdb2pmk7E=;
        fh=IiFwYT6XeQQsRM6WyrBJPHFNr9wfez3QtCEkLzkyYMU=;
        b=IR5CY53Gj5chlJKo18YsLnDdzrwH8oUAGuEpqQ3WVLRddqTb1qdWCtIFMfJSps7YLu
         txliNEmNHqATt6God9xG8GjNgRY0zuBbZ2R+V/+KNYRwpfnvJ1OBFL6wssH/1xu9geqo
         cSSmviko0UgCA2wnvGCX8v7EZ0rZX0smNxJe6PyjT/KBDJv33yjLTLY3FZdN/Eiy2x/x
         Mr0eWYhAN6EL9ILV7DDiEsgG+HdpmPvHm4rbVhPFkbLrNEvS1quloQCFHbE64nTjzPtj
         T/ebus+zI91fPuPUBVYjCFnfWuCDtdQhAM2FAqs7WvDQpDMUgWm1Ymn4g3PczkOHwA+I
         KJhg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773043516; x=1773648316; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRzvHdv5ruH/JD72yB5V1Ivp7J4AaqZR7aIdb2pmk7E=;
        b=jA79zuWvwoJww4Y4czn8BGm1bTmWKAwdKzLU/oH0QcLGi2SdVezrdbXsoWUWp0ZbS3
         w+tqQKpvNY1tGnlDjZqKzs8Eg2Ex0bSez1AQkzGaDToF05jBOOai1JyWsD8IZYyl/7Aa
         fNGUWWsmfWPlfbN8mjg5v2Zaoyq815g5Za4EgAcwehx9XBUX25aqz1/Ug1Xi9bCLXOLs
         WmE4p/bVYcy/HBqlabakFUF8Py7D8x6AavPBkUW4W11TFg2FfTe4hYmAKGS3J0HENbVg
         v2SCMAZGMP5J0c+R6vvBR5VAhpbv4X1AUK4EeRhfNN2O1NLkBaxZzkuFEgmmG5bj1V/P
         3EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773043516; x=1773648316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fRzvHdv5ruH/JD72yB5V1Ivp7J4AaqZR7aIdb2pmk7E=;
        b=nwv4fB/FtQw2fwF94qpIBv+fWJVMLCWTMtn7biObZGrbtXhcRJ1UNV3+bvxAGwPVrA
         eGUfcDC0Y/GPsC0Xa7vM/PP+LWlVRBYr+I7F4prLBRlU/nHmjAKPX5FeQFIkn5XMptUF
         2ygJrWOknpONIqioG3dsBK7WGRRzYTZRMVssEXR3aB/dgSCVsx1P2YXAQqgu3Loy7Jfk
         dMM0F2he0wS5cR7C1dQUZBQiLekB3ZpV7g/W/3EjO5sPvAP4bExqR/e/svNrwkz85gqi
         mdGIsHeCg9jD0KDnjuHcC7hf7yqOKKii7sDCNJnLOTDHEYOSNff0gliiiaJ2biWeYo6J
         iVmw==
X-Forwarded-Encrypted: i=1; AJvYcCVkWcFuuO/G1p2wOH+KOAJqBVimNvSqGGZYYkiftsdJblWFbG9YUdvr9EF2GTnJVRfGQTEToNvF+3w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0c7ix+f7QfwY0MCav8GnZezsudVSiIcRslApxzTWMHHQpvxvS
	F2jpWq8rLfCGeif8jHGttv7iCms6UIb8HX7x6iuvT8OhVChUNFVsVSeHbLH28S1Y1xn0wye94h7
	SG9/+LWIvRqFvJLc77VRBLh5Xr1kFRHs=
X-Gm-Gg: ATEYQzw3PxTJmHDWbn8TrzuAk2m3TAOrF0uNIW6EPChYYq5IilCck5Aw/mc+wHWGKnk
	Fc7qcys5dSO6olL+jdMkeufvo0kk0Yh+/o3jKbEY3cv/8LKvjKEG7/e7F36x4v9rBxL1AjAyGTW
	IFnGIzM+xHtDMtju4b2HgWSWyr4/tUHTBbm89UnuVEWYbvVyabsYEgdkEcwuSXjdtb82x051TRm
	HpqC1mm0mpornYyU0tkQlF8Rix6cgqRQHiAnl/X2FwQ3DWMB7SxuSFJSOQKxd7oEhUOE23H2JGK
	R7+k9C0=
X-Received: by 2002:a17:906:c14c:b0:b88:dc6:3967 with SMTP id
 a640c23a62f3a-b942e026133mr560704766b.40.1773043515456; Mon, 09 Mar 2026
 01:05:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1771989595.git.zhoubinbin@loongson.cn> <408551399f089d10e2ebc2c0add5ba58d659a1b9.1771989596.git.zhoubinbin@loongson.cn>
 <CAAhV-H6G6Zb7P8OpoM78FkfSW2HeLt+9xfbJyU21tdbUa8A=Ww@mail.gmail.com> <aa5yZ6xSW8yxm9gI@vaman>
In-Reply-To: <aa5yZ6xSW8yxm9gI@vaman>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 9 Mar 2026 16:05:03 +0800
X-Gm-Features: AaiRm5294yKy8lbGyQ7Hmx4k6HbI1oWu6Wm6ACsqemZt6_dIw21pirDFEH1wTc4
Message-ID: <CAMpQs4JX0jZuLk84QnW79cVrjA-Fs6oDx8Uq_cyTVLTaE3F8vg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] dmaengine: loongson: New driver for the Loongson
 Multi-Channel DMA controller
To: Vinod Koul <vkoul@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	dmaengine@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 3:10=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 26-02-26, 16:18, Huacai Chen wrote:
> > Hi, Binbin,
> >
> > On Wed, Feb 25, 2026 at 3:41=E2=80=AFPM Binbin Zhou <zhoubinbin@loongso=
n.cn> wrote:
> > >
> > > This DMA controller appears in Loongson-2K0300 and Loongson-2K3000.
> > >
> > > It is a chain multi-channel controller that enables data transfers fr=
om
> > > memory to memory, device to memory, and memory to device, as well as
> > > channel prioritization configurable through the channel configuration
> > > registers.
> > >
> > > In addition, there are slight differences between Loongson-2K0300 and
> > > Loongson-2K3000, such as channel register offsets and the number of
> > > channels.
> > >
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >  MAINTAINERS                                  |   1 +
> > >  drivers/dma/loongson/Kconfig                 |  10 +
> > >  drivers/dma/loongson/Makefile                |   1 +
> > >  drivers/dma/loongson/loongson2-apb-cmc-dma.c | 729 +++++++++++++++++=
++
> > >  4 files changed, 741 insertions(+)
> > >  create mode 100644 drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index aea29c28d865..af9fbb3b43e2 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -14954,6 +14954,7 @@ L:      dmaengine@vger.kernel.org
> > >  S:     Maintained
> > >  F:     Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.y=
aml
> > >  F:     Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.ya=
ml
> > > +F:     drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > >  F:     drivers/dma/loongson/loongson2-apb-dma.c
> > >
> > >  LOONGSON LS2X I2C DRIVER
> > > diff --git a/drivers/dma/loongson/Kconfig b/drivers/dma/loongson/Kcon=
fig
> > > index 9dbdaef5a59f..4278fbbe8096 100644
> > > --- a/drivers/dma/loongson/Kconfig
> > > +++ b/drivers/dma/loongson/Kconfig
> > > @@ -12,6 +12,16 @@ config LOONGSON1_APB_DMA
> > >           This selects support for the APB DMA controller in Loongson=
1 SoCs,
> > >           which is required by Loongson1 NAND and audio support.
> > >
> > > +config LOONGSON2_APB_CMC_DMA
> > > +       tristate "Loongson2 Chain Multi-Channel DMA support"
> > > +       select DMA_ENGINE
> > > +       select DMA_VIRTUAL_CHANNELS
> > > +       help
> > > +         Support for the Loongson Chain Multi-Channel DMA controller=
 driver.
> > > +         It is discovered on the Loongson-2K chip (Loongson-2K0300/L=
oongson-2K3000),
> > > +         which has 4/8 channels internally, enabling bidirectional d=
ata transfer
> > > +         between devices and memory.
> > Moving this to after LOONGSON2_APB_DMA is a little better.
>
> Yes and we expect these files to be sorted, so this needs to be done

This is reorder on the latest patchset:

https://lore.kernel.org/all/cover.1772853681.git.zhoubinbin@loongson.cn/
>
> --
> ~Vinod

--=20
Thanks.
Binbin
