Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F321FBF
	for <loongarch@lists.linux.dev>; Mon, 18 Dec 2023 01:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.176])
	by gateway (Coremail) with SMTP id _____8Bx6ujqpn9lueYBAA--.10085S3;
	Mon, 18 Dec 2023 09:56:58 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.176])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxkuPopn9limEJAA--.45156S2;
	Mon, 18 Dec 2023 09:56:56 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Yingkun Meng <mengyingkun@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v6 0/2] New driver for the Loongson LS2X APB DMA Controller
Date: Mon, 18 Dec 2023 09:56:37 +0800
Message-Id: <cover.1702365725.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxkuPopn9limEJAA--.45156S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ur43WFW7JFyDJw18Xr17XFc_yoW8Kr43pF
	W3uayakF1jqFyxCrs3J348ur1Sv3WfJ3sxWa9xA34DZay7ur12v34fKan0vFW7AFWxKFWj
	qFZ3Ga4UCFnFvrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv
	67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87
	Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUx5fQDUUUU

Hi all:

This patchset introduces you to the LS2X apbdma controller.

The Loongson LS2X APB DMA controller is available on Loongson-2K chips.
It is a single-channel, configurable DMA controller IP core based on the
AXI bus, whose main function is to integrate DMA functionality on a chip
dedicated to carrying data between memory and peripherals in APB bus
(e.g. nand).

Thanks.

----
V6:
patch(2/2):
 - Use GFP_NOWAIT as the flag for allocating descriptor memory;
 - Drop superfluous init in ls2x_dma_write_cmd().

Thanks to Vinod for the suggestions.

Link to V5:
https://lore.kernel.org/dmaengine/cover.1700644483.git.zhoubinbin@loongson.cn/

V5:
patch(2/2):
 - Rebase on dmaengine/next;
 - Annotate struct ls2x_dma_sg with __counted_by;
 - .remove()->.remove_new()
 - Drop duplicate assignments in ls2x_dma_chan_init().

Link to V4:
https://lore.kernel.org/all/cover.1691647870.git.zhoubinbin@loongson.cn/

V4:
patch(2/2)
  - Drop linux/of_device.h;
  - Meaningful parameter name for ls2x_dma_fill_desc(): i->sg_index; 
  - Check the slave config and reject invalid configurations;
  - Update data width handle;
  - Use generic xlate: of_dma_xlate_by_chan_id().

Link to V3:
https://lore.kernel.org/dmaengine/cover.1689075791.git.zhoubinbin@loongson.cn/

V3:
patch(1/2)
  - Add clocks property;
  - Drop dma-channels property, for we are single-channel dmac.
patch(2/2)
  - Add clk support. 

Link to V2:
https://lore.kernel.org/dmaengine/cover.1686192243.git.zhoubinbin@loongson.cn/

V2:
patch(1/2)
  - Minor changes from Conor;
  - Add Reviewed-by tag.
patch(2/2)
  - Fix build errors from lkp@intel.com.

Link to V1:
https://lore.kernel.org/dmaengine/cover.1685448898.git.zhoubinbin@loongson.cn/

Binbin Zhou (2):
  dt-bindings: dmaengine: Add Loongson LS2X APB DMA controller
  dmaengine: ls2x-apb: new driver for the Loongson LS2X APB DMA
    controller

 .../bindings/dma/loongson,ls2x-apbdma.yaml    |  62 ++
 MAINTAINERS                                   |   7 +
 drivers/dma/Kconfig                           |  14 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/ls2x-apb-dma.c                    | 705 ++++++++++++++++++
 5 files changed, 789 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
 create mode 100644 drivers/dma/ls2x-apb-dma.c

-- 
2.39.3

