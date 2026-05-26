Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9218D3DD84C
	for <loongarch@lists.linux.dev>; Tue, 26 May 2026 11:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796587; cv=none; b=R9toxoMwwF0/xvxUBtHoIoCo0b4oYKsJ6CZBrIap9Ih0JC+X7XzKns/TLJhsl6rnRHzOmNNZXxaSO3wjXuvvt7T6y5wC0Qhfb76LAHyngwOlXtGlE3b0njGOKHgfxaOmDq7qCQk63PrBdity5PCwAVkJ6QTylyJKrW3HPBQLhj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796587; c=relaxed/simple;
	bh=oMGiyN7YCURX+bE3pjmtMneb0HTJgVp5gOSxCkPvf3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LnwaDAKQtoZnzEiXyHovT2ensP9AQKvniHhJKKaYVfgpHhF0Xi20PDVdgF47EP6SjtNKFrpiWsytP/9a6h6gPEBC27fYPXuSjPVXRK+6nQhFECv0UIfWruEXupOum3TyFiQsvGsbdOVp41EFGEGOTJEGqXY75elY75NIES2Lp9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8AxX+tdihVqkWMNAA--.38171S3;
	Tue, 26 May 2026 19:56:13 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJCxGOBYihVq04+RAA--.13379S2;
	Tue, 26 May 2026 19:56:11 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 0/5] ASoC: loongson: Refactor DMA handling and regmap
Date: Tue, 26 May 2026 19:55:58 +0800
Message-ID: <cover.1779796354.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxGOBYihVq04+RAA--.13379S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgETCGoVNiwIpwAAsS
X-Coremail-Antispam: 1Uk129KBj93XoWxCF48XFW3CF1UWFyxCFykJFc_yoW5Jw15pa
	n3C393Wr15trW2yrs3JayrJFy5ZryrWr9ruF47J34kWr9xuasFvw17tF18ZFW7Cry8GFy2
	vry8KFW8uF13uacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0FALUUUUU=

Hi all:

This series refactors the Loongson I2S ASoC drivers, reducing code
duplication and improving DMA differentiation. It also adds an entry
in MAINTAINERS and applies a few fixes to the es8323 codec driver.

Patch 1 adds a MAINTAINERS entry to track the Loongson audio drivers.

Patch 2 consolidates duplicate regmap configurations from the PCI and
platform glue drivers into the shared loongson_i2s.c. It also fixes
volatile register marking and switches from REGCACHE_FLAT to
REGCACHE_MAPLE.

Patch 3 renames internal DMA structures and functions with an "idma"
prefix to clearly distinguish them from external DMA (eDMA) support.

Patch 4 extracts the external DMA logic from the platform driver into
loongson_dma.c, making it reusable and avoiding duplication with the
internal DMA implementation.

Patch 5 adjusts a few register values in the es8323 codec driver to
improve power control and output volume on Loongson platforms.

These changes have been tested on Loongson-2K0300 (platform, eDMA) and
Loongson-3K2000 (PCI, iDMA) boards.

Thanks.
Binbin

========
V2:
Patch (2/5):
  - Fix volatile register handling, and switch from REGCACHE_FLAT to
    REGCACHE_MAPLE;
Patch (5/5):
  - New patch for ES8323 coedc.

Link to V1:
https://lore.kernel.org/all/cover.1773821115.git.zhoubinbin@loongson.cn/

Change from [1]:
Patch (2/4):
  - Reordered the `write` function to follow the `read` function;
Patch (3/4)/(4/4):
  - Use `idma` (internal dma) and `edma` (external dma) for short.

[1]:
https://lore.kernel.org/all/cover.1773107475.git.zhoubinbin@loongson.cn/

Binbin Zhou (5):
  MAINTAINERS: Add entry for Loongson ASoC driver
  ASoC: loongson: Combined regmap definitions
  ASoC: loongson: Use the `idma` identifier for internal DMA variables
  ASoC: loongson: Separate external shared DMA from the platform
    interface
  ASoC: codecs: es8323: Adjust the initialization of certain registers

 MAINTAINERS                            |   9 ++
 sound/soc/codecs/es8323.c              |   9 ++
 sound/soc/loongson/Makefile            |   4 +-
 sound/soc/loongson/loongson_dma.c      | 148 +++++++++++++++++--------
 sound/soc/loongson/loongson_dma.h      |   6 +-
 sound/soc/loongson/loongson_i2s.c      |  55 ++++++++-
 sound/soc/loongson/loongson_i2s.h      |   7 +-
 sound/soc/loongson/loongson_i2s_pci.c  |  59 +---------
 sound/soc/loongson/loongson_i2s_plat.c |  67 +----------
 9 files changed, 190 insertions(+), 174 deletions(-)


base-commit: 8cd773d4f8235aaf0b04927b3c9d2d0326def09b
-- 
2.52.0

