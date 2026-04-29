Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D8839DBE7
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 06:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445956; cv=none; b=W9F4cwHstVRaBpoXdT7SwxxDq8uqlnIfgnpGOy15Kxtmw6ZS0LiSaw9/OWaZeAake4UK/RTC6+gLId/ztshZ1FzA87XnsughLOJdsRKApOJOwzsCt6qGreWCO5JmfVeZhKH0fw2aUb5s+mtDtAxrl4rdA2b8teVGMNQAld/qzUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445956; c=relaxed/simple;
	bh=cIkj0kxww8gxsjUOlEDL+11Vay4FMTzDgmzX/FxgbuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9+Adt+HP/M1bAsVq+wCmm1IE3XEauNcve/WQ5BOzcQC1NVZoosX4PAy4eN5CjuPW+82EQwqfCGOXcLp7BA3+88F0OJGIvKmVHCMDCTIS3lo+IB265d7d/y59wFWWqR5Xb8vJnmg9EjKixcmngSpP1OK+3gkP+J5YOlxgfMkjUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O09QT1ms; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O09QT1ms"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-8318293f02bso296460b3a.0
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 23:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445954; x=1778050754; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p829QSKrb4/ZZPtJ47R2GmLE7Z7L3DGhl/Bc8vHjFYM=;
        b=O09QT1msmEvcdiQuWLY/OFO9OQ/bkrCQxkLYMKkrm9x5QPnAh/JsW7v2peBIWhJqfM
         1ojVK+VdmAy+8ox0ugyz/nj73dFG81d0VA/mvBMXUP8wXObXAWZRLkFKWhSua1nqFvE+
         NITtzORWzL7JXujcS/ZWAiEnO5+SvsfbQ5rr5I44QxNxlR4wmhGtylcGIjqtSzxYENGZ
         S4T90esg+xMBlQVDvLB4QzNAjEaxx2XIwKrcYmnjQJ9vVCIYlBRQZI/J0YGaXzFCSX/z
         v+jfRmB5slsalGUU7c2YkZxQPLWERcO26lxsdYNtkAE8bpQBPHFZEJ/cDMwKmFsh3wfc
         +t7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445954; x=1778050754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p829QSKrb4/ZZPtJ47R2GmLE7Z7L3DGhl/Bc8vHjFYM=;
        b=BjjFCpSaSlpb1EOmFvNTfUB+MIebHoalsIhAfXUk6wLt/9FpYL956o5o0oA1QU8IMw
         OmXK9tI2LY79l+xawnLsvHOSI/G1dO7iqqFB+NK84SRQBULzwl+8fnpS+dhRd3cwXk+H
         RjdPw877G0Yc/K2/NXnG5hFQxsy6Rw4TDPlpBkMd8azyBqK5zt1/Php3tfRqzukvG1QB
         0gUFLrY++5ysbtQsWnb3cIjAVOzgOnG5or6wVZlGsIrlpmxz2sfM/P/pD9ObiFXHH6g3
         p3cyly55CGq/PMJF4zYqfGhFxhdT3lwd04y/uyhslCDHtX7HidRoZeIEtsLVD0gNiSC8
         thSA==
X-Forwarded-Encrypted: i=1; AFNElJ9ly4QrMCfvpv294DCxaP/awjhrUyNyEsjqT6doqfR9N9pzv03lU944OQEv8ohL89Nb6pmiR/qce8M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1p0M0XoEUL0EDdBIs+YSqKNR5ubTdt0G9sm/p0Z1QbDBM5iKq
	k7ckn+uUSqKOb6PHYjxHF1IfNDkX4L08orAPUQ5VQCSsySxgwXOpO8lk
