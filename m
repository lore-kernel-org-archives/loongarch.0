Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566413BE62B
	for <loongarch@lists.linux.dev>; Wed, 20 May 2026 09:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268783; cv=none; b=Ul8asjG/wtnojkVwtcz3SXgKM0ZaaFozw+z/xeEmUbPKoeZFTVXLVCCwi9YUGLDvSzrZcRnjGv2k1gDrtPJBJDhHiQ1ofkwBb270VJ6RxQ9Sk9oRe6D3nNXjr51tz6XGYrvZbTO24x87DBKYUT2ywrcbL/D+g0pB1iIyF6j+wUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268783; c=relaxed/simple;
	bh=z+pV8J3G9vBpigYuBP9S8akaNmUvqt94D2AXmVvYIIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KIF/FrPN1dqB0ZZvNaT+aEpdwh9QnU17S5isfMs08+MaIZeI+sMFCeVCjGYFOwh6MOJjvmpBMIMGkz6KymaRUPbh5pB8PkUeYb8cPsRq2lNdabWSYhuC49+BHZ4YEnBkhiLhaPkEuMN0WnGjFYUrkBFZ6uEXkL6dAjwqXIrZodo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1N7ZtmK; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1N7ZtmK"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-8353ca0f1f1so1955221b3a.1
        for <loongarch@lists.linux.dev>; Wed, 20 May 2026 02:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268782; x=1779873582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOCzBK8k01kCn1ct1tqBM3o0gO2HRIsLOEiUTag/y2g=;
        b=T1N7ZtmKWZJHAbLazUQxeGdaDU/UndwmPPHm4FkAGWiP+9oeqfxCpDH9NekuKOpA5+
         /yTrc/l32l7EIi7QkyNQ9ZcAU7hUhdKU88zVh2aleOHP6s0Lmu6vVtVFHuKHL9o7q8SQ
         yPp2dBThVHnFx1MZBnbVdX02HnYBrzQ+bfNWGxKdX7+qdyPIEkgcvKDT4mbHlhbtU6cc
         5QIPk4RijBsyW/ep6IwYPMbNorpX137dFdT4eI+jghWZA+KEJN17+UzYvU9SDHo1W1Am
         r15h0YdYublicFxb0+7fQ0QHf/YV5Xb1DBSXzHDxcA2Eanh/JuiJbZwC62iOQu216bat
         mIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268782; x=1779873582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hOCzBK8k01kCn1ct1tqBM3o0gO2HRIsLOEiUTag/y2g=;
        b=IEUc+Vu4viinBmnMjlpT5lCq+1/1k9ApBKgZ70jgp6p8P5q31GaE/x+v00JXw1tZjN
         CALy/nRTjDOcm2rXC/0p92q3Eg5NMM9iblP/gDN8ul0Ifc85bJSLPwbBixBiSz7UouRd
         5A0Uhyn6nsPvfQ24GPXrd6OfH84AaqAp77Aevj5fMUXgksGb8O7ATuKcb4UE7maJGTOj
         4sbsMD7fm8HICDyBTtUOShigeQns4ibRSCpL2DIYAT8wImZi2+izFYw2TwUMhA+JmA2c
         7v1uoR62ZK+vMW7rXWmpKepowLzxAarYtaAltq6k6Q84qm1O+bTcWQQtBmn5PmkMtBgh
         Ih6A==
X-Forwarded-Encrypted: i=1; AFNElJ+gdkynQWMBfz+96thC4r1LY5FT4O2gqfE+/1gI3romu7fzZD+WeQwsxIrO4+L5Lv1pQaUPG7WQ2/A=@lists.linux.dev
X-Gm-Message-State: AOJu0YxN4VBkQcfYbjhj990cFNhBDqiguLGyFV0yho7UXVGE2yujgZ7o
	NkmURp5C49XNKegv65E/vFb5wa5GzIKrr7dXKX8XtQUdAIORiaC+JlMZ
X-Gm-Gg: Acq92OFYaeBjeFTgQaZdiBwh/VTjVxqYePfeHbyI6pYmD3oN+v8VJldzPmRFxs/X4HB
	nJMnNoeZROHnLmvnMLJrXCZgSCkFl5NrjnMzPIw8hMKS8L5mfbh319Vd3uHIloAEJL8c5wiEuLg
	oqGGeJloICMmdxHy+ZypwvKJ7rBjepG1cCkoo3NMTI/XRKX8L0hoeRTxgqomYLlQG3zXrdI9H4u
	hZSmqAhIohwmb6dNv7/BCu9BN9AbAZ+myn+0Dq3FMO0ASiBhOJHTpWqhZgIhnElmUUkdkwpbAU4
	gSCYHf+vcXqHmElyqCnQnCHwBvNujbBEONUnZh53wrp3PcnFjvtdnoRRHbOct4WoYRCXNHVTCWP
	1QWIy3Is+pff6k6TcBlJJfLeF+bHs2S2yOIlO314MJFemPMmxFoyrgKox7TzbcWdlzn9JnTujpZ
	6sirMSXDK3gv4HDlYWv+OgMA6adUS0etEorK/vgA==
