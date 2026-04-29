Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF9339DBE8
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 06:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445937; cv=none; b=i9wAg5sQbsyxaS4NxrYNaIpTd+mtZc1aRzg97/j92vp+smP0pe39qnuIV43dGCEpYhEVjEaISZsYpwWLrZ6ZJm3t2isAa8uMnoyoex+jhmYFQl/g5NXoqfiKASgWPDsWPl1ZadvCUTSbgx2HvKfifljmYPKfLoFNpYR/McpdHq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445937; c=relaxed/simple;
	bh=3p0YBHSpmNNuRtsQDEIxkQcORCtiS252q1murO0b87Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpamdFoQOriB9pJEIUxDrn47HIZ30h1uwt8oCvVKCoNDSs6vmI9yqcA99QqAty97vPADI5Rm9w1q5XvbzL6wnhdfpvTzh0mGRvWDqo83lCxhHusUn+MRJVJsaphb8RWkhmUuKtKGrtcgh0B3DY1rSjtWTRsK/LdAWAgQqYgkfQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScGJ5O3X; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScGJ5O3X"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-82f1f6103afso5714393b3a.1
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 23:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445934; x=1778050734; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y02uBvZORLsA6xImd4974JLfXXgs5mmuCn2J28MpgzI=;
        b=ScGJ5O3Xvu2B6hxhMK4c/Vol0fuyHtjJKp+sy5gPvsCQE5ku+dTGsMbp9dkHyfRi5P
         XhKpArYE1j+kgNZxRCwEgrsaNSr6tZr6ijg2zjYtpMfoVuI3bf7XcgLy9r+OmMhKIrYl
         vg0H13+VJRhr/6spywlUFO6MJHYWSAWxYEQ3UoKkwIihzGWg+p1QzmwtzJOWtJKTFzx0
         S4vC+79chk3N0/1j8tMdcnQW5bs3yOSIfODMtCYWKhEG4WjG0IX6oIYwvGBm0/a7motM
         BxAYdzfw1GnBX8ccnZP4Me4aKJzInspUa5sYkTJKbat2dpjrf3UIsN/2HJ/lxEXfxx2H
         Dqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445934; x=1778050734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y02uBvZORLsA6xImd4974JLfXXgs5mmuCn2J28MpgzI=;
        b=LWhvh8iHIjY1d2k+1oqol481e37y9S1URMfdZzqSj2rAl2HLgQlNeaOp3sNcei2vV0
         pgEG9MKuOeVr0CKp0MMARBMJzpHg+yBb2xz1LBEUJzH4DV5KtcJCvp9T0qFzJStXtvJK
         0c3WpVzPTghkG0+TOODYmgkYyGaBfGMgTEkwwf27FiJCD2yZKKcjckDFBA0fg2rKEgrd
         fB7DABWCGyjtm53loXZlYw7sUVb+8BMBj7hd7Tu1puPsgUmNxRLJhmiHQjE+s9ofEeNg
         xs0CgFPNk0WSFd+ss7MWtbr1ITB2o0OTtRo6bU39mmK/mplGfQ/jWWj3aLD8tCvihETs
         8wuw==
X-Forwarded-Encrypted: i=1; AFNElJ/N5Aolj81bpPOJ7Bx4Vs0lhgzXpQbwHE/L+nQ1SEi9FF9aK7JA7upgljSWEdyJIFjNDVGPR8FSPiQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMf+3JdIeSL6AbfLFqnUO8vloTC4qMQ6QNJyiZjnPUGIVDRFIo
	LIGIKX6gnoRwT13Z8Gpvqp6L87lvFNDbHoONwdPwJz0T1fz+DS+c0RXY
X-Gm-Gg: AeBDieu1imwEktRiNfIl37rjjzKwFL3ydevluqD7mzeQokFDkB2tPaIoLZVN+KkWnbH
	iuIQ8vYKSjb6HOPG9aoWrdokNqE2KqaCP16Zm1phTZt1PhGqHBe/nF5mm3dthA5eiPAGwF3Saau
	4b3aTyGWidFhTq4Srqe+CTi74E3bnjEXW1JlvfBjvyP6YXFs8A61GvkJkhIEa0w8mP1FQm9/58k
	YXTfSSWQye2sriXvCC/zfBUWaD4XOy7ng9+PLfXCHdUBKLq38qHwoeYDlyum7i5Pwlp3g/gs27B
	T3lEFGTfphiHoHXV5eM3Kk5rzpe/tgSYhwxRaGNsgYbmKsTl3zW1K54+eu7EqZ2c0V7eQvzMK6+
	q6wtjxsIOMN7wsvTMK+95b2nJHpQoEaSdPM2Yk/sFRN7iA4L6RboJt64mnt0BhRNZhcu/iJdcr6
	lbwB5CJohnyBYOywG8WFqZc/aoZchZdlMHAiTtM1GRqEN46bkg
