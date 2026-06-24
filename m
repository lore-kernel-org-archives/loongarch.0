Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F72C3019AA
	for <loongarch@lists.linux.dev>; Wed, 24 Jun 2026 08:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291382; cv=none; b=e7uo5Wq0n+5Xy6YVQAwogF06vjH9KRJlpk/HZuJ40WqnM4L0+jnNDAht/jYxp3TmLbmh6Ap3WeP2JjbrC6rU7uud00phHzDKsI5tj36z8ooKmFT5+srRSqTQQ3n6pzJLGYudwgdfV+2/I0fXy8QHJXOLHIxImpAiVx8ss9QwRYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291382; c=relaxed/simple;
	bh=ypKabj3M/1bQfePWvUSl6+zpMzmZe2RkXMKjF9IYhNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qWjEs7RWkiV4ysQ4CznZ29MezN7Dlt8DHIiK3pqkB3qhLDEJOSgT8OSwU2AdbnpwNyMu920eilO+gqKNSNWFUbD+1ijD5rvMtE7bZRw8iz1mcEcYuzD5FVc3iWM2b28cyiFaH6fim0Eep/JpG49dLSxdbzPuqF9RVn6CenY1DOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.155])
	by gateway (Coremail) with SMTP id _____8BxzsCpmztqylMXAA--.36814S3;
	Wed, 24 Jun 2026 16:56:09 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.155])
	by front1 (Coremail) with SMTP id qMiowJDxD8OcmztqjVGxAA--.8793S2;
	Wed, 24 Jun 2026 16:55:57 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Lee Jones <lee@kernel.org>,
	Corey Minyard <minyard@acm.org>,
	Chong Qiao <qiaochong@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jeffbai@aosc.io,
	kexybiscuit@aosc.io,
	zhuyunfei@loongson.cn,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] mfd: ls2kbmc: mfd: ls2kbmc: Fix iomem pointer handling in video mode parsing
Date: Wed, 24 Jun 2026 16:55:50 +0800
Message-ID: <20260624085550.1508771-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxD8OcmztqjVGxAA--.8793S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEICGo7ceQEhAAAsE
X-Coremail-Antispam: 1Uk129KBj93XoW7trWfurWxJFykJr4UCw47WrX_yoW8Zr43pF
	WfWa1ayr4YyrWIqan7Jr15uFyFqw1rtayjgrW7Z3sxZr98u3yDCryF9FZIqF98ZFykKFy5
	trn8JFyI9a45AabCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxU2MKZDUUUU

Use pointers annotated with the __iomem marker for all iomem map calls,
and creates a local copy of the mapped IO memory for future access in
the code. memcpy_fromio() and memcpy_toio() are used to read/write data
from/to mapped IO memory

Fixes: 0d64f6d1ffe9 ("mfd: ls2kbmc: Introduce Loongson-2K BMC core driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603021730.Yy3QXYTw-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202606120639.WG6eb8VU-lkp@intel.com/
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
V2:
 - Add the missing memcpy_fromio();
 - Drop the unnecessary `buf` variable.

Link to V1:
https://lore.kernel.org/all/20260616115530.4012675-1-zhoubinbin@loongson.cn/

 drivers/mfd/ls2k-bmc-core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index 408056bfb2fe..1312812860c0 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -427,14 +427,20 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
  */
 static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_platform_data *pd)
 {
-	char *mode;
+	char *mode __free(kfree) = NULL;
+	void __iomem *base;
 	int depth, ret;
 
 	/* The last 16M of PCI BAR0 is used to store the resolution string. */
-	mode = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M, SZ_16M);
+	base = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M, SZ_16M);
+	if (!base)
+		return -ENOMEM;
+
+	mode = kmalloc(SZ_16M, GFP_KERNEL);
 	if (!mode)
 		return -ENOMEM;
 
+	memcpy_fromio(mode, base, SZ_16M);
 	/* The resolution field starts with the flag "video=". */
 	if (!strncmp(mode, "video=", 6))
 		mode = mode + 6;

base-commit: c454531af72e0df811600601413bb8d3d039ed08
-- 
2.52.0

