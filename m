Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DBA17DFF2
	for <loongarch@lists.linux.dev>; Mon, 28 Oct 2024 09:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730108076; cv=none; b=hD5OAF9j5o+7Jf1y2zd6cNH7T6NWdSz3x1OCZ/79pv14+WWesKYkEjdfIoDMF11n0fVl3sOJkfbn1Uq77LK8bg7jL7a9/M2bx8vZHCT49rf3NLLAeBQcI9vyPLvDWVxoq+IgOQooWUw58Hk+n65KdsZEJlvkB5Lh1E2+wccF3Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730108076; c=relaxed/simple;
	bh=Z3vqjb/orKw8R4teFes9y7ATp36S3tsG7USNV57/Zuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PJAp9vSNuny+PXfdOk1Aq/hl5vhxpp6N22BjVLnWC+hgAw3eCFYmVOs0pKF8o973KgRX2KDftzV9TVBaNLuht4r6hcS9koSGfMgq4LHp377WfOfZbEO9rotD7I74rarsJP/qOO9ubFYOspnfc2SeBDYJ8bJT8xnpOEOMJg6onHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.202])
	by gateway (Coremail) with SMTP id _____8Bx++GhWh9n2K0YAA--.51358S3;
	Mon, 28 Oct 2024 17:34:25 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.202])
	by front1 (Coremail) with SMTP id qMiowMBxnkegWh9nFzAiAA--.14607S2;
	Mon, 28 Oct 2024 17:34:25 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] dmaengine: loongson2-apb: Change GENMASK to GENMASK_ULL
Date: Mon, 28 Oct 2024 17:34:13 +0800
Message-ID: <20241028093413.1145820-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxnkegWh9nFzAiAA--.14607S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Aw4xWrW8Xw4kuF4fuF1xZwc_yoW8WF18pF
	y3W34IgrW5KF17Was5ta4YqFy3AasxJrW7uanFv34Uur93Zwn293s5tFs3XFyUAryUAFW2
	vF97t345AFZ7WacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0FALUUUUU=

Fix the following smatch static checker warning:

drivers/dma/loongson2-apb-dma.c:189 ls2x_dma_write_cmd()
warn: was expecting a 64 bit value instead of '~(((0)) + (((~((0))) - (((1)) << (0)) + 1) & (~((0)) >> ((8 * 4) - 1 - (4)))))'

The GENMASK macro used "unsigned long", which caused build issues when
using a 32-bit toolchain because it would try to access bits > 31. This
patch switches GENMASK to GENMASK_ULL, which uses "unsigned long long".

Fixes: 71e7d3cb6e55 ("dmaengine: ls2x-apb: New driver for the Loongson LS2X APB DMA controller")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/87cdc025-7246-4548-85ca-3d36fdc2be2d@stanley.mountain/
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/dma/loongson2-apb-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/loongson2-apb-dma.c b/drivers/dma/loongson2-apb-dma.c
index 367ed34ce4da..c528f02b9f84 100644
--- a/drivers/dma/loongson2-apb-dma.c
+++ b/drivers/dma/loongson2-apb-dma.c
@@ -31,7 +31,7 @@
 #define LDMA_ASK_VALID		BIT(2)
 #define LDMA_START		BIT(3) /* DMA start operation */
 #define LDMA_STOP		BIT(4) /* DMA stop operation */
-#define LDMA_CONFIG_MASK	GENMASK(4, 0) /* DMA controller config bits mask */
+#define LDMA_CONFIG_MASK	GENMASK_ULL(4, 0) /* DMA controller config bits mask */
 
 /* Bitfields in ndesc_addr field of HW descriptor */
 #define LDMA_DESC_EN		BIT(0) /*1: The next descriptor is valid */

base-commit: 8974f34de2ef173470a596a4dee22f4922583d1b
-- 
2.43.5

