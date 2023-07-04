Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E8A53B6
	for <loongarch@lists.linux.dev>; Tue,  4 Jul 2023 12:53:49 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.108])
	by gateway (Coremail) with SMTP id _____8Ax1fBcFqRkygQAAA--.44S3;
	Tue, 04 Jul 2023 20:53:48 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.108])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax98xaFqRkXDAbAA--.63241S3;
	Tue, 04 Jul 2023 20:53:47 +0800 (CST)
From: Feiyang Chen <chenfeiyang@loongson.cn>
To: chenhuacai@kernel.org
Cc: Feiyang Chen <chenfeiyang@loongson.cn>,
	dvyukov@google.com,
	andreyknvl@gmail.com,
	loongarch@lists.linux.dev,
	kasan-dev@googlegroups.com,
	chris.chenfeiyang@gmail.com,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH 1/2] LoongArch: relocatable: Provide kaslr_offset() to get the kernel offset
Date: Tue,  4 Jul 2023 20:53:31 +0800
Message-Id: <cfc7b16d31d0f2dbe08d5d835f34796b2074a35a.1688369658.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1688369658.git.chenfeiyang@loongson.cn>
References: <cover.1688369658.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Ax98xaFqRkXDAbAA--.63241S3
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZw4DWrWxKr4kuF17AF1kJFc_yoWrJFyDpF
	9rZw1Dtr4fGr1xGrWqqa4kury5JwsrWw1agFsFk34xZ3W2qFy5JaykuFnruayUX3y0vF4f
	Xas8trnFva1DJ3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
	UjIFyTuYvjxUc-eODUUUU

Provide kaslr_offset() to get the kernel offset when KASLR is enabled.
Rename reloc_offset to __reloc_offset and export it.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 arch/loongarch/include/asm/setup.h |  6 ++++++
 arch/loongarch/kernel/relocate.c   | 18 ++++++++----------
 arch/loongarch/kernel/setup.c      |  3 +++
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/include/asm/setup.h
index 2dca0d1dd90a..39f9964bbdd4 100644
--- a/arch/loongarch/include/asm/setup.h
+++ b/arch/loongarch/include/asm/setup.h
@@ -37,4 +37,10 @@ extern unsigned long __init relocate_kernel(void);
 
 #endif
 
+extern unsigned long __reloc_offset;
+static inline unsigned long kaslr_offset(void)
+{
+	return __reloc_offset;
+}
+
 #endif /* __SETUP_H */
diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/relocate.c
index 6c3eff9af9fb..9ba560d514e1 100644
--- a/arch/loongarch/kernel/relocate.c
+++ b/arch/loongarch/kernel/relocate.c
@@ -16,11 +16,9 @@
 #include <asm/sections.h>
 #include <asm/setup.h>
 
-#define RELOCATED(x) ((void *)((long)x + reloc_offset))
+#define RELOCATED(x) ((void *)((long)x + __reloc_offset))
 #define RELOCATED_KASLR(x) ((void *)((long)x + random_offset))
 
-static unsigned long reloc_offset;
-
 static inline void __init relocate_relative(void)
 {
 	Elf64_Rela *rela, *rela_end;
@@ -154,7 +152,7 @@ static inline void __init update_reloc_offset(unsigned long *addr, long random_o
 {
 	unsigned long *new_addr = (unsigned long *)RELOCATED_KASLR(addr);
 
-	*new_addr = (unsigned long)reloc_offset;
+	*new_addr = (unsigned long)__reloc_offset;
 }
 
 unsigned long __init relocate_kernel(void)
@@ -173,7 +171,7 @@ unsigned long __init relocate_kernel(void)
 	if (relocation_addr_valid(location_new))
 		random_offset = (unsigned long)location_new - (unsigned long)(_text);
 #endif
-	reloc_offset = (unsigned long)_text - VMLINUX_LOAD_ADDRESS;
+	__reloc_offset = (unsigned long)_text - VMLINUX_LOAD_ADDRESS;
 
 	if (random_offset) {
 		kernel_length = (long)(_end) - (long)(_text);
@@ -187,15 +185,15 @@ unsigned long __init relocate_kernel(void)
 			"dbar 0 \t\n"
 			::: "memory");
 
-		reloc_offset += random_offset;
+		__reloc_offset += random_offset;
 
 		/* The current thread is now within the relocated kernel */
 		__current_thread_info = RELOCATED_KASLR(__current_thread_info);
 
-		update_reloc_offset(&reloc_offset, random_offset);
+		update_reloc_offset(&__reloc_offset, random_offset);
 	}
 
-	if (reloc_offset)
+	if (__reloc_offset)
 		relocate_relative();
 
 	relocate_absolute(random_offset);
@@ -208,9 +206,9 @@ unsigned long __init relocate_kernel(void)
  */
 static void show_kernel_relocation(const char *level)
 {
-	if (reloc_offset > 0) {
+	if (__reloc_offset > 0) {
 		printk(level);
-		pr_cont("Kernel relocated by 0x%lx\n", reloc_offset);
+		pr_cont("Kernel relocated by 0x%lx\n", __reloc_offset);
 		pr_cont(" .text @ 0x%px\n", _text);
 		pr_cont(" .data @ 0x%px\n", _sdata);
 		pr_cont(" .bss  @ 0x%px\n", __bss_start);
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 95e6b579dfdd..d7bda711824f 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -65,6 +65,9 @@ struct cpuinfo_loongarch cpu_data[NR_CPUS] __read_mostly;
 
 EXPORT_SYMBOL(cpu_data);
 
+unsigned long __reloc_offset __ro_after_init;
+EXPORT_SYMBOL(__reloc_offset);
+
 struct loongson_board_info b_info;
 static const char dmi_empty_string[] = "        ";
 
-- 
2.39.3

