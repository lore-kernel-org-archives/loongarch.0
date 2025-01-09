Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DF817548
	for <loongarch@lists.linux.dev>; Thu,  9 Jan 2025 06:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736404291; cv=none; b=lEkotkejQXYQU9ODO3SswnGJI5vpCffSUHkxkWm2vv6bV9HRbyL8MVMYcUrv5JuS2FHAmTCLPwLeNgnoCdqJsh/AXZ7nDqsI2u9F9bKQkrsCqwAS4jLEC5kIbBZINfwrUWgvA7svnoUfqM6UNBSW9KVnuqDhEsee/3fFYy+JUFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736404291; c=relaxed/simple;
	bh=aLFq2nxZ2sdNdfLZxJIlCc2BseCDyw44v/JTQPGTSQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l2uwnQWSZSts82Qtj660ABTWXt17iwGe5ZezemB0MkbZetjhFpMuChS/xnVWCGadU6SPNPDiHqODfIlLIYkminZhDQ8ctK2sYEoyUcThAiQtXJY4kgA+h0Rw2iCuVPjMgr4NKUaQ/qEA4z9QQgZk0LWt2E0NKiDRbBPoceNNRmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.63])
	by gateway (Coremail) with SMTP id _____8DxmeAybX9nOW5gAA--.58759S3;
	Thu, 09 Jan 2025 14:31:14 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
	by front1 (Coremail) with SMTP id qMiowMBxUMYtbX9np88aAA--.16097S2;
	Thu, 09 Jan 2025 14:31:13 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Add debugfs entries to switch SFB/TSO state
Date: Thu,  9 Jan 2025 14:30:56 +0800
Message-ID: <20250109063056.2438304-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxUMYtbX9np88aAA--.16097S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxKF43Kw4ktr1ktryruFyDJwc_yoWfWw4fp3
	4DC3y5Gr48urn3Jr9xtr98ur93W3srGw4aqFZxZ34rCF4IqF1Svrn29r9IvFWkW3s8WryI
	gF9Yy34YqFWDtwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70PfDUUUU

We need to switch SFB (Store Fill Buffer) and TSO (Total Store Order)
state at runtime to debug memory management and KVM virtualization, so
add two debugfs entries "sfb_state" and "tso_state" under the directory
/sys/kernel/debug/loongarch.

Query SFB:
cat /sys/kernel/debug/loongarch/sfb_state

Enable SFB:
echo 1 > /sys/kernel/debug/loongarch/sfb_state

Disable SFB:
echo 0 > /sys/kernel/debug/loongarch/sfb_state

Query TSO:
cat /sys/kernel/debug/loongarch/tso_state

Switch TSO:
echo [TSO] > /sys/kernel/debug/loongarch/tso_state

Available [TSO] states:
0 (No Load No Store)    1 (All Load No Store)   3 (Same Load No Store)
4 (No Load All Store)   5 (All Load All Store)  7 (Same Load All Store)

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/loongarch.h |  15 +++
 arch/loongarch/kernel/Makefile         |   2 +-
 arch/loongarch/kernel/kdebugfs.c       | 168 +++++++++++++++++++++++++
 arch/loongarch/kernel/unaligned.c      |   8 +-
 4 files changed, 186 insertions(+), 7 deletions(-)
 create mode 100644 arch/loongarch/kernel/kdebugfs.c

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index a3cc4f8d4c4a..15c245636176 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -108,6 +108,12 @@
 #define  CPUCFG3_SPW_HG_HF		BIT(11)
 #define  CPUCFG3_RVA			BIT(12)
 #define  CPUCFG3_RVAMAX			GENMASK(16, 13)
+#define  CPUCFG3_ALDORDER_CAP		BIT(18) /* All address load ordered, capability */
+#define  CPUCFG3_ASTORDER_CAP		BIT(19) /* All address store ordered, capability */
+#define  CPUCFG3_ALDORDER_STA		BIT(20) /* All address load ordered, status */
+#define  CPUCFG3_ASTORDER_STA		BIT(21) /* All address store ordered, status */
+#define  CPUCFG3_SLDORDER_CAP		BIT(22) /* Same address load ordered, capability */
+#define  CPUCFG3_SLDORDER_STA		BIT(23) /* Same address load ordered, status */
 
 #define LOONGARCH_CPUCFG4		0x4
 #define  CPUCFG4_CCFREQ			GENMASK(31, 0)
@@ -565,6 +571,15 @@
 
 /* Implement dependent */
 #define LOONGARCH_CSR_IMPCTL1		0x80	/* Loongson config1 */
