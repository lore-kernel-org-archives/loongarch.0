Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7EF274B37
	for <loongarch@lists.linux.dev>; Thu, 13 Nov 2025 08:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763023733; cv=none; b=cfsgJe19nlofmPZxypGnSpq7q58VTj4WMGbP3BI+Llz4qvX+tydrBzx220knNXaFrfCscbSBgtoJzcXRjHbO6innvRBc6TjKJXe8wrOVqwhcNPEf03UABSltzZPQvFWTa1e2wzyuZ1uQxLO/E0Eum4kwvhK4KWxWxFdx30tudnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763023733; c=relaxed/simple;
	bh=YOS1OUwRph7MAOs2qaWQ75lwbdHGF5OrgkOIbrVqLpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p+7H/Vv/Y8bCkwscZ6Svufw3RAipTK4Snrxk4cQVP+EqaQECZaHDJA/Do52RJ4m7F9+xRYOddlRUhICTxEHrxn2P8z56m62zZptfP37Tb17/WzTSHeEOCvqElYVFTmdqQ3g9kYaGCLVIs+qJl1q//eVaUNjutQaxkBdV0oNyaEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8AxidFlmxVpn8oiAA--.10091S3;
	Thu, 13 Nov 2025 16:48:37 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by front1 (Coremail) with SMTP id qMiowJAxQMJimxVpkYAxAQ--.3356S2;
	Thu, 13 Nov 2025 16:48:36 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 0/2] i2c: Add Loongson-2K0300 I2C controller support
Date: Thu, 13 Nov 2025 16:48:22 +0800
Message-ID: <cover.1763018288.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxQMJimxVpkYAxAQ--.3356S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEFCGkVcy8C8QAAse
X-Coremail-Antispam: 1Uk129KBj9xXoW7XryDXrW8Kry5JF4fGry5WrX_yoWfCFbEkF
	n7Wa47Aw1DCF93Aa48Ja1rZry3Cayqga4rZ3Zxtw4SkrW2qw1YgF9rJrZxZw4xXF4UWFsx
	Ww1kAF4Iv3ZxWosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU25EfUUUUU

Hi all:

This patch set describes the I2C controller integrated into the Loongson-2K0300 chip.

It has a significantly different design from the previous I2C controller (i2c-ls2x),
such as support for master-slave transfer mode, and DMA transfers (implementation
in progress), etc. Therefore, we try to name it i2c-ls2x-v2.

Therefore we try to name it i2c-ls2x-v2.

Thanks.

Binbin Zhou (2):
  dt-bindings: i2c: loongson,ls2x: Add ls2k0300-i2c compatible
  i2c: ls2x-v2: Add driver for Loongson-2K0300 I2C controller

 .../bindings/i2c/loongson,ls2x-i2c.yaml       |   1 +
 MAINTAINERS                                   |   1 +
 drivers/i2c/busses/Kconfig                    |  10 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-ls2x-v2.c              | 513 ++++++++++++++++++
 5 files changed, 526 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-ls2x-v2.c


base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
-- 
2.47.3

