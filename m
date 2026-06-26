Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B23B2EEE94
	for <loongarch@lists.linux.dev>; Fri, 26 Jun 2026 02:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782440844; cv=none; b=osxpV9nXf8Og70BT4n6bKhCQo0t+aLZDC1ZcWcsHzDi68+Uso831cb6hjMSPTu7q+qjnud70auoUc6n6FvvwABFTvouv3f8NqUDZYM067mLglwrQIwxtkFrtjJABvzfv/b1cIyuHLJXkaGDoRAL5VBlzr9lb2/HMVP0myqBhrjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782440844; c=relaxed/simple;
	bh=lvVxjrbdPD39TkmjEb3d6UFMQJyJbOOk9m165/3zjvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZwlwQCoHImB4O9h3QQ1Hj3V+4hUEV6cq/tHUg+28R7iZ4YpGJewI0B4nlIY9WGtMRmOEDG8OBLPs1gwLckxU1ZgMxQCehgEJ8x0B/Y1gGby6HAvISuc5iYFu9TAxzDfQzP2Sde7bfJFok8JrlKtmrS304YgzxDExr+xp+IlUDD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.155])
	by gateway (Coremail) with SMTP id _____8DxBOmF4z1qtTAYAA--.56054S3;
	Fri, 26 Jun 2026 10:27:18 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.155])
	by front1 (Coremail) with SMTP id qMiowJBxSeCC4z1qim2zAA--.12873S2;
	Fri, 26 Jun 2026 10:27:15 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Keguang Zhang <keguang.zhang@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 0/9] ASoC: Add Loongson-2K0300 I2S controller and sound card support
Date: Fri, 26 Jun 2026 10:27:02 +0800
Message-ID: <cover.1782439646.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxSeCC4z1qim2zAA--.12873S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEKCGo8wzAaEwAAst
X-Coremail-Antispam: 1Uk129KBj93XoWxXr43uw15XF4rtw13Cr1Utwc_yoW5tFyDpF
	s3u39xGryUGFyjyFZxXry8Cr4fZ34xJa9rJF45J34kJanrC3yjv34qy3WYvF47ZrZ5GrWj
	qrn5KF4rWFy5ZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7hiSDUUUU

Hi all:

This series adds ASoC support for the Loongson-2K0300 SoC and its
associated development boards, including the CTCISZ Forever Pi and the
ATK-DL2K0300B.

Key changes:
- Extend DT bindings to support ls2k0300-i2s and new audio card
  compatibles.
- Refactor the platform I2S driver to handle SoC differences via per-device
  configuration (rev_id, optional APB DMA config, reset sequence).
- Refactor the audio machine driver to support board-specific DAI formats,
  GPIO-based headphone detection/control, speaker enable, and DAPM routing.
- Add jack detection and automatic switching between headphones and
  speakers for the DL2K0300B board.

The patchset also cleans up the existing audio card binding by
referencing the common sound-card properties, and adds new compatibles
for the Loongson-2K0300 variants with proper DAI format handling.

All changes have been tested on Loongson-2K2000 (PCI), Loongson-2K0300
Forever Pi and Loongson-2K0300 DL2K0300B boards.

Thanks.
Binbin

========
V3:
Patch (1/9):
  - New patch;
  - Error handling reported by AI Sashiko;
Patch (3/9):
  - Mark platform configuration structures as `const`;
Patch (4/9):
  - Add Acked-by tag from Rob, thanks;
Patch (5/9):
  - Correct commit message;
Patch (7/9):
  - Drop `loongson` prefix;
  - Change `gpiod_hp_mute` to `gpiod_hp_ctl`;
Patch (8/9):
  - Add `add_dapm_routes` to  loongson_card_config;
  - Move gpiod* register ops into loongson_card_parse_of();
  - Change `gpiod_hp_mute` to `gpiod_hp_ctl`;
  - Add `ls_priv->gpiod_hp_det` judgment in loongson_asoc_machine_init()
    to avoid double-free;
Patch (9/9):
  - New patch;
  - Add DAPM routes from MIC inputs to Mic Bias. 

Link to V2:
https://lore.kernel.org/all/cover.1780538113.git.zhoubinbin@loongson.cn/

v2:
- The first four patches for V1 (related to code cleanup) have been
  accepted as a separate series. The link is as follows:
https://lore.kernel.org/all/178041371415.93058.4794135670349989571.b4-ty@b4/

Patch (1/7):
  - Add Reviewed-by tag from Krzysztof Kozlowski;
Patch (3/7):
  - New patch;
  - Reference sound-card-common.yaml, drop custom model property;
Patch (4/7)(5/7):
  - New patches;
  - Support Forever Pi board with different DAI format;
Patch (6/7)(7/7):
  - New patches;
  - Implement headphone jack detection and DAPM routing for ATK-DL2K0300B
    board.

Link to V1:
https://lore.kernel.org/all/cover.1773107475.git.zhoubinbin@loongson.cn/

Binbin Zhou (9):
  ASoC: loongson: Fix error handling in ACPI property parsing
  ASoC: dt-bindings: loongson,ls2k1000-i2s: Document Loongson-2K0300
    compatible
  ASoC: loongson: Add Loongson-2K0300 I2S controller support
  ASoC: dt-bindings: loongson,ls-audio-card: Use common sound card
  ASoC: dt-bindings: loongson,ls-audio-card: Add ctcisz forever pi
    compatible
  ASoC: loongson: Add Loongson-2K0300 CTCISZ Forever Pi sound card
    support
  ASoC: dt-bindings: loongson,ls-audio-card: Add ATK-DL2K0300B
    compatible
  ASoC: loongson: Add headphone jack detection and DAPM routing
  ASoC: es8328: Add DAPM routes from MIC inputs to Mic Bias

 .../sound/loongson,ls-audio-card.yaml         |  53 +++++-
 .../bindings/sound/loongson,ls2k1000-i2s.yaml |  22 ++-
 sound/soc/codecs/es8328.c                     |   5 +
 sound/soc/loongson/loongson_card.c            | 171 ++++++++++++++++--
 sound/soc/loongson/loongson_i2s_plat.c        |  42 ++++-
 5 files changed, 267 insertions(+), 26 deletions(-)

-- 
2.52.0