X-Gm-Gg: AeBDiesHpU+/TUYZeH/upzc+Ba6D1xDzX5bqfrHrUy6m/69Y1m7oJ6BovP9BKwMQEEI
	yiCzTEuCuEdaazoOburvmESJn/BJGqylvCQOrnpOzgN4Qko9Zc8l/VHVDXzebJWiRAwvxy/Ezzc
	xVvwVP4nhIlY9npC2pkoY3bGWeauDqAp9rD1pKnb6nbTPLyNNAaDObK/HLvj/Mm2/HsU7gvMZWV
	HRwK8KMQ4Jk9h1JLs4L1V1Qc4HVqBllhKc1uKAhGLmmPKI+UXmgbR6UGsZGbO0vfqnjiZZe9MCT
	JoBH8+PBE9SDePfek5luVyWd3WGFjjG3NHs8SL/M9luKyXxpTV2s2Qz3tK7pl5tLN8npRG66JEk
	IDNDwX0ZsOXsvoBp9HU6OcGFPFUfmwNUGSnSPVgH7KSnJmnKUFHoAwE1FzLKcstGNiAVQPh2ayM
	gdSysCvB+kGfCuoE9GDsbmH26YusR3a4ovOtNi5E3W2SPoiY72aKgp6aLqNCk=
X-Received: by 2002:a05:6a00:94e8:b0:82f:65d:33ad with SMTP id d2e1a72fcca58-834ebb751bdmr1807155b3a.15.1777445953880;
        Tue, 28 Apr 2026 23:59:13 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:13 -0700 (PDT)
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
Subject: [PATCH 03/11] of: reserved_mem: avoid unconditional save of reg entries in fdt_scan_reserved_mem_late()
Date: Wed, 29 Apr 2026 14:58:23 +0800
Message-ID: <20260429065831.1510858-4-chenwandun@lixiang.com>
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

fdt_scan_reserved_mem_late() iterates all reg entries of every
/reserved-memory child and unconditionally initialises each via
fdt_init_reserved_mem_node(), while fdt_scan_reserved_mem() in the
first pass may have rejected individual entries in
early_init_dt_reserve_memory() (e.g. outside physical memory or, on
the no-map path, overlapping an existing reservation).

When a single node mixes failing and succeeding reg entries, the
first-pass counter only accounts for the successful ones, and the
second-pass save then overflows into the wrong slots: the failing
entry may be written to reserved_mem[] while the succeeding one is
dropped by the "not enough space" guard in fdt_init_reserved_mem_node().
The stored entry does not correspond to any real memblock reservation
and misleads consumers such as of_reserved_mem_lookup().

Mirror early_init_dt_reserve_memory()'s preconditions in the
per-reg-entry save loop:

 - skip the entry if it does not overlap memblock.memory;
 - for nomap entries, skip if the region is already reserved.

This keeps reserved_mem[] strictly consistent with the regions that
were actually reserved.

Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 03c676052dab..807b222fce5f 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -288,6 +288,7 @@ void __init fdt_scan_reserved_mem_late(void)
 		const char *uname;
 		int i, len;
 		const __be32 *prop;
+		bool nomap;
 		int ret;
 
 		if (!of_fdt_device_is_available(fdt, child))
@@ -301,6 +302,7 @@ void __init fdt_scan_reserved_mem_late(void)
 		if (ret && ret != -ENODEV)
 			continue;
 
+		nomap = of_get_flat_dt_prop(child, "no-map", NULL) != NULL;
 		uname = fdt_get_name(fdt, child, NULL);
 		for (i = 0; i < len; i++) {
 			u64 b, s;
@@ -310,8 +312,23 @@ void __init fdt_scan_reserved_mem_late(void)
 			base = b;
 			size = s;
 
-			if (size)
-				fdt_init_reserved_mem_node(child, uname, base, size);
+			if (!size)
+				continue;
+
+			/*
+			 * Save only entries that were successfully reserved
+			 * in the first pass. Mirrors the preconditions in
+			 * early_init_dt_reserve_memory() so that a per-reg
+			 * entry failure (outside RAM, or nomap rejected due
+			 * to an existing reservation) does not leave a
+			 * ghost slot in reserved_mem[].
+			 */
+			if (!memblock_overlaps_region(&memblock.memory, base, size))
+				continue;
+			if (nomap && memblock_is_region_reserved(base, size))
+				continue;
+
+			fdt_init_reserved_mem_node(child, uname, base, size);
 		}
 	}
 
-- 
2.43.0

