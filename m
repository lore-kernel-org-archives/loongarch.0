Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2680C637
	for <loongarch@lists.linux.dev>; Thu,  8 Jun 2023 02:55:45 +0000 (UTC)
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8Dxi+owQ4Fkn1oAAA--.1294S3;
	Thu, 08 Jun 2023 10:55:44 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxTMouQ4FkIFQGAA--.12049S2;
	Thu, 08 Jun 2023 10:55:43 +0800 (CST)
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
	loongson-kernel@lists.loongnix.cn,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Yingkun Meng <mengyingkun@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH RESEND v2 0/2] New driver for the Loongson LS2X APB DMA Controller
Date: Thu,  8 Jun 2023 10:55:29 +0800
Message-ID: <cover.1686192243.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxTMouQ4FkIFQGAA--.12049S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtF4xXFWrCw1rZrWrGrWUJrc_yoWkArgE9F
	yFqFZ7Arn8uF17CFWjvr4fXFy3ZF4jg34F9a4Utr1S9F1fJrn0gFyvyrZ3u3WIgFs8ur17
	urW0qr1xA3W7JosvyTuYvTs0mTUanT9S1TB71UUUU17qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbaxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWr
	XVW3AwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
	xhVjvjDU0xZFpf9x07b1UUUUUUUU=
Message-ID: <20230608025529.JbAUXH6tjB9lYBcbV7R9wzmH29cVHEWKhbBsD1rhchE@z>

Hi all:

This patchset introduces you to the LS2X apbdma controller.

The Loongson LS2X APB DMA controller is available on Loongson-2K chips.
It is a single-channel, configurable DMA controller IP core based on the
AXI bus, whose main function is to integrate DMA functionality on a chip
dedicated to carrying data between memory and peripherals in APB bus
(e.g. nand).

Thanks.

----
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

 .../bindings/dma/loongson,ls2x-apbdma.yaml    |  61 ++
 drivers/dma/Kconfig                           |  14 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/ls2x-apb-dma.c                    | 644 ++++++++++++++++++
 4 files changed, 720 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
 create mode 100644 drivers/dma/ls2x-apb-dma.c

-- 
2.39.3

