Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B679383C86
	for <loongarch@lists.linux.dev>; Wed, 27 May 2026 03:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852640; cv=none; b=ltpXTHDJ/UTth+JFCZciJOcbG6nj99VrIyv0wH3cHwnqxvEfu7f5pS/c4pMIejF++6K7gBdV+lvMtaT6LLLWgQYuXIxCjhtXMHg5lZN9YmZf9i9BBJeGUw44sR44mzNdDc5J7j95q438vkJDjE+abIRITJWLtcjTaa8nFJ/9vJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852640; c=relaxed/simple;
	bh=Da0oBjp44x8BvyVj0AmgQWkstuuP08sX20VzouoaLK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bf6ju16xZZK60pB63G5I6PHZuRRX8HpQReC6TpbK6A1EScJZ2zsboYisUom7D1cgYO119Jw4aBBA/k9CzgepXb4nOmC60rsI5P9v3tQWPuMRsuleLqGfY6ZoNJQ+eLWcHWERyJNbgGd0XuFo2ebrwm7eXb2uPTAFqVFX/ij7+fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U187RRHV; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U187RRHV"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-c736261ee8dso5086511a12.1
        for <loongarch@lists.linux.dev>; Tue, 26 May 2026 20:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852638; x=1780457438; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKDMR5TAGwiz4Z0dhIjLc6hZgq3gL98geqqMieh10P4=;
        b=U187RRHVKoh7C7Hj0+8R8/dXK16iTNdZLFvc3U1eTYcmTwYVArMtoei9brIrKHNE98
         wzk7ppLy5W8RN17Jk/6nYdGDLHs6H8x4a7wENxhvrb8uNAePPfQBasnefwN+VWK8qtOw
         7lLQ/YH/gFSAA6B3obfpfKm8iylB/+cuygJWzJdXZdcX0GFY1s2F8PdFrz3murON8E+I
         GS0FsZx1jZ8zHB9GUkWcpKNsxu9m2Urohs4ltbhyxnmG09MCoTzo+GgZkzw8yGRTZWxt
         KB/ywGlnDBE64cueeWBLLfarleBsNP7nRi34ViyvppQPc01v9UEFIrV/8HBm/sO6ST9x
         0Kew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852638; x=1780457438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hKDMR5TAGwiz4Z0dhIjLc6hZgq3gL98geqqMieh10P4=;
        b=eQfc1egsKhI4kQMganlGcHn6ZgxU6Grbm+gHqPH8sOhFKqYVJjIjWjfXjJ8T+Wf/wX
         ZcrHL8qf1OFOHotkuR65RI58i+or25RS2QwkZyxBt5AnswE7IuqRBvA4b+1YQm9tFp/G
         gAa7ZuYYNgPpFpKB/ziariBRFMMh+rC/Cyc1F9+n9ChTDGyCjHHsEkOec3loX38HQmm5
         zZuMN7kndq2CuPGzdZWD3/45sAPdSOWi9OXmDePyaK3t3cDgL+9BMIhdFeYEH/dWA/oz
         7MSFIl1UN5mthUE7B+yXoDO2d5OE/XvWBxwlhlhlvQeRV9BlC2wVzb9c4kDnZQiK7pvT
         pQUA==
X-Forwarded-Encrypted: i=1; AFNElJ8mqyj8b1yA8MmJaxJOg/+C31ynZQgXBvRAFOVsWQj+6cqr8d9FKLVvSeIp+4bXT4RWmCnz2HiIWn0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzL++XQRZ89m8GBIOwLW/fsPtecnVZjqFEa4fiaNJQLRj4nQK/J
	D/sklNy5p9uwpmin710GGWwAa1f+wRgkd4ZIjGyTwajsadn76iNn0yhA
X-Gm-Gg: Acq92OE2ocuER4E/ZyGkbeE/feumeEpHgMhzTNDJRak1tlA1GDosTmYR2YYHg7Ljp4f
	7cBHzggLiPLfQgfPeHwYXbKFbhA4/i4RWnY53OANfR9fXOgK+N2XDtvsmgCRFBulO3/V4boZEL6
	drBSl7u6pKDKp5DC1UI+Xdnn9wtj02ApxXSNKM6SDrzPBSkS2YPLLQGx1QWgrTJZs65y4opQH4h
	gqRhCQZK/1MNwl7yhWHQRc5TRV9ppygMA6dGAFG+FAT6jajCLaIQxXJNezWbzmYOhjDq1hX8b4v
	YfUQ+4zfm3v9ekHJKjAN0RmOPvj57s1ZQ6vp2/aGDNPr8uAdgHQW1ijxo1gmHNnNF2WqmGCpAyT
	TWSw52QiHkgxplzlVWdFU0FAGvcjMbO3WQLqZs4YksHxRC3G9AudnzOjmel1D5O+jj2psMUE0Ki
	0FiQKsPJBk5m44LCZj/MMshESA33nL8Brc36h0
X-Received: by 2002:a05:6a00:1d9e:b0:835:38db:82f6 with SMTP id d2e1a72fcca58-8415f69ea9cmr20057592b3a.36.1779852638276;
        Tue, 26 May 2026 20:30:38 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:30:37 -0700 (PDT)
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
Subject: [PATCH v3 06/11] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Wed, 27 May 2026 11:29:12 +0800
Message-ID: <20260527032917.3385849-7-chenwandun1@gmail.com>
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

Add a 'dumpable' flag to struct reserved_mem so the kernel can decide
whether a reserved area should be included in the kdump vmcore. Most
reserved regions are owned by devices and do not contain data useful
for kernel crash analysis, so excluding them by default is the right
behaviour.

Reusable CMA regions are different: pages in a CMA region are handed
back to the buddy allocator and may contain key data for crash
analysis, so set dumpable to true in rmem_cma_setup().

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Link: https://lore.kernel.org/all/20260506144542.GA2072596-robh@kernel.org/
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e8b20b29fa68..55a67cee41ea 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				dumpable;
 };
 
 struct reserved_mem_ops {
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 03f52bd17120..eddec89eb414 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -579,6 +579,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0

