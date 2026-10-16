Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA00360EDE
	for <loongarch@lists.linux.dev>; Fri, 16 Oct 2026 03:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120166; cv=none; b=XSopQQB7I1qm6qhuJYrkrJ9KsSyiIwoAUXnf7+aS30W0rmfB5oVEydCWY56lrCSgtal/ZXP0DulVSyO651Zc1w5SJYib0qqUtHuWzxGD1OyoZRVRQ2glAtFlJT2l2IWRwe4lW6nvc69Jaqq8YhiwpF/9Yro+iZO9BAD93xq1C6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120166; c=relaxed/simple;
	bh=PT3LWhSw2vdV442dcbthELxWe2cTjR/Mhzld4jrWTDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gf0ckAt2Afr0ttwcpzkD5zspep3L7sD3jstbogDCLq/2Sy1Dxc46t1PTkLSZ96bjzDaO/3jnHaULHYvV+knQ8LYsB3hLh9yK5nyMJDheylhJAmsvYGRWpMaN6JMmvh97aPQjIKoS9iO4CZKhRyVJBDQD5khNjeEBjfNHK4dihOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAK0xSQY; arc=none smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAK0xSQY"
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3a51696a650so3488758a91.1
        for <loongarch@lists.linux.dev>; Thu, 15 Oct 2026 20:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120165; x=1792724965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pI8cU+3Va0VJY6BQ+e7sBVT9LPRu4J+OFo4gOdjLJ30=;
        b=jAK0xSQYpqwSosC+db+KIeA7kG8x5fPodLdHStRJ7hALsNCSNgR7AURDESXJ/bD3z6
         k2E2dVeqmv3UHUuyz8B687twO2BUjfyNb02hw/8l2IV3uSSKXU31/bL9koBfoD0AoSp7
         wDKj1PWaK5aNXvp6oQ1PRyjLNPjl1OrGcG1K9RUMt2hVZ/ngaIyawJKipU+JjZC1Uh+l
         SUFACrbAR2T3MaqKHLmnafKpy2NJoNYC5XodJl8nYQBvE7GS1peAAlRt+kt1g4CcIa0j
         SWz/mnESbjqz+v/LJQJ/Nc18yCA3vlHfWlAIO2eo92GVlo8l6xfMj3CdknDM79f5Hqb/
         Vy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120165; x=1792724965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pI8cU+3Va0VJY6BQ+e7sBVT9LPRu4J+OFo4gOdjLJ30=;
        b=gZQhV7SSrvm2VUXwSDoN/OdJjkfjnFPNkOr70Z+YoIw+Xu1nXtmfdcfKLuqri5TgNJ
         m3sSvDEKSmYWRVg5hC4NGBI14MfW2Mv+h10XMpDZ7yKsa+C2PnZazNLIW50gBMeWUXub
         sGuhfxAWC0975Vky2zlDTGfsmNA1LV8RclBBi0EDM/OODN9389xMhZ45KuD3FmcQHrJj
         rZ4j1bakbLsKKMPmNZfbVATrkCMk3GQPGQzU2QHxycS+aG1hUlVkBFDcHeb0gItSSNBe
         6WB6R0obizXZDk+e30GMiVitxhPUTDN+YwMoPgQBOj4/H62TRd3TAj4g/MB+JVi6HAC4
         FUoA==
X-Forwarded-Encrypted: i=1; AKwUvBz6vIzgH530v4TLXQgpmnVJyX7uk5zil1HwvuRlrjths+nyI8Zb1frzKe3QvyTTcClXQcd+nRWOTQU=@lists.linux.dev
X-Gm-Message-State: AFq9FYJGIsWM2ZQ+36EWyVgc/tUq3hTtdXiy4AcMyOFr75N7WOIDkwLz
	hNYsFUu40oOH2DOvtp8/WBHRHkd4RhSN4FqDdDBFUOPmoBVxtM/Oaspl
X-Gm-Gg: AYBFou3bKnpWUi0U2UfTfppfHsSLpjvFlwJm/6sHHaK+qSamZNZyKVdZr+Z+c0ne611
	qE8pPXSivh997KI1sPlnNstmVEMg1EX+6NNm8tZDaMZXLIkODuPqNbzHkV/mLTy2G4gWLlYwDn6
	cmWU1eC/jscrbK/i0ir8CLde6UixwZIMQm9cgWfz+rqaEdJGUWJP7RrT/FIqXYT4S3+aRlrAjxa
	iaI3D0ftguDQVBD3F2Bdc4G7GNLTlQdSFeMgn6yk413WqoujC8SW1jf1fjHQOe9RW+u7/V8WBm5
	ysGmx0YkEwBiCcTr2cBkAcGJnma//a/y3zVsFzAPClX1gbWYbdChVF78GZ+SL1kEhuXLRy/4mHm
	5h22JfZfrCtNXeGWS5pXkmzmjvXixdpbjndzbvkDQVhoJ6EAwogjAfuBakyPmcKqXMgHMU4S2/s
	Wu9ylUPSofcSFbZnEVBoA2IaxgK/gP7MbdPyefIK3dUleLAtKWnu8kBks+K2HK9Xp4QQdrEe8xl
	I2z5034p24=
X-Received: by 2002:a17:90b:5823:b0:3a7:9413:cfae with SMTP id 98e67ed59e1d1-3ab3ab1d561mr18240688a91.42.1792120164811;
        Thu, 15 Oct 2026 20:09:24 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm370085a91.4.2026.10.15.20.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:09:24 -0700 (PDT)
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
Subject: [PATCH v8 1/8] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Fri, 16 Oct 2026 11:08:48 +0800
Message-ID: <20261016030855.4062882-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016030855.4062882-1-chenwandun1@gmail.com>
References: <20261016030855.4062882-1-chenwandun1@gmail.com>
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

