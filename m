Received: from mail-pz2-f2.google.com (mail-pz2-f2.google.com [74.125.228.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7B03AAF52
	for <loongarch@lists.linux.dev>; Fri, 16 Oct 2026 06:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131393; cv=none; b=kkg6y8LAOlPp2NYn9DlxjJCBFcyT4GcIaYjr9IKW8WcicEHws6dz0XLVCAWO5WBgJF0QDhn7CT+DvsdIIZUJqS9fNr9FQ5m46TWm5dGx/vLC/QXJ+jNdHBOU9fGLJRHhTEowSivY2Xh2owUj3r8wg93ktegU+hFARinkN8JSr5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131393; c=relaxed/simple;
	bh=XLWTvyCPrvBH6IrX2SQmS/lbWi/l2CNUS/x21NzD+5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dl1FQmCbIFNt0grorN5OQ6lEnz6zs5hy9fb/cfttzHJ4RERI880Epf5g0RnlrJ3urZV4R7H0k9Qwut8GxuR9+CerkJkHzbiugkMTHv+nMdgpDB7L1Fmtz6fPxCR3k8bG7QGUppMXFTO1h0yUDoeo8xK/QrvXTpKTAWtq4Z6I8xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYUwGcNK; arc=none smtp.client-ip=74.125.228.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYUwGcNK"
Received: by mail-pz2-f2.google.com with SMTP id 41be03b00d2f7-ccc451ef3a7so604409a12.1
        for <loongarch@lists.linux.dev>; Thu, 15 Oct 2026 23:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131391; x=1792736191; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ChIsG9Vgmjf7e0EG0U79egn378mU9W7gdCp3fG4lF2s=;
        b=iYUwGcNKAB3Vq9hTMJf9UqQAqaLavO1JpyDrmIRQTExtPTx1s28ulvsXRYnHUmy+oa
         EAskJD1j1VqFEIuIXsC7LmUGWJ/hVOt8KK3pmbaSh6oslEdKC5ghnM8CJ8RK2km0zKxu
         Gx9eLVUq+XfKURtoxHuLq2vuzyOkdqAJmQSkmFuj8lEwgbP2mJRiqZ2GO9PM6tUS9RaP
         m9DYgSd0k+exGuTa+p/7uzp9y7pbCFv5SCxP+kSOM4+2jyXZMj0z4FXk7SB8gGEIr1GE
         ko5t1xtqIwG5EMyaEhjy2kSlA7kmefzGZcjXK4LNSXN78KmYTOMi/a1PvZ1qKVlUX2sF
         yG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131391; x=1792736191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ChIsG9Vgmjf7e0EG0U79egn378mU9W7gdCp3fG4lF2s=;
        b=NirANIoSNOmpeIq7O2b7DdhcGTGlnz/uoPdT6spABPaEQR8vgURFv0Mg76M8SKpMYs
         nZd8Aj/0oONvFqh7h807CNNYSvfBBO8qS94yPZLylLvkguBy/iLmnMbq26m9pVwq79hz
         L1pF8uz8V0YY8/03XXQXL6d05y0GtHGqx7inC5xcOzlWaWuaRtNq022O8cc0d6pu4dqT
         09m3LieaEbhSBl0JR7MJ02Qs1EQ2DYmg8MDmiXXrY1kCJ2sSHUHMPg27OcHVfM02sdEC
         afNp97yUGtpL+C3NUGixuTAg1Fx0GGRA0sLlVfi3gmXs6MkExsQnEYx/kD20v80vp6lM
         kToQ==
X-Forwarded-Encrypted: i=1; AKwUvBwU0AfJvwsTwgi6F8ThiuWuzrotfxFB4fgKeGi3n/DYIfzrHfQRj4rLmr4ZDeuppYqKWg7VDwxv9nU=@lists.linux.dev
X-Gm-Message-State: AFq9FYIUrUXQXkGPQjqc67gGQdfuWJ7YB1lTwKE2pgtmk5kEl8uXYpjU
	9iQo5ZXYgxlhGL7tUO6/nLbe3M0eXZsjtheWph0TyShsIyq0dM04jgij
X-Gm-Gg: AYBFou1nV/TbciYVq+4/kYt/LjPump9uMmsVjEAjGjaAHnrMsxxPltUzdXdq5Px5RUx
	bY9W6oFTvB4mRJ2NfahaPvWYo+Vu13IrC4MVkW3veeun0MTLN013123LgYcP5CJ6m3R5H+gc9PD
	F7l7lSv/taayJ/qXCW6H6YkoiyrBUCZEElB6KxkKg7psKelm0k/0zOcGZiWSAgEpF6FHOBZS8hz
	V9uqcKuIVnBSOsn7SX2gYMHBwCvqBHp9a++Ypt6oaU5Vr5FImnnh+U09Npj1qjsBetk5I19xG2r
	+d0IYa9d0PIKOOowe40BVTOId3KEoM9i4aftBI0XzEOdkdiXv1eI0GyAuiGbKj1dOGTVsYyYp8x
	88cGZR8+DrGbcERwFff5nEAxvbZu1X6ARDM7EAJMO0UqknfOqOtS6nduTo4mpOuN7/9wXtradT9
	BX53h/IaECr3tJ8iOex4zqi+LOxCj8rT4VlwBWtQhVlAKV2MjHSYud6Rta1nKN/SdQiPLSewnFa
	lrjETROCIqGU4r4/FBqGg==
X-Received: by 2002:a05:6a00:99b:b0:881:5dcb:400e with SMTP id d2e1a72fcca58-897c8991295mr20719510b3a.56.1792131390645;
        Thu, 15 Oct 2026 23:16:30 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:16:29 -0700 (PDT)
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
Subject: [RESEND PATCH v8 2/8] crash_core: fold duplicated memblock arch hooks into the weak default
Date: Fri, 16 Oct 2026 14:15:43 +0800
Message-ID: <20261016061549.4181390-3-chenwandun1@gmail.com>
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

