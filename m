Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1007E
	for <loongarch@lists.linux.dev>; Wed, 15 Mar 2023 00:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C4FC433D2;
	Wed, 15 Mar 2023 00:45:04 +0000 (UTC)
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
Subject: [PATCH V2] LoongArch: Make WriteCombine configurable for ioremap()
Date: Wed, 15 Mar 2023 08:44:50 +0800
Message-Id: <20230315004450.508486-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LoongArch maintains cache coherency in hardware, but when paired with
LS7A chipsets the WUC attribute (Weak-ordered UnCached, which is similar
to WriteCombine) is out of the scope of cache coherency machanism for
PCIe devices (this is a PCIe protocol violation, which may be fixed in
newer chipsets).

This means WUC can only used for write-only memory regions now, so this
option is disabled by default, making WUC silently fallback to SUC for
ioremap(). You can enable this option if the kernel is ensured to run on
hardware without this bug.

Kernel parameter writecombine=on/off can be used to override the Kconfig
option.

Suggested-by: WANG Xuerui <kernel@xen0n.name>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
V2: Add kernel prameter and update commit messages.

 arch/loongarch/Kconfig          | 14 ++++++++++++++
 arch/loongarch/include/asm/io.h |  4 +++-
 arch/loongarch/kernel/setup.c   | 19 +++++++++++++++++++
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 0d11738a861a..e8437ac300f2 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -446,6 +446,20 @@ config ARCH_IOREMAP
 	  protection support. However, you can enable LoongArch DMW-based
 	  ioremap() for better performance.
 
+config ARCH_WRITECOMBINE
+	bool "Enable WriteCombine (WUC) for ioremap()"
+	help
+	  LoongArch maintains cache coherency in hardware, but when paired
+	  with LS7A chipsets the WUC attribute (Weak-ordered UnCached, which
+	  is similar to WriteCombine) is out of the scope of cache coherency
+	  machanism for PCIe devices (this is a PCIe protocol violation, which
+	  may be fixed in newer chipsets).
+
+	  This means WUC can only used for write-only memory regions now, so
+	  this option is disabled by default, making WUC silently fallback to
+	  SUC for ioremap(). You can enable this option if the kernel is ensured
+	  to run on hardware without this bug.
+
 config ARCH_STRICT_ALIGN
 	bool "Enable -mstrict-align to prevent unaligned accesses" if EXPERT
 	default y
diff --git a/arch/loongarch/include/asm/io.h b/arch/loongarch/include/asm/io.h
index 402a7d9e3a53..545e2708fbf7 100644
--- a/arch/loongarch/include/asm/io.h
+++ b/arch/loongarch/include/asm/io.h
@@ -54,8 +54,10 @@ static inline void __iomem *ioremap_prot(phys_addr_t offset, unsigned long size,
  * @offset:    bus address of the memory
  * @size:      size of the resource to map
  */
+extern pgprot_t pgprot_wc;
+
 #define ioremap_wc(offset, size)	\
-	ioremap_prot((offset), (size), pgprot_val(PAGE_KERNEL_WUC))
+	ioremap_prot((offset), (size), pgprot_val(pgprot_wc))
 
 #define ioremap_cache(offset, size)	\
 	ioremap_prot((offset), (size), pgprot_val(PAGE_KERNEL))
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index bae84ccf6d36..ae977dc01aaa 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -160,6 +160,25 @@ static void __init smbios_parse(void)
 	dmi_walk(find_tokens, NULL);
 }
 
+#ifdef CONFIG_ARCH_WRITECOMBINE
+pgprot_t pgprot_wc = PAGE_KERNEL_WUC;
+#else
+pgprot_t pgprot_wc = PAGE_KERNEL_SUC;
+#endif
+
+EXPORT_SYMBOL(pgprot_wc);
+
+static int __init setup_writecombine(char *p)
+{
+	if (!strcmp(p, "on"))
+		pgprot_wc = PAGE_KERNEL_WUC;
+	else if (!strcmp(p, "off"))
+		pgprot_wc = PAGE_KERNEL_SUC;
+
+	return 0;
+}
+early_param("writecombine", setup_writecombine);
+
 static int usermem __initdata;
 
 static int __init early_parse_mem(char *p)
-- 
2.39.1

