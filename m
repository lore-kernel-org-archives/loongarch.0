Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FE4385529
	for <loongarch@lists.linux.dev>; Wed, 27 May 2026 03:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852664; cv=none; b=BxTchGy8R9fLI+RbJmtwH0aaDdfZPOtpx/4aJzmlgx/kh3DpAltaZ15wgxiu79ysnoSfpjOb2NOAzSc2AHJBT0s5tfivjNadhNXwhrsjT6sAgaJcExRPyZMnFGVF+e0uuYeUUd0jcburGbiTk/Pm3i1k07Kd9g3K2BhhNv8ON6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852664; c=relaxed/simple;
	bh=BHpTlBX027ykjwYhJS6nSthz2HwxSGDDjUR6JMQZP6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N1nL4aVCgmkHlYbibfTek5LrDW1Mdecftf/Pr3ck2DQEfNMexXVt4t0Laxj97oOh86zU+qsidbwBu6DYb9LT0QFP7hiUb6OB3Kxu6Tjyrdcq3u5j56LBMfK+TV8D5OFyA698QWpIV7w7bW04tW8vNOsYWFkkPJunLWTRCubGfDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2F+tdnR; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2F+tdnR"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-83ec36a13e9so5625372b3a.0
        for <loongarch@lists.linux.dev>; Tue, 26 May 2026 20:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852662; x=1780457462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrSylNUfVMz9fGhknfQmD+9F4TfLhiOlPkwxJFsVly8=;
        b=D2F+tdnRoMf1KyhQhSXoFmcn9yOGgA1hkInLjHP8vugHc5KPYkgbp8ihR0qF40GrIe
         nbHwZusppaBHx8FlwinSgufk5gd+RUMloeUQmN//DEVilhNcBRovgn0F9cIFRdZDbLFU
         OqiiQZydjkZI6VwS3FpoQ4uY3eVd5s8FKpeEDGrzb8P9fQVXKJNGUvScffe7H+s3J1dT
         OrIAGONRS2xOqEAO1YSJvg5VWjWgfCPBTLyTeXwEf9P+RTPf6Y5iz6Tv3Rj7i949+B4Z
         M0Nlz2BD6OPy5mN4hY7mwclXRnje69bhoKvXmaZn941CKcLs1/gmAHNXbf4+XhhGrb/2
         5qRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852662; x=1780457462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hrSylNUfVMz9fGhknfQmD+9F4TfLhiOlPkwxJFsVly8=;
        b=OyUiaPUk3qsDK3urF4l45ckZflnxwuab0XhSYdzDM5fFLfrRCisN23R70CROzr8Nv1
         8gAN4quhrgUUt2D8a/TmY4KiCJPi/gbWUobFhdrmvV8QGj+MEBjxQFqr3PTp7a5/TE7q
         ZOrVqiVvBB7kE7HGlvHt3R3bywj0KCXt0ampUWrjFpdrQsz/BXt1FiWFBaNAPGRVLr2M
         HsjADi2C5Lr1JLGl2fviJsi9NUVX/IiPBod7sWsxyyYsF7HYF/BTtsSikyTtBftN7BER
         CNl+9sp0mTSJIP5VdEKZZn5d/8dD06DsHLiA4uBy6ylaZlNTNgv6w8ANG/Su5Mdzfsao
         S31A==
X-Forwarded-Encrypted: i=1; AFNElJ+8HujS8azV6UEZzjGA3es62PuxifzyPINHvtjxQadpfZ8cclYzLMw6Oejnvj0MBYlOSJxkxP8/n8o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdnMG5kksBf7GLWaebIuV2qv9hHiOZPAr1RjQtdDobkoIqnJ6t
	uS44Gx5JVfzbgwVjWRE7NZxh4PU90tO52Yf/b3dFW8XW+y2JEnzZFBhM
