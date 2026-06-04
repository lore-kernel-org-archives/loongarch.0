Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F1729D264
	for <loongarch@lists.linux.dev>; Thu,  4 Jun 2026 02:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780539104; cv=none; b=NL5A+XMkGSHvaxmPOWlSHwAOMMDMyxQBHomFylrYuRn+U9baGm6e09m4HikAt9TlezrTVlVFhBERaQ23k+OR08dCmPfcW4Lk8PvMkKtSpw6mMqza6I9TUOgegnIX6F/AeR/uO9tjz9eSfaYk3y0UHMr5Mg+2ZimGr7+JgcnaMoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780539104; c=relaxed/simple;
	bh=dbmoStt4SvONriNOZw2cjRdz2s212WCzOx1qdC+kzfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F5bsvvozdkv2CpyY0DhmtkDcYuC2CDT+bWcaJSuFyyEsr7LTGh+V9B9wuXYzxlJWjo2ykUMYyzmAjMHtHIIy1Gh19z+cMxzuWS8mrBW9Yk0z79IkVWZYZFqcKICDesb7ByBAKvBb/fFHQrInCO3Bg2ns0ILTuNMGy9bHmmnSDqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8Axp3ja3iBqHWEQAA--.20836S3;
	Thu, 04 Jun 2026 10:11:39 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJBx78LZ3iBq1UabAA--.33017S2;
	Thu, 04 Jun 2026 10:11:38 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 0/7] ASoC: Add Loongson-2K0300 I2S controller and sound card support
Date: Thu,  4 Jun 2026 10:11:20 +0800
Message-ID: <cover.1780538113.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBx78LZ3iBq1UabAA--.33017S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEICGofwi0ZZwAAsn
X-Coremail-Antispam: 1Uk129KBj93XoWxXr43uw15XF4rurWruw4kAFc_yoW5GFy5pa
	n3ua9xGr15JFy2yFZxZry8Cr4fZ3yxJasrJF4UG34kGan8Aw1jv34Dt3WYvF47ZrZ3XrWU
	XFnYgF4rWF98CrgCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2_HUDUUUU

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
  GPIO-based headphone detection/mute, speaker enable, and DAPM routing.
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

Binbin Zhou (7):
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

 .../sound/loongson,ls-audio-card.yaml         |  52 +++++-
 .../bindings/sound/loongson,ls2k1000-i2s.yaml |  22 ++-
 sound/soc/loongson/loongson_card.c            | 163 +++++++++++++++++-
 sound/soc/loongson/loongson_i2s_plat.c        |  42 ++++-
 4 files changed, 256 insertions(+), 23 deletions(-)


base-commit: b2a71527074f5e4d273a25f6c89fb159172b2877
-- 
2.52.0