X-Received: by 2002:a05:6a00:3028:b0:82f:2aaa:c14c with SMTP id d2e1a72fcca58-83f18e770a7mr21882568b3a.16.1779268781713;
        Wed, 20 May 2026 02:19:41 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:19:41 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 4/8] of: reserved_mem: save /memreserve/ entries into the reserved_mem array
Date: Wed, 20 May 2026 17:18:40 +0800
Message-ID: <20260520091844.592753-5-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun1@gmail.com>

From: Wandun Chen <chenwandun@lixiang.com>

/memreserve/ is used by firmware or bootloaders, such regions hold no
useful data for crash analysis, they should be excluded from the
kdump vmcore, so save /memreserve/ entries into the reserved_mem array
for later exclusion.

If a /memreserve/ entry overlaps any dumpable reserved region, mark
the whole memreserve entry dumpable as well. This may keep slightly
more memory in vmcore than strictly necessary, but avoids splitting
entries and never drops data that may be useful for crash analysis.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/fdt.c             |  5 ++++
 drivers/of/of_private.h      |  2 ++
 drivers/of/of_reserved_mem.c | 55 ++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 82f7327c59ea..d2bcaf149fe8 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -499,6 +499,7 @@ void __init early_init_fdt_scan_reserved_mem(void)
 	int n;
 	int res;
 	u64 base, size;
+	int nr_memreserve = 0;
 
 	if (!initial_boot_params)
 		return;
@@ -516,7 +517,9 @@ void __init early_init_fdt_scan_reserved_mem(void)
 		if (!size)
 			break;
 		memblock_reserve(base, size);
+		nr_memreserve++;
 	}
+	fdt_reserved_mem_account_memreserve(nr_memreserve);
 }
 
 /**
@@ -1287,6 +1290,8 @@ void __init unflatten_device_tree(void)
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
 
+	fdt_reserved_mem_save_memreserve_entries();
+
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
 		fdt = (void *) __dtb_empty_root_begin;
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..646b5f43ad47 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,8 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+void __init fdt_reserved_mem_account_memreserve(int n);
+void __init fdt_reserved_mem_save_memreserve_entries(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 313cbc57aa45..6dfe9e03c535 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -241,6 +241,43 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
+static void __init fdt_reserved_mem_add_memreserve(phys_addr_t base,
+						   phys_addr_t size)
+{
+	struct reserved_mem *rmem;
+	bool dumpable = false;
+	int i;
+
+	if (reserved_mem_count == total_reserved_mem_cnt) {
+		pr_err("not enough space for memreserve regions.\n");
+		return;
+	}
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		rmem = &reserved_mem[i];
+
+		if (!rmem->dumpable)
+			continue;
+
+		if (base < rmem->base + rmem->size && rmem->base < base + size) {
+			dumpable = true;
+			break;
+		}
+	}
+
+	rmem = &reserved_mem[reserved_mem_count];
+	rmem->base = base;
+	rmem->size = size;
+	rmem->dumpable = dumpable;
+
+	reserved_mem_count++;
+}
+
+void __init fdt_reserved_mem_account_memreserve(int n)
+{
+	total_reserved_mem_cnt += n;
+}
+
 /**
  * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
  * memory regions.
@@ -301,6 +338,24 @@ void __init fdt_scan_reserved_mem_late(void)
 	__rmem_check_for_overlap();
 }
 
+void __init fdt_reserved_mem_save_memreserve_entries(void)
+{
+	const void *fdt = initial_boot_params;
+	u64 base, size;
+	int n;
+
+	if (!fdt)
+		return;
+
+	for (n = 0; ; n++) {
+		if (fdt_get_mem_rsv(fdt, n, &base, &size))
+			break;
+		if (!size)
+			break;
+		fdt_reserved_mem_add_memreserve(base, size);
+	}
+}
+
 static int __init __reserved_mem_alloc_size(unsigned long node, const char *uname);
 
 /*
-- 
2.43.0

