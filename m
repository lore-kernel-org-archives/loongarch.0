Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A869E28313D
	for <loongarch@lists.linux.dev>; Wed,  3 Dec 2025 04:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764737643; cv=none; b=b+LLjvf+8tRfpr2sQYsLN6PIxW1MFnjGV/I+ny8p0ciI+SbsmZ1hb29RVVUykSFl3fKdcEQybn0vf+freMnuOGTv87tFab0GqUbrz6pzz+h8rqeFCfgILbqvPswlSxxQbbGT9pYnUXbq5fNKtEoc27qcdDFmR5YwM/n7Dy/cfNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764737643; c=relaxed/simple;
	bh=XRaMSYPcrFCQBDJFnfNAsbVT2FhJZu7oFrzEv5ZdSeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNuzuTsyXHvU/NAAJCtKC/OJomxUPm5GDV4Iu6e7OoKlG4oDARyknDfXbSuKcAPDxzbFwx7VZNuXhKAtKQnBuvyD575ZMbALHRom47xwHn6sjILaLJVKA2Vre5rt64FmjjV3AizHoKOwzfy87xw7XhACozp5qPZxtQied0zBB/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.57.136])
	by gateway (Coremail) with SMTP id _____8CxJ9FOwi9pF5cqAA--.25563S3;
	Wed, 03 Dec 2025 12:53:34 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.57.136])
	by front1 (Coremail) with SMTP id qMiowJDx6sBNwi9p7NpEAQ--.30497S3;
	Wed, 03 Dec 2025 12:53:33 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	tglx@linutronix.de,
	jiaxun.yang@flygoat.com,
	peterz@infradead.org,
	wangliupu@loongson.cn,
	lvjianmin@loongson.cn,
	maobibo@loongson.cn,
	siyanteng@cqsoftware.com.cn,
	gaosong@loongson.cn,
	yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH v7 3/5] irqchip/irq-loongson.h:irq-loongson.h preparation for Redirect irqchip
Date: Wed,  3 Dec 2025 12:53:29 +0800
Message-ID: <20251203045331.33035-2-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20251203045331.33035-1-zhangtianyang@loongson.cn>
References: <20251203045331.33035-1-zhangtianyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDx6sBNwi9p7NpEAQ--.30497S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGFy8AF1rXrW5WrW3Zw4kKrX_yoW5Jw1rpF
	W5Aay29r48tF4xXry5Gw1kXFy3ZFyxKrZrtayfGayfXFZ8Gws7WFy2qF95ZFy8Gr48ua4x
	ur48tF1UuFs8A3gCm3ZEXasCq-sJn29KB7ZKAUJUUUjP529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUmYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1q6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_GFv_Wryle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y40E4IxF1VCIxcxG6Fyj6r4UJwCY1x0262kKe7AKxVW8ZVWrXwCF04k2
	0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVW8ZVWrXwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU9qXdUUUUU

Adjusted definitions and macro from loongson-avec.c to irq-loongson.h,
including:
1 marco AVEC_MSG_OFFSET
2 struct avecintc_data
3 Make avecintc_sync public

Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 drivers/irqchip/irq-loongarch-avec.c | 12 +-----------
 drivers/irqchip/irq-loongson.h       | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
index bf52dc8345f5..514ad8dedc46 100644
--- a/drivers/irqchip/irq-loongarch-avec.c
+++ b/drivers/irqchip/irq-loongarch-avec.c
@@ -24,7 +24,6 @@
 #define VECTORS_PER_REG		64
 #define IRR_VECTOR_MASK		0xffUL
 #define IRR_INVALID_MASK	0x80000000UL
-#define AVEC_MSG_OFFSET		0x100000
 
 #ifdef CONFIG_SMP
 struct pending_list {
@@ -47,15 +46,6 @@ struct avecintc_chip {
 
 static struct avecintc_chip loongarch_avec;
 
-struct avecintc_data {
-	struct list_head	entry;
-	unsigned int		cpu;
-	unsigned int		vec;
-	unsigned int		prev_cpu;
-	unsigned int		prev_vec;
-	unsigned int		moving;
-};
-
 static inline void avecintc_enable(void)
 {
 	u64 value;
@@ -85,7 +75,7 @@ static inline void pending_list_init(int cpu)
 	INIT_LIST_HEAD(&plist->head);
 }
 
-static void avecintc_sync(struct avecintc_data *adata)
+void avecintc_sync(struct avecintc_data *adata)
 {
 	struct pending_list *plist;
 
diff --git a/drivers/irqchip/irq-loongson.h b/drivers/irqchip/irq-loongson.h
index 11fa138d1f44..1f11d799bf0a 100644
--- a/drivers/irqchip/irq-loongson.h
+++ b/drivers/irqchip/irq-loongson.h
@@ -6,6 +6,17 @@
 #ifndef _DRIVERS_IRQCHIP_IRQ_LOONGSON_H
 #define _DRIVERS_IRQCHIP_IRQ_LOONGSON_H
 
+#define AVEC_MSG_OFFSET		0x100000
+
+struct avecintc_data {
+	struct list_head        entry;
+	unsigned int            cpu;
+	unsigned int            vec;
+	unsigned int            prev_cpu;
+	unsigned int            prev_vec;
+	unsigned int            moving;
+};
+
 int find_pch_pic(u32 gsi);
 
 int liointc_acpi_init(struct irq_domain *parent,
@@ -24,4 +35,12 @@ int pch_msi_acpi_init(struct irq_domain *parent,
 					struct acpi_madt_msi_pic *acpi_pchmsi);
 int pch_msi_acpi_init_avec(struct irq_domain *parent);
 
+int redirect_acpi_init(struct irq_domain *parent);
+
+#ifdef CONFIG_SMP
+void avecintc_sync(struct avecintc_data *adata);
+#else
+static inline void avecintc_sync(struct avecintc_data *adata) {}
+#endif
+
 #endif /* _DRIVERS_IRQCHIP_IRQ_LOONGSON_H */
-- 
2.41.0

