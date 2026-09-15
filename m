Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B8D37FF50
	for <loongarch@lists.linux.dev>; Tue, 15 Sep 2026 09:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463851; cv=none; b=P9/6OWz9ZHHQcR79myejdAQ1QNikmsGCPqwkXbPqzF8K+cU9lKRlIi1XYDteEZqS8bjEVKhNBXgNg2ef7Uw1h/ReR0BVz3ZAS/dWIGILJ0v1g0GPwZiAOZZ5+1Zd0mc5J9rKje2cNgR8MFnAZCK/6YshIcB6Gc0CEVqWD1XcbK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463851; c=relaxed/simple;
	bh=ugEfg7AXlHxdKcviED0e+xDhN7V4+8EYzdt0Vszv3Zk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E8yOEpeOJfehXuTz1Um/txiwkAk/USayRGvIw7SOY5+34lmkdFZ/YF06r/hJSNwE2/Tjkvc6ZNcLtrztw85wzjqc5UdNAKj3J5wOImeQx24+HobyU9AjYsaVQomdQlUSv/90TzBhXQ4JCEui+YlKRV2dexF4EULFylPz4zEwRcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=lNODUYXM; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="lNODUYXM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1789463816;
	bh=zSn6/Xt03VlF5C2px1uerRteZ5rlSNoUnzRPAIMuVYs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=lNODUYXM1dZ2pT0bllCorQTuxXCnevfjvWwX5cBhEQvlFLomHJRa+kzbtL6AivXW0
	 qPsM+jy+bITP+QDKO2xUj4w0tHbwLFwVlwus7kyydIZ879cp9uM0WsL2o5l1Tfql1X
	 wW9bD1ngjEWQK1fmI19qXL6o8f/O+qgfMQpUBWu0=
X-QQ-mid: esmtpgz13t1789463779t0a40db71
X-QQ-Originating-IP: R5lNfAsjNhsm7RrOxcFq1g2DszbpyFUq5YMcKgY8/CQ=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Sep 2026 17:16:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5476555254069493490
EX-QQ-RecipientCnt: 10
From: Wentao Guan <guanwentao@uniontech.com>
To: chenhuacai@kernel.org,
	lixianglai@loongson.cn
Cc: kernel@xen0n.name,
	tglx@kernel.org,
	jiaxun.yang@flygoat.com,
	loongarch@lists.linux.dev,
	guanwentao@deepin.org,
	shaoyang@uniontech.com,
	linux-kernel@vger.kernel.org,
	Wentao Guan <guanwentao@uniontech.com>
Subject: [PATCH] LoongArch: Clear the pending timer interrupt when the clockevent stops
Date: Tue, 15 Sep 2026 17:15:43 +0800
Message-Id: <20260915091542.1701069-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M7OGOwGJ/FwKALPUPKeWVCkEehMsNHrukxaQlqFNBYzY3Ut2A+7i0L4E
	Mih3q4FNJTbUEymlLopcTxGfMHZylTezu438VHRMe4m4GxA8brpgJ4v6ACixTG+yerX8q2X
	PZnja50Bxw1FXbZTRMXwZKAgHUxtgePN1jjOmQP3RjDeEI4vAp94D3qNAZAQ8XFS+QdUrYE
	dEt4clneIHgg0LGbl5lDeywi7NPEtQtnRZ/dUZ+weZ7/MghfZX3xg9aq8rWAhHbi2pBlLWa
	ZrFKBWSUUKCfJjg0ch5OtAFXxuGwjxxtTyKj0oVw1lfoylc7TE1XN7yPO/nGhE2DtiPQcU5
	Pqx6Y/XNPZqNS2drATnQZZe3B8UUCqB9B5UWWMqb2XkO3YDmLwgJ+mnmReW9D+d3Mqv0cjx
	PqiRQloQu/zwfDanLML3D1plUMk6HAgc/XT0BLkm333btrba4ajJOOzlOJbrdk778CssM/g
	EqjagYAaz7PDQdoQ57KN2vuA40xp4nO6LQYU0icseAB8NBYAldvijOsnKGb0ULfNYE/Pxwc
	4bs2QYorsgUE5CKEvYwa0OyTY4uui6H5ONdGKudjWjSWQWBFTQZ8pVklTVcUUe4D5yxM7Va
	5twbDlPkbdghrzzbEuXU9iaCW0BZQJEJd92OHX905gEeZmV7E7IO90e+oQb9FQlLRAERJsJ
	24zgkwniw6YB8qiJIBowbHFj2SzrTK2G74B3gtASME9mykNXXTiGfPUj+3i83lVHATI5SCB
	6bHv9Z6wjoWdPIWU/iRhAjXmqdQyWDX9MBaGTB/mWNf22Hxmee638Mn2CgbbIxzW0ZN1vUl
	g8sKqGK/lOWWPKm/n9t9aZf+cesDnVgKvOtC5pH9rMrUq81vVosg10i85Njywvq8Sbuu2hw
	ZU7pjGQResEfQUHln4f4N45ATvVMvbqILpfFnaeNwbRdJlXx3RreElXasFJJ/QOYmzlWHV3
	0foibEKRe3CR1qTy5xuaSvwSk2WHTGD/1X5om/cYcEw0dxhomi2fXFbkIXeWHeOkjokEMFI
	f09C6GFJJBp07+G9ZbsbSYwRY5VbsBso7GtzH1ClY+VA3bKh5YfTSXuR4ggFhfzIXq/I0hz
	A==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

