Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C364314D21
	for <loongarch@lists.linux.dev>; Wed, 18 Mar 2026 09:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825430; cv=none; b=ruJ2TVwg9NYov/G340CyLAZy9tR4ske86CCr6Nqt9S13xNncszOXGyjh75HrKIW9LbodMlVmwI0oDgUz2lB0ZIgXZQOC57xH3fih20PJ4BWqoc1HYsJmcZPsWTof/hQgVDNdfzsBwT+5r6iN3Ts4MBAEvTvTNY9EYgkdZZ5aQwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825430; c=relaxed/simple;
	bh=Hou2eOq3Kcw6ABHb5mWD/PcfR9U5q7md9RpwGH3olzY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jOuuQnxsTM9gN1FGwKuOkTD+yvL4f/ISKgHith9yFt8L330kZ48UwlorQgzCm+UV7jWcRwEr30XKwc2vqzVYs9G9dAtMirlyvJUCiSPG5/g5S19s+nkDyW/ChzUvNU6qiYFAkxrn0/yis9/iop+B7lF8bY4EMhK+sdDXBawb/vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.17])
	by gateway (Coremail) with SMTP id _____8BxXcOKbbpp7EQcAA--.16309S3;
	Wed, 18 Mar 2026 17:16:58 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.17])
	by front1 (Coremail) with SMTP id qMiowJBxKMF+bbppwqlXAA--.23316S2;
	Wed, 18 Mar 2026 17:16:47 +0800 (CST)
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
Subject: [PATCH 0/4] ASoC: loongson: Optimized code and variable naming
Date: Wed, 18 Mar 2026 17:16:34 +0800
Message-ID: <cover.1773821115.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxKMF+bbppwqlXAA--.23316S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEKCGm6PsMDlAAAs7
X-Coremail-Antispam: 1Uk129KBj93XoW7uF4fXF47tr45Gr47AF1DArc_yoW8XF17pF
	Z3C393Wr45trW2ywn3JryrJr1rAryrWrnxuF47J34kCF9xA3W2v343tF48JFW2yrWUGryj
	vFW8Gay8uFn8uFbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2ID7UUUUU

Hi all:

This patchset is separated from [1], because it is unrelated to
Loongson-2K0300 support, and there are other features that need to be
added for Loongson-2K0300.

Patchset Overview:
1. Updated MAINTAINERS to add the Loongson ASoC entry;
2. Merged regmap definitions to eliminate warnings;
3. Renamed internal DMA/external DMA variables and decoupled external
   DMA from the platform interface.

Thanks.
Binbin

======
Change from [1]:
Patch (2/4):
  - Reordered the `write` function to follow the `read` function;
Patch (3/4)/(4/4):
  - Use `idma` (internal dma) and `edma` (external dma) for short.

[1]: https://lore.kernel.org/all/cover.1773107475.git.zhoubinbin@loongson.cn/

Binbin Zhou (4):
  MAINTAINERS: Add entry for Loongson ASoC driver
  ASoC: loongson: Combined regmap definitions
  ASoC: loongson: Use the `idma` identifier for internal DMA variables
  ASoC: loongson: Separate external shared DMA from the platform
    interface

 MAINTAINERS                            |   7 ++
 sound/soc/loongson/Makefile            |   4 +-
 sound/soc/loongson/loongson_dma.c      | 148 +++++++++++++++++--------
 sound/soc/loongson/loongson_dma.h      |   6 +-
 sound/soc/loongson/loongson_i2s.c      |  55 +++++++++
 sound/soc/loongson/loongson_i2s.h      |   7 +-
 sound/soc/loongson/loongson_i2s_pci.c  |  59 +---------
 sound/soc/loongson/loongson_i2s_plat.c |  67 +----------
 8 files changed, 180 insertions(+), 173 deletions(-)


base-commit: de12d535e2730ab630ffc65aee915c8155c9752a
-- 
2.52.0

