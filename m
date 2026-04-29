Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23B139DBDD
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 06:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445985; cv=none; b=t0lRm1D1iWBPj2RpMoO6JobTVDF0jRNw/C6Hf8pU36t4DmfhkJtcMnSA5HsBHFtqmCch/i7NO1HCIOBJrwjIWWaOeHru/5GBE9BPFardrF42p2vSJF7OZ+JCM5SxtvkWZwrE5fyPZsowzM7booSTzsXGkH4nDbTSlvFXGM1ZB4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445985; c=relaxed/simple;
	bh=qpJTPexygSurz5Uyf2L27E21lAO5pvcSgLBshfv01g4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G/xD5LSgVP1+UiFKJqeiERKiWy146wHfHRTtuPmEMooJ/8o0BKQURlgeCcrU8DFk0Rj+XzzPDH02phMs+OOYRsgwRnJcV6OinPaFy/EmnLPx3CDxbdLkdC2OUNjRyWDIp8fZBZfACal1pHvk7B26s+q1Du4uyFXPjzg4f7a1K/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqDVNLQT; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqDVNLQT"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-82cf636dac8so5271765b3a.3
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 23:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445983; x=1778050783; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2q9dPj7TNisCrTMpZ3igJmznQK/scPvx1hraOs9ZEkA=;
        b=NqDVNLQTulUHSg2Vh+u5A09BrbIvHuyNGRzY+/Ou8swGzfo7I8P7+jaqXJa+2+YX3G
         +PPFWBXJDqHj5e9y5aCoBsQUtNaHIn8WIx8j5qvPq64jMqfW96ngEUTPPY9lqcjlBbGT
         iLlxLsLGQHIin5Au97o4ndflpxhKvwrD/jlhrCV+R4OiS02NskPe6N2k6guG3KwznW+A
         XOhwqn8HKaKO60kvklmhOIZdUQ7TesjtArXUoOJ5J+ZG15JE0GCPUfDXuuJPtbZ4zs9g
         DgkT5VQkCPVE/HFoy3wVfjKrXf5lcSsGHXel/nXuYpUz1/A2ZDhoTmxiTXHeZ+LBUqPF
         r10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445983; x=1778050783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2q9dPj7TNisCrTMpZ3igJmznQK/scPvx1hraOs9ZEkA=;
        b=mL0+0mpySEPeKWMgU9a7cE2AAjk4vmmd4pb+h4Z36GEmL2SaouvUJV5qkkPvJHZqaQ
         TCCRb/gYsBJ/M4vvxf9NIrMR9UNe/KcJlBMFNvrdDkyYMgqWwGQPQFTr+tn9ULwGNX2+
         JESLR2pcm3bbWiHUyu3vx4gnPZdn2/AwG8KLaseFTx6WUT1gEPEaVKi+yDMMorjtQBEH
         XFWRaV4LWfp1BsZoaPyu4dye0U7Wa1wGGfG7MxIksN8mSKG3nfZkhO44yfuUAaQVI+RG
         Vvy4xHr3aMAc3tEqfpc8uf5SttPQZw1N3WojcI+alx2VxC9LU827CnTWYD77zAyMCqKT
         wHdw==
X-Forwarded-Encrypted: i=1; AFNElJ82GVLXlEp0yNYpWs2DdNOgWB1G1jhIORwDQnyD/EG5ciN7DhUmxuCzUHy04TY4Dw00vz5GOelaxCQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGkJs4yOuM6x+o6b6lugFNqBpVzgTDW35NDnnJUkAv2vKa8cqg
	ZnA52JPDiUx8UzfnfeQwS8rlwUiRJ1Lqq5kl9WkhEhTesDk8i4xEHxvD
