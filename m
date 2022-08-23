Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2987B
	for <loongarch@lists.linux.dev>; Tue, 23 Aug 2022 09:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9FDC433C1;
	Tue, 23 Aug 2022 09:06:48 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Add SysRq-x (TLB Dump) support
Date: Tue, 23 Aug 2022 17:06:36 +0800
Message-Id: <20220823090636.526090-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SysRq-x (TLB Dump) support for LoongArch, which is useful for
debugging.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/Makefile |  2 ++
 arch/loongarch/kernel/sysrq.c  | 65 ++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/loongarch/kernel/sysrq.c

diff --git a/arch/loongarch/kernel/Makefile b/arch/loongarch/kernel/Makefile
index a213e994db68..7225916dd378 100644
--- a/arch/loongarch/kernel/Makefile
+++ b/arch/loongarch/kernel/Makefile
@@ -23,6 +23,8 @@ obj-$(CONFIG_SMP)		+= smp.o
 
 obj-$(CONFIG_NUMA)		+= numa.o
 
+obj-$(CONFIG_MAGIC_SYSRQ)	+= sysrq.o
+
 obj-$(CONFIG_UNWINDER_GUESS)	+= unwind_guess.o
 obj-$(CONFIG_UNWINDER_PROLOGUE) += unwind_prologue.o
 
diff --git a/arch/loongarch/kernel/sysrq.c b/arch/loongarch/kernel/sysrq.c
new file mode 100644
index 000000000000..366baef72d29
--- /dev/null
+++ b/arch/loongarch/kernel/sysrq.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * LoongArch specific sysrq operations.
+ *
+ * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
+ */
+#include <linux/init.h>
+#include <linux/smp.h>
+#include <linux/spinlock.h>
+#include <linux/sysrq.h>
+#include <linux/workqueue.h>
+
+#include <asm/cpu-features.h>
+#include <asm/tlb.h>
+
+/*
+ * Dump TLB entries on all CPUs.
+ */
+
+static DEFINE_SPINLOCK(show_lock);
+
+static void sysrq_tlbdump_single(void *dummy)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&show_lock, flags);
+
+	pr_info("CPU%d:\n", smp_processor_id());
+	dump_tlb_regs();
+	pr_info("\n");
+	dump_tlb_all();
+	pr_info("\n");
+
+	spin_unlock_irqrestore(&show_lock, flags);
+}
+
+#ifdef CONFIG_SMP
+static void sysrq_tlbdump_othercpus(struct work_struct *dummy)
+{
+	smp_call_function(sysrq_tlbdump_single, NULL, 0);
+}
+
+static DECLARE_WORK(sysrq_tlbdump, sysrq_tlbdump_othercpus);
+#endif
+
+static void sysrq_handle_tlbdump(int key)
+{
+	sysrq_tlbdump_single(NULL);
+#ifdef CONFIG_SMP
+	schedule_work(&sysrq_tlbdump);
+#endif
+}
+
+static struct sysrq_key_op sysrq_tlbdump_op = {
+	.handler        = sysrq_handle_tlbdump,
+	.help_msg       = "show-tlbs(x)",
+	.action_msg     = "Show TLB entries",
+	.enable_mask	= SYSRQ_ENABLE_DUMP,
+};
+
+static int __init loongarch_sysrq_init(void)
+{
+	return register_sysrq_key('x', &sysrq_tlbdump_op);
+}
+arch_initcall(loongarch_sysrq_init);
-- 
2.31.1

