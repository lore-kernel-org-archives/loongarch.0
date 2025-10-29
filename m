Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B957A2E975A
	for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 02:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761703750; cv=none; b=ag27E5RThix6HWGZLH4rFVW+5a0IeOpma6kpa7+4G8COSrOGNeFFwoG1/woEeHwh37E3P5M/dThaF93cLyGOJeaTPo1jkvA6K6uT7GcGdSSU67WuFz/wgoEBe1EK9LVHoV2FOEqRqfy5MWcSHeL/we3WEyFMheitqtGgYpiFAf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761703750; c=relaxed/simple;
	bh=pWLIeOrIPvij3ly95Tw1VY7CEj4IzIlnm2x9qNT8xmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CzArXAbMGW3xDuPoEZAAWGhP5+ZA4PxNAfUJU2z4ikkpEpZF55uoskQU9f/8s4THyVbSh0h8mX6SIWlLocE5LeP1qwk7dVe0rIdLhcJeNyCdcoCSseBSMkNgtVNYYBIN4SNuBGx/mkIWQ01mKMgFOIxUBRz6G4hqPl8q0H9vizg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8Bx379DdwFpXdobAA--.58331S3;
	Wed, 29 Oct 2025 10:09:07 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by front1 (Coremail) with SMTP id qMiowJDxqcA5dwFpbrAXAQ--.64967S5;
	Wed, 29 Oct 2025 10:09:06 +0800 (CST)
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
Subject: [PATCH 3/6] watchdog: loongson: Simplify loongson_wdt_probe code
Date: Wed, 29 Oct 2025 10:08:47 +0800
Message-ID: <20251029020847.1946295-4-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251029020847.1946295-1-zhoubinbin@loongson.cn>
References: <20251029020847.1946295-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxqcA5dwFpbrAXAQ--.64967S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEKCGkAWxIUqAAAsd
X-Coremail-Antispam: 1Uk129KBj93XoW7Zw13XrWkKrWrXrWkJF4DKFX_yoW8GFyxpF
	ZxZa4FkrW7trsFvrnrJ3yDZF13C34Iq3sxXF4xKw18u3s8Jw15X34rJFyxKa98AFZ8JFy2
	qFyxtrW8ua98tFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1q6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUoxR6UUUUU

Remove meaningless output to simplify loongson_wdt_probe().

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/watchdog/loongson_wdt.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/loongson_wdt.c b/drivers/watchdog/loongson_wdt.c
index 2e7803ce7d42..3e0c3cac14f9 100644
--- a/drivers/watchdog/loongson_wdt.c
+++ b/drivers/watchdog/loongson_wdt.c
@@ -106,11 +106,11 @@ static int loongson_wdt_probe(struct platform_device *pdev)
 	struct loongson_wdt_drvdata *drvdata;
 	struct watchdog_device *loongson_wdt;
 	unsigned long clk_rate;
-	int err;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
+	platform_set_drvdata(pdev, drvdata);
 
 	drvdata->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(drvdata->base))
@@ -137,15 +137,7 @@ static int loongson_wdt_probe(struct platform_device *pdev)
 	watchdog_set_nowayout(loongson_wdt, nowayout);
 	watchdog_set_drvdata(loongson_wdt, drvdata);
 
-	err = devm_watchdog_register_device(dev, &drvdata->wdt);
-	if (err)
-		return err;
-
-	platform_set_drvdata(pdev, drvdata);
-
-	dev_info(dev, "Loongson Watchdog driver registered\n");
-
-	return 0;
+	return devm_watchdog_register_device(dev, &drvdata->wdt);
 }
 
 #ifdef CONFIG_OF
-- 
2.47.3

