Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5E05C060
	for <loongarch@lists.linux.dev>; Thu, 14 Dec 2023 15:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFcRYG1c"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-20315d10afaso1696676fac.0
        for <loongarch@lists.linux.dev>; Thu, 14 Dec 2023 07:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702566935; x=1703171735; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wb1/c99fDx2vxrOG/BjC5kU3A8NpbcUe6YaEnqoVq+s=;
        b=eFcRYG1cZ5BVme7hIsD5utPX9aeT62WYrrahDtr4yGiUv6oFY77kgVcyNoHz+nLEvS
         u5epvA7IQ1/twfEx7aazPjfRZ1jJjQXbT0EAHuMMOJhhDM5QdrnRBJ43QzYWvgj263SG
         0NNESZ6YtTOvgJ4KdWO3KqyqP1xmMBLQQ1j1pIOzkIcOqSRWimUP1Hou/Ou3rIoVl0EA
         dvtFg0+D1iuQqiCX4ND7K/G2w8s7qX0oM4hSQT39PDZAHnfOpTI5DH30E47uHUx6BSgl
         eBa0Ps2HkNNIxTliT2GRbfV4Evmf0s3RTQ0jUW6x4MEWhlx4mAFteIkbqf158YpotZCt
         xwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702566935; x=1703171735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wb1/c99fDx2vxrOG/BjC5kU3A8NpbcUe6YaEnqoVq+s=;
        b=pJpsELLUJGBuwB7Hw5mfKqKKVd3uFJI7cm6I7MGCK3Avzyo8RIi77BWcxbkFzO9sVv
         DqnoMYFDLD/iN3tsiOg0/3rQXDjo7SO2QdzGj3zPeLFqDSinJOOoL8511eQx7+34dSCj
         JaZVfwQQ72//M/vqhlINOYh9rU0nabVwRLYRRkMKf3yaatPYmPTbS1yETBwPAfbJqFWs
         SfzHrI0gmjGdWaqWmsHajG//eedV2y1ykHZ6CaLdo7DUH7GK5hSzpph713+C03FEeolI
         kc4jPK8E8JiJ3CXlQDWi762ReFAGCA859jL9xqFKU4zfDIjC57X37f0wXbtnZSQ374Bh
         bbLQ==
X-Gm-Message-State: AOJu0Yx6bJGoKjCY5PFRl9ukwXWSZMKT3MNzzhkeJwrsmGNuKiDh7+qc
	Ii3ZlhMFjPkMsEwOoJseJsU=
X-Google-Smtp-Source: AGHT+IEPfMadRV3cTITiKW5mlEGOHNGhNvsrfOl026TFEUVp+domMSgFVqmzh2kXUESW9AXEtzPilA==
X-Received: by 2002:a05:6870:a693:b0:203:506a:326e with SMTP id i19-20020a056870a69300b00203506a326emr715873oam.79.1702566934908;
        Thu, 14 Dec 2023 07:15:34 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id d24-20020a67fb18000000b004665bd1453asm160375vsr.30.2023.12.14.07.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 07:15:34 -0800 (PST)
Date: Thu, 14 Dec 2023 18:15:30 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Yanteng Si <siyanteng@loongson.cn>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, Jose.Abreu@synopsys.com, 
	chenhuacai@loongson.cn, linux@armlinux.org.uk, guyinggang@loongson.cn, 
	netdev@vger.kernel.org, loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
Subject: Re: [PATCH v6 0/9] stmmac: Add Loongson platform support
Message-ID: <pwdr6mampxe33jpqdf6o5xczgd4qkdttqj4tvionxl7qbry2ek@hpadl7wi4zni>
References: <cover.1702458672.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1702458672.git.siyanteng@loongson.cn>

Hi Yanteng

On Wed, Dec 13, 2023 at 06:12:22PM +0800, Yanteng Si wrote:
> v6:
> 
> * Refer to Serge's suggestion:
>   - Add new platform feature flag:
>     include/linux/stmmac.h:
>     +#define STMMAC_FLAG_HAS_LGMAC			BIT(13)
> 
>   - Add the IRQs macros specific to the Loongson Multi-channels GMAC:
>      drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h:
>      +#define DMA_INTR_ENA_NIE_LOONGSON 0x00060000	/* Normal Loongson Tx/Rx Summary */
>      #define DMA_INTR_ENA_NIE 0x00010000	/* Normal Summary */
>      ...
> 
>   - Drop all of redundant changes that don't require the
>     prototypes being converted to accepting the stmmac_priv
>     pointer.
> 
> * Refer to andrew's suggestion:
>   - Drop white space changes.
>   - break patch up into lots of smaller parts.
>      Some small patches have been put into another series as a preparation
>      see <https://lore.kernel.org/loongarch/cover.1702289232.git.siyanteng@loongson.cn/T/#t>
>      
>      *note* : This series of patches relies on the three small patches above.
> * others
>   - Drop irq_flags changes.
>   - Changed patch order.

Thanks for submitting the updated series. I'll have a closer look at
it on the next week.

-Serge(y)

> 
> 
> 
> v4 -> v5:
> 
> * Remove an ugly and useless patch (fix channel number).
> * Remove the non-standard dma64 driver code, and also remove
>   the HWIF entries, since the associated custom callbacks no
>   longer exist.
> * Refer to Serge's suggestion: Update the dwmac1000_dma.c to
>   support the multi-DMA-channels controller setup.
> 
> See:
> v4: <https://lore.kernel.org/loongarch/cover.1692696115.git.chenfeiyang@loongson.cn/>
> v3: <https://lore.kernel.org/loongarch/cover.1691047285.git.chenfeiyang@loongson.cn/>
> v2: <https://lore.kernel.org/loongarch/cover.1690439335.git.chenfeiyang@loongson.cn/>
> v1: <https://lore.kernel.org/loongarch/cover.1689215889.git.chenfeiyang@loongson.cn/>
> 
> Yanteng Si (9):
>   net: stmmac: Pass stmmac_priv and chan in some callbacks
>   net: stmmac: dwmac-loongson: Refactor code for loongson_dwmac_probe()
>   net: stmmac: dwmac-loongson: Add full PCI support
>   net: stmmac: Add multi-channel supports
>   net: stmmac: Add Loongson-specific register definitions
>   net: stmmac: dwmac-loongson: Add MSI support
>   net: stmmac: dwmac-loongson: Add GNET support
>   net: stmmac: dwmac-loongson: Disable flow control for GMAC
>   net: stmmac: Disable coe for some Loongson GNET
> 
>  drivers/net/ethernet/stmicro/stmmac/common.h  |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 296 ++++++++++++++----
>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |   2 +-
>  .../ethernet/stmicro/stmmac/dwmac1000_dma.c   |  61 +++-
>  .../ethernet/stmicro/stmmac/dwmac100_dma.c    |   2 +-
>  .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |   2 +-
>  .../net/ethernet/stmicro/stmmac/dwmac_dma.h   |  47 ++-
>  .../net/ethernet/stmicro/stmmac/dwmac_lib.c   |  65 ++--
>  .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/hwif.c    |   8 +-
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    |  11 +-
>  .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   6 +
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  13 +-
>  include/linux/stmmac.h                        |   4 +
>  14 files changed, 413 insertions(+), 107 deletions(-)
> 
> -- 
> 2.31.4
> 
