Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571445;
	b=xHrZxDpmrzM35BFR9/Unk2atdjphIbaEgv7XjLaeCwjMK85hqBKqk+/yLyFvsPY2oA/E
	 1q86DZux6+iELSMcF/cC//nhzBPw4EUrBN6uLTKZpk+2VQKeMVxOqzikV3Vm/y6J8lZcC
	 yjIFdMNqrYhPM2m6ej8h/jeoAeow98BUnIc4p8ggX8jCk/5K762hiDxowuhO/bHMlwv5e
	 rZoGUsuOjSPLAADynWIO9kY4tYnHb4zTCHyi9Tege7k0fNnGC8cXBRzb57BAXUe7nTM2l
	 UpgDfmFgCGYFroYTArijO2qo29z2E7pjuW/nMt7plYjkx6HIsNwGa7SJP0BlORQ0Rvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e9/qG3hNPJNIGpwptQDGRFtRM3jaRgB/Z0bZ0bWRF/Y=;
	b=HaKqOmitGEGpFGcY8gikAQp0lkhPVWof85G3zNQYSULvdnJtMuh/hx9pW5gt59SWkdA3
	 LyIEDWRA1Vtq1dTGor9OmmML+UXyYr5od0qYiq3XPyEZ1Fx/cGvFL8DrHz4xGUIAoreTJ
	 5hsEHTwgvTdnY5bdqBAZ2foR9KbWjGDQYCf2Q2x/OIjC9RNcfqplAQQMouzFfx8wCSesy
	 qRCuSUgRndjOnys7smgpYKEb+8l6iLHpAiIPW+GwOKv+NcZOuBHBUCGwcTEfCutyAyFn1
	 Yosw+YcX7AcKmIMUpsjMl6VHEVFEdLjyYCehS7/vZVFrKrp/+ScqsOyNwawVxR6AuAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iuBxRZ0b;
	arc=none smtp.remote-ip=74.125.228.1
Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5B1606A31B
	for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 08:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A5B1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iuBxRZ0b
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cd63952c9f2so54357a12.1
        for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 01:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571443; x=1793176243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9/qG3hNPJNIGpwptQDGRFtRM3jaRgB/Z0bZ0bWRF/Y=;
        b=iuBxRZ0bjGgwItF62RhDP8GK5BHLhmxiJV165NKfPb1B03zdc8CJONBp0pEjoXd77s
         X9ONis8TYYfzc13eTfmcEWg0SNOpLWjnr0iFBmsgKNwnm/9+TrYP9RMKaqzr4mUXfYEw
         11qOOtWJuRoqG5ZXWcMyXx3hu1xuiQN86wxFXQIXveAJefkuQ7iAEJBmv4Rkxx7bP1Mx
         o7p90EPblKEgpnLw7ae4JzBBKLf57Y67qUg1vts7LqSSKayNr6fKFKQJ/Pb+PCKNNFoM
         qkP/ODeEIAuxFJuVvymUz20P3np+B6LhFx4kL1iR9/MCmPGCN6D+3LhIvVl1e+sqfQVE
         1OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571443; x=1793176243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e9/qG3hNPJNIGpwptQDGRFtRM3jaRgB/Z0bZ0bWRF/Y=;
        b=tOWcgkgTh2UJh6ez9V3TAY+XScOEeCz+tXDDzo08WmXpUgmYhizm255eO4It0hSCnl
         GW6zsntWmzTtLxN2w5ACQYEAjWDGDgLl/Gu0ZQAXfndbm2CUuJEwhUPZO5dRD5+dCKIn
         t8z2PnQsHFhrvwZll4uaR834AQvYqXU/jmV9Fjk7EDKjORCzg44CL44yUK5K4paZV6pL
         r+lWtGHZwKlb/eGXRACk0j93S5NgHCHEFvzup9CyitmDhQD9zDNRC7dxINbLW1QUj3dk
         W3keLjbUQT1+zSHSnQRULV6t7AYMVYl0M3zLXKhLANd7EaaO0+SebmnPqPGRsCUjaprA
         HijQ==
X-Forwarded-Encrypted: i=1; AKwUvByWidoF2Li6B9aFC7XXsJbmY5OY8YiR72/sbm+a54MXt8Pgy0tUuMrZsbFa01C+hAqa/q4M3W58g+0=@lists.linux.dev
X-Gm-Message-State: AFq9FYLIioSpPRwGwn2AsuUFXY4nbmralCIkyyELGREdCpKH7cNZo1Go
	U4f3hi/Ko2Ki1h7mvGMhZdBjyM5600wzVxMC9oFBW7xdslvQg6bNqrKT
X-Gm-Gg: AYBFou3pNGCunPFtkgbWXU+A4WkCHzAIY/AnydIrq3m+AJo5PDBuZBz/PlAG2WDrgn5
	EVEg/1nZk1W3Ikzx5D6YvbpZXutjFBdiYMLAVHCgbvvvJiozzGKV+wq23z++QKMPX4S6bTD5GzX
	exbIgAbE87IckOLh88zx7dZ4GJSqGG12YrKi3GJ/uEWF1flmL51aEgUP1RI1RTfgMdT0WAWV2og
	QhSH2FfUhJaJvXyeaVPnBhyM0XAdaPOZ695mKZsiME1jI1JTDlYXy0+GONg+e1O885oWzU8thj2
	pf0zmm62RzDepOe6g23sUYo4sDdY21sKUjxF29n6cCdUmXH/lox1JOU2SaaVxkyoYlSTBarTVEm
	UAHWlCem/LlS1sDRSTMnyz9RT/mTMimyrdfSkNAb6vf4tD30qVm92LLB19szqL0g2AqpxrgH9/q
	zm1wL3qvdeIiDLjheiZFkhNKlUnKkgF0/BURdaLhPnpBaFepWNutIOv+DXRhuRPlWjNEghbhkOh
	BTAdyPjXNEo5jV/guGAklbx3F0CF837QaT5Oi8D4n8kdoX0UKlGsOgorRASyWKjs7y6
X-Received: by 2002:a05:6a00:a204:b0:874:708d:b620 with SMTP id d2e1a72fcca58-8a089d13a97mr1238939b3a.30.1792571443298;
        Wed, 21 Oct 2026 01:30:43 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:30:42 -0700 (PDT)
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
Subject: [PATCH v9 1/8] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Wed, 21 Oct 2026 16:30:04 +0800
Message-ID: <20261021083011.2170525-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
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
index e7891a2a89da..e21d0bab77ee 100644
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

