Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5CE10E3
	for <loongarch@lists.linux.dev>; Sat, 11 Feb 2023 08:44:20 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxnfBjVedjuTERAA--.34665S3;
	Sat, 11 Feb 2023 16:44:19 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxf+RjVedjXv8wAA--.57308S2;
	Sat, 11 Feb 2023 16:44:19 +0800 (CST)
From: Qing Zhang <zhangqing@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	WANG Xuerui <kernel@xen0n.name>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: ptrace: Add function argument access API
Date: Sat, 11 Feb 2023 16:44:14 +0800
Message-Id: <20230211084414.25998-1-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cxf+RjVedjXv8wAA--.57308S2
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWrWftryfGFW5ZF47KFyxuFg_yoW5JFWDpa
	4kA3ZxGr48urs3uFW3J3WrZryrZrs7CrWakr1Ik34Syr9FqryrJFWkXr1qy3WktrWUJFWI
	gF15t3yYgFs8Z3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjxU2T5lUUUUU

Add regs_get_argument() which returns N th argument of the function
call, t show This enables ftrace kprobe events to access kernel function
arguments via $argN syntax.

eg:
echo 'p bio_add_page arg1=$arg1' > kprobe_events
bash: echo: write error: Invalid argument

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---
 arch/loongarch/Kconfig              |  1 +
 arch/loongarch/include/asm/ptrace.h | 33 +++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index e3eba2eb4b44..103046966893 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -97,6 +97,7 @@ config LOONGARCH
 	select HAVE_EXIT_THREAD
 	select HAVE_FAST_GUP
 	select HAVE_FTRACE_MCOUNT_RECORD
+	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
 	select HAVE_GENERIC_VDSO
diff --git a/arch/loongarch/include/asm/ptrace.h b/arch/loongarch/include/asm/ptrace.h
index 66a0e6c480a3..f6ffcc00753c 100644
--- a/arch/loongarch/include/asm/ptrace.h
+++ b/arch/loongarch/include/asm/ptrace.h
@@ -120,6 +120,39 @@ static inline long regs_return_value(struct pt_regs *regs)
 	return regs->regs[4];
 }
 
+/**
+ * regs_get_kernel_argument() - get Nth function argument in kernel
+ * @regs:       pt_regs of that context
+ * @n:          function argument number (start from 0)
+ *
+ * regs_get_argument() returns @n th argument of the function call.
+ * Note that this chooses most probably assignment, in some case
+ * it can be incorrect.
+ * This is expected to be called from kprobes or ftrace with regs
+ * where the top of stack is the return address.
+ */
+static inline unsigned long regs_get_kernel_argument(struct pt_regs *regs,
+						     unsigned int n)
+{
+	static const unsigned int argument_offs[] = {
+		offsetof(struct pt_regs, regs[4]),
+		offsetof(struct pt_regs, regs[5]),
+		offsetof(struct pt_regs, regs[6]),
+		offsetof(struct pt_regs, regs[7]),
+		offsetof(struct pt_regs, regs[8]),
+		offsetof(struct pt_regs, regs[9]),
+		offsetof(struct pt_regs, regs[10]),
+		offsetof(struct pt_regs, regs[11]),
+#define NR_REG_ARGUMENTS 8
+	};
+
+	if (n >= NR_REG_ARGUMENTS) {
+		n -= NR_REG_ARGUMENTS;
+		return regs_get_kernel_stack_nth(regs, n);
+	} else
+		return regs_get_register(regs, argument_offs[n]);
+}
+
 #define instruction_pointer(regs) ((regs)->csr_era)
 #define profile_pc(regs) instruction_pointer(regs)
 
-- 
2.36.0

