Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA62728CF4A
	for <loongarch@lists.linux.dev>; Mon,  8 Jun 2026 06:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780900263; cv=none; b=VihyseUEKu4ERH/XFCWhs7ac3Vrk8OlSf/VGVpBEDGDIa5124kXPvBFIxF71eAXUk/ltLWA+RMMB36Pxp0UnxqkdIzxZq3rpTPI6u4EG2d6iRxBYGIiXoUX2gT0NQ4BOVQ7BIN5blFtRe7PpgWFNGIS4ol5aVHfkJUiyYdT6fOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780900263; c=relaxed/simple;
	bh=dlPwCvZcTpHxF2Gl44ASbMMVi2c4erj7HxtVLbJsk+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Qz8zWx88hv3SE6n/wKRCCDfDZG2f+5Wx9TggyPpVCxLlAESWMfDl234r8qR2ELL9B2Yvyrk1uirzKAF6UVX9vke+WKyX/L7CuaMrdgqG1PWtSAtXjQxufI2/djf9RC7Yxr5lsTegnn6kGMYLk31YY1HgcFK+9FXQgd4cYhb2pQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Xiw7toej; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Xiw7toej"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780900260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OEXekJtAwJS0eqEuRTbzTTz6WYbsxD3ZLu+3uG3jgtM=;
	b=Xiw7toejQ4UvNrtG9OhYQaY2bZ/Tl7dnmFmmxb+JEVaEkNM0LnJDJMHDH0UTceBjLngCHQ
	r4xQZnMxwhQV0wU1mKnui+4DmeeiwtNQ3njdlK+zt/U/FKH6o3PwMufO+ALQfAFX75ll/D
	jh9Kb5A5V+ouSvz8WXVd6VbblKC9Q9Y=
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
Subject: [PATCH v2] LoongArch: Enable STRICT_MODULE_RWX for stricter modules memory permissions
Date: Mon,  8 Jun 2026 14:30:25 +0800
Message-Id: <20260608063025.281047-1-haoran.jiang@linux.dev>
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
v2:
Change the method of modifying page table permissions from patch_map to set_memory_xx

---
 arch/loongarch/Kconfig       |  2 ++
 arch/loongarch/kernel/inst.c | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

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
diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
index 0b9228b7c13a..877890c77d0c 100644
--- a/arch/loongarch/kernel/inst.c
+++ b/arch/loongarch/kernel/inst.c
@@ -207,13 +207,31 @@ int larch_insn_read(void *addr, u32 *insnp)
 int larch_insn_write(void *addr, u32 insn)
 {
 	int ret;
+	int err = 0;
+	size_t start;
 	unsigned long flags = 0;
 
 	if ((unsigned long)addr & 3)
 		return -EINVAL;
 
+	start = round_down((size_t)addr, PAGE_SIZE);
+
 	raw_spin_lock_irqsave(&patch_lock, flags);
+
+	err = set_memory_rw(start, 1);
+	if (err) {
+		pr_info("%s: set_memory_rw() failed\n", __func__);
+		return err;
+	}
+
 	ret = copy_to_kernel_nofault(addr, &insn, LOONGARCH_INSN_SIZE);
+
+	err = set_memory_rox(start, 1);
+	if (err) {
+		pr_info("%s: set_memory_rox() failed\n", __func__);
+		return err;
+	}
+
 	raw_spin_unlock_irqrestore(&patch_lock, flags);
 
 	return ret;
-- 
2.25.1

