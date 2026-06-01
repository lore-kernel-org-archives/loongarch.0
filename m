Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB6638F65D
	for <loongarch@lists.linux.dev>; Mon,  1 Jun 2026 09:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780306209; cv=none; b=PoiOMSHtExfGANc2IpBXTrEtyv0s/M0dY6L2qf3KKAU6gBcgYvWPh9zxaWisCphIW09Elwkd5WcC7jzyygj/l+KbcC5S+NPR4vmTVuDvL/k9b5NWbp8EV4PzOZkAwAvsNf1vFRn1NthHyFUMzGULuSDT0YcCF4ITZ5gcJUoFv0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780306209; c=relaxed/simple;
	bh=F2qwso1fDR/7OMLA99rX+URI4V7lNYaa79S0jJD0Zlg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GnfLx8MAGgWH3H+PObW7jIvbekWw98fxD4Zb5g5KBzwUhIgIEhojAd+IonhTuVvgVIQYAYhJyv3iSZYwfJK3r4kS+hI+DOWul5Qy/Cym5tg8caKhZdpseLG9URJq0bpRNG9SP8doEZw4piYGfa5Z0DMhgJzmT22se/Y171qmEkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8CxCHkQUR1qM0sPAA--.18171S3;
	Mon, 01 Jun 2026 17:29:52 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJAxXcIJUR1qGOqXAA--.23311S2;
	Mon, 01 Jun 2026 17:29:46 +0800 (CST)
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
Subject: [PATCH v3 0/4] ASoC: loongson: Refactor DMA and regmap handling
Date: Mon,  1 Jun 2026 17:29:35 +0800
Message-ID: <cover.1780304703.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxXcIJUR1qGOqXAA--.23311S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEFCGodH18GIwAAsf
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr4fWF4DCFWkGF43GryUJwc_yoW5JryDpa
	n3C393Wr15trW2yrs3Ja4rJFy5ZryrXr9rWF47J34kWr9xu3W2vw1ftF48ZFW7Cry8XryI
	vry8KFW8uF15uacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8xuctUUUUU==

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

These changes have been tested on Loongson-2K0300 (platform, eDMA) and
Loongson-2K2000 (PCI, iDMA) boards.

Thanks.
Binbin

========
V3:
- Drop es8323 patch.
Patch (2/4):
 - Add I2S_CTRL as volatile register.

Link to V2:
https://lore.kernel.org/all/cover.1779796354.git.zhoubinbin@loongson.cn/

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

Binbin Zhou (4):
  MAINTAINERS: Add entry for Loongson ASoC driver
  ASoC: loongson: Combined regmap definitions
  ASoC: loongson: Use the `idma` identifier for internal DMA variables
  ASoC: loongson: Separate external shared DMA from the platform
    interface

 MAINTAINERS                            |   9 ++
 sound/soc/loongson/Makefile            |   4 +-
 sound/soc/loongson/loongson_dma.c      | 148 +++++++++++++++++--------
 sound/soc/loongson/loongson_dma.h      |   6 +-
 sound/soc/loongson/loongson_i2s.c      |  56 +++++++++-
 sound/soc/loongson/loongson_i2s.h      |   7 +-
 sound/soc/loongson/loongson_i2s_pci.c  |  59 +---------
 sound/soc/loongson/loongson_i2s_plat.c |  67 +----------
 8 files changed, 182 insertions(+), 174 deletions(-)


base-commit: 9617ce6798f8eee61d8068f0ea03a08ce051932e
-- 
2.52.0

