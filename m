Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F825C92
	for <loongarch@lists.linux.dev>; Wed, 10 Aug 2022 10:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A9CC433D7;
	Wed, 10 Aug 2022 10:31:49 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Fix the !CONFIG_SMP build for irqchip drivers
Date: Wed, 10 Aug 2022 18:31:56 +0800
Message-Id: <20220810103156.1214996-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1, Guard get_ipi_irq() in CONFIG_SMP;
2, Define cpu_logical_map() for the EIOINTC driver;
3, Make eiointc_set_irq_affinity() return early for !CONFIG_SMP.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/smp.h       | 8 ++++++++
 arch/loongarch/kernel/irq.c            | 2 ++
 drivers/irqchip/irq-loongson-eiointc.c | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
index 71189b28bfb2..9ee5a309df5b 100644
--- a/arch/loongarch/include/asm/smp.h
+++ b/arch/loongarch/include/asm/smp.h
@@ -12,6 +12,8 @@
 #include <linux/threads.h>
 #include <linux/cpumask.h>
 
+#ifdef CONFIG_SMP
+
 extern int smp_num_siblings;
 extern int num_processors;
 extern int disabled_cpus;
@@ -112,4 +114,10 @@ static inline void __cpu_die(unsigned int cpu)
 extern void play_dead(void);
 #endif
 
+#else /* !CONFIG_SMP */
+
+#define cpu_logical_map(cpu)  0
+
+#endif
+
 #endif /* __ASM_SMP_H */
diff --git a/arch/loongarch/kernel/irq.c b/arch/loongarch/kernel/irq.c
index 1ba19c76563e..d83623bc59fa 100644
--- a/arch/loongarch/kernel/irq.c
+++ b/arch/loongarch/kernel/irq.c
@@ -87,6 +87,7 @@ static void __init init_vec_parent_group(void)
 	acpi_table_parse(ACPI_SIG_MCFG, early_pci_mcfg_parse);
 }
 
+#ifdef CONFIG_SMP
 static int __init get_ipi_irq(void)
 {
 	struct irq_domain *d = irq_find_matching_fwnode(cpuintc_handle, DOMAIN_BUS_ANY);
@@ -96,6 +97,7 @@ static int __init get_ipi_irq(void)
 
 	return -EINVAL;
 }
+#endif
 
 void __init init_IRQ(void)
 {
diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index 80d8ca6f2d46..17f94f3c11af 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -18,6 +18,8 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 
+#include <asm/smp.h>
+
 #define EIOINTC_REG_NODEMAP	0x14a0
 #define EIOINTC_REG_IPMAP	0x14c0
 #define EIOINTC_REG_ENABLE	0x1600
@@ -96,6 +98,9 @@ static int eiointc_set_irq_affinity(struct irq_data *d, const struct cpumask *af
 	struct cpumask intersect_affinity;
 	struct eiointc_priv *priv = d->domain->host_data;
 
+	if (!IS_ENABLED(CONFIG_SMP))
+		return -EPERM;
+
 	raw_spin_lock_irqsave(&affinity_lock, flags);
 
 	cpumask_and(&intersect_affinity, affinity, cpu_online_mask);
-- 
2.31.1

