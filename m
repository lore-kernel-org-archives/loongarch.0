Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5422D376F1
	for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 06:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755758361; cv=none; b=r2jDD/R3SVgrEJ88SbQ2VmUuNHVPnrX3cbV/ETDqsoH3TsHxlm9ag2ygYWuO4/0P9xejhRIR1BYqPfFLhjmy5VL33rFTE32GG8GrcD6RZFUJMAr+4p0WPhG7MQaBxSoNTro2n09mtHPSPWqH3A4ckRukz+/e+HoQ+tpKYf64yIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755758361; c=relaxed/simple;
	bh=puOZ8EylBOhCwDG77Y4/kLzSoTNGL401eY5MqKnLoUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LvtPjaStGU80VAMopgFnc/ppk4hMv3YRuwsORZf75MMRMHESPXPKwW5okuLzbbgAN6bXbpnJkYBdKGKzNDY55XX9RSMU6Y/LmUtNU0MzMzHkfWFCna5MrhgJUSGYeHJGpBBd2/jdkVLnARbqvEODH30Llri4c3Wwp7P0xcwclWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.45])
	by gateway (Coremail) with SMTP id _____8BxG9IMv6Zog00BAA--.2287S3;
	Thu, 21 Aug 2025 14:39:08 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.45])
	by front1 (Coremail) with SMTP id qMiowJAxT+YIv6ZohPRcAA--.21919S2;
	Thu, 21 Aug 2025 14:39:06 +0800 (CST)
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
Subject: [PATCH v3 0/7] mtd: rawnand: loongson: Add Loongson-2K nand controller support
Date: Thu, 21 Aug 2025 14:38:53 +0800
Message-ID: <cover.1755757841.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxT+YIv6ZohPRcAA--.21919S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxuF17KryUWw1UCr1ktr47trc_yoW5Jw48pa
	y3u3y3GF1DtF47AFsI9a48Cr1rZryfJ39rJwsxG348C39xW345Xry0yF4rtFW7urWSqryj
	qF93GF48GF1DCFgCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxV
	WUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8aZX5UU
	UUU==

Hi all:

This patchset adds support for the Loongson-2K0500/Loongson-2K1000 NAND
controllers, which are similar to the Loongson-1C NAND controller.

They support a maximum capacity of 16GB FLASH per chip, with a maximum
page size of 8KB. The chip supports up to 4 chip selects and 4 RDY signals.

The key difference between the Loongson-2K NAND controllers is that the
Loongson-2K1000 explicitly configures the DMA controller routing, while
the Loongson-2K0500 defaults to using APBDMA0.

Summary of the patchset:
Ptach 1: Rename all prefixes from ls1x to loongson
Patch 2: Add 6-byte NAND ID reading
Patch 3: Add chip select support
Patch 4-5: Add Loongson-2K0500 NAND controller support
Patch 6-7: Add Loongson-2K1000 NAND controller support

Thanks.

-------
V3:
Patch (1/7):
  - Merge the first two rename patches;
Patch (3/7)
  - Refact chip capacity calculation. Use a big switch-case
    for writesize, and sort the big switch-case by writesize;
  - Drop the redundant 'nand_cs = 0x0';
Patch (6/7)
  - Add Reviewed-by tag from Rob, thanks.

Link to V2:
https://lore.kernel.org/all/cover.1754890670.git.zhoubinbin@loongson.cn/

V2:
Patch (5/8):
  - Add Acked-by tag from Rob, thanks;
Patch (7/8):
  - Update reg-names attribute description.

Link to V1:
https://lore.kernel.org/all/cover.1753166096.git.zhoubinbin@loongson.cn/

Binbin Zhou (6):
  mtd: rawnand: loongson1: Rename the prefix from ls1x to loongson
  mtd: rawnand: loongson: Add nand chip select support
  dt-bindings: mtd: loongson,ls1b-nand-controller: Document the
    Loongson-2K0500 NAND controller
  mtd: rawnand: loongson: Add Loongson-2K0500 NAND controller support
  dt-bindings: mtd: loongson,ls1b-nand-controller: Document the
    Loongson-2K1000 NAND controller
  mtd: rawnand: loongson: Add Loongson-2K1000 NAND controller support

Keguang Zhang (1):
  mtd: rawnand: loongson: Add 6-byte NAND ID reading support

 .../mtd/loongson,ls1b-nand-controller.yaml    |   56 +-
 MAINTAINERS                                   |    2 +-
 drivers/mtd/nand/raw/Kconfig                  |    8 +-
 drivers/mtd/nand/raw/Makefile                 |    2 +-
 .../mtd/nand/raw/loongson-nand-controller.c   | 1021 +++++++++++++++++
 .../mtd/nand/raw/loongson1-nand-controller.c  |  836 --------------
 6 files changed, 1080 insertions(+), 845 deletions(-)
 create mode 100644 drivers/mtd/nand/raw/loongson-nand-controller.c
 delete mode 100644 drivers/mtd/nand/raw/loongson1-nand-controller.c


base-commit: fb2fae70e7e985c4acb1ad96110d8b98bb64a87c
-- 
2.47.3

