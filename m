Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BB72989B7
	for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 06:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211052; cv=none; b=YlRWGnnGKuP8Hg4HLn/3FWYSZ+NaMQYX2PSrY6QdFA9FcwgzWCyzsuGZSuC5gU1hHSDv/pl2/iobBFwsOOHf3zatUP5h7EwLXkGZDpouMEO8F/9KKJNt8Z6ZXA7z9vG9HXhWSgpHGHUNgB34QuhY3BzcrACSiOHhuaHwxN69QHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211052; c=relaxed/simple;
	bh=4SNQOngjEtcFeQhjM4CmDgqJ5nWhxKl2AcnpSAK2Gx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BtjInBnMe5AcAKqzpIEQIM0EV1F7ojw/EEJ2ciVXEYdt3f/TlfxE2E+4nu57oA/qYxMijbx08GIMf9018xJWVGiTmBGAtzua1JqjUffNlswpgs6FL9vcAPAWLgriiKW9ihpJxj6KJhVTGXb0cvBkodomhfIbkPlVAuV6AaDqU5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8BxUcCpDbFpm9IZAA--.16589S3;
	Wed, 11 Mar 2026 14:37:29 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJCx_8KoDbFpqclSAA--.26805S2;
	Wed, 11 Mar 2026 14:37:28 +0800 (CST)
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
Subject: [PATCH 0/3] ASoC: Add Loongson-2k0300 I2S controller support
Date: Wed, 11 Mar 2026 14:37:15 +0800
Message-ID: <cover.1773107475.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx_8KoDbFpqclSAA--.26805S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEDCGmvssIbJAABsD
X-Coremail-Antispam: 1Uk129KBj93XoW7CF4xJrWrur1fAF15uw1ruFX_yoW8JFWDpw
	sxC393WrW5Jr4ayrnxJryrGr1rZryrZwsxXa17Jw1UCr9xA3WUuw1UKF4rAFW7Zry8Jryq
	vry8GFW8uasxCabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1CPfJUUUUU==

Hi all:

This patchset adds support for the Loongson-2K0300 I2S controller.
Similar to the Loongson-2K2000, it utilizes internal DMA for data
transfer but interfaces as a platform device.

Also, I cleaned up the redundant code from before.

Thanks.
Binbin

Binbin Zhou (6):
  MAINTAINERS: Add entry for Loongson ASoC driver
  ASoC: loongson: Combined regmap definitions
  ASoC: loongson: Add `internal` to the names of internal DMA variables
  ASoC: loongson: Separate external shared DMA from the platform
    interface
  ASoC: dt-bindings: loongson,ls2k1000-i2s: Document Loongson-2K0300
    compatible
  ASoC: loongson: Add Loongson-2k0300 I2S controller support

 .../bindings/sound/loongson,ls2k1000-i2s.yaml |  22 ++-
 MAINTAINERS                                   |   7 +
 sound/soc/loongson/Makefile                   |   4 +-
 sound/soc/loongson/loongson_card.c            |   2 +-
 sound/soc/loongson/loongson_dma.c             | 142 ++++++++++++------
 sound/soc/loongson/loongson_dma.h             |   6 +-
 sound/soc/loongson/loongson_i2s.c             |  61 +++++++-
 sound/soc/loongson/loongson_i2s.h             |   7 +-
 sound/soc/loongson/loongson_i2s_pci.c         |  59 +-------
 sound/soc/loongson/loongson_i2s_plat.c        |  98 ++++--------
 10 files changed, 229 insertions(+), 179 deletions(-)


base-commit: e69bc9b4c9827f4af5dfecba10df35dcc67d180a
-- 
2.52.0

