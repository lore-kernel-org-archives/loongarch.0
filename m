Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2322904
	for <loongarch@lists.linux.dev>; Fri, 16 Sep 2022 07:20:44 +0000 (UTC)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.32])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxbWuKIyRj8fAaAA--.56566S2;
	Fri, 16 Sep 2022 15:19:38 +0800 (CST)
From: Jianmin Lv <lvjianmin@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] irqchip/loongson-pch-lpc: Add dependence on LoongArch
Date: Fri, 16 Sep 2022 15:19:26 +0800
Message-Id: <20220916071926.28368-1-lvjianmin@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxbWuKIyRj8fAaAA--.56566S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw4xAw43XF4rKryUWFWruFg_yoWfJrXEka
	4Y9F4vyFnxCryUWryjqr4fWryUKayqgws2kw4jqr1fX3WIqw1xK3ZxZa15Kr47JFWqgFsI
	93yfCrs2kw1UXjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
	wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
	vE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2
	jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
	8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_
	JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAI
	w28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUF9a9DU
	UUU
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/

The loongson-pch-lpc driver may be selected in a random
configuration, but it is only supported for LoongArch, So,
the dependence on LoongArch is added for it to avoid compile
error for a random configuration of other architetures.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 66b9fa408bf2..70fbc5a3f644 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -623,8 +623,9 @@ config LOONGSON_PCH_MSI
 
 config LOONGSON_PCH_LPC
 	bool "Loongson PCH LPC Controller"
+	depends on LOONGARCH
 	depends on MACH_LOONGSON64
-	default (MACH_LOONGSON64 && LOONGARCH)
+	default MACH_LOONGSON64
 	select IRQ_DOMAIN_HIERARCHY
 	help
 	  Support for the Loongson PCH LPC Controller.
-- 
2.31.1

