Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A931B26C
	for <loongarch@lists.linux.dev>; Tue, 19 Dec 2023 12:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1Q41Dab"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cc63b3ed71so43239501fa.3
        for <loongarch@lists.linux.dev>; Tue, 19 Dec 2023 04:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702990558; x=1703595358; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ThEDF5X685my3aypVfpzyZJUTfRzfmqP6N9smgNetEs=;
        b=W1Q41DabQMb0pw6pE5pi/9w/f09LcTXpMojCRqNezvEpxQAxL1Ale50K+xkuGOCEj7
         xyhuXWHjlpf4mH8tfyQJfZTD12wjGK7VLYx1c8MjOaMVt6XR+jfFgFO45DrcaFwFvScF
         O9ujnRxn5D4pm2jecSA4HE8szE9W8NfrB9Pf6QxArTqBFlsSJkOi3XOiYFS1pK2Nq2T8
         //0MUpdJkvRjrNo2FapCF/eYXhzFdXTbNDicwEVT9X6fK+ISBAVFMFO85BZsNL6hNHeg
         aboKRV+DFCKX2n7abysEeVLTevN4erumTpY0npTQUHtrVok80KGkJ+8XOQZtI0elcNpP
         Dksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702990558; x=1703595358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ThEDF5X685my3aypVfpzyZJUTfRzfmqP6N9smgNetEs=;
        b=f3PuqA4MRd85uOMYKo7pGPi8pRvvudJVUz6r3E8O6tc9CaXm8x954gHGhzMaqqBJx9
         6kqHqyuyAOSfdJgb7TfV9g/wET1r9qiyfds5OgtgYOYOkMwfPQFfMRPM6jJhQ50rvAjm
         NeHXhpjvvaIohGqsJlZQcl2GYf25+Gb7INmvQRodXYPJpbvDvEFX5duxMXoer5ajD6xl
         SK7W4CN7hP84VjFi2mYgkmKpZOjKVQIdalwmLbyB87Qeg5OWvMrdOPxFWjbIsWb0X+4P
         qoa6CJ2Hg53qeKKuBqfDXH1ndeYfa+yqaYLn+flh9ki4u0HTUAIFNHxIQc9OObRgUKAy
         etqQ==
X-Gm-Message-State: AOJu0Ywnxhz2SmmLvjg/KUpz5U0Yl51P/DnU+xcp+5O/rAP1uIGWGOi3
	V1inFo0qJ4z0ONQ4ghW98HQ=
X-Google-Smtp-Source: AGHT+IFiE6QYBiTcVUFS6P1GPo7wdMo2zGCwVwmOdTDn3J7xZZ8r673aujlJgzZpBUlksgfe9SC3dA==
X-Received: by 2002:a05:651c:54d:b0:2cb:2d09:791 with SMTP id q13-20020a05651c054d00b002cb2d090791mr9297539ljp.3.1702990557409;
        Tue, 19 Dec 2023 04:55:57 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id w25-20020a2e9599000000b002cc8772c87bsm72314ljh.76.2023.12.19.04.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 04:55:56 -0800 (PST)
Date: Tue, 19 Dec 2023 15:55:53 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Yanteng Si <siyanteng@loongson.cn>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, Jose.Abreu@synopsys.com, 
	chenhuacai@loongson.cn, linux@armlinux.org.uk, guyinggang@loongson.cn, 
	netdev@vger.kernel.org, loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
Subject: Re: [PATCH v6 0/9] stmmac: Add Loongson platform support
Message-ID: <hc7nrz7ppzm45v37hi7xuogmgaz2w3jnolmuesxsm6s5ta34rn@vc2mmp33zpu7>
References: <cover.1702458672.git.siyanteng@loongson.cn>
 <pwdr6mampxe33jpqdf6o5xczgd4qkdttqj4tvionxl7qbry2ek@hpadl7wi4zni>
 <885a8904-9412-411d-9995-7d3ff350f309@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <885a8904-9412-411d-9995-7d3ff350f309@loongson.cn>

