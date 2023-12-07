Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CC914F9A
	for <loongarch@lists.linux.dev>; Thu,  7 Dec 2023 07:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="do0kg7vm"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-db549f869a3so745201276.1
        for <loongarch@lists.linux.dev>; Wed, 06 Dec 2023 23:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701934967; x=1702539767; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xATSf1mKGxc0Izf+E9mhfmBLrFa4vSy5SZKU8hVo4UI=;
        b=do0kg7vmdTrVq1PNtn2XXXTn/YNsqsIUNDGuBJ1RysFsQdjH+mecxqGFsjc0u5jCN4
         hUb5wzQUInfvlmu/RrCPQ24eooFR66cmyjsJImdLQuyHiFFOjToPndoXi4hM1/mIidDW
         kIFEMO/e/0xuQ/CxOnbTV2W6RWrdNRBm1Ogw11Whv6hDOXjO2YrD1xIsD58DaFQCjiq5
         hx2pYueVcyGHn7pW/sJeJy2Mom3z3mXumWzkUfuuk1T+3HVEL6Cq8IE4/9vKC95M3iDs
         Ad9N2WuN2GXJTxwbymBaXB2mNOhI9xF+FWqvFdiRckIqtXpyDwL33AkQEbObs1BZBjXM
         eVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701934967; x=1702539767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xATSf1mKGxc0Izf+E9mhfmBLrFa4vSy5SZKU8hVo4UI=;
        b=YSh41KeTbrt3nLOcxX3zaqVNr163mi42OWeQZFww84D2G7glUJ7E0jM+OdANBh4YRO
         hE0sMWSemPiwspbqzhSV+CU6ySHW4yggTApchJRcZzmGFARfnvOuxHkblDtClHu+9zmz
         lNrISYHCIpj61s4VS5CsNshqmtWMe8JsciOyGCk2Z21FjGECHfSUc3+Eg+ZCAI+4c6Wc
         kHp2q2BqYzz3ChIlozjVniPqkEzuDYOoGgUQ1nT6rfCp95FSX5tSZinXuUP0xCdIQ8vO
         hwwosN/uvMg1KGV2mujvzZkLtXY6giqmd2B5TDPsFyMV4ljhwQ8tmFQHD3SZbI3I/9v0
         DZtA==
X-Gm-Message-State: AOJu0Ywmk4SNUKNHgFQS+N1Z9R1Loj5J5dybSaUbVaVnWaqRzWBuk6AK
	7lzzkPMllPi5P5gLfD4u9CIqvT7DCaOs0WvfpJ8=
X-Google-Smtp-Source: AGHT+IEW0mODy37dFWhUY4yRWuukw0NSZavDDe4/boxu94cJxA4p9htNWyfWPlcrhg//95Max1io8ZK1yfKK130e4J8=
X-Received: by 2002:a25:d60a:0:b0:db7:dacf:ed70 with SMTP id
 n10-20020a25d60a000000b00db7dacfed70mr1970234ybg.81.1701934967186; Wed, 06
 Dec 2023 23:42:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1700644483.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1700644483.git.zhoubinbin@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 7 Dec 2023 13:42:36 +0600
Message-ID: <CAMpQs4KJpXotjhZO9tt_jQn+4HDkwros-=9hvDcys-Z5LGsmxA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] New driver for the Loongson LS2X APB DMA Controller
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, Yingkun Meng <mengyingkun@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 3:27=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Hi all:
>
> This patchset introduces you to the LS2X apbdma controller.
>
> The Loongson LS2X APB DMA controller is available on Loongson-2K chips.
> It is a single-channel, configurable DMA controller IP core based on the
> AXI bus, whose main function is to integrate DMA functionality on a chip
> dedicated to carrying data between memory and peripherals in APB bus
> (e.g. nand).

Hi Vinod:

Gentle ping. Any comments on this series of patches?

Thanks.
Binbin
>
> Thanks.
>
> ----
> V5:
> patch(2/2):
>  - Rebase on dmaengine/next;
>  - Annotate struct ls2x_dma_sg with __counted_by;
>  - .remove()->.remove_new();
>  - Drop duplicate assignments in ls2x_dma_chan_init().
>
> Link to V4:
> https://lore.kernel.org/all/cover.1691647870.git.zhoubinbin@loongson.cn/
>
> V4:
> patch(2/2)
>   - Drop linux/of_device.h;
>   - Meaningful parameter name for ls2x_dma_fill_desc(): i->sg_index;
>   - Check the slave config and reject invalid configurations;
>   - Update data width handle;
>   - Use generic xlate: of_dma_xlate_by_chan_id().
>
> Link to V3:
> https://lore.kernel.org/dmaengine/cover.1689075791.git.zhoubinbin@loongso=
n.cn/
>
> V3:
> patch(1/2)
>   - Add clocks property;
>   - Drop dma-channels property, for we are single-channel dmac.
> patch(2/2)
>   - Add clk support.
>
> Link to V2:
> https://lore.kernel.org/dmaengine/cover.1686192243.git.zhoubinbin@loongso=
n.cn/
>
> V2:
> patch(1/2)
>   - Minor changes from Conor;
>   - Add Reviewed-by tag.
> patch(2/2)
>   - Fix build errors from lkp@intel.com.
>
> Link to V1:
> https://lore.kernel.org/dmaengine/cover.1685448898.git.zhoubinbin@loongso=
n.cn/
>
> Binbin Zhou (2):
>   dt-bindings: dmaengine: Add Loongson LS2X APB DMA controller
>   dmaengine: ls2x-apb: new driver for the Loongson LS2X APB DMA
>     controller
>
>  .../bindings/dma/loongson,ls2x-apbdma.yaml    |  62 ++
>  MAINTAINERS                                   |   7 +
>  drivers/dma/Kconfig                           |  14 +
>  drivers/dma/Makefile                          |   1 +
>  drivers/dma/ls2x-apb-dma.c                    | 705 ++++++++++++++++++
>  5 files changed, 789 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2x-a=
pbdma.yaml
>  create mode 100644 drivers/dma/ls2x-apb-dma.c
>
> --
> 2.39.3
>
