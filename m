Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9F41FB0
	for <loongarch@lists.linux.dev>; Wed, 22 Feb 2023 06:53:26 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxlF3fu_Vjs30DAA--.1571S3;
	Wed, 22 Feb 2023 14:53:19 +0800 (CST)
Received: from bogon.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxK77Yu_VjuoY4AA--.37664S3;
	Wed, 22 Feb 2023 14:53:19 +0800 (CST)
From: Youling Tang <tangyouling@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] LoongArch: kdump: Add the same binary implementation
Date: Wed, 22 Feb 2023 14:53:10 +0800
Message-Id: <1677048791-26951-2-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1677048791-26951-1-git-send-email-tangyouling@loongson.cn>
References: <1677048791-26951-1-git-send-email-tangyouling@loongson.cn>
X-CM-TRANSID:AQAAf8DxK77Yu_VjuoY4AA--.37664S3
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWr17JryUGryfCr1ruF1kGrg_yoWrGr1Dpr
	9xAF4kJFW8Grn5trWqy34DWrWDJ3Z7CF1ag3W7Aa48AF47Zw1UZr1vyr9rXF1Ut393trW0
	gFyrGw1ava1UGwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jea0PUUUUU=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

This feature depends on the relocation function, so the relocation configuration
CONFIG_RELOCATABLE will be enabled.

Add the same set of binary implementations for kdump, and then no longer need to
compile two kernels (the production kernel and the capture kernel share the same
binary).

CONFIG_CRASH_DUMP is enabled by default (CONFIG_RELOCATABLE is also enabled).

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/loongarch/Kconfig                     | 12 +-----------
 arch/loongarch/Makefile                    |  4 ----
 arch/loongarch/configs/loongson3_defconfig |  1 +
 arch/loongarch/include/asm/addrspace.h     |  2 ++
 arch/loongarch/kernel/head.S               |  2 +-
 5 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index ab4c2ab146ab..84f220273296 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -502,6 +502,7 @@ config KEXEC
 
 config CRASH_DUMP
 	bool "Build kdump crash kernel"
+	select RELOCATABLE
 	help
 	  Generate crash dump after being started by kexec. This should
 	  be normally only set in special crash dump kernels which are
@@ -511,17 +512,6 @@ config CRASH_DUMP
 
 	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
-config PHYSICAL_START
-	hex "Physical address where the kernel is loaded"
-	default "0x90000000a0000000"
-	depends on CRASH_DUMP
-	help
-	  This gives the XKPRANGE address where the kernel is loaded.
-	  If you plan to use kernel for capturing the crash dump change
-	  this value to start of the reserved region (the "X" value as
-	  specified in the "crashkernel=YM@XM" command line boot parameter
-	  passed to the panic-ed kernel).
-
 config RELOCATABLE
 	bool "Relocatable kernel"
 	help
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 2aba6ff30436..8304fed7aa42 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -79,11 +79,7 @@ endif
 cflags-y += -ffreestanding
 cflags-y += $(call cc-option, -mno-check-zero-division)
 
-ifndef CONFIG_PHYSICAL_START
 load-y		= 0x9000000000200000
-else
-load-y		= $(CONFIG_PHYSICAL_START)
-endif
 bootvars-y	= VMLINUX_LOAD_ADDRESS=$(load-y)
 
 drivers-$(CONFIG_PCI)		+= arch/loongarch/pci/
diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index cb52774c80e8..7885f6e5de93 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -48,6 +48,7 @@ CONFIG_HOTPLUG_CPU=y
 CONFIG_NR_CPUS=64
 CONFIG_NUMA=y
 CONFIG_KEXEC=y
+CONFIG_CRASH_DUMP=y
 CONFIG_SUSPEND=y
 CONFIG_HIBERNATION=y
 CONFIG_ACPI=y
diff --git a/arch/loongarch/include/asm/addrspace.h b/arch/loongarch/include/asm/addrspace.h
index d342935e5a72..4edcb3c21cf5 100644
--- a/arch/loongarch/include/asm/addrspace.h
+++ b/arch/loongarch/include/asm/addrspace.h
@@ -125,4 +125,6 @@ extern unsigned long vm_map_base;
 #define ISA_IOSIZE	SZ_16K
 #define IO_SPACE_LIMIT	(PCI_IOSIZE - 1)
 
+#define PHYS_LINK_ADDR	PHYSADDR(VMLINUX_LOAD_ADDRESS)
+
 #endif /* _ASM_ADDRSPACE_H */
diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index b12f459ad73a..57962ff08f6d 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -24,7 +24,7 @@ _head:
 	.org	0x8
 	.dword	kernel_entry		/* Kernel entry point */
 	.dword	_end - _text		/* Kernel image effective size */
-	.quad	0			/* Kernel image load offset from start of RAM */
+	.quad	PHYS_LINK_ADDR		/* Kernel image load offset from start of RAM */
 	.org	0x38			/* 0x20 ~ 0x37 reserved */
 	.long	LINUX_PE_MAGIC
 	.long	pe_header - _head	/* Offset to the PE header */
-- 
2.37.3

