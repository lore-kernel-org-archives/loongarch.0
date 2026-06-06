Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F8E3AB48C
	for <loongarch@lists.linux.dev>; Sat,  6 Jun 2026 13:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780752141; cv=none; b=K1IJSePzvmvmFYkTjbPhblNGbzGNmll3mcnNZ994Ulm0b5Zp++cQfd9a8UcerKxrdzCp7tnc3m1JUqtWEGurJLrxlw8h0AjuvEM4lNSK4sRfkfMiiBcE8rgTEATbqxPE+e1CwrDr5JtTta55x3DqE12UWlnIS8weJ65PPrYxftw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780752141; c=relaxed/simple;
	bh=cGYAXNTu1qL+6NlNoQgQZsLFZ9jLAeaaG17bz5cBxEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SyMxQoL73C8BOTMrtQtcGfLD9vpdVOVI1kplX43hsVFkMQ4aHfOUwEpNB4ldxAHB3RjiDuyb5GcdGairChXVLn0Z3VRx6SamWtVXNJ7i6gs598Tf5f5DqXIhL11RmK8j010Vxpaext2C61EmBneJYYgDiGQKRDBPSkHultwQzrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MrPx1NyW; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MrPx1NyW"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780752138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QYRv0TFk5ixGCSvlT9n2D6Lg3SOtx0nM5GvZWeV4Xxc=;
	b=MrPx1NyWk3lsbvnBk7H+LV+6XYbw35POy3tNI79lVIAGwVPzowNRal+3gtR+8FuXuJoLl/
	jo4kfTINQN3zmu4/jFlsMxuxs4yJFHXOJ4u38wBLB+mpjiPmtT4P2sLG0ZIaFx/cs5TW0R
	4MAapgjGRk6IRx5qwVkaZSHmh6g3iTk=
From: haoran.jiang@linux.dev
To: loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	akpm@linux-foundation.org,
	jbohac@suse.cz,
	kees@kernel.org,
	yangtiezhu@loongson.cn,
	Haoran Jiang <jianghaoran@kylinos.cn>
Subject: [PATCH 2/2] LoongArch: Enable STRICT_MODULE_RWX for stricter modules memory permissions
Date: Sat,  6 Jun 2026 21:21:26 +0800
Message-Id: <20260606132126.562034-3-haoran.jiang@linux.dev>
In-Reply-To: <20260606132126.562034-1-haoran.jiang@linux.dev>
References: <20260606132126.562034-1-haoran.jiang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Haoran Jiang <jianghaoran@kylinos.cn>

Enable STRICT_MODULE_RWX to enforce strict memory permissions
on modules,making the code region non-writable, the data region
non-executable, and the read-only data region both non-writable
and non-executable.Add patch_map interface to temporarily map
read-only code sections via fixmap, enabling runtime code patching
while preserving memory protection after modifications

Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
---
 arch/loongarch/Kconfig              |  2 ++
 arch/loongarch/include/asm/fixmap.h |  1 +
 arch/loongarch/kernel/inst.c        | 29 ++++++++++++++++++++++++++++-
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 606597da46b8..40d748a13c50 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -27,6 +27,7 @@ config LOONGARCH
 	select ARCH_HAS_PTE_SPECIAL if 64BIT
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_SET_DIRECT_MAP
+	select ARCH_HAS_STRICT_MODULE_RWX
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_ARCH_DATA
@@ -197,6 +198,7 @@ config LOONGARCH
 	select NUMA_MEMBLKS if NUMA
 	select OF
 	select OF_EARLY_FLATTREE
+	select ARCH_OPTIONAL_KERNEL_RWX
 	select PCI
 	select PCI_DOMAINS_GENERIC
 	select PCI_ECAM if ACPI
diff --git a/arch/loongarch/include/asm/fixmap.h b/arch/loongarch/include/asm/fixmap.h
index 5a9b04c720bf..7d174eafdc21 100644
--- a/arch/loongarch/include/asm/fixmap.h
+++ b/arch/loongarch/include/asm/fixmap.h
@@ -22,6 +22,7 @@ enum fixed_addresses {
 	FIX_KMAP_END = FIX_KMAP_BEGIN + (KM_MAX_IDX * NR_CPUS) - 1,
 #endif
 	FIX_EARLYCON_MEM_BASE,
+	FIX_TEXT_POKE0,
 	__end_of_fixed_addresses
 };
 
diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
index 0b9228b7c13a..7c4f60a7e892 100644
--- a/arch/loongarch/kernel/inst.c
+++ b/arch/loongarch/kernel/inst.c
@@ -9,9 +9,33 @@
 
 #include <asm/cacheflush.h>
 #include <asm/inst.h>
+#include <linux/kprobes.h>
 
 static DEFINE_RAW_SPINLOCK(patch_lock);
 
+static void __kprobes *patch_map(void *addr, const unsigned int fixmap)
+{
+	phys_addr_t phys;
+
+	if ((unsigned long)addr < vm_map_base) {
+		return addr;
+	} else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
+		struct page *page = vmalloc_to_page(addr);
+
+		BUG_ON(!page);
+		phys = page_to_phys(page) + offset_in_page(addr);
+	} else {
+		return addr;
+	}
+
+	return (void *)set_fixmap_offset(fixmap, phys);
+}
+
+static void __kprobes patch_unmap(int fixmap)
+{
+	clear_fixmap(fixmap);
+}
+
 void simu_pc(struct pt_regs *regs, union loongarch_instruction insn)
 {
 	unsigned long pc = regs->csr_era;
@@ -208,12 +232,15 @@ int larch_insn_write(void *addr, u32 insn)
 {
 	int ret;
 	unsigned long flags = 0;
+	void *waddr = addr;
 
 	if ((unsigned long)addr & 3)
 		return -EINVAL;
 
 	raw_spin_lock_irqsave(&patch_lock, flags);
-	ret = copy_to_kernel_nofault(addr, &insn, LOONGARCH_INSN_SIZE);
+	waddr = patch_map(addr, FIX_TEXT_POKE0);
+	ret = copy_to_kernel_nofault(waddr, &insn, LOONGARCH_INSN_SIZE);
+	patch_unmap(FIX_TEXT_POKE0);
 	raw_spin_unlock_irqrestore(&patch_lock, flags);
 
 	return ret;
-- 
2.25.1

