Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323395672
	for <loongarch@lists.linux.dev>; Thu, 15 Jun 2023 09:18:13 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8DxyOlM14pkRYAFAA--.11696S3;
	Thu, 15 Jun 2023 17:18:04 +0800 (CST)
Received: from user-pc.202.106.0.20 (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxVeRH14pkxssbAA--.13716S3;
	Thu, 15 Jun 2023 17:18:03 +0800 (CST)
From: Yinbo Zhu <zhuyinbo@loongson.cn>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Marc Zyngier <maz@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Cc: Jianmin Lv <lvjianmin@loongson.cn>,
	wanghongliang@loongson.cn,
	Liu Peibao <liupeibao@loongson.cn>,
	loongson-kernel@lists.loongnix.cn,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Subject: [PATCH v3 1/3] loongarch: export some arch-specific pm interfaces
Date: Thu, 15 Jun 2023 17:17:55 +0800
Message-Id: <20230615091757.24686-2-zhuyinbo@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230615091757.24686-1-zhuyinbo@loongson.cn>
References: <20230615091757.24686-1-zhuyinbo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxVeRH14pkxssbAA--.13716S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Some power management controllers need to support DTS and will use
the suspend interface thus this patch was to export such interface
for their use.

Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
---
 arch/loongarch/include/asm/acpi.h    |  3 +--
 arch/loongarch/include/asm/suspend.h | 10 ++++++++++
 arch/loongarch/power/suspend.c       |  8 ++++----
 3 files changed, 15 insertions(+), 6 deletions(-)
 create mode 100644 arch/loongarch/include/asm/suspend.h

diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/asm/acpi.h
index 976a810352c6..1d7810798c08 100644
--- a/arch/loongarch/include/asm/acpi.h
+++ b/arch/loongarch/include/asm/acpi.h
@@ -8,6 +8,7 @@
 #ifndef _ASM_LOONGARCH_ACPI_H
 #define _ASM_LOONGARCH_ACPI_H
 
+#include <asm/suspend.h>
 #ifdef CONFIG_ACPI
 extern int acpi_strict;
 extern int acpi_disabled;
@@ -37,12 +38,10 @@ extern struct list_head acpi_wakeup_device_list;
 
 extern int loongarch_acpi_suspend(void);
 extern int (*acpi_suspend_lowlevel)(void);
-extern void loongarch_suspend_enter(void);
 
 static inline unsigned long acpi_get_wakeup_address(void)
 {
 #ifdef CONFIG_SUSPEND
-	extern void loongarch_wakeup_start(void);
 	return (unsigned long)loongarch_wakeup_start;
 #endif
 	return 0UL;
diff --git a/arch/loongarch/include/asm/suspend.h b/arch/loongarch/include/asm/suspend.h
new file mode 100644
index 000000000000..fc64089fefaa
--- /dev/null
+++ b/arch/loongarch/include/asm/suspend.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_SUSPEND_H
+#define __ASM_SUSPEND_H
+
+void loongarch_common_resume(void);
+void loongarch_common_suspend(void);
+void loongarch_suspend_enter(void);
+void loongarch_wakeup_start(void);
+
+#endif
diff --git a/arch/loongarch/power/suspend.c b/arch/loongarch/power/suspend.c
index 5e19733e5e05..166d9e06a64b 100644
--- a/arch/loongarch/power/suspend.c
+++ b/arch/loongarch/power/suspend.c
@@ -27,7 +27,7 @@ struct saved_registers {
 };
 static struct saved_registers saved_regs;
 
-static void arch_common_suspend(void)
+void loongarch_common_suspend(void)
 {
 	save_counter();
 	saved_regs.pgd = csr_read64(LOONGARCH_CSR_PGDL);
@@ -40,7 +40,7 @@ static void arch_common_suspend(void)
 	loongarch_suspend_addr = loongson_sysconf.suspend_addr;
 }
 
-static void arch_common_resume(void)
+void loongarch_common_resume(void)
 {
 	sync_counter();
 	local_flush_tlb_all();
@@ -62,12 +62,12 @@ int loongarch_acpi_suspend(void)
 	enable_gpe_wakeup();
 	enable_pci_wakeup();
 
-	arch_common_suspend();
+	loongarch_common_suspend();
 
 	/* processor specific suspend */
 	loongarch_suspend_enter();
 
-	arch_common_resume();
+	loongarch_common_resume();
 
 	return 0;
 }
-- 
2.20.1