+#define  CSR_LDSTORDER_SHIFT		28
+#define  CSR_LDSTORDER_WIDTH		3
+#define  CSR_LDSTORDER_MASK		(_ULCAST_(0x7) << CSR_LDSTORDER_SHIFT)
+#define  CSR_LDSTORDER_NLD_NST		(_ULCAST_(0x0) << CSR_LDSTORDER_SHIFT) /* 000 = No Load No Store */
+#define  CSR_LDSTORDER_ALD_NST		(_ULCAST_(0x1) << CSR_LDSTORDER_SHIFT) /* 001 = All Load No Store */
+#define  CSR_LDSTORDER_SLD_NST		(_ULCAST_(0x3) << CSR_LDSTORDER_SHIFT) /* 011 = Same Load No Store */
+#define  CSR_LDSTORDER_NLD_AST		(_ULCAST_(0x4) << CSR_LDSTORDER_SHIFT) /* 100 = No Load All Store */
+#define  CSR_LDSTORDER_ALD_AST		(_ULCAST_(0x5) << CSR_LDSTORDER_SHIFT) /* 101 = All Load All Store */
+#define  CSR_LDSTORDER_SLD_AST		(_ULCAST_(0x7) << CSR_LDSTORDER_SHIFT) /* 111 = Same Load All Store */
 #define  CSR_MISPEC_SHIFT		20
 #define  CSR_MISPEC_WIDTH		8
 #define  CSR_MISPEC			(_ULCAST_(0xff) << CSR_MISPEC_SHIFT)
diff --git a/arch/loongarch/kernel/Makefile b/arch/loongarch/kernel/Makefile
index 9497968ee158..4853e8b04c6f 100644
--- a/arch/loongarch/kernel/Makefile
+++ b/arch/loongarch/kernel/Makefile
@@ -10,7 +10,7 @@ extra-y		:= vmlinux.lds
 obj-y		+= head.o cpu-probe.o cacheinfo.o env.o setup.o entry.o genex.o \
 		   traps.o irq.o idle.o process.o dma.o mem.o reset.o switch.o \
 		   elf.o syscall.o signal.o time.o topology.o inst.o ptrace.o vdso.o \
-		   alternative.o unwind.o
+		   alternative.o kdebugfs.o unwind.o
 
 obj-$(CONFIG_ACPI)		+= acpi.o
 obj-$(CONFIG_EFI) 		+= efi.o
