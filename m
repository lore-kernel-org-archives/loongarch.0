Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F069F3E2ADD
	for <loongarch@lists.linux.dev>; Fri,  9 Oct 2026 09:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537607; cv=none; b=SmsmOBVbu/CgW1BNdtFUJ+xTqN4qWyBffId+xtpsENiE8CvwvFeERN2aZ5o+0LcmE7RNy4XtwyLnlZ9B/VGu8x7XwRZ3kEj89AxFcU+M6kIHBw2XMAYph4PJl15YVnPtnfaSR9LAV+peoPndlpLv44NGkWIOpkIeny02dxceZ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537607; c=relaxed/simple;
	bh=nhG3/rieSjC5NNr0qWIYRx/E2bze2PWXFEaFpLXt8rE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iCdLsztLRZSmeGLWakBLmNzOW7vE4qenIqipmJ9vhewyc+SMtjHrTdl78ky+0r7R2d4sC3G5pT0AoyU7orG5GvTL3VaCVbpCtlZReGwM8ocQne6BIQh65vOyEM8M87di+RK1eG9XBrbACI5pEQQVfAoNJmPVjgeO4f//H6i1GuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.159])
	by gateway (Coremail) with SMTP id _____8CxutG7schqZRUUAA--.58735S3;
	Fri, 09 Oct 2026 17:19:56 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.159])
	by front1 (Coremail) with SMTP id qMiowJDxBc22schqA2cqAA--.61825S2;
	Fri, 09 Oct 2026 17:19:51 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 0/3] Add Loongson-2K0300 APB DMA mux support
Date: Fri,  9 Oct 2026 17:19:31 +0800
Message-ID: <cover.1791535540.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxBc22schqA2cqAA--.61825S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEPCGrIS3YGyAAAsW
X-Coremail-Antispam: 1Uk129KBj93XoW7CF1DZFW8XFW8uw18JF13trc_yoW8try5pa
	9xC3yakFyUtFy7Aws5Ja48Zr4rZ3sxJa42gayaqw1qka9xG34qq3WIyF1jvr17Cr18AFW2
	vFykCFW8GF17ZrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF
	7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU1vPfJUUUUU==

Hi all:

Loongson-2K0300 integrates a CMC DMA controller with 8 physical
channels. Peripheral DMA requests are not hard-wired to these channels;
they are routed through the CHIP_CTRL13/14/15 DMA_MAP fields.

This series adds support for that DMA request router.

Patch 1 adds the DT binding constants for the peripheral request IDs.
Patch 2 adds the DT binding documentation for the DMA mux.
Patch 3 adds the driver, Kconfig symbol and Makefile entry.

The driver registers with of_dma_router_register(). In the route
allocation callback it validates the <request> <channel> <flags>
specifier, programs the SoC-specific route register, and forwards
<channel> <flags> to the parent CMC DMA controller.

Thanks.
Binbin.

=========
V2:
Patch(1/3):
 - Drop LS2K0300_DMA_REQ_MAX as it is not part of the ABI;
Patch(2/3):
 - More detailed description of `dma-cells`;
 - Add the `dma_requests` constraint
Patch(3/3):
 - Drop loongson2_dmamux_map->shift;
 - Move of_parse_phandle() into loongson2_dmamux_route_allocate() avoid
   UAF;
 - Drop loongson2_dmamux->dma_np;
 - Check dma_requests;
 - Add devm_add_action_or_reset() instead of .remove();
 - Replace `metux()` with `spinlock()`, which has lower overhead;
 - Add loongson2_dmamux_route_free().

Link to V1:
https://lore.kernel.org/all/cover.1790068409.git.zhoubinbin@loongson.cn/

Binbin Zhou (3):
  dt-bindings: dma: loongson: Add Loongson-2 DMA mux request IDs
  dt-bindings: dma: loongson: Add Loongson-2K0300 DMA mux support
  dmaengine: loongson: Add Loongson-2K0300 APB DMA mux driver

 .../dma/loongson,ls2k0300-dmamux.yaml         |  72 ++++
 MAINTAINERS                                   |   3 +
 drivers/dma/loongson/Makefile                 |   1 +
 drivers/dma/loongson/loongson2-apb-dmamux.c   | 398 ++++++++++++++++++
 .../dt-bindings/dma/loongson,ls2k-dmamux.h    |  53 +++
 5 files changed, 527 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
 create mode 100644 drivers/dma/loongson/loongson2-apb-dmamux.c
 create mode 100644 include/dt-bindings/dma/loongson,ls2k-dmamux.h


base-commit: 1d8ae2003de08f61095e4e928b1b8cce6c23cabd
-- 
2.52.0

