Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EB92FFF88
	for <loongarch@lists.linux.dev>; Wed, 25 Feb 2026 07:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772005268; cv=none; b=mKA4IgWNYYi9bahLf2AshleKL0eHJNuYpbhXZmYA8PlcyKklVi4EOw0fJUs6bfN1pA8Qa6z0x5dweA1XF83rmlq7RZEZhS5VVMV55nRaNJVDe77AfmfwdSn+iJ8B9ZCvPCbPpjR3IV6Z/ZUJbKIR0lNTFjZCLyZmWAoCZLJ09ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772005268; c=relaxed/simple;
	bh=eSrkXWy9BCRtHLzgve84b/vlDP4sX8winZUWhH7FZCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I5pZEbyeyUTxFVuBtkan4OjtQXvOTO10tJM+u4+nTaPLs/NyYQmNfOjJ/2O7iwdEZ0/YcVu3Hu/3Q8RpmlMJW4Qppb6QjWTu2P7JAxYJdbC9pfrJnqpqPyW0ce2MaE5eKDhq4dGagQyMwLBiPwRjVEZ7Krql730j1IEcZwtA/Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8Dx_8OKp55p2_0UAA--.64605S3;
	Wed, 25 Feb 2026 15:40:58 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJCxGOCIp55pFMRKAA--.9627S2;
	Wed, 25 Feb 2026 15:40:57 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-mips@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 0/6] dmaengine: Add Loongson Multi-Channel DMA controller support
Date: Wed, 25 Feb 2026 15:40:38 +0800
Message-ID: <cover.1771989595.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxGOCIp55pFMRKAA--.9627S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEJCGmejz8BiwAAsM
X-Coremail-Antispam: 1Uk129KBj93XoWxJF1xtry3ZFy7GF43Kr48GrX_yoW5ur4xpF
	WfA34fCFWUtFW3uwn3JFy8Ar15Aa4fJrZxWa9rXw1UCr9ru34UZr1Fk3WjqF47ArW5GFW2
	qFykGF48CF4UGrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOdb8UUUUU=

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

===========
V3:
- Rebase on dmaengine/next tree;
patch(1/6):
 - Keep alphabet order;

patch(2/6):
 - Add Reviewed-by tag from Frank, thanks;

patch(3/6)/(4/6):
 - New patches, format loongson2-apb-dma driver code;

patch(5/6):
 - Add description for `interrupts` property;

patch(6/6):
 - Use ffs() helper make the code cleaner;
 - Refact loongson2_cmc_dma_chan_irq();
 - Simplify locking with guard() and scoped_guard();
 - kzalloc()->kzalloc_flex().

Link to V2:
https://lore.kernel.org/all/cover.1770605931.git.zhoubinbin@loongson.cn/

V2:
patch(1/4):
 - Update loongson1-apb-dma.c entry in MAINTAINERS.

patch(2/4):
 - New patch, use dmaenginem_async_device_register() helper.

patch(3/4):
 - `additionalProperties: false` replaced by
   `unevaluatedProperties: false`.

patch(4/4):
 - Rename filename as loongson2-apb-cmc-dma.c;
 - Rename Kconfig item as LOONGSON2_APB_CMC_DMA;
 - Rename the variable prefix as `loongson2_cmc_dma`;
 - Use dmaenginem_async_device_register() helper;
 - Drop 'dma_' prefix in struct loongson2_mdma_chan_reg;
 - Use struct_size();

Link to V1:
https://lore.kernel.org/all/cover.1770119693.git.zhoubinbin@loongson.cn/

Binbin Zhou (6):
  dmaengine: loongson: New directory for Loongson DMA controllers
    drivers
  dmaengine: loongson: loongson2-apb: Convert to
    dmaenginem_async_device_register()
  dmaengine: loongson: loongson2-apb: Convert to devm_clk_get_enabled()
  dmaengine: loongson: loongson2-apb: Simplify locking with guard() and
    scoped_guard()
  dt-bindings: dmaengine: Add Loongson Multi-Channel DMA controller
  dmaengine: loongson: New driver for the Loongson Multi-Channel DMA
    controller

 .../bindings/dma/loongson,ls2k0300-dma.yaml   |  81 ++
 MAINTAINERS                                   |   7 +-
 drivers/dma/Kconfig                           |  25 +-
 drivers/dma/Makefile                          |   3 +-
 drivers/dma/loongson/Kconfig                  |  38 +
 drivers/dma/loongson/Makefile                 |   4 +
 .../dma/{ => loongson}/loongson1-apb-dma.c    |   4 +-
 drivers/dma/loongson/loongson2-apb-cmc-dma.c  | 729 ++++++++++++++++++
 .../dma/{ => loongson}/loongson2-apb-dma.c    |  93 +--
 9 files changed, 899 insertions(+), 85 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
 create mode 100644 drivers/dma/loongson/Kconfig
 create mode 100644 drivers/dma/loongson/Makefile
 rename drivers/dma/{ => loongson}/loongson1-apb-dma.c (99%)
 create mode 100644 drivers/dma/loongson/loongson2-apb-cmc-dma.c
 rename drivers/dma/{ => loongson}/loongson2-apb-dma.c (91%)


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.52.0

