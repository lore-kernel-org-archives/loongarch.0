Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F84B52BE2F
	for <loongarch@lists.linux.dev>; Tue, 22 Sep 2026 08:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066617; cv=none; b=RYK/PmPl5vHI1gP/hkucapEDfa6+0LS4URruKSz0tjX1P7wZrpqM2bddYgodvyxv7qY2YSkjT14LzTQxX+qr8rye0oeAx7wpcc98Qq3mlB08oF5WQVzlt0fQ+4PjyqqEPIwB/2npr4c+LFjB+ufqCp71J6sJZtfTyWcVG+/+otk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066617; c=relaxed/simple;
	bh=U5xkLdotgOqJj2n1qVMunZQPDE+jK8kLYOyJiOWwvzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I94hB30iDUnlsrKwSh8qHOM4Sp3z/b15Hd9CVIPB8PW3GNN9ThxvnNVvtJga0zIdjTIbEfkKTUt2pXM3i9RRb27a6l/HD1Jb7vbWRIzBAvreI41QRLYTcYk35VNaJPqsIdszBpHMl1Aaxy7ISdab2mkM1T2n4bUYc5BFany4oQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvLokKQF; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvLokKQF"
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2d903e972efso19330965ad.0
        for <loongarch@lists.linux.dev>; Tue, 22 Sep 2026 01:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066615; x=1790671415; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KnVDZ+yI4npNCIQQqlxZwSFoW6YUe6LE24tWXfIE9sY=;
        b=DvLokKQF72xjp6RLfhydKlKTBYxo2g803Is0PIqZkeg4fXFQJzooqNM5Sv61sTU1sE
         Jde9l9c3NVaEhpn87YJsWV2GOsJpCx4VLKsetjl8YK1zMH+xmy27exN8c1NFXBSxlJj0
         prxoMasMBb0CrLkn12RXQM/bJAUA7tpSv8/qmkGqOr9zH3IZ2nVbP/RXJBZ6rf16e6n+
         UK1UNn8ikGeTOrw0uGXIzw6AAOyDHR1vfHlk52P/ZvI4ecbZsgNh4jjRC1Of9qtwFB59
         tXi4W05E7fiyOpdIjqCcLuAhBEnCjJBt9jPjsPyn1dfV6KnOwwGwSY+34rq9FBmYsU0i
         cNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066615; x=1790671415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KnVDZ+yI4npNCIQQqlxZwSFoW6YUe6LE24tWXfIE9sY=;
        b=S+kf54Qpv3uaAUDr/l/o3Q6zqqNvIvmScMdsfq1XYSLaQfZZro0FV+6URrCMX6bAfZ
         uEVrSVJ2QQIbZosCX/A3fgw0lVMBtI8jI3lk413x+VErZgodz5SefjlJNQaHOnWUgeDl
         7YtXTPRUdKi1kOA0rWvIMaj/3hGLZbCUAK7biysafNKtwSXzbXFxSshkxa2RGdIckcZY
         LhLOOMVW5+JFkbB6Pvc5dLJlapDRebgn2V+2hOJkdZTHzpIzh9HDa8XPk1NyHB7BgbNt
         b2C1QUPGni5uyW2JkqucwWJeLMDVRH6PZCgfEdIa+U9AxcjuVyhnXwX5sCX9wZHf3sqc
         8btA==
X-Forwarded-Encrypted: i=1; AKwUvBzGWu0GdJfOO4Cugqn0SmuJm7mVPuo7mIlg7WFIOq483A3DUdj9AfcV+AocSJpwML12KC9d+A5nYGM=@lists.linux.dev
X-Gm-Message-State: AFuF++mf92r7EYhlvcQh7e/wd60A/7RTr8bCky4Z7s66lZjgOWTDee1h
	xu+utHdtos8bKECxO/aeLMTYQApzhUWOiZmQAfmdYclbyhQ749fhYgUu
