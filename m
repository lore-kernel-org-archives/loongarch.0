Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612BB79D7
	for <loongarch@lists.linux.dev>; Wed, 31 May 2023 08:50:20 +0000 (UTC)
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8Cx5fBKCndku+gCAA--.6491S3;
	Wed, 31 May 2023 16:50:18 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxKL1ICndkqxyCAA--.14919S2;
	Wed, 31 May 2023 16:50:18 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Yingkun Meng <mengyingkun@loongson.cn>,
	loongson-kernel@lists.loongnix.cn,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 0/2] New driver for the Loongson LS2X APB DMA Controller
Date: Wed, 31 May 2023 16:50:03 +0800
Message-Id: <cover.1685448898.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxKL1ICndkqxyCAA--.14919S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvdXoWrZFyxWr47tr1kKw15Cw45Jrb_yoWfCrgEvF
	ySqFZ7Zrn8CFy7ZFWjvr4fJFy3ZF4UX3409a4Utr1S93W3Zw1aqa4vyrZ7u3WIgFZ8ur13
	ur40gr1xA3WUJjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	j7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
	xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
	CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_Gr
	UvcSsGvfC2KfnxnUUI43ZEXa7IU8HSoJUUUUU==

Hi all:

This patchset introduces you to the Loongson LS2X apbdma controller.

The Loongson LS2X APB DMA controller is available on Loongson-2K chips.
It is a single-channel, configurable DMA controller IP core based on the
AXI bus, whose main function is to integrate DMA functionality on a chip
dedicated to carrying data between memory and peripherals in APB bus
(e.g. nand).

Thanks.

Binbin Zhou (2):
  dt-bindings: dmaengine: Add Loongson LS2X APB DMA controller
  dmaengine: ls2x-apb: new driver for the Loongson LS2X APB DMA
    controller

 .../bindings/dma/loongson,ls2x-apbdma.yaml    |  61 ++
 drivers/dma/Kconfig                           |  14 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/ls2x-apb-dma.c                    | 642 ++++++++++++++++++
 4 files changed, 718 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
 create mode 100644 drivers/dma/ls2x-apb-dma.c

-- 
2.39.1