diff --git a/arch/loongarch/kernel/kdebugfs.c b/arch/loongarch/kernel/kdebugfs.c
new file mode 100644
index 000000000000..cf1d89888e32
--- /dev/null
+++ b/arch/loongarch/kernel/kdebugfs.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/init.h>
+#include <linux/export.h>
+#include <linux/debugfs.h>
+#include <linux/kstrtox.h>
+#include <asm/loongarch.h>
+
+struct dentry *arch_debugfs_dir;
+EXPORT_SYMBOL(arch_debugfs_dir);
+
+static int sfb_state, tso_state;
+
+static void set_sfb_state(void *info)
+{
+	int val = *(int *)info << CSR_STFILL_SHIFT;
+
+	csr_xchg32(val, CSR_STFILL, LOONGARCH_CSR_IMPCTL1);
+}
+
+static ssize_t sfb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
+{
+	int s, state;
+	char str[32];
+
+	state = (csr_read32(LOONGARCH_CSR_IMPCTL1) & CSR_STFILL) >> CSR_STFILL_SHIFT;
+
+	s = snprintf(str, sizeof(str), "Boot State: %x\nCurrent State: %x\n", sfb_state, state);
+
+	if (*ppos >= s)
+		return 0;
+
+	s -= *ppos;
+	s = min_t(u32, s, count);
+
+	if (copy_to_user(buf, &str[*ppos], s))
+		return -EFAULT;
+
+	*ppos += s;
+
+	return s;
+}
+
+static ssize_t sfb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
+{
+	int state;
+
+	if (kstrtoint_from_user(buf, count, 10, &state))
+		return -EFAULT;
+
+	switch (state) {
+	case 0: case 1:
+		on_each_cpu(set_sfb_state, &state, 1);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return count;
+}
+
+static const struct file_operations sfb_fops = {
+	.read = sfb_read,
+	.write = sfb_write,
+	.open = simple_open,
+	.llseek = default_llseek
+};
+
+#define LDSTORDER_NLD_NST        0x0 /* 000 = No Load No Store */
+#define LDSTORDER_ALD_NST        0x1 /* 001 = All Load No Store */
+#define LDSTORDER_SLD_NST        0x3 /* 011 = Same Load No Store */
+#define LDSTORDER_NLD_AST        0x4 /* 100 = No Load All Store */
+#define LDSTORDER_ALD_AST        0x5 /* 101 = All Load All Store */
+#define LDSTORDER_SLD_AST        0x7 /* 111 = Same Load All Store */
+
+static char *tso_hints[] = {
+	"No Load No Store",
+	"All Load No Store",
+	"Invalid Config",
+	"Same Load No Store",
+	"No Load All Store",
+	"All Load All Store",
+	"Invalid Config",
+	"Same Load All Store"
+};
+
+static void set_tso_state(void *info)
+{
+	int val = *(int *)info << CSR_LDSTORDER_SHIFT;
+
+	csr_xchg32(val, CSR_LDSTORDER_MASK, LOONGARCH_CSR_IMPCTL1);
+}
+
+static ssize_t tso_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
+{
+	int s, state;
+	char str[240];
+
+	state = (csr_read32(LOONGARCH_CSR_IMPCTL1) & CSR_LDSTORDER_MASK) >> CSR_LDSTORDER_SHIFT;
+
+	s = snprintf(str, sizeof(str), "Boot State: %d (%s)\n"
+			               "Current State: %d (%s)\n\n"
+				       "Available States:\n"
+				       "0 (%s)\t" "1 (%s)\t" "3 (%s)\n"
+				       "4 (%s)\t" "5 (%s)\t" "7 (%s)\n",
+				       tso_state, tso_hints[tso_state], state, tso_hints[state],
+				       tso_hints[0], tso_hints[1], tso_hints[3], tso_hints[4], tso_hints[5], tso_hints[7]);
+
+	if (*ppos >= s)
+		return 0;
+
+	s -= *ppos;
+	s = min_t(u32, s, count);
+
+	if (copy_to_user(buf, &str[*ppos], s))
+		return -EFAULT;
+
+	*ppos += s;
+
+	return s;
+}
+
+static ssize_t tso_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
+{
+	int state;
+
+	if (kstrtoint_from_user(buf, count, 10, &state))
+		return -EFAULT;
+
+	switch (state) {
+	case 0: case 1: case 3:
+	case 4: case 5: case 7:
+		on_each_cpu(set_tso_state, &state, 1);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return count;
+}
+
+static const struct file_operations tso_fops = {
+	.read = tso_read,
+	.write = tso_write,
+	.open = simple_open,
+	.llseek = default_llseek
+};
+
+static int __init arch_kdebugfs_init(void)
+{
+	unsigned int config = read_cpucfg(LOONGARCH_CPUCFG3);
+
+	arch_debugfs_dir = debugfs_create_dir("loongarch", NULL);
+
+	if (config & CPUCFG3_SFB) {
+		debugfs_create_file("sfb_state", S_IRUGO | S_IWUGO,
+			    arch_debugfs_dir, &sfb_state, &sfb_fops);
+		sfb_state = (csr_read32(LOONGARCH_CSR_IMPCTL1) & CSR_STFILL) >> CSR_STFILL_SHIFT;
+	}
+
+	if (config & (CPUCFG3_ALDORDER_CAP | CPUCFG3_ASTORDER_CAP)) {
+		debugfs_create_file("tso_state", S_IRUGO | S_IWUGO,
+			    arch_debugfs_dir, &tso_state, &tso_fops);
+		tso_state = (csr_read32(LOONGARCH_CSR_IMPCTL1) & CSR_LDSTORDER_MASK) >> CSR_LDSTORDER_SHIFT;
+	}
+
+	return 0;
+}
+postcore_initcall(arch_kdebugfs_init);
diff --git a/arch/loongarch/kernel/unaligned.c b/arch/loongarch/kernel/unaligned.c
index 3abf163dda05..487be604b96a 100644
--- a/arch/loongarch/kernel/unaligned.c
+++ b/arch/loongarch/kernel/unaligned.c
@@ -482,14 +482,10 @@ void emulate_load_store_insn(struct pt_regs *regs, void __user *addr, unsigned i
 #ifdef CONFIG_DEBUG_FS
 static int __init debugfs_unaligned(void)
 {
-	struct dentry *d;
-
-	d = debugfs_create_dir("loongarch", NULL);
-
 	debugfs_create_u32("unaligned_instructions_user",
-				S_IRUGO, d, &unaligned_instructions_user);
+				S_IRUGO, arch_debugfs_dir, &unaligned_instructions_user);
 	debugfs_create_u32("unaligned_instructions_kernel",
-				S_IRUGO, d, &unaligned_instructions_kernel);
+				S_IRUGO, arch_debugfs_dir, &unaligned_instructions_kernel);
 
 	return 0;
 }
-- 
2.43.5

