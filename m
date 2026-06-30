Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0CC3E3176
	for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 07:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805674; cv=none; b=m9HZy5105ZI2/ePmg8MxbgZQE/5/prq2w7IjwqIPJiD0O2FXiQZzEs2YBa1fpPYBFlCna8nA/Dv/+Y8txHffGwXSuaoQoqcmUT2ITJD4h0gIB8JPImK3sgrphc9mutqOEcMWArUlLfq1D1dv0R1MY419HEKKTk8D9tZTFjryJ3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805674; c=relaxed/simple;
	bh=8OujZebZaWz43d3tSXQeCWPkY+eLKrfLdaC8H8OV1pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fPKiU/SrrEXGCl1LgYTY1gxV4UUxys0THuQ++TkdrWnzjpHDPgyJ1fSCy9eFqjd7YZfCvpooVomgyrzZzXUiQok+ykLzCR6oBCUkCvmhR7+uaKo3C2HR3QfB1NXPZtldpQ5K/XAoLy/4opEKRCooNSsXAc0bcbMH5rITRm5zw9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIcwwV8o; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIcwwV8o"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2c9e8a1d256so19539195ad.1
        for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 00:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805670; x=1783410470; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoJbo79rUg5zjWEB3QBIDp68NPxVQaL4/r71+zofbTM=;
        b=AIcwwV8oIb59SY7BSvr0NR4LgllRE21RwB5ZkTOZ9G5ehXu+izHIKbMrH5qX8EDHA6
         2XYQivHkOM4Dr0XKOZJEsHmxCRtuNrDuJW0e2gc6enjNAITrbc2Yw2xFYdvzJluaIHnr
         XN1U4Ka0h4N60qUYw/wbXoVoChBr7LG80p25aLjtDNVdZH6iG9KQsLxPqO9XQdhGCpqM
         Nx1dvmlefSxkcyxRvOGBin9Q3HilGXYxZQtiXi7vENUH+GpMJrXBfn/AuroWdedr76G8
         nvk54vYWUeCJs9DM9J+FLkbO0ejRg1ZZFOJhngdcQ3lrgrfjEDJj3pIWe+Nq0i9paImz
         pMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805670; x=1783410470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VoJbo79rUg5zjWEB3QBIDp68NPxVQaL4/r71+zofbTM=;
        b=eD4GcvN6Eph99bAx15WTyAOvyS+XS0c7yohQ9jRwRO23nNMi7rL11V2xtLq47kE3E0
         Y7ut4V8PGiKi/EzHkgAhGFpjaoBkOnLYZRAQL05XH3zbtX08lvm7RC6H1QlGRw+aQGAI
         t2cLHDjObp51NIbza1sfajpi+9rAKJM4YMtWoGNrjj5pX53RYtf1+fWvEVp1azqbx08N
         pxWgsf7IzNB37dXqbORfJGJlpSvebPIN+vKhzLElkj0qpnv/FER4megIxTOxxsHA1nQ+
         ej7Ws8BWDUP5iMZh93/+5Ui7RcxOKjZxYeK71sGoqOswuljpRyWpf5DZVfEFYxSNEtSQ
         B6Tg==
X-Forwarded-Encrypted: i=1; AHgh+RqHkOu+XMXxweafg4IMMy5c9c0Vbq9n5BlX3sLInzoKqtMvodO244H8MrLvF/ii467Cfi1Qm+0IuqY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZdROVVXTk1EMf7ZEay/ofCDS+aMiezpQP1AOlVS66OlVsfwUV
	NCVf7JSSDt7TA31fSuml9TipnCXS5MhUJYQpLLJ7hce7DbVmU2/s2pbh
X-Gm-Gg: AfdE7cmHOiNZiNTQMUXTQn+jLDzij3dMwXMOMU0qw1++YyTYTEDK7HXeScUQTFpnK3n
	HY9gC9oHi2gQ9Lge3RNkeYZILk5H1L8BZ/GmZKdqyNGVccPjOHzrSdZKubnO88EXuPMfXx3wNfU
	uWJtMzFGw9ktLePVC6hgw9ScSUWWFV1FY8zXP8bU4qTLSogCRVsWXiE8RliBJbBRhZRqnI8Cvh7
	lVVFLYmRudkvguMsheDQnibQvtqA0nvdeHHiJc3p65VSWCMuG9qwN7L5p/hwznZIT1FmjzDWiWZ
	zn81vYRiqZdq/ZXyCkkNP+kB0pXQlSvWUlQsnXyLvD+4mAOZigHfUb5Gg9WpEv1kUWZUJWonugf
	7K4J8vjB3DR1z9r7V6+yhyhxcQFGESFxtQSz8FL+IV1dPEDEtKc37De4JTi1wQ2wuxnUZsO18zl
	FOPYRK0GLtRKF+G7+UAlbi6HroKw==
X-Received: by 2002:a17:903:41d1:b0:2c9:97a9:209b with SMTP id d9443c01a7336-2ca2ed32417mr20077795ad.47.1782805669781;
        Tue, 30 Jun 2026 00:47:49 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:47:49 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 02/10] of: reserved_mem: dedup and relocate reserved-memory messages
Date: Tue, 30 Jun 2026 15:47:06 +0800
Message-ID: <20260630074715.4126796-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

In both fdt_scan_reserved_mem and fdt_scan_reserved_mem_late, there
are identical check-related print messages. Consolidate these messages
by moving them all into the fdt_scan_reserved_mem function.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 82222bd45ac6..42649dc3613f 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -270,19 +270,15 @@ void __init fdt_scan_reserved_mem_late(void)
 		return;
 
 	node = fdt_path_offset(fdt, "/reserved-memory");
-	if (node < 0) {
-		pr_info("Reserved memory: No reserved-memory node in the DT\n");
+	if (node < 0)
 		return;
-	}
 
 	/* Attempt dynamic allocation of a new reserved_mem array */
 	if (alloc_reserved_mem_array())
 		return;
 
-	if (__reserved_mem_check_root(node)) {
-		pr_err("Reserved memory: unsupported node format, ignoring\n");
+	if (__reserved_mem_check_root(node))
 		return;
-	}
 
 	fdt_for_each_subnode(child, fdt, node) {
 		const __be32 *prop;
@@ -337,6 +333,7 @@ int __init fdt_scan_reserved_mem(void)
 
 	node = fdt_path_offset(fdt, "/reserved-memory");
 	if (node < 0) {
+		pr_info("Reserved memory: No reserved-memory node in the DT\n");
 		total_reserved_mem_cnt = 0;
 		return -ENODEV;
 	}
-- 
2.43.0

