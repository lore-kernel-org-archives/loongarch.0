Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B502B427FB3
	for <loongarch@lists.linux.dev>; Thu,  6 Aug 2026 09:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009011; cv=none; b=QU98ADBwH2S89w892MD2ZPC2zm2rHCMEv4oQLq3syghRKeiF1KHRfCkL5HWlr5v2AOF3dPiBxgBBJgoWOeOsWXpFyQ73pCX2IDG6HCO7o4JQ1CW73dI3/eDOh+DZ5huz78efSwHrPf2+oDjM/pTxCVckupupFrdw5GFSj5PHEJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009011; c=relaxed/simple;
	bh=3+eeaa1ZvEiSWwM8HzdyswyClU6vwmIcEhsy7E60oGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z31DgBpCzxzpuKvrKFrXYvKbHkzQ88Z72cKpgVsHRBhBQW70WVu8WeGN5k9yyfqfxwAC92o1P7S4q0A4JGSuAJ4+Oeo+QtEWSzlsXtZNBAWA7xszbzbFT50V1KKw4oiZyOgW9CKi2CIKJK/KN+SxVQzfPwoWiBppagalweyby74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjTUMpMi; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjTUMpMi"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-ca7a25cd87dso1606674a12.1
        for <loongarch@lists.linux.dev>; Thu, 06 Aug 2026 02:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786009007; x=1786613807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVDvUsuVz4fOLoguLRCQrGgJgNWPqJ2TDc/OI8CtAH0=;
        b=OjTUMpMigGWe23FBSmr0ua5c2M32ZnJEuBn2lmRgnp/V6MhO+1dCa7fhBbfa3yJdPA
         KD6LOSf6JbWjkxsYdMyV3GU344zMy/jgKYGSh94YbIiJCfssJZ9iz9HW/QacNp+ul+aQ
         SJymJSB5DP/fyRRIKfHs/4Hb6qXrndxSVUU1uS/rSynfXeRh4K2mcXsVkmAYRvG3iB5M
         RosV6ogMsKnVTK1eY9Vb7Vt3eFExeVASdXzWhbSFYOjo7MVVsub+BBoHV57dfEw5BCIb
         fvYSOjoNxNCFG/tLPTHuPjnDkWs3vWVYe2hcDCY1KMQ1GmTxouTXVsyRTb86Ctf6JCok
         lNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009007; x=1786613807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVDvUsuVz4fOLoguLRCQrGgJgNWPqJ2TDc/OI8CtAH0=;
        b=FaImWHD88dXE1bEaZoYxLN/1DsEfwMfy2Waqkfgz7CciPVef/xD6XG7bku+brbEubW
         OmjOsqFNsTQUgV1dGcj49cohMa5i1IzNzumUzZ6VsG2eNXO1UDrJYobBfNQgQ2xHiN7a
         75T06hX5kPtovRgWbBjaJ2lS3c91Nt4fbz9n6GdQFvaMZxgVm/t23/k/Cqt5Iin8SjE/
         9JtdPKIMh0itlPfZa4Ac2PxQYffY754moDDDa2Nm8ymkqTTzLQwk732hcwRdAs30ATEI
         5YM/6k+J5wLB1Hm3S+ql2Rhsqb46cx9HRkouD5XO+FJeU78xzt/Bog8nRWM/2f/9uEXH
         bS+A==
X-Forwarded-Encrypted: i=1; AHgh+RpUEuxEqrIUQRVsLr9Sub6KB8YZZDJUaxqp/mArlxyp7VD/YiCS8OGK1F/8IsT9Wb7wfjz2o+JqFQQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyA0Gxy0sR5WDuPVqCW50dqQtFeM9gHFMB1QR7avecXpT0vc49H
	DmFC9kr05f2sPTTn5TjG+Riki2U1hhyIIEjJo1sAVrCoDFL5iXlrSCKn
X-Gm-Gg: AR+sD11MDHU+vQWiKXcxY1e4Ge9ngCSwSJOk6KbZTmDTomXyZYrUbwYhOFkCpfRI4Fd
	sm5iUG/2y0Vkz/48HpOJaLXlaPZWksFC9TTNWi+uKkIlyS1XQidsWWzt0cONgcp3PJBaK/iSMB4
	X7cyCldNoHpGKrlFEl/EUtjU29bTBKprGFmMVFbMDQylcqa8laYvSeuFUcHStE2fa4lm4jGc8jL
	bqP2vtcb4CIbCrpiHeu0m5EHqur61us9CH8jO0GNAZEOmhDO1V92/nCaN0kbpIruTiyJEHFn998
	5nUqvtRmdJfJ6/BMMcpZBiRTknaYW7fTeVwMC3s/0FlVb4w3QeA1pArz8TpVP0fKRa9KO+ciSaC
	+5iEftnYzGdR0HkuIyubOQfO7kg8+6nYz0VZPjPeOm0o115xuSNJNTsjdnQ0l06aCqBTac5gtE9
	joX1F+Zl7F4gDsjTkgIFOAA8uyY2zKQX91Wy6tXh5TSeV94AXcX1qcuzLfZxwEtYqHEl8QPPgWw
	lSgMVKZ8Nf9
X-Received: by 2002:a05:6a00:3687:b0:848:467d:293b with SMTP id d2e1a72fcca58-84f2dfb4e5bmr16809060b3a.11.1786009006714;
        Thu, 06 Aug 2026 02:36:46 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:36:46 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel@xen0n.name,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com
Subject: [PATCH v5 6/8] crash_core: fold duplicated memblock arch hooks into the weak default
Date: Thu,  6 Aug 2026 17:35:17 +0800
Message-ID: <20260806093519.2907771-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

The weak defaults are only consumed by crash_prepare_headers(), which is
called only by arm64, riscv, loongarch (via the weak default) and x86
(via its own non-weak override).

arm64, loongarch and riscv open-code the same memblock walk in
arch_get_system_nr_ranges() and arch_crash_populate_cmem(). Move it into
the __weak defaults in kernel/crash_core.c and delete the arch copies.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
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
index 2b36aa9fade0..77285ae3ce60 100644
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

