Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D9D2797AD
	for <loongarch@lists.linux.dev>; Sat,  6 Sep 2025 06:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757141406; cv=none; b=rGSPRP4/3lwtyPHHSCJzf6adV0shluY2rfaXrQlex6f5xFFk+C6jyTd1YazjD9jMY/K0ozdxXfDNglrKNx2dPEepkw4fz8jQzH0jCXbPMo4jUh4RmH98yRJsnZFOhzFnsiS83zGrKlk8J4u9vCTeq6sR2AyU4WrudhFAP5hMaaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757141406; c=relaxed/simple;
	bh=LlUX4MJaaSh7LZmA9f9FS/sywguLW+RUIRJ8UNXhu8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eKzDlBgTbWgl9E5kZNaOUkYSYvEQK7p7ZQsHXD+u+i0ypH2bHcf6bT77hpTMvd2n2UkJrsRFEp3fHcNuowc8tMI+ERQ7JQluGg8BurCihiE0plunRDpRBiJ5MGyykwv3+mZrBDHxX4hANik5tZJb99D11qs1fsZgfViPbDobjKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Bxnr+U2btooVcHAA--.14497S3;
	Sat, 06 Sep 2025 14:49:56 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJDx_8OQ2btoJZuBAA--.17141S3;
	Sat, 06 Sep 2025 14:49:56 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Xianglai Li <lixianglai@loongson.cn>
Subject: [PATCH v3 1/2] tick: Remove unreasonable detached state set in tick_shutdown()
Date: Sat,  6 Sep 2025 14:49:51 +0800
Message-Id: <20250906064952.3749122-2-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250906064952.3749122-1-maobibo@loongson.cn>
References: <20250906064952.3749122-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDx_8OQ2btoJZuBAA--.17141S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Function clockevents_switch_state() will check whether it has already
switched to specified state, do nothing if it has.

In function tick_shutdown(), it will set detached state at first and
call clockevents_switch_state() in clockevents_exchange_device(). The
function clockevents_switch_state() will do nothing since it is already
detached state. So the tick timer device will not be shutdown when CPU
is offline.

Function tick_shutdown() did this because it was originally invoked
on a life CPU and not on the outgoing CPU. Now this function is called
on the outgoing CPU, the hardware device can be accessed.

Here remove state set before calling clockevents_exchange_device(), its
state will be set in function clockevents_switch_state() if it succeeds
to do so.

Fixes: 3b1596a21fbf ("clockevents: Shutdown and unregister current clockevents at CPUHP_AP_TICK_DYING")

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/time/clockevents.c   |  2 +-
 kernel/time/tick-common.c   | 16 +++++-----------
 kernel/time/tick-internal.h |  2 +-
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/kernel/time/clockevents.c b/kernel/time/clockevents.c
index f3e831f62906..a59bc75ab7c5 100644
--- a/kernel/time/clockevents.c
+++ b/kernel/time/clockevents.c
@@ -633,7 +633,7 @@ void tick_offline_cpu(unsigned int cpu)
 	raw_spin_lock(&clockevents_lock);
 
 	tick_broadcast_offline(cpu);
-	tick_shutdown(cpu);
+	tick_shutdown();
 
 	/*
 	 * Unregister the clock event devices which were
diff --git a/kernel/time/tick-common.c b/kernel/time/tick-common.c
index 9a3859443c04..7e33d3f2e889 100644
--- a/kernel/time/tick-common.c
+++ b/kernel/time/tick-common.c
@@ -411,24 +411,18 @@ int tick_cpu_dying(unsigned int dying_cpu)
 }
 
 /*
- * Shutdown an event device on a given cpu:
+ * Shutdown an event device on the outgoing CPU:
  *
- * This is called on a life CPU, when a CPU is dead. So we cannot
- * access the hardware device itself.
- * We just set the mode and remove it from the lists.
+ * Called by the dying CPU during teardown, with clockevents_lock held
+ * and interrupts disabled.
  */
-void tick_shutdown(unsigned int cpu)
+void tick_shutdown(void)
 {
-	struct tick_device *td = &per_cpu(tick_cpu_device, cpu);
+	struct tick_device *td = this_cpu_ptr(&tick_cpu_device);
 	struct clock_event_device *dev = td->evtdev;
 
 	td->mode = TICKDEV_MODE_PERIODIC;
 	if (dev) {
-		/*
-		 * Prevent that the clock events layer tries to call
-		 * the set mode function!
-		 */
-		clockevent_set_state(dev, CLOCK_EVT_STATE_DETACHED);
 		clockevents_exchange_device(dev, NULL);
 		dev->event_handler = clockevents_handle_noop;
 		td->evtdev = NULL;
diff --git a/kernel/time/tick-internal.h b/kernel/time/tick-internal.h
index faac36de35b9..4e4f7bbe2a64 100644
--- a/kernel/time/tick-internal.h
+++ b/kernel/time/tick-internal.h
@@ -26,7 +26,7 @@ extern void tick_setup_periodic(struct clock_event_device *dev, int broadcast);
 extern void tick_handle_periodic(struct clock_event_device *dev);
 extern void tick_check_new_device(struct clock_event_device *dev);
 extern void tick_offline_cpu(unsigned int cpu);
-extern void tick_shutdown(unsigned int cpu);
+extern void tick_shutdown(void);
 extern void tick_suspend(void);
 extern void tick_resume(void);
 extern bool tick_check_replacement(struct clock_event_device *curdev,
-- 
2.39.3

