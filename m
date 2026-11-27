Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770487;
	b=EOR6aKwsiLXu2o3P0HnoUHvKz5x0CGC/pJZ2iiNil9oD+Xfd2wIr/c3Uub2z2OygGIx+
	 txl6jWWFruR0IZZPCN1PGf7+u/9OjI5SWH42YTERj+P1CPTz9+xdTNqCvZH4BRqHowiEo
	 AawBzWU5/ca47L0cEls9T9Gf2w9FFzD2Mz3+RNUyQbx8CCKktu0oJcPgrHA85lvH6RjIV
	 43weDOir8p/aB/zKRgZ+wkVfsf7hqSWS15YrAmjtSFeT8lpjmjCf2MrknxvBYJDo31EvC
	 68glcBUSxq4JDuRq1s3Nq0UwJHSCslIm3iqjDUIgVaSdWj2+ulgIlvjByil5eUZNSzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9Yac15kv4zUJMw/dFjjqld9TLsvrPI7GRE4h7XfVDwk=;
	b=tMHCKvjBtIHGdjzI5HpHk85T83R9advu+sGlrd+1G2UgAkMaHyz93GVA5eQRTen6yqnk
	 IUwa2QSQyTko2qi3lMbKeHUUXzWGRWhLtNRF44gxZdb3UznTHMwmHVOf5fMfOaiqi2tnT
	 ShDbPrCLM8sY4x3goPu4s1IocmW5GJsLqOd+U8dbqMnBLKza6Is5OTKCRNzQP8J7R31LN
	 gssyujnIx7xO1IL3lxaLwJijQoR8nPxloYMBLvDxl1npBAI1ILiwXwhcHSP9n3vkA0RgX
	 D4IonknyhexloMbCENIy5gPvUIj3K2EnIQYFYyES8cyj0GnlFM9b3jUYxXqG1tzOkcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z4SLTwyA;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC24606A31E
	for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 09:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDC24606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z4SLTwyA
Received: by mail-pj2-f6.google.com with SMTP id d9443c01a7336-2f0918f9e8eso21972495ad.0
        for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 01:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770486; x=1796375286; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Yac15kv4zUJMw/dFjjqld9TLsvrPI7GRE4h7XfVDwk=;
        b=z4SLTwyA0gtzGoXVFiIr3qTmN93NlQyTcAus1IgXuJhzLkMaS9HfxNBXVUwrDNlCr7
         bUvh2mpsXEzpJBNQrS2hkwnAztLvRsKg2wL1Yx2DuUtzPXmD9gejSzUj80JgEKMc2Y0f
         xnqlx1fY0ixYpYzJ1tTkGoShSg2XOliLy1Ac5QLCnQf0amTdhnPvFUB43eNk7KUKdcFg
         yorTOS7D0cBj+sh1NYF8vKy63vFzqbApZxyWD8JeFRhg6e2y2HrlqZSIPfWu42gVzjL5
         fn7szyWlY8IeW7utE6FWr9ak0Pml9FYbw8duIgpQChaOUgxSn9IUzi4UU9yoi+f0iIKG
         Vx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770486; x=1796375286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Yac15kv4zUJMw/dFjjqld9TLsvrPI7GRE4h7XfVDwk=;
        b=ovVtjbXraUgODC1q9JBynSI3Eb31fKJcPYdLNF+K6dP8pGTNtyulDtyAo6fw/JJa55
         YvZ/N8lWi0lshCxSbE4Lo2uYnbWLXuWfVdNSjCw+7D4uFXVPWzkrVARSzCwEjXaNCD/K
         q8/ecSmWWKrx0CJQA9899/jPVYU+TppJnb2fZwZ0wUi+su2IwN1N+oP2unUMqFkTTrNp
         kKsVa0bWQul1Q/NHxfCWGX9RFgh0nT4W7twsfLzkuGqJ1Lb0Stajgefjg6H8+Pboya+d
         q8Z+H6vuF3hdQpj7h8m9UJPefKOZD9ADBXpfzWd05BmoI4wX2HnUhZOTZeavVV9dkIHN
         j1fQ==
X-Forwarded-Encrypted: i=1; AL+hErFqE8Im4rdukYgW8wFiAztS2wyY0//9PTzc+fdJgiFgtWyRdJtLBMcu8JMjO7nFuEetGpgbESSe+7k=@lists.linux.dev
X-Gm-Message-State: APuU4Z+B1zwRSOEgroqrVcqIEkJDd9BjkE0UUuo+oFJpasD4rpg/VxHc
	m2V4TU4xJb4GTJy93nY9p1y/T/Mb/EvD6QlsKu++PDcnG+5xAq4Cgkvs
X-Gm-Gg: AZFdTZfd80QVffEx5bvlVxD9u1rjZYLFJa4aA9FdLc1G+YSp7/f2J4S0fR0nhHznKZP
	CkpLPWOHwOaSEQPdBOqqelwZaTgRyeXEZ8Ta0tIhEcMKGTOAvUmEa4IvwGGwkNnt114uyamnUi8
	yCKaLh+wf/gSi88TV8Zk+4ud+GgMFTfK+UQi1niHxTB/6C9a2T7cljecQxvxxBrgTWqqXLWyTuq
	X/b0yIqm8dRapOOHKbEkvHmjcuC9y3w7UL2k/ovm2FKql1nV+5oQBm3CdNHqBPpiI9zdXULQ7hv
	ml5ruwsrneHmxw0K0UBL/P4XoWmh4WZdcPOYfMrhx0WUWq+4zMig0aU6u+32a8HI4QbVY4scqMO
	1kT87l9l6Y7/TR+npmQdzaY3r9CUkldWV9RqQi2XVkNgeSTeflCS6Qg/TqVLk/vkirng8P4KU2D
	xL4R2Es+m4Z1jVe7edK5zaG8CQijURKW/qe/t7k8e7+25SJp8KwKLvhlMOPouS13KzZYAhRYcwg
	otoon31PJUpGvdBr7qkLc02zS5mDoJA/mFGJIBya1sw5ognGPz68BKD489kwJy5rVOBBsjvKAzp
	qS+wKNBatZZMtpl7ZS1MeUCDZv/ayoudAMxO6H3ICg==
X-Received: by 2002:a05:6a21:8803:b0:3f9:292e:775d with SMTP id adf61e73a8af0-4014bc4b4abmr19459218637.49.1795770485952;
        Fri, 27 Nov 2026 01:08:05 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:05 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
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
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 2/8] crash_core: fold duplicated memblock arch hooks into the weak default
Date: Fri, 27 Nov 2026 17:07:17 +0800
Message-ID: <20261127090723.741253-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
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
 kernel/crash_core.c                        | 27 ++++++++++++++++++++
 4 files changed, 27 insertions(+), 82 deletions(-)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 14f453dd0946..18695f01043c 100644
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
index 0fe60907b97f..bef459287683 100644
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
index dad7f02365d3..fdc6695e8588 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,32 +37,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
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
-
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 				 unsigned long cmdline_len)
 {
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index d0bd2d0cf899..faa0f22dbb41 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -281,8 +281,35 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 	return cmem;
 }
 
+#ifdef CONFIG_ARCH_KEEP_MEMBLOCK
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
+#else
 unsigned int __weak arch_get_system_nr_ranges(void) { return 0; }
 int __weak arch_crash_populate_cmem(struct crash_mem *cmem) { return -1; }
+#endif
+
 int __weak arch_crash_exclude_ranges(struct crash_mem *cmem) { return 0; }
 
 int __weak arch_crash_exclude_mem_range(struct crash_mem **mem,
-- 
2.43.0

