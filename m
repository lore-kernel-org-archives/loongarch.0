Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5923016E9
	for <loongarch@lists.linux.dev>; Tue,  3 Mar 2026 07:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772521625; cv=none; b=VmFKSbQ7GSd2tWNVa5P4K9p3f6ngMbz23t3DWeWwEyeq1Plw+NeRFzP56C8ei8qEuJJBLyUKVSV8dY26LrU2r9+nR58Olbf5Q/ov24OmX2240kZaBT/SnLGhepOGcrrm8h69eP/ZDPRIB8liHh1lINLGQht1720+S7+vReHYk3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772521625; c=relaxed/simple;
	bh=eVNij862v85tR6MBDOa2teZvuozAxO+pCCEnMOL6Oz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U7rUaag3eUxEVyMggqS1M4+4AAdI5I2YYndTsl0OwEraF6TtDrzFaIk3f/W9aym3c6vOsFiFPdFGF+0tmzvzY1+K/ZLppilDsBYysXLogSd4TLZ9K5S1uy7z0mGw2wMqOAl1K7tpKWlG21bAFIGED2jyI8GsJ7xZSViaVHYBgno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8AxgsCSiKZp9fAWAA--.10052S3;
	Tue, 03 Mar 2026 15:06:59 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJCxWeCRiKZp14VNAA--.16604S2;
	Tue, 03 Mar 2026 15:06:58 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	soc@kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH] soc: loongson: loongson2_guts: Use of_root instead of own reference
Date: Tue,  3 Mar 2026 15:06:42 +0800
Message-ID: <20260303070642.2785715-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxWeCRiKZp14VNAA--.16604S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEPCGmmeEEBzQAAs9
X-Coremail-Antispam: 1Uk129KBj93XoW7trWkWr4DtrWDGr1rCw47Jrc_yoW8WF13pF
	sakay5KF4Utrs7u3s8Aa48Wa4Yk3y0ga9xJF4xJws7WF98A3W7Wry3JF1Yvr4fZFy8C34U
	XFyvg3yUCa4UWrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOiSdUUUUU=

There is already a global of_root reference. Use that instead of getting
one on our own. We don't need to care about the reference count either
this way.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/soc/loongson/loongson2_guts.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/loongson/loongson2_guts.c b/drivers/soc/loongson/loongson2_guts.c
index 16913c3ef65c..d32ec0748b12 100644
--- a/drivers/soc/loongson/loongson2_guts.c
+++ b/drivers/soc/loongson/loongson2_guts.c
@@ -92,7 +92,7 @@ static u32 loongson2_guts_get_svr(void)
 
 static int loongson2_guts_probe(struct platform_device *pdev)
 {
-	struct device_node *root, *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 	const struct loongson2_soc_die_attr *soc_die;
 	const char *machine;
@@ -109,11 +109,8 @@ static int loongson2_guts_probe(struct platform_device *pdev)
 	if (IS_ERR(guts->regs))
 		return PTR_ERR(guts->regs);
 
-	/* Register soc device */
-	root = of_find_node_by_path("/");
-	if (of_property_read_string(root, "model", &machine))
-		of_property_read_string_index(root, "compatible", 0, &machine);
-	of_node_put(root);
+	if (of_property_read_string(of_root, "model", &machine))
+		of_property_read_string_index(of_root, "compatible", 0, &machine);
 	if (machine) {
 		soc_dev_attr.machine = devm_kstrdup(dev, machine, GFP_KERNEL);
 		if (!soc_dev_attr.machine)

base-commit: 862ad12fb14cdad9c647100fbc16f7d8171b4470
-- 
2.52.0

