Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A648C33AD9B
	for <loongarch@lists.linux.dev>; Fri, 29 May 2026 14:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063586; cv=none; b=eYuUyGXMsY78bhL10whgz1xa6R46aEj0DOTq3mXe41JoJXKYixBV+9kIJpBIzKD+wcD5WvEAvhTm2BQ2l/5svjVPuF7uQ4C6tYhy72U33p/5qZ71it1xqV7wdtvzJNx5DtTAovhfBvBzQzjxdx8v0nABaMviq+rhAbPahE1GlJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063586; c=relaxed/simple;
	bh=yHHY+aPkWIbAKYPrgocf26yZ+rcrEiBBFVvIcrfV7aE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MY4gVxEDqP8R86Whtc53JBO+FrNGmlyosdE4+fDsxqr8x5d9cugR1nwiKZxGiXXjLk75uIdfsBUGsT78A+Rg9cfO57JQC2JTOk4NBferdV/+vuO0aC++EeVxKIaEAGwPqZxcquVbbC5ODNFVlr6gwHv8jybwuQ19sPX3nDQRPP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8CxQ_BXnRlqWY8OAA--.41043S3;
	Fri, 29 May 2026 22:06:15 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJBxrsJPnRlqqRKVAA--.64350S2;
	Fri, 29 May 2026 22:06:14 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Gabriel Somlo <somlo@cmu.edu>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: qemu-devel@nongnu.org,
	loongarch@lists.linux.dev,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] fw_cfg: Add support for LoongArch architecture
Date: Fri, 29 May 2026 22:05:59 +0800
Message-ID: <20260529140559.1775511-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxrsJPnRlqqRKVAA--.64350S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJrW8Wry8tFW5GFyUGw15trc_yoW8Wry5pr
	4DXFWjkrWrJa1FgrZrJa1q9r1aqas3JrZrua47Aa1qv3W3A3ykJr98AFW5tFyqvr4vyFWY
	kF1fKw1a9F1vkagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1YL9UUUUU=

Qemu fw_cfg support was missing for LoongArch, which made some functions
unusable in virtual machines. So add the missing LoongArch defines.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/firmware/Kconfig       | 2 +-
 drivers/firmware/qemu_fw_cfg.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index bbd2155d8483..9ec747716389 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -121,7 +121,7 @@ config RASPBERRYPI_FIRMWARE
 
 config FW_CFG_SYSFS
 	tristate "QEMU fw_cfg device support in sysfs"
-	depends on SYSFS && (ARM || ARM64 || PARISC || PPC_PMAC || RISCV || SPARC || X86)
+	depends on SYSFS && (ARM || ARM64 || LOONGARCH || PARISC || PPC_PMAC || RISCV || SPARC || X86)
 	depends on HAS_IOPORT_MAP
 	default n
 	help
diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index 87a5421bc7d5..0c51a9df589f 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -211,7 +211,7 @@ static void fw_cfg_io_cleanup(void)
 
 /* arch-specific ctrl & data register offsets are not available in ACPI, DT */
 #if !(defined(FW_CFG_CTRL_OFF) && defined(FW_CFG_DATA_OFF))
-# if (defined(CONFIG_ARM) || defined(CONFIG_ARM64) || defined(CONFIG_RISCV))
+# if (defined(CONFIG_ARM) || defined(CONFIG_ARM64) || defined(CONFIG_LOONGARCH) || defined(CONFIG_RISCV))
 #  define FW_CFG_CTRL_OFF 0x08
 #  define FW_CFG_DATA_OFF 0x00
 #  define FW_CFG_DMA_OFF 0x10
-- 
2.52.0

