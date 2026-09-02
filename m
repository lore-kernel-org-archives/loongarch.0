Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F20D3D9548
	for <loongarch@lists.linux.dev>; Wed,  2 Sep 2026 07:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334308; cv=none; b=KthmBaVsdV2QfPx+f/5zYg4u06BZxH2IRmFktott9Ma5YSLeqhAs+Trnal3u8ctsMh5iImu8A24wK+35xdbecElBla9x0ft0tl1kuxLuehNJvyR4GnxVtjdiQaES85FALZ537bCtcOe40XjW3YM8fCZ10qyDxuTPImoYtwqz4bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334308; c=relaxed/simple;
	bh=3r50C2QwHvq/Iqle8+nbAe80qqES6U9nJgMPBo2G00I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBDrFqboTpBlFxXL75jHwnKgT/FalrLoZ6F48SJoIIp4AEXE8Snkl9qk/LcXxYvjFU4H9nkt8nxmNxuHG0uiy7/66dv1c6eK2Acw6x0frzA1h7pVvRMgwzocR3kkgqZfKVhmXFPqdqj6qMVI1rD9td4gOcSFm9pLoe8N44rfQW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2QkZKm1; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2QkZKm1"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d6f9dddd99so3087805ad.0
        for <loongarch@lists.linux.dev>; Wed, 02 Sep 2026 00:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334306; x=1788939106; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uqv+RTAI4cJSSsg2qdg0AwAoAqWKAsIT2FLXo2GNbW8=;
        b=d2QkZKm17H2uWuTWUUs43txuHriWBN1LLpLH/opp6jlLLZOMZpv4wNCvDSIAdHWQrR
         cIAxEpi6s+P8PRV+si37q/qvaDg2zuxYMUbajzQwW7gTpZREs5InyaKGdHLlqNXdCL1X
         DQExE5Y4SsNpzMZqadeV6uOdTNkfqH+Xux4eixWLGiANDzBNb/0rnohfGV4cVOrhGMTj
         V/OFkpgprFbshquh4FHD6b3ffJMpelf4DCUm7fAa9+Cp2A9JDha9N/m1ZCjaUZGRsyWe
         jnryRddvbWQKoXJMk/I0ax/KLfSxmT1+q2Ho39V9/f842tBiugyW2tEVz0WlN6jG/NAm
         RGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334306; x=1788939106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uqv+RTAI4cJSSsg2qdg0AwAoAqWKAsIT2FLXo2GNbW8=;
        b=WvAIs4NkcXAWln3GEmGH5MBHVNyUtSxVGoQnDaq4OWS/Oa2oHvA62Ntdm+4/v1C2Hd
         cUqUHSsfWCstbnnYWVFdEqGNZRUQhYxycu94O3OOMnRBJEU+Jn/PdIAE2Yh0Z8WfQewP
         9Olg0z35xd8QfLDfpg/SbGrCDkXEZ/Bo4shXhsfCIe+12gtAPVaMt2FzmSphUncqpL78
         qmJYf+2SmU7Qyfd3+/N6/6Pz8cfJvPmZzakfvlEUZDTbqlJrw3fDGXsJ5aUx03yz5tLc
         7+yezzl6UjLPGraTPprqa1iMmbv0wyb3rQpFlQASjibVPSF5pNVKhUxqgYqvncBn5VA1
         NlhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZlBRRvJkZjKnVKKeCjc7jiVu1f/KKEYR45bh1E5YOe76owo85aVSqq9FB5eg0of415J1VP840mqY=@lists.linux.dev
X-Gm-Message-State: AFuF++mKRZNQx+GijpQD8L00Ln+27XUp7qHRRiu3HJBuRkhV5SZTLYtX
	1JHt6V9HmjbzRVKgsU+wJA3uxFtNjD4kND4MN7PF26WToGGDCGBX9fiQ
X-Gm-Gg: AR+sD12n4/fnHXvDx7mH8uhcOhoKHi9lq5KAYJbsvVdvLGGvmZ5y/329fFMJJDy/Fts
	Sm0lE/zfY4GXiDTazvuA/rnIVlzMIriiIXUj8YaHQSdB6csenM4lDEnjGVxZP8lt4+8NqPuJcZy
	yPO8eS7/UrFsdnF5CBw2gOGMHtmz0A290Svn42fx2sjcKzoLRHdgz8vU34dLl0yErI17xnODjNW
	uc4zJffhhjFMQG5bjjFbkZSRvmbajgeZ+54tDsoPjLHpdbiiWqc46JICapr0gM+MuY3IAi87IEH
	bi+cH7K2jQY2eOS7B7VF/eGj8cU05qbk6FNJSWEsD7wmR5X/OrDx9juQEGpteBkEmM9+zU8Cje/
	+IxHAjoiOAw2KU0n6/AcnY1Xu6lvAtlACN4LGKiYPSuNHAaymicKE82k85IVrbjVjVKoc41PrbA
	R7LLa7UWWA8c5EzZ8Zunk+eWVhEfh2LNFmiuFFJeaTuztjBscb/sEJqTcRw1/hj/ylueXTemlw
X-Received: by 2002:a05:6a20:258e:b0:3d1:39e9:b261 with SMTP id adf61e73a8af0-3d9aa4ca9c0mr4530228637.0.1788334305736;
        Wed, 02 Sep 2026 00:31:45 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:31:44 -0700 (PDT)
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
Subject: [PATCH v6 01/10] mm: memblock: add missing HugeTLB flag name
Date: Wed,  2 Sep 2026 15:31:07 +0800
Message-ID: <20260902073116.802752-2-chenwandun1@gmail.com>
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

From: Meijing Zhao <zhaomeijing@lixiang.com>

Commit 7d163a75f821 ("memblock: make HugeTLB bootmem allocation work
with KHO") added MEMBLOCK_RSRV_HUGETLB but did not add the corresponding
entry to flagname[]. As a result, memblock debugfs cannot report the
flag by name.

Add the missing RSV_HUGETLB entry.

Fixes: 7d163a75f821 ("memblock: make HugeTLB bootmem allocation work with KHO")
Signed-off-by: Meijing Zhao <zhaomeijing@lixiang.com>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://lore.kernel.org/lkml/20260821020910.3428585-2-zhaomeijing100@gmail.com/
---
 mm/memblock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/memblock.c b/mm/memblock.c
index 9ce86349a29f..f2952d725c10 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2886,6 +2886,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
+	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0