X-Received: by 2002:a05:6a00:2d85:b0:82c:dd31:b83d with SMTP id d2e1a72fcca58-834ddc5879cmr6667128b3a.38.1777445934284;
        Tue, 28 Apr 2026 23:58:54 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:58:53 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 01/11] of: reserved_mem: fix region count for nodes with multiple reg entries
Date: Wed, 29 Apr 2026 14:58:21 +0800
Message-ID: <20260429065831.1510858-2-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a reserved-memory node contains multiple reg entries (e.g.,
reg = <base1 size1>, <base2 size2>), the count used for
total_reserved_mem_cnt is wrong in two places:

1) __reserved_mem_reserve_reg() returns 0 on success regardless of how
   many regions it reserved in memblock. The caller in
   fdt_scan_reserved_mem() then increments count by just 1.

2) fdt_scan_reserved_mem_late() uses of_flat_dt_get_addr_size() which
   only reads the first reg entry. Subsequent entries are never
   initialized via fdt_init_reserved_mem_node(), so their metadata is
   lost.

Fix both issues:
 - Make __reserved_mem_reserve_reg() return the actual number of
   regions successfully reserved. Update the caller to accumulate
   the returned count.
 - Rewrite fdt_scan_reserved_mem_late() to use
   of_flat_dt_get_addr_size_prop() and iterate all reg entries,
   initializing each one via fdt_init_reserved_mem_node().

Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 37 +++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8d5777cb5d1b..9d1b0193864c 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -129,6 +129,8 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
 
 /*
  * __reserved_mem_reserve_reg() - reserve all memory described in 'reg' property
+ *
+ * Returns: number of regions successfully reserved, or negative error code
  */
 static int __init __reserved_mem_reserve_reg(unsigned long node,
 					     const char *uname)
@@ -137,6 +139,7 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 	int i, len, err;
 	const __be32 *prop;
 	bool nomap;
+	int reserved_count = 0;
 
 	prop = of_flat_dt_get_addr_size_prop(node, "reg", &len);
 	if (!prop)
@@ -160,12 +163,13 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 			fdt_fixup_reserved_mem_node(node, base, size);
 			pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
 				uname, &base, (unsigned long)(size / SZ_1M));
+			reserved_count++;
 		} else {
 			pr_err("Reserved memory: failed to reserve memory for node '%s': base %pa, size %lu MiB\n",
 			       uname, &base, (unsigned long)(size / SZ_1M));
 		}
 	}
-	return 0;
+	return reserved_count;
 }
 
 /*
@@ -275,25 +279,32 @@ void __init fdt_scan_reserved_mem_late(void)
 
 	fdt_for_each_subnode(child, fdt, node) {
 		const char *uname;
-		u64 b, s;
+		int i, len;
+		const __be32 *prop;
 		int ret;
 
 		if (!of_fdt_device_is_available(fdt, child))
 			continue;
 
-		if (!of_flat_dt_get_addr_size(child, "reg", &b, &s))
+		prop = of_flat_dt_get_addr_size_prop(child, "reg", &len);
+		if (!prop)
 			continue;
 
 		ret = fdt_validate_reserved_mem_node(child, NULL);
 		if (ret && ret != -ENODEV)
 			continue;
 
-		base = b;
-		size = s;
+		uname = fdt_get_name(fdt, child, NULL);
+		for (i = 0; i < len; i++) {
+			u64 b, s;
 
-		if (size) {
-			uname = fdt_get_name(fdt, child, NULL);
-			fdt_init_reserved_mem_node(child, uname, base, size);
+			of_flat_dt_read_addr_size(prop, i, &b, &s);
+
+			base = b;
+			size = s;
+
+			if (size)
+				fdt_init_reserved_mem_node(child, uname, base, size);
 		}
 	}
 
@@ -331,16 +342,16 @@ int __init fdt_scan_reserved_mem(void)
 
 	fdt_for_each_subnode(child, fdt, node) {
 		const char *uname;
-		int err;
+		int ret;
 
 		if (!of_fdt_device_is_available(fdt, child))
 			continue;
 
 		uname = fdt_get_name(fdt, child, NULL);
 
-		err = __reserved_mem_reserve_reg(child, uname);
-		if (!err)
-			count++;
+		ret = __reserved_mem_reserve_reg(child, uname);
+		if (ret > 0)
+			count += ret;
 		/*
 		 * Save the nodes for the dynamically-placed regions
 		 * into an array which will be used for allocation right
@@ -348,7 +359,7 @@ int __init fdt_scan_reserved_mem(void)
 		 * or marked as no-map. This is done to avoid dynamically
 		 * allocating from one of the statically-placed regions.
 		 */
-		if (err == -ENOENT && of_get_flat_dt_prop(child, "size", NULL)) {
+		if (ret == -ENOENT && of_get_flat_dt_prop(child, "size", NULL)) {
 			dynamic_nodes[dynamic_nodes_cnt] = child;
 			dynamic_nodes_cnt++;
 		}
-- 
2.43.0

