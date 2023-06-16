Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA9C7C
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 06:11:04 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.112.76])
	by gateway (Coremail) with SMTP id _____8AxW+r2_ItkBNwFAA--.12518S3;
	Fri, 16 Jun 2023 14:11:02 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.76])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxReTv_ItkFPEcAA--.17020S5;
	Fri, 16 Jun 2023 14:11:02 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hongliang Wang <wanghongliang@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 3/6] LoongArch: Allow device trees to be built into the kernel
Date: Fri, 16 Jun 2023 14:10:40 +0800
Message-Id: <1014ba684298858ec2590c8cdb75d702523dcf43.1686882123.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1686882123.git.zhoubinbin@loongson.cn>
References: <cover.1686882123.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxReTv_ItkFPEcAA--.17020S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxuF1kCFy7JF43Ar1fXF43Jwc_yoWrGryfp3
	sxAr4kJr4kGr97Ar92qrZ5WrZ8Jrs7Cw42q3W2yry0kr17Xr10vr4Iqr9rZF1UJws5J3y0
	gryrKa4agF4UJabCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8ldgtUUUUU==

Some systems do not provide a useful device tree to the kernel at boot
time. Let's keep a device tree table in the kernel, keyed by the dts
filename, containing the relevant DTBs.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/Kconfig           | 16 ++++++++++++++++
 arch/loongarch/Makefile          | 10 ++++++++--
 arch/loongarch/boot/dts/Makefile |  3 +--
 arch/loongarch/kernel/setup.c    |  9 +++++++--
 4 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 79412304a01f..ea78922b2ca9 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -308,6 +308,22 @@ config 64KB_3LEVEL
 
 endchoice
 
+config BUILTIN_DTB
+	bool "Enable builtin dtb in kernel"
+	depends on OF
+	help
+	  Some systems do not provide a useful device tree to the kernel at boot
+	  time. Let's keep a device tree table in the kernel, keyed by the dts
+	  filename, containing the relevant DTBs.
+
+config BUILTIN_DTB_NAME
+	string "Source file for LoongArch builtin dtb"
+	depends on BUILTIN_DTB
+	help
+	  Base name (without suffix, relative to arch/loongarch/boot/dts/)
+	  for the DTS file that will be used to produce the DTB linked into the
+	  kernel.
+
 config CMDLINE
 	string "Built-in kernel command line"
 	help
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index a27e264bdaa5..c8c2dd7d14e5 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -5,7 +5,8 @@
 
 boot	:= arch/loongarch/boot
 
-KBUILD_DEFCONFIG := loongson3_defconfig
+KBUILD_DEFCONFIG		:= loongson3_defconfig
+KBUILD_DTBS			:= dtbs
 
 image-name-y			:= vmlinux
 image-name-$(CONFIG_EFI_ZBOOT)	:= vmlinuz
@@ -130,11 +131,14 @@ PHONY += vdso_install
 vdso_install:
 	$(Q)$(MAKE) $(build)=arch/loongarch/vdso $@
 
-all:	$(notdir $(KBUILD_IMAGE))
+all:	$(notdir $(KBUILD_IMAGE)) $(KBUILD_DTBS)
 
 vmlinux.elf vmlinux.efi vmlinuz.efi: vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(bootvars-y) $(boot)/$@
 
+# device-trees
+core-y += arch/loongarch/boot/dts/
+
 install:
 	$(Q)install -D -m 755 $(KBUILD_IMAGE) $(INSTALL_PATH)/$(image-name-y)-$(KERNELRELEASE)
 	$(Q)install -D -m 644 .config $(INSTALL_PATH)/config-$(KERNELRELEASE)
@@ -142,5 +146,7 @@ install:
 
 define archhelp
 	echo '  install              - install kernel into $(INSTALL_PATH)'
+	echo '  dtbs                 - Device-tree blobs for enabled boards'
+	echo '  dtbs_install         - Install dtbs to $(INSTALL_DTBS_PATH)'
 	echo
 endef
diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/Makefile
index 5f1f55e911ad..1e24cdb5180a 100644
--- a/arch/loongarch/boot/dts/Makefile
+++ b/arch/loongarch/boot/dts/Makefile
@@ -1,4 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-dtstree	:= $(srctree)/$(src)
 
-dtb-y := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
+obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_NAME))
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 4444b13418f0..1c5df6254248 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -296,8 +296,13 @@ static void __init fdt_setup(void)
 	if (acpi_os_get_root_pointer())
 		return;
 
-	/* Look for a device tree configuration table entry */
-	fdt_pointer = efi_fdt_pointer();
+	/* We prefer to try to use built-in dtb, checking its legality first. */
+	if (!fdt_check_header(__dtb_start))
+		fdt_pointer = __dtb_start;
+	else
+		/* Fallback to efi dtb, when built-in dtb is not available. */
+		fdt_pointer = efi_fdt_pointer();
+
 	if (!fdt_pointer || fdt_check_header(fdt_pointer))
 		return;
 
-- 
2.39.3

