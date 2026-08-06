Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD419435A8B
	for <loongarch@lists.linux.dev>; Thu,  6 Aug 2026 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008986; cv=none; b=SmkiVormAfQL423FH0E3Mtj2hcqIQ+/edR+yNz2SNDVYChAFX03JiH4uo6W0P6tZ+ruQI5v/V8SXh7nl04G7sQS9y2S+GUesYxaLfMKzI7+2JTcodF/kxHY+KG6KKWpM49wstSJk+EgEcKcA8MAqVBSCmZ+DxJ2GVhBsfYvdAeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008986; c=relaxed/simple;
	bh=EUNr4WhuIYQkkKj8MSIpKNUa/1/RumTAD0mx3DUcTaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fL7YzeJyzawdfyIQ2z53c0pVAuaB36AdZlpnXNgKEAA7TiHlB31Pp1eYe7QvXD0dOdeYLXuxmBHIjAvMEES5uchZpHJEIYcib6rvbMZ2UbRHuoUN4CNhyxunWLG+sQRfrUhKi939Bs7kMJitztiHn4hD/+K2P5OOv8zckD/Bdco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZtgtGku; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZtgtGku"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-84847482584so559664b3a.0
        for <loongarch@lists.linux.dev>; Thu, 06 Aug 2026 02:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008984; x=1786613784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JoRhdZOCeEiS1VMpBUeU4kVAqK2jVYvx0TEggrSzApM=;
        b=bZtgtGku0W8c00TjtR1ZNJK2W/S/5+McF7EtDN4rMugX7JXKeZI8rqAxHtqBPfh5dD
         GADeXsCvYndHLA9Ci95/JaGpjX8vP8e+I3DRhUHY3dR/fFIsF4YYyQAchTkfFvwqmh83
         2e2eKtzFRurzzXh7+TeSvUahCorz4EGebjUkyqSVqUozZSiZ5HjMIMhWP5DH2RLgLN8X
         2iWQdS90MWn8pRHFBgXfP2mumrWx2dwxLy6Em3WIXHPetw89qCzfAq4C9rnBnbZnOLaw
         E6oTegzLScLaLNSXgCQEFSsyl+OJFqhqRJCarjoLx5kdQ2c9wlXoqCKo5UcbnWREJLaq
         o6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008984; x=1786613784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JoRhdZOCeEiS1VMpBUeU4kVAqK2jVYvx0TEggrSzApM=;
        b=m34xBfFQR53EQzL92ab8RHMMeB52JYGTi1BWZx4rF4w0w9w3YMsvlpw+P8ktcJHN6J
         5uM9z8xnL8E2A1Nka7Fa+7sw6hRppqFZrgjA68bcGgIrZdOtTedPluu1FGox1eBESJnp
         4w/AD3rCmhmTL/P51pCTOgVslb0w/CEYaA4y54VRJBEj58ZA71g1ZQpKmHRkCdv8PngG
         382jYh9OH6nbpo4Sr7vIckOsmmCLOSSD8TyF0gydO/HzOrbtPQvrzSKRQQ3v5t03S0gb
         Viau1D2zsHSv8A23xCaoVdil4lq4El2pCZ0SYstpPd5KVXeMfGPAgdYDtC4rguD/XvCB
         p5fQ==
X-Forwarded-Encrypted: i=1; AHgh+Rolowa6nunVATeXhbs1utDTBbvxydM4rY/l5IHzjdHsznSSQbED/1wb34QMFZI5icf+ZYs4Thy4gpQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuPGt6YjNvk7lqM4SXZjvfo9DxANy2e9bXgoFwzd1FqKQaHWrA
	e33Hwh178IiwPqXYB0fuM+unHFUnQGW2Ft98XL1nDmvnZPyY5/fqnABK
X-Gm-Gg: AR+sD13c1R8jGIcRgjMqOGGoztBHtQD5pPicHoQdVX+kmV/oZ4NPDzbOUVj+2jkuUAm
	5mxD9Bsejjh1vvDDAwXi5XwtNenAR289TZL8rf6kdZvJMMGoRpRdbJH7Zb+u7WltA3wzoqVb0qX
	gPSzmnjzh7mQ/9Op14ES/3iTTzBZH2UGidbNKGoSXIn6fMwUYWZxnmI6rV7Q0Tu1VELMjojEeEf
	z1gkPWqOJsPIy/ZjK2xrPEuDGX5uPXcfObWr4AgiPY4VrmFsMgHUIEBFvG3cFgysz+KzTt/U4z6
	ZTNchzsyuQlh/NjfNEBuNNyI0GGkBJCnlNEFzu6QHJPZ9Af2prX1bW4TCkTloqCPs3mjQXyI4c/
	K3XNPpILqC+JgRsWEa4jjkAzWYDiS0mfkYtB2JYiugZl55/Tr3vWJS3c6v2PvSvbhqx0tZuwAS0
	IqHeHYfIHimajiDTil9GDgFB49f7l4QREyQ9skBffjAOQa39Fmkc5KhnnkfBpUPYwY5q+TXp34d
	A==
X-Received: by 2002:a05:6a00:f8a:b0:847:9dd7:2683 with SMTP id d2e1a72fcca58-84f41df42ccmr6551184b3a.9.1786008984000;
        Thu, 06 Aug 2026 02:36:24 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:36:23 -0700 (PDT)
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
Subject: [PATCH v5 4/8] of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
Date: Thu,  6 Aug 2026 17:35:15 +0800
Message-ID: <20260806093519.2907771-5-chenwandun1@gmail.com>
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

The /memreserve/ entries are memory reservations made by the bootloader
or firmware, their contents are not needed for kernel crash analysis,
so mark them MEMBLOCK_NODUMP to have kdump omit them from the vmcore.

Entries that overlap a dumpable region (such as CMA) are left unmarked,
because the pages of a dumpable region may carry crash-relevant data.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/fdt.c             |  2 ++
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index a64afc3ded3d..2aa888997e9b 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1286,6 +1286,8 @@ void __init unflatten_device_tree(void)
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
 
+	fdt_mark_memreserve_nodump();
+
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
 		fdt = (void *) __dtb_empty_root_begin;
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..667ce9e46aab 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+void __init fdt_mark_memreserve_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index f38d11df6f15..f0683b5d77b3 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -251,6 +251,38 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
+void __init fdt_mark_memreserve_nodump(void)
+{
+	u64 base, size;
+	int n;
+	const void *fdt = initial_boot_params;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	if (!fdt)
+		return;
+
+	for (n = 0; ; n++) {
+		int i;
+
+		if (fdt_get_mem_rsv(fdt, n, &base, &size))
+			break;
+		if (!size)
+			break;
+
+		for (i = 0; i < reserved_mem_count; i++) {
+			struct reserved_mem *rmem = &reserved_mem[i];
+
+			if (rmem->dumpable && base < rmem->base + rmem->size &&
+			    rmem->base < base + size)
+				break;
+		}
+		if (i == reserved_mem_count)
+			memblock_mark_nodump(base, size);
+	}
+}
+
 /**
  * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
  * memory regions.
-- 
2.43.0

