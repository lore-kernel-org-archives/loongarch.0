Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC7D28382
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 06:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754892169; cv=none; b=LzwJcYHeMl/Jtr0kZ0+Q0TSFtB6L05D26LE2rUwhDCTXoUkhzNSHyuXK62FoH2OfC0p6qlUr/hmfsA2opjbZV18H2p81f9pM4pQD/rvubgdw195bJf74oMbRlPKpTTXiEdn5hKRcP4fAViWuiqwey2Ujt1hrJ9gp8vzkJoLvw5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754892169; c=relaxed/simple;
	bh=ZRSdowreclX0O3QLmDdTkjFxPc+QBdAPCbohyOIwGTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/VqpkpwP+P9mvCupxN4IKJBvgu4mvt2yRY15Obnk1WYs977zfU1PQ0MB3CNfwLlCp7UQpLRQDxA/s27YRIbeu6dvSOLC6UP4tcLwHHlejgn/6EMU9JEbnqiwRXPCwtXsdyvI3pVDSjWZGJ3l/qNeorkl8bOKrRaYcmNqo3G0zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.45])
	by gateway (Coremail) with SMTP id _____8Cx_eKDh5loTUI+AQ--.12199S3;
	Mon, 11 Aug 2025 14:02:43 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.45])
	by front1 (Coremail) with SMTP id qMiowJAxE+R8h5loyFRCAA--.51398S4;
	Mon, 11 Aug 2025 14:02:42 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 2/8] mtd: rawnand: loongson: Rename loongson1 to loongson
Date: Mon, 11 Aug 2025 14:02:26 +0800
Message-ID: <47545b7ed4943a088b27021a0fdbeaf56947e833.1754890670.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1754890670.git.zhoubinbin@loongson.cn>
References: <cover.1754890670.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxE+R8h5loyFRCAA--.51398S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGF18trykWFy5GFyDZrWDAwc_yoW5Ww4fpF
	1UA3y7CF1UtF45Z3s0ga48Gr15Zas7JryDGa9rX34093s7X34Uuwn0yF1rtF47JF12qr47
	Zr93Wan5CFs8ArbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4ApnDUUUU

The second step in preparing to add Loongson-2K support is to change the
names of the driver files and Kconfig options from Loongson1-specific to
Loongson-generic.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 MAINTAINERS                                                 | 2 +-
 drivers/mtd/nand/raw/Kconfig                                | 6 +++---
 drivers/mtd/nand/raw/Makefile                               | 2 +-
 ...ongson1-nand-controller.c => loongson-nand-controller.c} | 0
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/mtd/nand/raw/{loongson1-nand-controller.c => loongson-nand-controller.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4bac4ea21b64..cc502582c9f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16722,7 +16722,7 @@ F:	Documentation/devicetree/bindings/*/loongson,ls1*.yaml
 F:	arch/mips/include/asm/mach-loongson32/
 F:	arch/mips/loongson32/
 F:	drivers/*/*loongson1*
-F:	drivers/mtd/nand/raw/loongson1-nand-controller.c
+F:	drivers/mtd/nand/raw/loongson-nand-controller.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
 F:	sound/soc/loongson/loongson1_ac97.c
 
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 4b99d9c422c3..d9e3f13666ac 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -462,12 +462,12 @@ config MTD_NAND_NUVOTON_MA35
 	  Enables support for the NAND controller found on
 	  the Nuvoton MA35 series SoCs.
 
-config MTD_NAND_LOONGSON1
-	tristate "Loongson1 NAND controller"
+config MTD_NAND_LOONGSON
+	tristate "Loongson NAND controller"
 	depends on LOONGSON1_APB_DMA || COMPILE_TEST
 	select REGMAP_MMIO
 	help
-	  Enables support for NAND controller on Loongson1 SoCs.
+	  Enables support for NAND controller on Loongson family chips.
 
 comment "Misc"
 
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 711d043ad4f8..c182b9703a9e 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -59,7 +59,7 @@ obj-$(CONFIG_MTD_NAND_ROCKCHIP)		+= rockchip-nand-controller.o
 obj-$(CONFIG_MTD_NAND_PL35X)		+= pl35x-nand-controller.o
 obj-$(CONFIG_MTD_NAND_RENESAS)		+= renesas-nand-controller.o
 obj-$(CONFIG_MTD_NAND_NUVOTON_MA35)	+= nuvoton-ma35d1-nand-controller.o
-obj-$(CONFIG_MTD_NAND_LOONGSON1)	+= loongson1-nand-controller.o
+obj-$(CONFIG_MTD_NAND_LOONGSON)		+= loongson-nand-controller.o
 
 nand-objs := nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_ids.o
 nand-objs += nand_onfi.o
diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
similarity index 100%
rename from drivers/mtd/nand/raw/loongson1-nand-controller.c
rename to drivers/mtd/nand/raw/loongson-nand-controller.c
-- 
2.47.3

