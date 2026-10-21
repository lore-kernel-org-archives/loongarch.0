Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571461;
	b=1htnNQk/mmAaxckmmmk6yENquBVc6Y+NRS21JCUvdtVm379X2bWOFNZWR5cgMZkhcjS8
	 3Y0mSXtz3GCr8q/wkRE4gcvVNw/NHTSlaQ7BfT6PEWnshTKpnLvunyVLR9BkI0Sy1KFul
	 cy6ag/pupv46BPICpgNZIlYO9uFj1dDXB6iCIK4GlH/QQUzJP92/ZHp6ji01dLkMKOnDn
	 0RkTZYZ0yCDJgrVQg897RBxCYgCNvm+3SMWOqEKjOiK2+vtIieLVaxwUtMQ/zxf7HK4RO
	 Zzord4SBPzfEQyiT+dxmnA8rqzlgjvupiDaVPjiQxMcukUvAkvp/zeAulh2Dm/A0txg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ChIsG9Vgmjf7e0EG0U79egn378mU9W7gdCp3fG4lF2s=;
	b=3zylfVKLYUhWYHXBec7IzO9rzXkku9QYao3dP9LEOMGJpnN7oJ5+g7XKgz4NzKrBsV/O
	 oljOW57zEbRvXOjsQusUPwk+TBXXemRa/ko1+iVuuKbBRQF2ctdmE7pHt48YLQJ6y2Npx
	 elGCEaSp8kYo+uu8NPNyVIazxR87WmxlwbDJTN/+ac4cnnL01Epao88ZMm3URwXod4Y3b
	 Sw21nZYpsVeL4kfjDXjGA5PM5+jDxN7ic8uNe3a6aMJ01ECZ9/g+TaL+fYP0cThz/lkMb
	 TJnYQYGncLQF25odrO0QSg2pJf7XvQQLVHdig+pMpRsKM1ejwHRo2cREYFbD1dw27xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="YGg8kB/F";
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64D5606A31F
	for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 08:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C64D5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YGg8kB/F
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3acb41888c0so47610a91.1
        for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 01:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571460; x=1793176260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ChIsG9Vgmjf7e0EG0U79egn378mU9W7gdCp3fG4lF2s=;
        b=YGg8kB/FoxX7otD9c+VGs2K2RIUDV/TKIhkS6ZNRYm4n4aEfTFe+RLmaPeqqW4EMsZ
         1I8Ubu/YEzZR6vbyZhUFgmefSd6A1hNhaKilevtlXDCt1BktVuIq/pGvH7VCjYnfkqbU
         nVRB3KZYmf4FUpIclUbTbUU3UM2QSwOyvxwRgWivhMZU4d3MGpbvoU5T1DrMyvP0zyTq
         XK5inkJEH9zYXBM2+8vTnYuyjixO0GIGx1VYoKmQOE/qH2Xciit1UqgvgtqBYcl+8xC0
         4B20zttAKNLPODZKSYVGS2YQkVXAnX9mbgaROY1dV3RuGQ2aFdGxkd2P/P6J3dRfi5DL
         wrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571460; x=1793176260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ChIsG9Vgmjf7e0EG0U79egn378mU9W7gdCp3fG4lF2s=;
        b=GWsItq4sxDi7oL8auA8Ou0ft0f+69cNnwctY85GdSN4e+2ERvSiDaZSz7QUHKCl6iS
         Z+7m6lFES2K+1i8R+uAJvv5VVNAZVcCnsnRAKX6+HV7FM3GsqGMKaQdCC0+pPQ0XmeZR
         cgkcst8kQWKsOspiONb/GUqHd1HZZcaKzyP1zdvsCgXP5ER15VGnGFC7+mv13xFztl+S
         OL7AT5+1c/lrYQObV7/VrpI53ewUc+ohYkwwNLJWNgn56iLNAMvkuNJ+WP00eLJo1s+k
         uR0+OlD1i6lIF4xelL/ZwsK+Hk/5EMGfKSAzlLK/I6ONYPr/JS7ECKsoRexuAnvT6HyC
         QMGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQ1rTbM/So/BqjJo5II0RSr5Q56BTklN5SPba+wRm4J4vsL9fZs7je5yE4GrnvVqK2X0Nsp7NXLCo=@lists.linux.dev
X-Gm-Message-State: AFq9FYJauWbAmVRzP0lQ9W7z5xC5TI/mgiTC6G9YwRPZa/BMIuGVYJS/
	zsTcOeUTWYfdA3Ky9Rq0QzVy+o+VKH+vuOMi0Io1v7DcTIWNMYntaP9Q
X-Gm-Gg: AYBFou0fk81nsMtRJnWQNYzyVNMdxyc7oQTxm5xBpYAz5gYuD32e/ETmEY5OuI85ETo
	OkoJUnn8soiQYzRRAu6XkV48+aSXNT1WsJaUA7H+H3BdzDlbUB9PWO1PTnflDmR8YkhnLEQZzmw
	mlAs0cEiic5/If4UY0Isx6CGbZtEe47dSYBy6xcgz6D16ZztP+W5ul46mkAn5UkHNLfzOjp7P+M
	yDU35Urc8+xxaZrvURwXNFtqsRFZQ4BbUkA5RFbbebx1dts7wg7gx20snBBeNuBQUT2ewJuUF+v
	aHbXnRKjaVKxgbWURR+sd/51Vb3/H+zqBydfWtGE/R9TPHGcy75qjNWrohnW43Q89o7loj8GHx2
	IciY0HIhEb1SHca/cMj1xNtTOdSyEL9BQxgNbwN2T5ylk+J2ElCcTFYoyc9we++n8qacsh/n4UO
	dGyfCa0hVeNlcqzSCm43xwB8NeHIwc4jqaAYmRWshgHK0UnwEPtix4RFh9Ty698fO1qwiuLYBp5
	y5gDDHf6i4yajDgabQI/FbRDtSBt6yfXUwYynCh/SlDscCAyctGDv+gmaCUJ/Tgi57U
X-Received: by 2002:a05:6a20:c78d:b0:3de:48ab:3b90 with SMTP id adf61e73a8af0-3e287d66c98mr907694637.26.1792571460149;
        Wed, 21 Oct 2026 01:31:00 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:30:59 -0700 (PDT)
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
Subject: [PATCH v9 2/8] crash_core: fold duplicated memblock arch hooks into the weak default
Date: Wed, 21 Oct 2026 16:30:05 +0800
Message-ID: <20261021083011.2170525-3-chenwandun1@gmail.com>
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

