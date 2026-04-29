Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C431539DBD7
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 06:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445946; cv=none; b=b6MONiD66yPeH2EJiuXH/y6Cpanl8jwWKG67t4PDB+zmh7QCNJqRpZNMAbv0aUvIxC2P3nsVSRBZLKQMjrjsmUkLGjDTq03fbms6SORGY8bxPkOBDkMs8R63kO2jcrW8nyT4msY9w8C+XLeRBw437qmlm8JxdYmAMiuABQv0PZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445946; c=relaxed/simple;
	bh=4vP7N1zetgFgj1WqIi/8IydbnE6WqBVEmWVx1kRBdBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fh/OcSEOAlakr3aTHY4vjRv5aoMiy28C+1/7nw0uRWB8ax3CuNVhuhI58/6kd5tPO6IFR1uJaZMjxQgUgmXOZhkTl3VJTaD5URXGPEX1za3YaHG1U7HrBHvFSsrSNyeSXbrOGfCZcS6DnXN4NL+ShAP2D+5crfNzhZGnRA88fM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYMYef0K; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYMYef0K"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-82fbdd60b64so6908074b3a.3
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 23:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445944; x=1778050744; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X32YgoESRg0ywcKfjv7wOK1DWSx0V8m7oh8gezp47dw=;
        b=nYMYef0K+/0zxSKtDdjAWaqC+fPXJLqenLjZzHQ0dNTnqN2p3oV4o90XSO87epdcif
         SSSRAJO32LoX54L2cUA3Srk1l4a/dlg49udxUKNOuOKXxt/MRtqHkmKMeDY3L8Hyhs0/
         Dv99CDnvAGOL6enPZTmn+iiAdc3o0kYRo5ZJSmEbhBm9KOn9wQxtPhGqSaAVkNUbQQW+
         yuUnxT7pBF/7fUATHeypZ0KSF4XoxSr6Cso2rNvQh4r+vhn61bpM6qcdW8/AN8wwB5qG
         Q6F4Vl68OIVOqCAlDh7bF/1H2wSiDK3Od+eq6EUpxpwUiyduQ4JHFptQjJFNJApuVX3c
         bLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445944; x=1778050744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X32YgoESRg0ywcKfjv7wOK1DWSx0V8m7oh8gezp47dw=;
        b=XukYW227z781e26OkQZeg65p/3ShaEQnf9LCsNBbK/IEbfNnAqqHX8/99oB8xr9GbJ
         dQDd/AKEXuo1ahMFUrwNL/IVsopdWeT0UQRNSwkL+UGNj2LUFWJQDo6XTXqqZjg2vy9A
         LbX+3J1u16x+XbgtxFpGY9dOBNig1i+9+WpCjAiR1r+R0o0zXTa30n/ro55DgI5nllEd
         x84mjlXWpIqFIl//nFPXC0DFVbVjYd5CN3n1DIAXy9xhFyE4+88dWiyKMcU1sTaQopFb
         SdgbakAG9wkV9XW6cg8TclAfr0p/CSEP+3/2OFZaBPJsxC00XDNSQ1p62GqMx6GOJthY
         eApg==
X-Forwarded-Encrypted: i=1; AFNElJ+8yKa8ftVrjz0hLz6DFwBMUVRqse8hLzQeBJeHB0U+CUm5S4i87sZiXu89/es+NIbVNfe1WTdnPzE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBRYntVwnfOkSpEZ3aETfEJZuRLvnG4M9GXqmPAaVSRTUtOQcL
	noqXttd7QbfvLbBZOBsWpqw5RgLGfGrK+I4qmN4lRdBTcIvi2FLn2e0v
X-Gm-Gg: AeBDies/hU81m4e7aRuWfjlwMButONjD3uguCL0H4FYeo4CtgSucE1bYfU3atzsm1Mk
	K6CiP9zb81vnef2YtqIOF5C7ulsHNlzeiXfwM6NuKX+jXgNWhnNOpbJ5xyfhumAPWljI6Dy4yNZ
	/JXX+XJ0wxvgh+TDdu5ZmUAgbjNWZMPHvJCfcBl8vC0ACH5TZuwBBny3YzzYclrmC01xB9UNobA
	iN13gYXFQtlEXoRyDlYLxFG87BlftRtBiDdFA6K4h8sxzq37HkLOIizi56u3LBJCN8KyNYgvllS
	+4CyVDutyTcqVtF4wT6Am+FE6FIIAxsVn3nbwFHrrTifSVPB/tauTotjIAOugfWe1cfiKdugRcQ
	5CmDhmhdtKR06oK31boo1PnTwpjSdGQZpDcjWMNb0aScNEPvAjMR7NY3gTfPL5oV6nFwH2DGRiK
	sZ4RVLjdBzmT9iyEc2KQFeCYhP8Xi736z7Xz3oV3+0kYoIg3D4r+YiTYIaSUE=
X-Received: by 2002:a05:6a00:17aa:b0:823:1c5f:1c43 with SMTP id d2e1a72fcca58-834ddc5725bmr6614944b3a.36.1777445944007;
        Tue, 28 Apr 2026 23:59:04 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:03 -0700 (PDT)
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
Subject: [PATCH 02/11] of: reserved_mem: reject reserved memory outside physical address range
Date: Wed, 29 Apr 2026 14:58:22 +0800
Message-ID: <20260429065831.1510858-3-chenwandun@lixiang.com>
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

early_init_dt_reserve_memory() does not validate whether the region
falls within physical memory. If a device tree incorrectly specifies a
reserved memory region outside the physical address range:

 - For the non-nomap path, memblock_reserve() blindly adds the region
   to memblock.reserved, creating a stale entry that refers to
   non-existent memory.

 - For the nomap path, memblock_mark_nomap() silently fails to match
   any region in memblock.memory, but still returns success.

Add a memblock_overlaps_region() check at the entry of
early_init_dt_reserve_memory() to reject such regions before any
memblock operation takes place. This also simplifies the existing nomap
guard: the original "overlaps && is_reserved" condition reduces to just
"is_reserved", since the overlap with physical memory is already
guaranteed by the new check.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 9d1b0193864c..03c676052dab 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -112,14 +112,21 @@ static int fdt_fixup_reserved_mem_node(unsigned long node,
 static int __init early_init_dt_reserve_memory(phys_addr_t base,
 					       phys_addr_t size, bool nomap)
 {
+	if (!memblock_overlaps_region(&memblock.memory, base, size)) {
+		phys_addr_t end = base + size - 1;
+
+		pr_warn("Reserved memory region %pa..%pa is outside of physical memory\n",
+			&base, &end);
+		return -EINVAL;
+	}
+
 	if (nomap) {
 		/*
 		 * If the memory is already reserved (by another region), we
-		 * should not allow it to be marked nomap, but don't worry
-		 * if the region isn't memory as it won't be mapped.
+		 * should not allow it to be marked nomap. The region being
+		 * physical memory is guaranteed by the overlap check above.
 		 */
-		if (memblock_overlaps_region(&memblock.memory, base, size) &&
-		    memblock_is_region_reserved(base, size))
+		if (memblock_is_region_reserved(base, size))
 			return -EBUSY;
 
 		return memblock_mark_nomap(base, size);
-- 
2.43.0

