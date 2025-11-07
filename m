Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E099D25FA2D
	for <loongarch@lists.linux.dev>; Fri,  7 Nov 2025 06:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762495310; cv=none; b=Mu+OzLyrBZw8cOecImwqEu2evQxninQuppiTcw/qmmYEFN/oGKhZ5POIC17v3YmWr7YBx6QlPtkUcNrGG/Fh838sFeHUR0vTFe8aAlYE069oChgsa+9LP4/GGUYMvV9OCBhME6v54rdonHdpmRh5KAIGURlql3wWBV1FN8OxDTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762495310; c=relaxed/simple;
	bh=jNK/MYzHi7n/urMQGiuIB/7a1B4zVrZcU5Hj0QPwwJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UvzDRJQNS0lnDz2gPLcxEk2ptwC9JCnZPf/ysV5ocAjZsUE8NQ+kOJM5SvVQHN7Oc9SGegS8ibq0M5vtAcF8dZZbv2PVHoa1jqqxIz+hOWg+w0HfkFp5RE9JvivbJzaUKLsxO39Z/POPS0UG3zgAchHYgdn66X3LdyBn3017pDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8BxG9JIiw1poiYgAA--.2476S3;
	Fri, 07 Nov 2025 14:01:44 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by front1 (Coremail) with SMTP id qMiowJBxzsFCiw1pSJIqAQ--.32958S4;
	Fri, 07 Nov 2025 14:01:44 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 2/5] watchdog: loongson1: Simplify ls1x_wdt_probe code
Date: Fri,  7 Nov 2025 14:01:28 +0800
Message-ID: <7d792b573160cbeb0f797f6b8e2f5dcb54f8b490.1762482089.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762482089.git.zhoubinbin@loongson.cn>
References: <cover.1762482089.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxzsFCiw1pSJIqAQ--.32958S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQETCGkNii4ACAAAsT
X-Coremail-Antispam: 1Uk129KBj93XoW7Ww18Kw1UJry3GrWxGw47ZFc_yoW8GF1rpF
	Z5ua4FkrWUKr429w17t34DAF1fGFWIq3y7Xr4xKw1kuas8Kr15ZFWrJFySya98AFZ7Jr17
	tF9rtrWfua98tFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxV
	WUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jFRRiU
	UUUU=

Remove meaningless output to simplify ls1x_wdt_probe().

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/watchdog/loongson1_wdt.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/loongson1_wdt.c b/drivers/watchdog/loongson1_wdt.c
index 8502263b0d6f..781f01f1f888 100644
--- a/drivers/watchdog/loongson1_wdt.c
+++ b/drivers/watchdog/loongson1_wdt.c
@@ -108,11 +108,11 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
 	struct ls1x_wdt_drvdata *drvdata;
 	struct watchdog_device *ls1x_wdt;
 	unsigned long clk_rate;
-	int err;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
+	platform_set_drvdata(pdev, drvdata);
 
 	drvdata->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(drvdata->base))
@@ -139,15 +139,7 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
 	watchdog_set_nowayout(ls1x_wdt, nowayout);
 	watchdog_set_drvdata(ls1x_wdt, drvdata);
 
-	err = devm_watchdog_register_device(dev, &drvdata->wdt);
-	if (err)
-		return err;
-
-	platform_set_drvdata(pdev, drvdata);
-
-	dev_info(dev, "Loongson1 Watchdog driver registered\n");
-
-	return 0;
+	return devm_watchdog_register_device(dev, &drvdata->wdt);
 }
 
 #ifdef CONFIG_OF
-- 
2.47.3