commit 8ef7f3132e40 ("LoongArch: Add cpuhotplug hooks to fix high cpu
usage of vCPU threads") clears a latched timer interrupt from a cpuhp
teardown callback, because a pending timer interrupt keeps waking an
offline CPU up again right after it entered the idle instruction.
Clearing a pending timer interrupt is part of stopping a clockevent
device on other architectures: lapic_timer_shutdown() masks the local
APIC timer and zeroes its counter, and riscv_clock_shutdown() calls
riscv_clock_event_stop(), which clears the timer interrupt.

Clear the pending timer interrupt in constant_set_state_shutdown()
instead. The clockevents core already stops the device before the CPU
is parked, through the generic tick teardown (tick_cpu_dying(),
registered on CPUHP_AP_TICK_DYING), so the cpuhp hooks have nothing
left to do: the startup callback only repeats what
loongson_init_secondary() does on every bring-up, and the teardown
callback only did the write_csr_tintclear() that now happens when the
device is stopped. CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING is not
needed any more and is removed.

Assisted-by: atomcode:deepseek-v4.1-flash
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
---
 arch/loongarch/kernel/time.c | 23 +++--------------------
 include/linux/cpuhotplug.h   |  1 -
 2 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
index dbaaabcaf6f09..64136a541b049 100644
--- a/arch/loongarch/kernel/time.c
+++ b/arch/loongarch/kernel/time.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
  */
 #include <linux/clockchips.h>
-#include <linux/cpuhotplug.h>
 #include <linux/delay.h>
 #include <linux/export.h>
 #include <linux/init.h>
@@ -88,6 +87,9 @@ static int constant_set_state_shutdown(struct clock_event_device *evt)
 	timer_config &= ~CSR_TCFG_EN;
 	csr_write(timer_config, LOONGARCH_CSR_TCFG);
 
+	/* Clear Timer Interrupt */
+	write_csr_tintclear(CSR_TINTCLR_TI);
+
 	raw_spin_unlock(&state_lock);
 
 	return 0;
@@ -104,21 +106,6 @@ static int constant_timer_next_event(unsigned long delta, struct clock_event_dev
 	return 0;
 }
 
-static int arch_timer_starting(unsigned int cpu)
-{
-	set_csr_ecfg(ECFGF_TIMER);
-
-	return 0;
-}
-
-static int arch_timer_dying(unsigned int cpu)
-{
-	/* Clear Timer Interrupt */
-	write_csr_tintclear(CSR_TINTCLR_TI);
-
-	return 0;
-}
-
 static unsigned long get_loops_per_jiffy(void)
 {
 	u64 lpj = const_clock_freq;
@@ -189,10 +176,6 @@ int constant_clockevent_init(void)
 	lpj_fine = get_loops_per_jiffy();
 	pr_info("Constant clock event device register\n");
 
-	cpuhp_setup_state(CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING,
-			  "clockevents/loongarch/timer:starting",
-			  arch_timer_starting, arch_timer_dying);
-
 	return 0;
 }
 
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 0fb3a2a62eb00..6e4bac0bf811a 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -167,7 +167,6 @@ enum cpuhp_state {
 	CPUHP_AP_QCOM_TIMER_STARTING,
 	CPUHP_AP_TEGRA_TIMER_STARTING,
 	CPUHP_AP_ARMADA_TIMER_STARTING,
-	CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING,
 	CPUHP_AP_MIPS_GIC_TIMER_STARTING,
 	CPUHP_AP_ARC_TIMER_STARTING,
 	CPUHP_AP_REALTEK_TIMER_STARTING,
-- 
2.30.2

