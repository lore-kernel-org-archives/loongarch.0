Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71073E7BB4
	for <loongarch@lists.linux.dev>; Wed,  2 Sep 2026 07:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334412; cv=none; b=PDTcGUZfsjM54zwFHvERT/gV42XsUJguSQrUnogSKUiIJN8JKohWALnXVuysfxzjCD7sE9jH2RCylY8AMCqw8v3mzrWPMgQiR3jNdJAmSGqkOsl0kpd1nW95gL/31ZjJ6rx3JUXRctVz6/u8RwbE0C0PtVJoLY989ahC905dMQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334412; c=relaxed/simple;
	bh=rOduSQdWEUvuONTVSGKgP+5LCjrhss6DGwsRFOyVRP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jgv/uCsRvJLAAIsZqOPWoXpfGI4jyL1pLW0FPI6zsUTzfqSo4oR27jfpy0C88aWphL4A996IQN94NkGvSjWOkPXBeDgrSNC8TwGi8bIa7Tr7Kw0RJlQPJan1EyYFcpAbn/+sevsquZ0DeQe/oUGMc1k2uN12BrVJO4ytHwVgack=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oOA7X+PK; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oOA7X+PK"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-c9fe62e0da3so237714a12.1
        for <loongarch@lists.linux.dev>; Wed, 02 Sep 2026 00:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334410; x=1788939210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlegJqwkFPej4fFKCV2MAr7wlJV+QNtxUfZHapDGJcw=;
        b=oOA7X+PKNVHOyBvP884+bsq0yw65wVAJppmxFBaTFce4Hya0HbkDZ86H9UHNC7tjNQ
         4I4p2AN+AebKeLaVkSF8TThJO0V0i96fKy128irqMfPZtW69qB1HJZoorS4Y1VUOezkC
         GrV5b9iUp0KPkyZ3lz/fhHEGUEnbQfrjq9P2/NbW6T9/tLg3FqX3Db067lO/MR41Jl2e
         yh0QFdMPUw7OP2IVTn/5cscn4rYBD6Kt8C1+vLSAEbeI8YCstd5+LeGjB8KuUhVAKkJ9
         jkO7AQjl88CwNGuMqgWlI7MAKZ12NZx/rcb3f11S4QVggC4HMctv3jY0lIVOuuWcEs6s
         2jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334410; x=1788939210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlegJqwkFPej4fFKCV2MAr7wlJV+QNtxUfZHapDGJcw=;
        b=Cw+tqski+j1nCp9mAoXPJT/2UsAH8sx7BKROsRZ+bmoc8HkAxDhHLNUNyTWS2QcBTY
         L6+qI+Lst9VmfPkdQyFUrGrMs5a2odRa9cov39USNR6DOdovnE6LYtGiU5hIe+ZXIziM
         KvLy8O9aXRqanSrWFBovXxUE3wXfiZuk5mvtbC6yShxkf+IjnzxFTaSWBX3Y1dYPhd5N
         +JkJtVr23bNcymvAjwPsVWzLPMOjkOsgZF+uxeWE/jJVVjiVgLuyz1OGsBQ/ph5myBAR
         zXJzL9jtCIzN+QuWW4kjfOl+ge0g2XyqV53r4yrNAgAitcVJLCQBmzoz+8lzj4q1iP32
         cumg==
X-Forwarded-Encrypted: i=1; AKwUvBz2dUv/c94sudiU+CCJhKlMELISLq3k7tQggovmmFJ9nfAXQ4vhIRU+hTQoZ5AyvcmPXUwEiACPsPc=@lists.linux.dev
X-Gm-Message-State: AFuF++mJ963MGKgl1cysZi8jTkNN9kKh0p9FoB3IkMFbq7qCCxd23l9x
	PXbzNmd+3oFs/RKa6WFDFooWq4A/ivugmKT9Mru2uw4VFn/FaQNUvibo
X-Gm-Gg: AYBFou0Jg6RkjCRG16pyBG2vC477Sv5i9n3uFiytl1vx+9uTGvxykMb0VrSbx2I6lnW
	sbt14IXsqhw4WfyjXmA6luB10AJvgAHZRysafS4kdjjUHsIIsF/rERAsKmabjMOyPEzWWGR6E2B
	AHjsRo2kghKBHJxfLCPK5ucgNwcUW/lFFb1hbJQWSc/tEnP4lyn68UnxaIBCRVdkLFx+A6DBAbQ
	PFZi+ajM35cox5N8wiPRxFR54IRQgbXwYCAEDJiLEkTSfLbNLklvWypZHAQBOvPUkf7NE48VVPX
	FryH1OBcCmpzbIGUzQaFat5mUxK8U7HYPkcTyO5MTrdbSnUi2tRjbfKdoq7cmb7RfPdB5Qc+Mx9
	J3lzmg9ttLiudSH51yxO3oyljUJR4vsMr7x7olepj6LpQLW5UlrHNTFIXb57VSJLQINcUE7sx9i
	obQ7XAB+fSWBUFFer7t45Imgb/l4u/ns8fcNi2zwK7q23WUGiFFAAaxIEqrfhzJfB5Mzz6EKJ8
X-Received: by 2002:a05:6a00:4408:b0:857:4dea:e2fe with SMTP id d2e1a72fcca58-85ed8ed8414mr5132871b3a.13.1788334410213;
        Wed, 02 Sep 2026 00:33:30 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:33:28 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
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
Subject: [PATCH v6 09/10] of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
Date: Wed,  2 Sep 2026 15:31:15 +0800
Message-ID: <20260902073116.802752-10-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
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
 drivers/of/fdt.c             |  1 +
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 286fd4db6312..9a727941b5af 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1286,6 +1286,7 @@ void __init unflatten_device_tree(void)
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
 	fdt_mark_reserve_mem_nodump();
+	fdt_mark_memreserve_nodump();
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 505735732c13..6497404ec751 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -188,6 +188,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
 void __init fdt_mark_reserve_mem_nodump(void);
+void __init fdt_mark_memreserve_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index f29a07e8fb23..a42cf6eac55b 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -251,6 +251,39 @@ static void __init __rmem_check_for_overlap(void)
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
+			if (rmem->dumpable &&
+			    base < (u64)rmem->base + (u64)rmem->size &&
+			    (u64)rmem->base < base + size)
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

