Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851743C00
	for <loongarch@lists.linux.dev>; Sat,  2 Sep 2023 08:47:51 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8Ax1fC19vJk7_4dAA--.61257S3;
	Sat, 02 Sep 2023 16:47:49 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxWM2z9vJkbI1pAA--.60477S3;
	Sat, 02 Sep 2023 16:47:49 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 5/5] soc: loongson: loongson2_pm: Populate children syscon nodes
Date: Sat,  2 Sep 2023 16:47:45 +0800
Message-Id: <da06ff3c2405f36c8cedddfd20f8b54f4448f619.1693623752.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1693623752.git.zhoubinbin@loongson.cn>
References: <cover.1693623752.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxWM2z9vJkbI1pAA--.60477S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XF13WFy3tryUXr43AFy3KFX_yoWkKwc_u3
	W29r48Cr1UJFnIy398Zw13Ar9Fgrn5u3W8uF1Dtw1Iq3WUt3sxJFyUArnrGF17WF4Syrn8
	Z3y0gw1Ikw1rCosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbSAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWr
	XVW3AwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jqsjbUUUUU=

The syscon poweroff and reboot nodes logically belong to the Power
Management Unit so populate possible children.

Without it, the reboot/poweroff feature becomes unavailable.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/soc/loongson/loongson2_pm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/loongson/loongson2_pm.c b/drivers/soc/loongson/loongson2_pm.c
index 5ffb77afd9eb..b8e5e1e3528a 100644
--- a/drivers/soc/loongson/loongson2_pm.c
+++ b/drivers/soc/loongson/loongson2_pm.c
@@ -11,6 +11,7 @@
 #include <linux/input.h>
 #include <linux/suspend.h>
 #include <linux/interrupt.h>
+#include <linux/of_platform.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/platform_device.h>
 #include <asm/bootinfo.h>
@@ -192,6 +193,11 @@ static int loongson2_pm_probe(struct platform_device *pdev)
 	if (loongson_sysconf.suspend_addr)
 		suspend_set_ops(&loongson2_suspend_ops);
 
+	/* Populate children */
+	retval = devm_of_platform_populate(dev);
+	if (retval)
+		dev_err(dev, "Error populating children, reboot and poweroff might not work properly\n");
+
 	return 0;
 }
 
-- 
2.39.3