X-Gm-Gg: AeBDieu3qcw5wnz1YXqIe4ZhmhT6D3sIu8lYjPSzetr3Zicp+19/gwLliO8zymSPLTY
	ACl8pON5V28RTJS+qjfGJbKoi1gaUqNSHbmTdWpY2IoLpAfwnnyrjSXvaYJnCbAqskfM5Z8TBsK
	D204qwRtjqqrg3PydyR6WuMu7C1ytrpfx3EurYVdW83xNatuhodFdJ0Xqvq306h6GbY/Ld27FKv
	+34I1d27vciN+4gIaEomhDDYzm2mTk6jBUm10cehHok5xmkFZk0tXkskd5PPMa3S8yEC4v/7Tzj
	O6eI8ud8aDG+PYIUT/oYHf86vSxpkM+6CSH+qM49MMLqIrtseqfkP28Glkmvd+NH38g1fhl07K+
	aTrgo2N/Nx+FAv6+f9YpzzUApA1CjsqLxfqcD7VN8LPeL2PNuxpalwJRYjlW/R4ahaxMCkgqpGe
	EJaESWvYxzSsJCDVv3c6EgIQan2dvJjVoKkrXF9uYRsfsFSQUN
X-Received: by 2002:a05:6a00:1802:b0:82f:bd8:70eb with SMTP id d2e1a72fcca58-834ddb5b988mr6406851b3a.21.1777445983273;
        Tue, 28 Apr 2026 23:59:43 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:42 -0700 (PDT)
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
Subject: [PATCH 06/11] of: reserved_mem: save /memreserve/ entries into reserved_mem array
Date: Wed, 29 Apr 2026 14:58:26 +0800
Message-ID: <20260429065831.1510858-7-chenwandun@lixiang.com>
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

Save /memreserve/ entries from the FDT header into the reserved_mem
array so they can be consumed as vmcore filtering metadata by kdump.

/memreserve/ regions hold firmware or bootloader state that is not
useful for kernel crash analysis, so saved /memreserve/ entries
default to no_dump=true and are tagged with name="memreserve" so
consumers can distinguish them from /reserved-memory/ child nodes.

Some DTBs declare the same or overlapping range in both
/memreserve/ and a /reserved-memory/ child. Commit b41328187629
("of: fdt: Scan /memreserve/ last") describes one such case on
Khadas Vim3 where the range is in /memreserve/ and also in a
/reserved-memory/ child carrying no-map. The /reserved-memory/
node's attributes (no-map, reusable, linux,no-dump) are the
explicit declaration and must win over the firmware default,
fdt_reserved_mem_save_memreserve() therefore inherits no_dump from
the overlapping /reserved-memory/ entry rather than silently
applying no_dump=true.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 107 +++++++++++++++++++++++++++++------
 1 file changed, 91 insertions(+), 16 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index ac3d8b837d61..4b80420da2d2 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -252,6 +252,49 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
