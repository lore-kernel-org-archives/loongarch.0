Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBA01ACE03
	for <loongarch@lists.linux.dev>; Mon,  9 Sep 2024 07:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725866374; cv=none; b=jh7SU04AvZalTWlxyENKJKzsNhjuYYGp3abFfHO+zdD3Q/uW7IUR0m0K2JaD2eUB0AW3DUvTcA6EoFjrA3xmxP1CFTupBzlYtrU3SxVM6n7SuHtS/8OOil2YvgYMWZDzsRq48IYGcOr31L53Mxy8KXw/W6xUkm8SyPRToLCyjHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725866374; c=relaxed/simple;
	bh=smjF/m6JANvq+YSLnpImJwdWkSLA7dYeYW0ThCs6CqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iwzaLv6ff70enWStbOUGiXQsAIf9KLJSQbQ2erdzVapHaK2O1WBtAyDWngTRpgvUW9+8Av7Nos1iZdqyO9Aqb8NJJof6tPs1fjB/Fm8lyzZ0CGXmnFzcSI2hZWaIjmCbSuPg8/D1yNdKANxYofbN7HcVeYYvZwJA6zCO8mGUkuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.147])
	by gateway (Coremail) with SMTP id _____8AxpuiBod5m7JgCAA--.4815S3;
	Mon, 09 Sep 2024 15:19:29 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.147])
	by front1 (Coremail) with SMTP id qMiowMCxodZ+od5mqyoCAA--.12416S2;
	Mon, 09 Sep 2024 15:19:27 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Tang Bin <tangbin@cmss.chinamobile.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	linux-sound@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 0/8] ASoC: loongson: Simplify code formatting
Date: Mon,  9 Sep 2024 15:19:04 +0800
Message-ID: <cover.1725844530.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxodZ+od5mqyoCAA--.12416S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWruFy3tF15XFyDurW3uFW8Zrc_yoWkWrb_Wa
	y2ga4rGryDXFy3Aa47Xr45KrW7WrWxAa4rC3WDtw4xWw1ayr13XF4UurWUW3W7XryDArn8
	Xa18ur48ZryxKosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb3kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07jepB-UUUUU=

Hi all:

This patchset attempts to improve code readability by simplifying code
formatting.
No functional changes.

Original link:
https://lore.kernel.org/all/c54fbc2582702689c005e1ba528ab2318b1adde6.1725518229.git.zhoubinbin@loongson.cn/

Thanks.

Binbin Zhou (8):
  ASoC: loongson: Use BIT() macro
  ASoC: loongson: Simplify probe() with local dev variable
  ASoC: loongson: Simplify with dev_err_probe()
  ASoC: loongson: Simplify if statment in loongson_card_hw_params()
  ASoC: loongson: Simplify of_node_put() reference
  ASoC: loongson: Replace if with ternary operator
  ASoC: loongson: Factor out loongson_card_acpi_find_device() function
  ASoC: loongson: Factor out loongson i2s enable clock functions

 sound/soc/loongson/loongson_card.c    | 142 +++++++++++++-------------
 sound/soc/loongson/loongson_dma.c     |  10 +-
 sound/soc/loongson/loongson_i2s.c     | 110 ++++++++++----------
 sound/soc/loongson/loongson_i2s.h     |  24 ++---
 sound/soc/loongson/loongson_i2s_pci.c |  51 ++++-----
 5 files changed, 166 insertions(+), 171 deletions(-)

-- 
2.43.5

