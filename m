Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF1B44781D
	for <loongarch@lists.linux.dev>; Thu,  6 Aug 2026 09:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009034; cv=none; b=rnFqJqi2QGF/ZQL2vUzCDXYeiZPMEL1ZqXucL61n8Sj3zzvspiSs+EztXOByyjwxqmCKFZATDhlsFgFjG9RcGG/GrGCV9TSv7vK2LQf7XmqPOYs1UYKr8CDTxzmNu6NESSdsgJVZex8w9youqDBhKbbrp9b2ffqzVSz1MFbJWZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009034; c=relaxed/simple;
	bh=reK7rFNBw0BdYQ91tXN/M3BLzkC5IvWkzOQ7lbAAVK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eAV/XjxxlY5N4oJWtr290Le3NugeOpHJRHHrA1PW9NkOnDqkfaWv3ZRW0jNdrdhVke6TDM0sVuzSJYejUZli5P0rfSLLOhRuevaic7RXb5B0iBkWi+bAdCDKfbDa9mM779IEXQp1be0HvimFB1IzmbcroKUVFX5fonVhqWm8my0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pHO79RRK; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pHO79RRK"
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2cc6bb7476dso2630895ad.0
        for <loongarch@lists.linux.dev>; Thu, 06 Aug 2026 02:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786009029; x=1786613829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uyTtFjVVo4Ow+xxdf9JzDuHeX18HS+OnizMa+EN8GU=;
        b=pHO79RRKlGxO4g4Dv15MYi/LWtk6Etf6adzk7FweZHA90VaMNkLb1+FvF9cbO/ZQro
         KTBOD9GtpxzdxQt57Yn6rirGvRRK//cjltB5F8YePtwTsG0vkmZ4RBCRMqBlwgOsmiWt
         RaxdVFaeaykuD1MPnyAwiTJ7fczJ2iTED0jtPI0lGftZRKMx2vltIFrHJxGQ5c0hYu7j
         GFFmBV/3oixZzbqzhyPTsthdMpUbd22ifmmhUR3VzHu9vcDlR7A6ujBZ/weJG/DvTMoE
         Bfqob23L5s3hIxdJcnHcn/UK1Tbs4P+bzPQfE9uxBCdpYxkmyaKuBmJa6gTGcaKK6RLo
         YoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009029; x=1786613829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6uyTtFjVVo4Ow+xxdf9JzDuHeX18HS+OnizMa+EN8GU=;
        b=TNKw5uOxw+VNdmaQSy0SjiW7SHRQEObQEElUmNjPSFTRbJiqPSamlhm2lRe5peFU0c
         COY1J1fbRBFdTc6kIrIPT3tIz1CyqORqhyADFahfkf3ky7h9AW1a8p5VSqstbLYoIoH5
         gtS8il5CyredKWFe9TPUB4j95FSI2FiOLwJvwfiMIW4em/o4PvIFSaK8sfv4VtOepd6A
         KKSnBki4+W6HZjZoay6ymU57rk/5Co43Nqhv4ZpWB3kQ1JTBbcUEOibwatz76WcgZzZG
         VX6g+oEiasG6ANG//PuaQ3ZdAMhwOEGDYGwW85EwFLZLu+2g+Hbrx6SsLvnN3+pxTupr
         Wz8A==
X-Forwarded-Encrypted: i=1; AHgh+RrKsnYncxzlpmK9sEm7iZx2OjotWLUv67o2hQ03so4/c+qETYF/0yRIzq6wYL8E9+nzx8slRf1FyGg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFYU6T9/QVWnUqVUj0FptP4sRsQSsPJ7gt3lADaPv8roF09io5
	U7EKooyrjPuP6I/hVgagmIbG7BJa2qdx1r75iydF2mccVjL2m52kFaKP
X-Gm-Gg: AR+sD11tqDTPrbfoVr//SirXpzXckQG/DAvjTdWIEioVAzWGBffTItGYSSpbNZzptpu
	vEPq9hj+DxQUljPZZO2c9gPjN+H2sbZmSF0gEr4ZOTBGvYytq5Eb9UTmfSw6VEpKYaGPJBxlzJi
	kSqy7+l38ugdt86oHi6yK3N4X7BgnuuFni23Q1r1mwtBt+UrtPKw7tHMh3NCnlSblnYcSeDo2pE
	ujXS+z8bYdHkxiEypoIOimcu1Q299urqvdKvUhdpeBk+DodG7i/HqBGie8aGvLA2bE6qfkCqW4S
	dm2wcvtpT/iAl9JZQWUQc30sgdOEJ0KqNhIhl7cGuHoiHKxSrVV29JtEEQYkHwbK8A76N1wFPQ7
	N/qC+E9QL35RjLyiqZn6jpeLqVZu3KXqnFV5p8yXleQ4IED/n4Z891TLVCaQABwA58f79UYw6TJ
	nSrBJTsHXsGxkExk8CJ6Cy1wrs9eKAgsNHXbVhYVVoCf9z8lxoNoUMo/tDSD6zivlRq/fdiWp1p
	A==
X-Received: by 2002:a05:6a00:464f:b0:846:5d1f:56d4 with SMTP id d2e1a72fcca58-84f47dd0b44mr3119262b3a.14.1786009028817;
        Thu, 06 Aug 2026 02:37:08 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:37:08 -0700 (PDT)
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
Subject: [PATCH v5 8/8] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Thu,  6 Aug 2026 17:35:19 +0800
Message-ID: <20260806093519.2907771-9-chenwandun1@gmail.com>
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

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index fb78b7814f18..8cc9d666bc54 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -269,10 +269,10 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 	return 0;
 }
 
-/* Exclude NOMAP regions from the vmcore. */
+/* Exclude NOMAP and NODUMP regions from the vmcore. */
 static bool crash_should_skip_region(struct memblock_region *reg)
 {
-	return memblock_is_nomap(reg);
+	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
 }
 
 static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
-- 
2.43.0