+/**
+ * fdt_reserved_mem_save_memreserve() - save a /memreserve/ entry
+ * @base: base address
+ * @size: size
+ *
+ * Save a /memreserve/ range into reserved_mem[] with no_dump=true
+ * as the firmware default. If the range overlaps a /reserved-memory/
+ * child already saved in this pass, inherit that entry's no_dump so
+ * node-level attributes (no-map, reusable, linux,no-dump) win over
+ * the firmware default.
+ */
+static void __init fdt_reserved_mem_save_memreserve(phys_addr_t base,
+						    phys_addr_t size)
+{
+	struct reserved_mem *rmem;
+	phys_addr_t end = base + size;
+	bool no_dump = true;
+	int i;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		phys_addr_t r_base = reserved_mem[i].base;
+		phys_addr_t r_end = r_base + reserved_mem[i].size;
+
+		if (base < r_end && end > r_base) {
+			no_dump = reserved_mem[i].no_dump;
+			break;
+		}
+	}
+
+	if (reserved_mem_count == total_reserved_mem_cnt) {
+		pr_err("not enough space for all defined regions.\n");
+		return;
+	}
+
+	rmem = &reserved_mem[reserved_mem_count];
+	rmem->name = "memreserve";
+	rmem->base = base;
+	rmem->size = size;
+	rmem->no_dump = no_dump;
+
+	reserved_mem_count++;
+}
+
 /**
  * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
  * memory regions.
@@ -260,6 +303,9 @@ static void __init __rmem_check_for_overlap(void)
  * "static" reserved memory regions, that are defined using the "reg"
  * property. Each such region is then initialized with its specific init
  * function and stored in the global reserved_mem array.
+ *
+ * In addition, /memreserve/ entries from the FDT header are saved into
+ * the reserved_mem array so they can be consumed as vmcore metadata.
  */
 void __init fdt_scan_reserved_mem_late(void)
 {
@@ -270,28 +316,32 @@ void __init fdt_scan_reserved_mem_late(void)
 	if (!fdt)
 		return;
 
+	/*
+	 * fdt_scan_reserved_mem() has set total_reserved_mem_cnt to the
+	 * total number of entries to be saved (reg-based + /memreserve/).
+	 * If it is zero there is nothing to allocate, save or check.
+	 */
+	if (!total_reserved_mem_cnt)
+		return;
+
+	/*
+	 * Allocate up front: /memreserve/ saves below may run on any
+	 * path and must write into a memblock-backed array, not the
+	 * __initdata reserved_mem_array which is freed at free_initmem().
+	 */
+	alloc_reserved_mem_array();
+
 	node = fdt_path_offset(fdt, "/reserved-memory");
 	if (node < 0) {
 		pr_info("Reserved memory: No reserved-memory node in the DT\n");
-		return;
+		goto memreserve;
 	}
 
 	if (__reserved_mem_check_root(node)) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
-		return;
+		goto memreserve;
 	}
 
-	/*
-	 * fdt_scan_reserved_mem() sets total_reserved_mem_cnt to the
-	 * number of entries that need a slot in reserved_mem[]. If it is
-	 * zero there is nothing to allocate or save.
-	 */
-	if (!total_reserved_mem_cnt)
-		return;
-
-	/* Attempt dynamic allocation of a new reserved_mem array */
-	alloc_reserved_mem_array();
-
 	fdt_for_each_subnode(child, fdt, node) {
 		const char *uname;
 		int i, len;
@@ -342,6 +392,18 @@ void __init fdt_scan_reserved_mem_late(void)
 
 	/* check for overlapping reserved regions */
 	__rmem_check_for_overlap();
+
+memreserve:
+	/* Save /memreserve/ entries (independent of /reserved-memory) */
+	for (int i = 0; ; i++) {
+		u64 mbase, msize;
+
+		if (fdt_get_mem_rsv(fdt, i, &mbase, &msize))
+			break;
+		if (!msize)
+			break;
+		fdt_reserved_mem_save_memreserve(mbase, msize);
+	}
 }
 
 static int __init __reserved_mem_alloc_size(unsigned long node, const char *uname);
@@ -365,11 +427,11 @@ int __init fdt_scan_reserved_mem(void)
 
 	node = fdt_path_offset(fdt, "/reserved-memory");
 	if (node < 0)
-		return -ENODEV;
+		goto memreserve;
 
 	if (__reserved_mem_check_root(node) != 0) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
-		return -EINVAL;
+		goto memreserve;
 	}
 
 	fdt_for_each_subnode(child, fdt, node) {
@@ -406,8 +468,21 @@ int __init fdt_scan_reserved_mem(void)
 		if (!err)
 			count++;
 	}
+
+memreserve:
+	/* Count /memreserve/ entries (independent of /reserved-memory) */
+	for (int i = 0; ; i++) {
+		u64 base, size;
+
+		if (fdt_get_mem_rsv(fdt, i, &base, &size))
+			break;
+		if (!size)
+			break;
+		count++;
+	}
+
 	total_reserved_mem_cnt = count;
-	return 0;
+	return count ? 0 : -ENODEV;
 }
 
 /*
-- 
2.43.0

