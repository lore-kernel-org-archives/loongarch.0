Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B100E28EF
	for <loongarch@lists.linux.dev>; Tue, 14 Mar 2023 08:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38380C433D2;
	Tue, 14 Mar 2023 08:54:45 +0000 (UTC)
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
Subject: [PATCH] LoongArch: Make WriteCombine configurable for ioremap()
Date: Tue, 14 Mar 2023 16:54:33 +0800
Message-Id: <20230314085433.4078119-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LoongArch maintains cache coherency in hardware, but when works with
LS7A chipsets the WUC attribute (Weak-ordered UnCached, which is similar
to WriteCombine) is out of the scope of cache coherency machanism for
PCIe devices (this is a PCIe protocol violation, may be fixed in newer
chipsets).

This means WUC can only used for write-only memory regions now, so this
option is disabled by default (means WUC falls back to SUC for ioremap).
You can enable this option if the kernel is ensured to run on bug-free
hardwares.

Suggested-by: WANG Xuerui <kernel@xen0n.name>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/Kconfig          | 14 ++++++++++++++
 arch/loongarch/include/asm/io.h |  5 +++++
 2 files changed, 19 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 0d11738a861a..e3f5c422636f 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -446,6 +446,20 @@ config ARCH_IOREMAP
 	  protection support. However, you can enable LoongArch DMW-based
 	  ioremap() for better performance.
 
+config ARCH_WRITECOMBINE
+	bool "Enable WriteCombine (WUC) for ioremap()"
+	help
+	  LoongArch maintains cache coherency in hardware, but with LS7A
+	  chipsets the WUC attribute (Weak-ordered UnCached, which is similar
+	  to WriteCombine) is out of the scope of cache coherency machanism
+	  for PCIe devices (this is a PCIe protocol violation, may be fixed
+	  in newer chipsets).
+
+	  This means WUC can only used for write-only memory regions now, so
+	  this option is disabled by default (means WUC falls back to SUC for
+	  ioremap). You can enable this option if the kernel is ensured to run
+	  on bug-free hardwares.
+
 config ARCH_STRICT_ALIGN
 	bool "Enable -mstrict-align to prevent unaligned accesses" if EXPERT
 	default y
diff --git a/arch/loongarch/include/asm/io.h b/arch/loongarch/include/asm/io.h
index 402a7d9e3a53..079ef897ed1a 100644
--- a/arch/loongarch/include/asm/io.h
+++ b/arch/loongarch/include/asm/io.h
@@ -54,8 +54,13 @@ static inline void __iomem *ioremap_prot(phys_addr_t offset, unsigned long size,
  * @offset:    bus address of the memory
  * @size:      size of the resource to map
  */
+#ifdef CONFIG_ARCH_WRITECOMBINE
 #define ioremap_wc(offset, size)	\
 	ioremap_prot((offset), (size), pgprot_val(PAGE_KERNEL_WUC))
+#else
+#define ioremap_wc(offset, size)	\
+	ioremap_prot((offset), (size), pgprot_val(PAGE_KERNEL_SUC))
+#endif
 
 #define ioremap_cache(offset, size)	\
 	ioremap_prot((offset), (size), pgprot_val(PAGE_KERNEL))
-- 
2.39.1

