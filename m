Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50728947A
	for <loongarch@lists.linux.dev>; Fri, 22 Dec 2023 08:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.110.252])
	by gateway (Coremail) with SMTP id _____8Cx9OpEQoVlccoDAA--.15007S3;
	Fri, 22 Dec 2023 16:01:08 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.110.252])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxXOQ9QoVl0FEFAA--.26775S5;
	Fri, 22 Dec 2023 16:01:07 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hongliang Wang <wanghongliang@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v6 3/7] LoongArch: Allow device trees to be built into the kernel
Date: Fri, 22 Dec 2023 16:00:46 +0800
Message-Id: <42af8dd70ff83939950c5336986962785c421236.1703229766.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1703229766.git.zhoubinbin@loongson.cn>
References: <cover.1703229766.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxXOQ9QoVl0FEFAA--.26775S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJw48KF1DJw17Cw1fGFyUJwc_yoWruFy7pr
	W7ArsrGr4kGF1xArZ7X345Wry5Jrs7Kw4a93Wakry8CF47Zr18ur4Iyr9FvF1UJws5JrW0
	qFyfKa42gF4UJagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1q6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
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
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1mii3UUUUU==

During the upstream progress of those DT-based drivers, DT properties
are changed a lot so very different from those in existing bootloaders.
It is inevitably that some existing systems do not provide a standard,
canonical device tree to the kernel at boot time. So let's provide a
device tree table in the kernel, keyed by the dts filename, containing
the relevant DTBs.

We can use the built-in dts files as references. Each SoC has only one
built-in dts file which describes all possible device information of
that SoC, so the dts files are good examples during development.

And as a reference, our built-in dts file only enables the most basic
bootable combinations (so it is generic enough), acts as an alternative
in case the dts in the bootloader is unexpected.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/Kbuild            |  1 +
 arch/loongarch/Kconfig           | 18 ++++++++++++++++++
 arch/loongarch/Makefile          |  3 ++-
 arch/loongarch/boot/dts/Makefile |  3 +--
 arch/loongarch/kernel/setup.c    | 12 +++++++++---
 5 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/Kbuild b/arch/loongarch/Kbuild
index beb8499dd8ed..bfa21465d83a 100644
--- a/arch/loongarch/Kbuild
+++ b/arch/loongarch/Kbuild
@@ -4,6 +4,7 @@ obj-y += net/
 obj-y += vdso/
 
 obj-$(CONFIG_KVM) += kvm/
+obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
 
 # for cleaning
 subdir- += boot
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index ee123820a476..dd23ed31c12f 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -374,6 +374,24 @@ config CMDLINE_FORCE
 
 endchoice
 
+config BUILTIN_DTB
+	bool "Enable built-in dtb in kernel"
+	depends on OF
+	help
+	  Some existing systems do not provide a canonical device tree to
+	  the kernel at boot time. Let's provide a device tree table in the
+	  kernel, keyed by the dts filename, containing the relevant DTBs.
+
+	  Built-in DTBs are generic enough and can be used as references.
+
+config BUILTIN_DTB_NAME
+	string "Source file for built-in dtb"
+	depends on BUILTIN_DTB
+	help
+	  Base name (without suffix, relative to arch/loongarch/boot/dts/)
+	  for the DTS file that will be used to produce the DTB linked into
+	  the kernel.
+
 config DMI
 	bool "Enable DMI scanning"
 	select DMI_SCAN_MACHINE_NON_EFI_FALLBACK
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 4ba8d67ddb09..2ef3ff097f9a 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -6,6 +6,7 @@
 boot	:= arch/loongarch/boot
 
 KBUILD_DEFCONFIG := loongson3_defconfig
+KBUILD_DTBS      := dtbs
 
 image-name-y			:= vmlinux
 image-name-$(CONFIG_EFI_ZBOOT)	:= vmlinuz
@@ -141,7 +142,7 @@ endif
 
 vdso-install-y += arch/loongarch/vdso/vdso.so.dbg
 
-all:	$(notdir $(KBUILD_IMAGE))
+all:	$(notdir $(KBUILD_IMAGE)) $(KBUILD_DTBS)
 
 vmlinuz.efi: vmlinux.efi
 
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
index d183a745fb85..15d366b8407c 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -295,8 +295,12 @@ static void __init fdt_setup(void)
 	if (acpi_os_get_root_pointer())
 		return;
 
-	/* Look for a device tree configuration table entry */
-	fdt_pointer = efi_fdt_pointer();
+	/* Prefer to use built-in dtb, checking its legality first. */
+	if (!fdt_check_header(__dtb_start))
+		fdt_pointer = __dtb_start;
+	else
+		fdt_pointer = efi_fdt_pointer(); /* Fallback to firmware dtb */
+
 	if (!fdt_pointer || fdt_check_header(fdt_pointer))
 		return;
 
@@ -330,7 +334,9 @@ static void __init bootcmdline_init(char **cmdline_p)
 		if (boot_command_line[0])
 			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
 
-		strlcat(boot_command_line, init_command_line, COMMAND_LINE_SIZE);
+		if (!strstr(boot_command_line, init_command_line))
+			strlcat(boot_command_line, init_command_line, COMMAND_LINE_SIZE);
+
 		goto out;
 	}
 #endif
-- 
2.39.3