X-Gm-Gg: AYBFou2GgMs92PXbt1moenYPC4PxOrs90ZT2e37zvbxrhYtSwc9Vh2+TkkvOw0VjzyT
	7BQYCOmlhmMmEWK5WNk/oz0x7VX0FQ1B2ZkzKInaxY7fdYdMJXHCfNhX/AGHWVOrhcfGK28KuV6
	O04bOUsd6Z40Cy0/XXYJjn5Vv9FMhtghZmedRaZm7KIv3nYKIVvYuZCO0fkPZBR7iNYNVe86JbP
	94ijOytjhprOx83z1NCO8DVJThxjnx8HKAeD71o+Bw7hza34a4HyHNGbvG2ShVb+/Z5gwcLCGwa
	ZOw3qWpDPif6UJbYkwRFBDLR8Fxlqwnb6TiPzfAgprwAPX0mRShvsycCmwVHXPrGC/hWXsBuWV8
	APxDfVs7r6ZPyS5kFZPipX+WwmdEZEbfhpWw2bhYaow7yY124cfRqLj2zk0pN93BfKASe7tHc00
	pBrbIo9bVXJ85LIee+u0exLF82NzgQAiGl+60tujZ4WJvYYmkLPw0yK9VPQLWRzMLH38PJFlZwH
	0B8nNZNFoUyNz/QEYiWqg==
X-Received: by 2002:a17:90b:1a88:b0:39e:252:ae4d with SMTP id 98e67ed59e1d1-3a073112d3bmr471304a91.17.1790066615322;
        Tue, 22 Sep 2026 01:43:35 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:43:34 -0700 (PDT)
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
Subject: [PATCH v7 2/9] crash_core: fold duplicated memblock arch hooks into the weak default
Date: Tue, 22 Sep 2026 16:42:49 +0800
Message-ID: <20260922084256.1515554-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

arm64, loongarch and riscv open-code the same memblock walk in
arch_get_system_nr_ranges() and arch_crash_populate_cmem(). Move it into
the __weak defaults in kernel/crash_core.c and delete the arch copies.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/arm64/kernel/machine_kexec_file.c     | 29 ----------------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 --------------------
 arch/riscv/kernel/machine_kexec_file.c     | 26 -------------------
 kernel/crash_core.c                        | 25 +++++++++++++++++--
 4 files changed, 23 insertions(+), 84 deletions(-)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 854d872dfd0f..34d944d3f22f 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -14,7 +14,6 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/libfdt.h>
-#include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/slab.h>
@@ -39,34 +38,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	return kexec_image_post_load_cleanup_default(image);
 }
 
-#ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* for exclusion of crashkernel region */
-	phys_addr_t start, end;
-	u64 i;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	phys_addr_t start, end;
-	u64 i;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-#endif
-
 /*
  * Tries to add the initrd and DTB to the image. If it is not possible to find
  * valid locations, this function will undo changes to the image and return non
diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5412aa9f3568..481b8f906a56 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -13,7 +13,6 @@
 #include <linux/ioport.h>
 #include <linux/kernel.h>
 #include <linux/kexec.h>
-#include <linux/memblock.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -56,32 +55,6 @@ static void cmdline_add_initrd(struct kimage *image, unsigned long *cmdline_tmpl
 }
 
 #ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	int nr_ranges = 2; /* for exclusion of crashkernel region */
-	phys_addr_t start, end;
-	uint64_t i;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	phys_addr_t start, end;
-	uint64_t i;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-
 /*
  * Add the "mem=size@start" command line parameter to command line, indicating the
  * memory region the new kernel can use to boot into.
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 808e872f4063..fdc6695e8588 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,32 +37,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
-	u64 i;
-	phys_addr_t start, end;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	u64 i;
-	phys_addr_t start, end;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 				 unsigned long cmdline_len)
 {
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index d0bd2d0cf899..d201638d11f3 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -281,8 +281,29 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 	return cmem;
 }
 
-unsigned int __weak arch_get_system_nr_ranges(void) { return 0; }
-int __weak arch_crash_populate_cmem(struct crash_mem *cmem) { return -1; }
+unsigned int __weak arch_get_system_nr_ranges(void)
+{
+	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* crashk_res + crashk_low_res, +CMA splits */
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
+	return nr_ranges;
+}
+
+int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
+{
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
+	return 0;
+}
 int __weak arch_crash_exclude_ranges(struct crash_mem *cmem) { return 0; }
 
 int __weak arch_crash_exclude_mem_range(struct crash_mem **mem,
-- 
2.43.0

