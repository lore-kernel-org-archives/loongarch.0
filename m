Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001AD381B1D
	for <loongarch@lists.linux.dev>; Fri, 16 Oct 2026 06:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131380; cv=none; b=kDxMExgRks4UqGQW802AjpoxtPsD+8TBXt4k0LMjFLMe7PxtVDO7+xbZnWX+bYIF74+Xn4CrwUSR9MNhuSgKHJSWZ64xWuQErih/cnJ7A1OanPoz7XQNr1vv22tV7Kg3iQzNDGvodCSNBXNHYrb6evgd3YFTzqFym6EPuXNomAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131380; c=relaxed/simple;
	bh=PT3LWhSw2vdV442dcbthELxWe2cTjR/Mhzld4jrWTDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVSBehnCMYGJ0uP3lAO/Wv8He7gzogtdb0L88l1gd6IqQFlCvh04bLEK1nmeYPC+4VEJundNJ5P/d1Pc1jPF4NKCjdbxIlGFUzxnH+eKPRuUUIGz1nOAJycTryUmiCgry5Qhi56+PgUWsJGLeinAuF3urCehbITemmyrz3AaOTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/MxqcFO; arc=none smtp.client-ip=74.125.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/MxqcFO"
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so1161644a12.0
        for <loongarch@lists.linux.dev>; Thu, 15 Oct 2026 23:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131378; x=1792736178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pI8cU+3Va0VJY6BQ+e7sBVT9LPRu4J+OFo4gOdjLJ30=;
        b=e/MxqcFO/pVN1I19ucBJSTe7o1Z+smhFH5wX9Z4ZeyDZuBHfM9RGP0ZSucfcyRxu0q
         2oLOkQj7Uv8boF7gb8If/dzKyoT9MioYNT9HRn69EFDFnZE7hytl5Zypq9cXekZhOEJY
         i4TAfqTn65TDNJMPly2Y8rf471xZ+AAGXrTdrYWnBVZQr9y1XkhLUAMKtOC2uJN/TKPk
         YIXlPJbQVG6IQ6GJZ68KTgzGCrO276UaTiEhlXxf2ICLhNWHT5th1+LKwQ17zDbx1YfQ
         93cZe+w2G06c+Qzt2+nUe2nEpIW7VoAG9jEvuqMQ+b92At1IQb9KYsIhxQnnHn9VCimn
         4Dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131378; x=1792736178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pI8cU+3Va0VJY6BQ+e7sBVT9LPRu4J+OFo4gOdjLJ30=;
        b=2kfaD7QnB3FEbGdw+QpvgiOq2ZcgLO7iMnlBarr6MtjITTPfwWP/z/diGiwRGSEJN0
         v/SaeZWgXykLWkWfs5jGuw28PkbFHWm9/QzymLrGez8cIE2QgT5ncouqdpXHSDxLKs6n
         QjgWrnpOrozXhsZGk2N9odz35yGgIRCvEKHf7U0OfC8P4lNqmNU4Ls/OEU0yVG9n34f4
         tIxDD/rzBIaS3D98CmeNBWDf6CnrcQZbeB7lAW4c8B7eVE6P1F9pmGlmzJFx9ojbj7tJ
         alZJFKLbaN/a0ruCoUJ3mz9jBX+U4Hjv6dvNg15HQ0+TS38/ii7Q1hJWocrelcwS606p
         1Pvw==
X-Forwarded-Encrypted: i=1; AKwUvBwJuXuBf6LaXwDVhWgXq5+M3noiJB6wmFUuvs11Cb1dtBRGNCVZ6AOrT5n0wCafV+VFSDEyaK6w9IA=@lists.linux.dev
X-Gm-Message-State: AFq9FYI/wCe68TESGYA6JQNtvuwRoJeN2wtzIfny1IgFZUUohJiAIXGr
	OyZHHFlOWKubBU/EdkmgQbPk3LQZGR05MQMc8tw6tN2GT31rc21v5HRC
X-Gm-Gg: AYBFou2QhbiELSsMSjlQRmgUWQR0FApedmsdbjyUPhCsEpmus2MBFI10Bqt9Z6r9/vd
	O+KOVVKPxeXX9XRbsalKJZT4as04JcMaqQwKn465LQ0mdXuja79tdYBtr90Aq/qxX2WBYOFJPUt
	zltT0adOp4jMde+wPDtDAJE4+PP8ssgLm3tV5jUe8z77FPPYShD2uRT10fVX0N98+UIngYR8BXd
	M3WETfKcm7BDozMxZaiONg9J3BWSc3oEu05a/V0og/9oNN/iTiX7V4xWN7GjgS60k8ZthxBPcWW
	lG/LE97dchK8xkKRsnhWoffP7Pz9Xv33nCWke+3DZVULOIPrHewgHhL1d14PpEloy8vXU5aL75N
	Ybipcmi+Njm5tGshn9kDhc8ogzvrBOT/L90GjXVU5bB1pFkABS2m9T/Zv4/qxcKyYMu/5ilaTQT
	aD72uAPXjd3FWXlq7p4zbMuzhdLXCK2R7aXuaD09CNw84CtHqs+jrcTO+8r6Q8hLqbrkPlFWDPF
	JLStNQUzgQ=
X-Received: by 2002:a05:6a00:2996:b0:878:3538:8f7d with SMTP id d2e1a72fcca58-897c79d707emr18459260b3a.43.1792131378226;
        Thu, 15 Oct 2026 23:16:18 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:16:17 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [RESEND PATCH v8 1/8] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Fri, 16 Oct 2026 14:15:42 +0800
Message-ID: <20261016061549.4181390-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Replace walk_system_ram_res() with for_each_mem_range(). A later patch
introduces MEMBLOCK_NODUMP in memblock, the reserved-memory regions
marked with MEMBLOCK_NODUMP can be excluded from the vmcore by walking
memblock.

for_each_mem_range() iterates memblock.memory, which is freed after
init unless ARCH_KEEP_MEMBLOCK is selected. riscv needs ARCH_KEEP_MEMBLOCK
to filter reserved memory from the vmcore, so extend its condition
(ACPI || KEXEC) with CRASH_DUMP. arm64 and loongarch already select
ARCH_KEEP_MEMBLOCK unconditionally.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/riscv/Kconfig                     |  2 +-
 arch/riscv/kernel/machine_kexec_file.c | 31 ++++++++++----------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 62a4be0474e3..529310e3ae1e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -58,7 +58,7 @@ config RISCV
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_ARCH_DATA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
-	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC
+	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC || CRASH_DUMP
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 26cd2a8bd0cd..808e872f4063 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,39 +37,32 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
-{
-	unsigned int *nr_ranges = arg;
-
-	(*nr_ranges)++;
-	return 0;
-}
-
 unsigned int arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
+	u64 i;
+	phys_addr_t start, end;
 
-	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
 
 	return nr_ranges;
 }
 
-static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
+int arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	struct crash_mem *cmem = arg;
+	u64 i;
+	phys_addr_t start, end;
 
-	cmem->ranges[cmem->nr_ranges].start = res->start;
-	cmem->ranges[cmem->nr_ranges].end = res->end;
-	cmem->nr_ranges++;
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
 
 	return 0;
 }
 
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
-}
-
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 				 unsigned long cmdline_len)
 {
-- 
2.43.0

