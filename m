Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A967B2063E7
	for <loongarch@lists.linux.dev>; Wed, 18 Jun 2025 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234081; cv=none; b=SXIhqUz1YmZrD9qjgfyIxG1oR4YkXWG1F+ELtOgPsjcBIpJI6NnxZ+qvaKSV3ZSuhEdr/KwE6mFvznlpMt/DztwR5iTTGLUQuLqSFApXjOm8pnv3JHQ9u42eCeaKaKZio/c1ZKU5inDxuOy2zuGdTy9MV48xyWdjgU4b4RxVWeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234081; c=relaxed/simple;
	bh=xvX4ag3gAmJrZgEy8RbSxOpykRj9bDtqzprzwDWM6LU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OzgFfGXpzW5Yq3zqB10Msxbvl0jqVrscfqaQ505t1P3wzOixV7/2kjTiLxCvVkuckce8Vnixr5jSSEocNMGlb8Qho6RcYpW3HKAZFSWMy1VYiRn37aD050IyE3U/0OIS7O6mEmQq0InVwWhTNZP8A9eArM6YhMMai/S9B0TcP3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.149])
	by gateway (Coremail) with SMTP id _____8CxNHDOc1JoVfsYAQ--.56869S3;
	Wed, 18 Jun 2025 16:07:42 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.149])
	by front1 (Coremail) with SMTP id qMiowMDxH+XIc1JoikkfAQ--.28608S2;
	Wed, 18 Jun 2025 16:07:37 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-mmc@vger.kernel.org,
	wanghongliang@loongson.cn,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 0/4] LoongArch: Introduce the Loongson-2K MMC host controller driver
Date: Wed, 18 Jun 2025 16:07:24 +0800
Message-ID: <cover.1750216134.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxH+XIc1JoikkfAQ--.28608S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCF13WF4kXFWxJF15uw18Xrc_yoW5Gr45pa
	98u343Kr4UGr43Crs3GayrAr15u345J3srGanxJw1kWay7ua4UZ3s2kFWYvFW3urW8KrW7
	ZFyruF4F9a45CrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==

Hi all:

This patchset introduce the MMC host controller on Loongson-2K series
CPUs.

They are similar, except for the interface characteristics and the use of
DMA engine, specifically, the Loongson-2K0500/Loongson-2K1000 use an
externally shared APBDMA engine, while the Loongson-2K2000 uses an
internally exclusive DMA.

Based on this, I'm splitting the driver into two patches.

List of the patchset:
Patch1: bindings for Loongson-2K0500/Loongson-2K1000;
Patch2: driver for MMC controller using externally shared APBDMA engine;
Patch3: bindings for Loongson-2K2000;
Patch4: driver for MMC controller using internally exclusive DMA.

Thanks.

-------
V3:
- Rebase on linux-mmc/next branch.
patch(1/4):
 - Rename dt-binding file as loongson,ls2k0500-mmc.yaml.
patch(2/4):
 - Fix lkp error;
    https://lore.kernel.org/all/202505081845.0NQYX2nS-lkp@intel.com/
    https://lore.kernel.org/all/202505130918.uanOGxju-lkp@intel.com/
 - Add regulators support for ios ops;
 - Add ack_sdio_irq() callback;
 - Add MMC_CAP2_SDIO_IRQ_NOTHREAD flag;
patch(3/4):
 - Add Ack-by tag.
patch(4/4):
 - Update commit for fix_data_timeout().

Link to V2:
https://lore.kernel.org/all/cover.1746581751.git.zhoubinbin@loongson.cn/

V2:
patch(1/4):
 - Add reg define for each reg entry.

patch(2/4):
 - Put all code in the c-file;
 - Use mmc_from_priv() instead of host->mmc;
 - Use sdio_signal_irq() instead of mmc_signal_sdio_irq();
 - Use devm_mmc_alloc_host() instead of mmc_alloc_host();
 - Use mmc_regulator_get_supply();

patch(4/4):
 - Add fix_cmd_interrupt function which is needed by Loongson-2K2000.

Link to V1:
https://lore.kernel.org/linux-mmc/cover.1744273956.git.zhoubinbin@loongson.cn/

Binbin Zhou (4):
  dt-bindings: mmc: Add Loongson-2K SD/SDIO/eMMC controller binding
  mmc: loongson2: Add Loongson-2K SD/SDIO controller driver
  dt-bindings: mmc: loongson,ls2k0500-mmc: Add compatible for
    Loongson-2K2000
  mmc: loongson2: Add Loongson-2K2000 SD/SDIO/eMMC controller driver

 .../bindings/mmc/loongson,ls2k0500-mmc.yaml   |  112 ++
 MAINTAINERS                                   |    7 +
 drivers/mmc/host/Kconfig                      |   13 +
 drivers/mmc/host/Makefile                     |    1 +
 drivers/mmc/host/loongson2-mmc.c              | 1032 +++++++++++++++++
 5 files changed, 1165 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/loongson,ls2k0500-mmc.yaml
 create mode 100644 drivers/mmc/host/loongson2-mmc.c


base-commit: 187715cfd12932a528ff3a3952648e2b55381d4c
-- 
2.47.1

