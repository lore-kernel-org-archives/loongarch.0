Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F633186B
	for <loongarch@lists.linux.dev>; Fri,  2 Dec 2022 07:58:56 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.9.158])
	by gateway (Coremail) with SMTP id _____8Axjus+sIljOb4CAA--.6588S3;
	Fri, 02 Dec 2022 15:58:54 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.9.158])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx9VY+sIljqjckAA--.5784S2;
	Fri, 02 Dec 2022 15:58:54 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: export symbol with function smp_send_reschedule
Date: Fri,  2 Dec 2022 15:58:54 +0800
Message-Id: <20221202075854.2253116-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx9VY+sIljqjckAA--.5784S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7tr47Zw4xJw15Kr43tr1xGrg_yoW8uFy3pF
	9xZrn7Gr45W3s3A3s8A3yrur45Gws5GrnFqa17tFWrAFnFq3W8ZryktwnFqF10q3y0kF1F
	gFs5W34fKFyUAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr
	0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==

Function smp_send_reschedule is standard kernel ABI, which is
defined header file include/linux/smp.h, however on LoongArch
it is defined as inline function, so that kernel module can
not use this function.

Now define smp_send_reschedule as general function, and add
EXPORT_SYMBOL_GPL on this function, so that kernel modules can
use it.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/include/asm/smp.h | 10 ----------
 arch/loongarch/kernel/smp.c      | 11 +++++++++++
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
index 3dd172d9ffea..d82687390b4a 100644
--- a/arch/loongarch/include/asm/smp.h
+++ b/arch/loongarch/include/asm/smp.h
@@ -78,16 +78,6 @@ extern void calculate_cpu_foreign_map(void);
  */
 extern void show_ipi_list(struct seq_file *p, int prec);
 
-/*
- * This function sends a 'reschedule' IPI to another CPU.
- * it goes straight through and wastes no time serializing
- * anything. Worst case is that we lose a reschedule ...
- */
-static inline void smp_send_reschedule(int cpu)
-{
-	loongson_send_ipi_single(cpu, SMP_RESCHEDULE);
-}
-
 static inline void arch_send_call_function_single_ipi(int cpu)
 {
 	loongson_send_ipi_single(cpu, SMP_CALL_FUNCTION);
diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index 6ed72f7ff278..51dd3c3f06cb 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -141,6 +141,17 @@ void loongson_send_ipi_single(int cpu, unsigned int action)
 	ipi_write_action(cpu_logical_map(cpu), (u32)action);
 }
 
+/*
+ * This function sends a 'reschedule' IPI to another CPU.
+ * it goes straight through and wastes no time serializing
+ * anything. Worst case is that we lose a reschedule ...
+ */
+void smp_send_reschedule(int cpu)
+{
+	loongson_send_ipi_single(cpu, SMP_RESCHEDULE);
+}
+EXPORT_SYMBOL_GPL(smp_send_reschedule);
+
 void loongson_send_ipi_mask(const struct cpumask *mask, unsigned int action)
 {
 	unsigned int i;
-- 
2.27.0

