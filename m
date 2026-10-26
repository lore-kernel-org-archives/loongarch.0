Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792989200;
	b=p69F/6gcwyPh1yMF4+FbsgbTIEhhaJ532bZKCZ+UQHRttkf0EcldXyzPsFAsl6ZR5a9Q
	 GS4E/XnTLx9cSF83WeSVra3+gxXA8n93wfkM9xVH1qdvYowirNcATIAHWvm3c9R66q9qn
	 7CLgAtlE98pvvI37jC+ic03prNKI9KY6OaYXxkJCgvs5Fjf04oFvdoJpJunAXZMeTmqrx
	 kuLTgX471Yqfi38JTIu6+ml/Dgeiuqx1ZXYBsAm2efQwE24IyAmP6qclP0+ze7FE7fpbG
	 9J4iuc1XFm2Y5MoEcqHr5Bp4YdJU2jWR/WE4ufzrIoyg7QOM2q8GbJ7+JyGdOODEswA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989200;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=OLaBTI8wSKAzgSQXZOyB0488XXKM5pNdxDw1IYaL8d8=;
	b=D4jSuKaFHp4kjQn08cxjI9MkDuADA5kFUAV14CpfjSjDVneuOAMj7nuZdGvRK+WDaOOZ
	 eR1Vq9wS1ZKbrVrTFAxFN9xg8VTEUq/+6sFIQBmkO40SdJwf+deeUNlKEFPuX/389Mijx
	 EfmkAb5N24ngz5jdF7A/zhvns2S+Qd0RMG9LSal2f1WOMDxBNPhEcUu+T7SeX0HdWb4kV
	 HDSrHAcxighFWhxLaP1r3GlSW+3YpkYptdD5shQwU08TypbyUl0Mfi1Ro0r4NUc1kJC+J
	 6cpnQBgFRRIJcLnXmaRDL9H0ZOw4xVeDgWRCVaRcshJQGafVOBC3VFgio9zb5dCZCoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C368606A320
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 04:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C368606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8Cx_9IL2N5qy10ZAA--.8331S3;
	Mon, 26 Oct 2026 12:33:15 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJAx1cwI2N5q6jgwAA--.7070S2;
	Mon, 26 Oct 2026 12:33:13 +0800 (CST)
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
Subject: [PATCH v3 0/2] Add Loongson-2K0300 APB DMA mux support
Date: Mon, 26 Oct 2026 12:33:04 +0800
Message-ID: <cover.1792986696.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx1cwI2N5q6jgwAA--.7070S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEMCGretPgwNQAAs5
X-Coremail-Antispam: 1Uk129KBj93XoWxGF4DZFyfuw18ZF1fCF4UAwc_yoW5Gr4rpa
	9xC3y3Kr4DtFy7Aws3Jay8urW5Zr9xJr12gFWaqw1q9a98W3yjqa1Iy3Wqvry7Cr18AFW2
	vrykCrW8GF1UZrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU84xRDUUUUU==

Hi all:

Loongson-2K0300 integrates a CMC DMA controller with 8 physical
channels. Peripheral DMA requests are not hard-wired to these channels;
they are routed through the CHIP_CTRL13/14/15 DMA_MAP fields.

This series adds support for that DMA request router.

Patch 1 adds the DT binding constants for the peripheral request IDs
and yaml file for the DMA mux.
Patch 2 adds the driver, Kconfig symbol and Makefile entry.

The driver registers with of_dma_router_register(). In the route
allocation callback it validates the <request> <channel> <flags>
specifier, programs the SoC-specific route register, and forwards
<channel> <flags> to the parent CMC DMA controller.

Thanks.
Binbin.

=========
V3:
Patch(1/2):
 - Merged the two commits containing the dt-binding header file and
   the YAML file; no other changes were made;
 - Add Acked-by tag from Conor.

Patch(2/2):
 - Append the dmamux object to the existing CMC DMA line;
 - Add loongson2_dmamux_assign_bits() helper, no functional change;
 - Add Reviewed-by tag from Frank.

Link to V2:
https://lore.kernel.org/all/cover.1791535540.git.zhoubinbin@loongson.cn/

V2:
Patch(1/3):
 - Drop LS2K0300_DMA_REQ_MAX as it is not part of the ABI;
Patch(2/3):
 - A more detailed description of `dma-cells`;
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

Binbin Zhou (2):
  dt-bindings: dma: Document DMA mux support for Loongson-2K0300
  dmaengine: loongson: Add Loongson-2K0300 APB DMA mux driver

 .../dma/loongson,ls2k0300-dmamux.yaml         |  72 ++++
 MAINTAINERS                                   |   3 +
 drivers/dma/loongson/Makefile                 |   2 +-
 drivers/dma/loongson/loongson2-apb-dmamux.c   | 404 ++++++++++++++++++
 .../dt-bindings/dma/loongson,ls2k-dmamux.h    |  53 +++
 5 files changed, 533 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
 create mode 100644 drivers/dma/loongson/loongson2-apb-dmamux.c
 create mode 100644 include/dt-bindings/dma/loongson,ls2k-dmamux.h


base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
-- 
2.52.0

