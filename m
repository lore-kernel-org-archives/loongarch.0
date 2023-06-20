Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFAE0848D
	for <loongarch@lists.linux.dev>; Tue, 20 Jun 2023 08:18:45 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx_+vkYJFk5h4HAA--.14571S3;
	Tue, 20 Jun 2023 16:18:44 +0800 (CST)
Received: from bogon.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxReThYJFkJ3AhAA--.28832S5;
	Tue, 20 Jun 2023 16:18:43 +0800 (CST)
From: Youling Tang <tangyouling@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	madvenka@linux.microsoft.com
Cc: chenzhongjin@huawei.com,
	WANG Xuerui <kernel@xen0n.name>,
	Xi Ruoyao <xry111@xry111.site>,
	live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	tangyouling00@gmail.com,
	youling.tang@outlook.com
Subject: [RFC PATCH v1 23/23] LoongArch: objtool: Mark non-standard object files and directories
Date: Tue, 20 Jun 2023 16:18:32 +0800
Message-Id: <1687249112-2790-4-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1687249112-2790-1-git-send-email-tangyouling@loongson.cn>
References: <1687249112-2790-1-git-send-email-tangyouling@loongson.cn>
X-CM-TRANSID:AQAAf8CxReThYJFkJ3AhAA--.28832S5
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CrWfZr1xJFWrZr17AFWxKrX_yoW8ArWkpr
	nI9a1kJr4kur1kKrykt3y5Zr1Uta4DKr12ga1YvFy8CrnrXr1DZr4xJrWDXF1jgw4rAayF
	gwn3G34aqFWUJacCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUmjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Cr1j6rxdM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWr
	XVW3AwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lF7xvrVCFI7AF6II2Y40_Zr0_Gr1UMxkF7I0En4kS14v26r126r1DMxAIw28I
	cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43
	ZEXa7IU5pSoJUUUUU==
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Set OBJECT_FILES_NON_STANDARD for their related files and directories,
which will tell objtool to skip checking them.  It's ok to skip them
because they don't affect runtime stack traces.

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/loongarch/kernel/Makefile | 2 ++
 arch/loongarch/power/Makefile  | 2 ++
 arch/loongarch/vdso/Makefile   | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/loongarch/kernel/Makefile b/arch/loongarch/kernel/Makefile
index fcbfa0f38b53..9ea4d6b93f4d 100644
--- a/arch/loongarch/kernel/Makefile
+++ b/arch/loongarch/kernel/Makefile
@@ -3,6 +3,8 @@
 # Makefile for the Linux/LoongArch kernel.
 #
 
+OBJECT_FILES_NON_STANDARD_head.o := y
+
 extra-y		:= vmlinux.lds
 
 obj-y		+= head.o cpu-probe.o cacheinfo.o env.o setup.o entry.o genex.o \
diff --git a/arch/loongarch/power/Makefile b/arch/loongarch/power/Makefile
index 58151d003e40..bbd1d4793e8b 100644
--- a/arch/loongarch/power/Makefile
+++ b/arch/loongarch/power/Makefile
@@ -1,3 +1,5 @@
+OBJECT_FILES_NON_STANDARD_suspend_asm.o := y
+
 obj-y	+= platform.o
 
 obj-$(CONFIG_SUSPEND)		+= suspend.o suspend_asm.o
diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index d89e2ac75f7b..37c7795990b8 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # Objects to go into the VDSO.
 
+OBJECT_FILES_NON_STANDARD := y
+
 # Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
 # the inclusion of generic Makefile.
 ARCH_REL_TYPE_ABS := R_LARCH_32|R_LARCH_64|R_LARCH_MARK_LA|R_LARCH_JUMP_SLOT
-- 
2.39.2

