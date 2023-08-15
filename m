Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1ACBE61
	for <loongarch@lists.linux.dev>; Tue, 15 Aug 2023 08:51:07 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.245])
	by gateway (Coremail) with SMTP id _____8DxqOp6PNtkRLIYAA--.41131S3;
	Tue, 15 Aug 2023 16:51:06 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.245])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxniN1PNtk0wdbAA--.51871S5;
	Tue, 15 Aug 2023 16:51:06 +0800 (CST)
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
Subject: [PATCH v2 3/7] LoongArch: Allow device trees to be built into the kernel
Date: Tue, 15 Aug 2023 16:50:48 +0800
Message-Id: <babddef6b0aaaab499fd8f5b1636e348030ad823.1692088166.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1692088166.git.zhoubinbin@loongson.cn>
References: <cover.1692088166.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxniN1PNtk0wdbAA--.51871S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxuF1kCFy7JF43Ar1fAryfZrc_yoWrGryfp3
	srAw4kJr4kGr97tr92qrZ5WrZ8Jrs7Cw12q3W2yFy0kr17Xr10vw4Iqr9rZF1UGws5J3y0
	gryrKa4agF4UJabCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jqRRiUUUUU=

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
index 46b4c217da14..61febadd4fce 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -326,6 +326,22 @@ config 64KB_3LEVEL
 
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
index fb0fada43197..abaa3df9fd6f 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -5,7 +5,8 @@
 
 boot	:= arch/loongarch/boot
 
-KBUILD_DEFCONFIG := loongson3_defconfig
+KBUILD_DEFCONFIG		:= loongson3_defconfig
+KBUILD_DTBS			:= dtbs
 
 image-name-y			:= vmlinux
 image-name-$(CONFIG_EFI_ZBOOT)	:= vmlinuz
@@ -140,11 +141,14 @@ PHONY += vdso_install
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
@@ -152,5 +156,7 @@ install:
 
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
index 7783f0a3d742..e5008890beda 100644
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

