Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE0E340A57
	for <loongarch@lists.linux.dev>; Tue,  3 Feb 2026 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770121841; cv=none; b=aCT2PxYziY3IsDwdILDTxo4I52GX8nq6ozyG8oDInTYdvjcZ+YCOc9s/nYXMcjiwOKJHiDWWMIdnwfdaCIREKS4zfgZ6UWQj2N1wnr/YPgK4paXe0hQdLEecHqZhMHe7kxQoPSZAQjRhfcNQO0zV62g3cGsAxhl2FYfdDb4EdZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770121841; c=relaxed/simple;
	bh=xSkZGHYDhEC58xgVczwO2WAMqB7U1AW/5NWYBqSZbOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e4HnsX8A8J6FaQ6yy2KJUArhM8avFpMy4vxmA6cA/gbAQnJ4znH6ixEcwg0SFEGrEA9g9WpSOhBay3cBw7Cdtx+MQkWWUja0ju0RWcldwBkQtUpYMA+TchcTfzmcn/37suQzA6S5YZXRWPNd1sAtj8QUWQuNfK5KJVY417F0Fa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.42])
	by gateway (Coremail) with SMTP id _____8DxPMNo6oFpGl0PAA--.49666S3;
	Tue, 03 Feb 2026 20:30:33 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.42])
	by front1 (Coremail) with SMTP id qMiowJBxKMFl6oFp7RY_AA--.38493S2;
	Tue, 03 Feb 2026 20:30:31 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org
Cc: Xiaochuang Mao <maoxiaochuan@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 0/3] dmaengine: Add Loongson Multi-Channel DMA controller support
Date: Tue,  3 Feb 2026 20:30:09 +0800
Message-ID: <cover.1770119693.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxKMFl6oFp7RY_AA--.38493S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEHCGmBjh4H5QAAsW
X-Coremail-Antispam: 1Uk129KBj93XoW7Wry7XrWUKFykZw48Gry8Zwc_yoW8Aw4rpF
	43A3yS93W8tFW3Aas3JFy8Ary5Aa4fJr9rua9rXw1Uur9xZ34UZr1rKFyjqFW7Ary7JFW2
	qFy8GFWUGF17GwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8CJPtUUUUU==

Hi all:

This patchset introduces the Loongson multi-channel DMA controller,
which is present in the Loongson-2K0300 and Loongson-2K3000 processors.

It is a multi-channel controller that enables data transfers from memory
to memory, device to memory, and memory to device, as well as channel
prioritization configurable through the channel configuration registers.

Additionally, since multiple distinct types of DMA controllers exist on
the Loongson platform, I have attempted to consolidate all Loongson DMA
drivers into a new directory named `Loongson` for easier management.

Thanks.
Binbin

Binbin Zhou (3):
  dmaengine: loongson: New directory for Loongson DMA controllers
    drivers
  dt-bindings: dmaengine: Add Loongson Multi-Channel DMA controller
  dmaengine: loongson: New driver for the Loongson Multi-Channel DMA
    controller

 .../bindings/dma/loongson,ls2k0300-dma.yaml   |  78 ++
 MAINTAINERS                                   |   6 +-
 drivers/dma/Kconfig                           |  25 +-
 drivers/dma/Makefile                          |   3 +-
 drivers/dma/loongson/Kconfig                  |  38 +
 drivers/dma/loongson/Makefile                 |   4 +
 .../dma/{ => loongson}/loongson1-apb-dma.c    |   4 +-
 drivers/dma/loongson/loongson2-apb-dma-v2.c   | 759 ++++++++++++++++++
 .../dma/{ => loongson}/loongson2-apb-dma.c    |   4 +-
 9 files changed, 890 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
 create mode 100644 drivers/dma/loongson/Kconfig
 create mode 100644 drivers/dma/loongson/Makefile
 rename drivers/dma/{ => loongson}/loongson1-apb-dma.c (99%)
 create mode 100644 drivers/dma/loongson/loongson2-apb-dma-v2.c
 rename drivers/dma/{ => loongson}/loongson2-apb-dma.c (99%)


base-commit: 3c8a86ed002ab8fb287ee4ec92f0fd6ac5b291d2
-- 
2.47.3