On Tue, Dec 19, 2023 at 08:35:17PM +0800, Yanteng Si wrote:
> 
> 在 2023/12/14 23:15, Serge Semin 写道:
> > Hi Yanteng
> > 
> > On Wed, Dec 13, 2023 at 06:12:22PM +0800, Yanteng Si wrote:
> > > v6:
> > > 
> > > * Refer to Serge's suggestion:
> > >    - Add new platform feature flag:
> > >      include/linux/stmmac.h:
> > >      +#define STMMAC_FLAG_HAS_LGMAC			BIT(13)
> > > 
> > >    - Add the IRQs macros specific to the Loongson Multi-channels GMAC:
> > >       drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h:
> > >       +#define DMA_INTR_ENA_NIE_LOONGSON 0x00060000	/* Normal Loongson Tx/Rx Summary */
> > >       #define DMA_INTR_ENA_NIE 0x00010000	/* Normal Summary */
> > >       ...
> > > 
> > >    - Drop all of redundant changes that don't require the
> > >      prototypes being converted to accepting the stmmac_priv
> > >      pointer.
> > > 
> > > * Refer to andrew's suggestion:
> > >    - Drop white space changes.
> > >    - break patch up into lots of smaller parts.
> > >       Some small patches have been put into another series as a preparation
> > >       see <https://lore.kernel.org/loongarch/cover.1702289232.git.siyanteng@loongson.cn/T/#t>
> > >       *note* : This series of patches relies on the three small patches above.
> > > * others
> > >    - Drop irq_flags changes.
> > >    - Changed patch order.
> > Thanks for submitting the updated series. I'll have a closer look at
> > it on the next week.
> 

> I have prepared a new patch version and will CC you soon, so you can go
> straight
> 
> to the v7.

If you think you settled all the Andrew's comment, you can go ahead
and submit v7. I'll look at it tomorrow.

-Serge(y)

> 
> 
> Thank,
> 
> Yanteng
> 
> > 
> > -Serge(y)
> > 
> > > 
> > > 
> > > v4 -> v5:
> > > 
> > > * Remove an ugly and useless patch (fix channel number).
> > > * Remove the non-standard dma64 driver code, and also remove
> > >    the HWIF entries, since the associated custom callbacks no
> > >    longer exist.
> > > * Refer to Serge's suggestion: Update the dwmac1000_dma.c to
> > >    support the multi-DMA-channels controller setup.
> > > 
> > > See:
> > > v4: <https://lore.kernel.org/loongarch/cover.1692696115.git.chenfeiyang@loongson.cn/>
> > > v3: <https://lore.kernel.org/loongarch/cover.1691047285.git.chenfeiyang@loongson.cn/>
> > > v2: <https://lore.kernel.org/loongarch/cover.1690439335.git.chenfeiyang@loongson.cn/>
> > > v1: <https://lore.kernel.org/loongarch/cover.1689215889.git.chenfeiyang@loongson.cn/>
> > > 
> > > Yanteng Si (9):
> > >    net: stmmac: Pass stmmac_priv and chan in some callbacks
> > >    net: stmmac: dwmac-loongson: Refactor code for loongson_dwmac_probe()
> > >    net: stmmac: dwmac-loongson: Add full PCI support
> > >    net: stmmac: Add multi-channel supports
> > >    net: stmmac: Add Loongson-specific register definitions
> > >    net: stmmac: dwmac-loongson: Add MSI support
> > >    net: stmmac: dwmac-loongson: Add GNET support
> > >    net: stmmac: dwmac-loongson: Disable flow control for GMAC
> > >    net: stmmac: Disable coe for some Loongson GNET
> > > 
> > >   drivers/net/ethernet/stmicro/stmmac/common.h  |   1 +
> > >   .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 296 ++++++++++++++----
> > >   .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |   2 +-
> > >   .../ethernet/stmicro/stmmac/dwmac1000_dma.c   |  61 +++-
> > >   .../ethernet/stmicro/stmmac/dwmac100_dma.c    |   2 +-
> > >   .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |   2 +-
> > >   .../net/ethernet/stmicro/stmmac/dwmac_dma.h   |  47 ++-
> > >   .../net/ethernet/stmicro/stmmac/dwmac_lib.c   |  65 ++--
> > >   .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |   2 +-
> > >   drivers/net/ethernet/stmicro/stmmac/hwif.c    |   8 +-
> > >   drivers/net/ethernet/stmicro/stmmac/hwif.h    |  11 +-
> > >   .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   6 +
> > >   .../net/ethernet/stmicro/stmmac/stmmac_main.c |  13 +-
> > >   include/linux/stmmac.h                        |   4 +
> > >   14 files changed, 413 insertions(+), 107 deletions(-)
> > > 
> > > -- 
> > > 2.31.4
> > > 
> 
