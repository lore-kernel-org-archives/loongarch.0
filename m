Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9561C3BE62B
	for <loongarch@lists.linux.dev>; Wed, 20 May 2026 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268825; cv=none; b=V7bIZjrazG4cKPaGfG7KLaZIHOIU2PcvqqYkRCm7Vv5+VVM/lLFHpBafs6JwCWqyboOLCls2GGyUUpnaL2ATTO5IdHyeZXC7evFwkaluiGBku4enekm9IF7OUpKrkQQQp4BzPIUYmUkbVPpCU7/WHq7hpTBKOthqrCHlGKfJmn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268825; c=relaxed/simple;
	bh=vEY3z8jVj8nmsWJisxSq9AhqFt0JmI3xyGszSp/YCcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzYOGJTA1v1Jvrw/gz00OVfD00DeQR7o/FPL+IZJH3NkNPKCkb3SuQnIFxbE9yksHQ1ODOEUYb6s2qbmdbJuRXRVTqF978sSenUoo7lQU7Wz2SC6DOSoetWDXjpOtr67BRixVE/4HhQlOhrITe0lcpce/bHQLwu5fPvOrb25Lj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sdz7gXoa; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdz7gXoa"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-836ebdeb969so2117549b3a.3
        for <loongarch@lists.linux.dev>; Wed, 20 May 2026 02:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268823; x=1779873623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yF4iEePz0efKjWWczqPvkzIUeB6xqHtDsvairyfmeUg=;
        b=sdz7gXoar5r+7ki1Ezr1y2i7c4cjI/bmgFlQEnegSz54fcInIIFANHhlq56wZtsKiU
         +yvqNKiWsLqF9GrlOAIhOny1Q41I7XkJtdDCHPAqY+DmMGwGgL98Gqx5IizhY/qpcCFs
         JJL2P8U5gEz3qDPnwFjfL33e1FLas0oapaBTq1bCqjIOWhFTp8PB/34LC7LWBg9LPMc+
         E/5P2BfehZWeVQYmADyycActvYAz3JW2Js4KwwD8zTQ7GfPqvLUHpuPZ16iQ4tZATwAJ
         h1e/zE+5mTu4+ALkGv9No11TnDu8NjRHclC/CqL55x6q7clGT9ntkOqNuJYKXuDPQ7dR
         YrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268823; x=1779873623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yF4iEePz0efKjWWczqPvkzIUeB6xqHtDsvairyfmeUg=;
        b=lPOcYE7/VXaIPzunAs6l3qg5Z79pFsErJbwUxCRMVxrIZdvajA/hs6RnPMD3hzKFq5
         gTZWmT6P4aNv1NRnE/Qep+cY8Nmk9+OD/fMEpRF6ZV0CZpLcBVB4Ofq0JDbN/7v40oM7
         GTGl/bUw21z00wGkXEFp9P5qn+y20yZ/fLFWSEBh7uCv5mJkwyVEvg/yGVycKB9RFoPO
         uyOuFwANS63JmzEZbGIUXPukY6EJLVMrZwuOCtPjNPamrO3HJsNQdqvabSZ7tk0TRz1E
         tJZXJxK340GpUxxwYW4671m8B5j/bajg2x1WpMMDRUvwNCapumVWj+36b6uNo9iN/w4k
         Sx1g==
X-Forwarded-Encrypted: i=1; AFNElJ+l9oWFslJM1JajSWJ8aoBLZ5/RgVJTm0a22ScXOs9nJ/FRo4gTuwqMT6TSr7Sr+5SuaOt+MYps7Ik=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxbi176y7Lv2SprnTojVBlueXuR1Q9NF4m2aYucMHw2/SyeUXxU
	wT7JlrJ9UJWjQio+DPDDa4DqrknnG8+Nm/+ZPySqqpUOG5YIxVYaGC29
X-Gm-Gg: Acq92OFYzQ56M03m3dObpJqn6GWJP0LFblDlpnvWukoSZCyA/A7m47JJmE34/OFz3zJ
	4o18nR6TdluGjUWNK2BSvF0ZkG6zLZLgHrIoiirVtk7FjU5LKKDeuDaBXgiDUJ1iFJ8fUOST20a
	jRDPJz3DSbK6T3pjlAgxHdr8sVyEW7ga6fYk0UOHprDDxC2JBXTdpgZNlLYzi6RTdw+2Xobi1JR
	tPEQuaW9CKxBL+2/Mq3lY86O/t3MpDI3ihx8SJ/05FZrJ+/UMLgdliisLTTqDyzFesWxPHSfl7z
	Z0/rl52gQtcNZmzjJa0JAVuhJ4C76VtfI7qEKbrNWspZK/NNiriq5RV4WzA02mble1GD8ICHI3J
	pAcLKfpKahmDb5VKEz54goWUR8OklGZKgpusZ+VQnGtO7Bj1wU8rqMpi2ISrz15pvFZrNcfXZex
	Hbh1sEaB4iOFiqhG3gtox9ivXpNLc/e9BXjFYyxg==
X-Received: by 2002:a05:6a00:2e9f:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-83f33c391cfmr24600140b3a.21.1779268822961;
        Wed, 20 May 2026 02:20:22 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:20:22 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
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
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 8/8] loongarch: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Wed, 20 May 2026 17:18:44 +0800
Message-ID: <20260520091844.592753-9-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun1@gmail.com>

From: Wandun Chen <chenwandun@lixiang.com>

Apply the same non-dumpable reserved memory filtering to LoongArch
kdump as was done for arm64. Use of_reserved_mem_kdump_exclude() to
drop flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 arch/loongarch/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5584b798ba46..c5cead362d2d 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/memblock.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -67,6 +68,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -91,6 +93,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_kdump_exclude(cmem);
+	if (ret < 0)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0

