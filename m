Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B36F1FB3
	for <loongarch@lists.linux.dev>; Mon, 20 Nov 2023 02:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8BxIvA3yVplVR87AA--.50459S3;
	Mon, 20 Nov 2023 10:49:27 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax3tw2yVplyjFHAA--.23995S2;
	Mon, 20 Nov 2023 10:49:26 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: Peter Zijlstra <peterz@infradead.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v2] LoongArch: Implement constant timer shutdown interface
Date: Mon, 20 Nov 2023 10:46:52 +0800
Message-Id: <20231120024652.3191881-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Ax3tw2yVplyjFHAA--.23995S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGw48XFyUKr4rtFW8ZFyUCFX_yoW5Gw4Dpw
	sxCF9xJrWY93ZaqF1DJrs7Zr98Jw1v93y7tr97Gay8AFyjvr4fKFZ7trZ2vF4YvryFqr42
	ya1Fvw4qgrW7J3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUwmhFDUUUU

When cpu is hot-unplugged,, it is put in idle state and function
arch_cpu_idle_dead is called. Timer interrupt for this processor should be
disabled, else there will be pending timer interrupt for the plug-out cpu,
so that vcpu is prevented from giving up scheduling when system is running
in vm mode.

This patch implements the timer shutdown interface so that the timer will
be properly disabled when a CPU is hot-unplugged.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
Reviewed-by: WANG Xuerui <git@xen0n.name>
---
Changes in v2:
  1. Remove function constant_set_state_oneshot_stopped and add detailed
implementation in constant_set_state_shutdown.
  2. Modify patch description and make it easier to understand.

---
 arch/loongarch/kernel/time.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
index 3064af94db9c..6a1734473aea 100644
--- a/arch/loongarch/kernel/time.c
+++ b/arch/loongarch/kernel/time.c
@@ -58,21 +58,6 @@ static int constant_set_state_oneshot(struct clock_event_device *evt)
 	return 0;
 }
 
-static int constant_set_state_oneshot_stopped(struct clock_event_device *evt)
-{
-	unsigned long timer_config;
-
-	raw_spin_lock(&state_lock);
-
-	timer_config = csr_read64(LOONGARCH_CSR_TCFG);
-	timer_config &= ~CSR_TCFG_EN;
-	csr_write64(timer_config, LOONGARCH_CSR_TCFG);
-
-	raw_spin_unlock(&state_lock);
-
-	return 0;
-}
-
 static int constant_set_state_periodic(struct clock_event_device *evt)
 {
 	unsigned long period;
@@ -92,6 +77,14 @@ static int constant_set_state_periodic(struct clock_event_device *evt)
 
 static int constant_set_state_shutdown(struct clock_event_device *evt)
 {
+	unsigned long timer_config;
+
+	raw_spin_lock(&state_lock);
+	timer_config = csr_read64(LOONGARCH_CSR_TCFG);
+	timer_config &= ~CSR_TCFG_EN;
+	csr_write64(timer_config, LOONGARCH_CSR_TCFG);
+	raw_spin_unlock(&state_lock);
+
 	return 0;
 }
 
@@ -161,7 +154,7 @@ int constant_clockevent_init(void)
 	cd->rating = 320;
 	cd->cpumask = cpumask_of(cpu);
 	cd->set_state_oneshot = constant_set_state_oneshot;
-	cd->set_state_oneshot_stopped = constant_set_state_oneshot_stopped;
+	cd->set_state_oneshot_stopped = constant_set_state_shutdown;
 	cd->set_state_periodic = constant_set_state_periodic;
 	cd->set_state_shutdown = constant_set_state_shutdown;
 	cd->set_next_event = constant_timer_next_event;

base-commit: 037266a5f7239ead1530266f7d7af153d2a867fa
-- 
2.39.3