X-Gm-Gg: Acq92OFghEg5NKp6rbZPRYwz9+KUqiMog/wP01w/OqQLaiMEi8x1bb3pEKFp6VMXcFr
	37B+OBxGZDupxY5dvQfNjFnbdILvSFR+po+siaiHNvrVcK9i0WKIo7jEpgjDqB6m6XQV/A6Pgi0
	d1Jst42PxTfVhQi3TldIZ5IscZOxiM0WvP/TD/aE+7oAk7A68/cpxvyybv+ZV+Am04SqBOD1RDn
	zpT2pTav4wZAlM5bA/tQGttMvAdpq+Rw9/aqx/5jKOpqt+YV9oySh6dlEBaoSNhg9XGBVRTUe8H
	hbGFm2oIJhqa5+KE8F/4GnniNBc5lFO5BNaWmbf4Kw9wYwXYRkDTl1ua0c0KCUByoG2nIhpcxpK
	MIIbdKSieCQbLe8bmpxC6BLccqMOgEm/VgHRPFbL5O4ePxcmqTKbAicaPAdPTkiojiiJJFQ95Pv
	8m7bWog6PpO+XcifdJoSxV1W7mP4sysuNOkZSYVXBuNSGQnNE=
X-Received: by 2002:a05:6a00:13a6:b0:83e:b22f:373a with SMTP id d2e1a72fcca58-8415f31db44mr19548057b3a.11.1779852662047;
        Tue, 26 May 2026 20:31:02 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:31:01 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
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
	quic_obabatun@quicinc.com
Subject: [PATCH v3 08/11] of: reserved_mem: add kdump helpers to exclude non-dumpable regions
Date: Wed, 27 May 2026 11:29:14 +0800
Message-ID: <20260527032917.3385849-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Add two helpers to exclude non-dumpable regions for arch-specific
code.

 - of_reserved_mem_kdump_nr_ranges() returns the count of regions
   that are not dumpable. Each excluded region may split an existing
   crash_mem range into two, so callers use this to calculate
   crash_mem allocation size.

 - of_reserved_mem_kdump_exclude() walks reserved_mem[] and calls
   crash_exclude_mem_range() for every non-dumpable region.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c    | 34 +++++++++++++++++++++++++++++++++
 include/linux/of_reserved_mem.h | 14 ++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 5e27f9403786..1d9aa332325b 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/crash_core.h>
 
 #include "of_private.h"
 
@@ -858,6 +859,39 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
 
+/*
+ * Count non-dumpable reserved regions. Excluding each one may split a
+ * crash_mem range in two, callers use this to size the allocation.
+ */
+unsigned int of_reserved_mem_kdump_nr_ranges(void)
+{
+	unsigned int i, n = 0;
+
+	for (i = 0; i < reserved_mem_count; i++)
+		if (reserved_mem[i].size && !reserved_mem[i].dumpable)
+			n++;
+	return n;
+}
+
+/* Exclude non-dumpable reserved regions from @cmem. */
+int of_reserved_mem_kdump_exclude(struct crash_mem *cmem)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserved_mem *r = &reserved_mem[i];
+
+		if (!r->size || r->dumpable)
+			continue;
+		ret = crash_exclude_mem_range(cmem, r->base,
+					      r->base + r->size - 1);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
 /**
  * of_reserved_mem_region_to_resource() - Get a reserved memory region as a resource
  * @np:		node containing 'memory-region' property
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 55a67cee41ea..70db99f1fbff 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -8,6 +8,7 @@
 struct of_phandle_args;
 struct reserved_mem_ops;
 struct resource;
+struct crash_mem;
 
 struct reserved_mem {
 	const char			*name;
@@ -48,6 +49,9 @@ int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
 					      const char *name, struct resource *res);
 int of_reserved_mem_region_count(const struct device_node *np);
 
+unsigned int of_reserved_mem_kdump_nr_ranges(void);
+int of_reserved_mem_kdump_exclude(struct crash_mem *cmem);
+
 #else
 
 #define RESERVEDMEM_OF_DECLARE(name, compat, ops)			\
@@ -92,6 +96,16 @@ static inline int of_reserved_mem_region_count(const struct device_node *np)
 {
 	return 0;
 }
+
+static inline unsigned int of_reserved_mem_kdump_nr_ranges(void)
+{
+	return 0;
+}
+
+static inline int of_reserved_mem_kdump_exclude(struct crash_mem *cmem)
+{
+	return 0;
+}
 #endif
 
 /**
-- 
2.43.0

