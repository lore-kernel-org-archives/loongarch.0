Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825AD2045AD
	for <loongarch@lists.linux.dev>; Mon,  1 Jun 2026 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303762; cv=none; b=ENnN+qY4JaVoexEUrmyiblrqVfaWE5QP0VaEvw+ckbxS0NaGdXU99Vla6SIz4jdzVqnir9xx+dnAgzRLvenobeeKkXm9hC6wS3BvPOmUZE1k4Kf6acEYwZcxOyr3DubAcin5zRuwqclxiBHH4kq2ga0EYDI/1uIEmcn92B6nANQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303762; c=relaxed/simple;
	bh=hVBoWuTqxj4bitzB4Qyn9047IWyGEV2cC0xTiRzqADs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=taXIg5PfsXJtPnpIHpp0Xa5p48Hqei2LgMAIk7qFn9RGytihDjOzrJasB4kMU9PCLu0aeag135IJWcr2wRLmqQBmUvNJVZmfAaHn3v9WFdLqmnW8/VR/NY/g/UFTErdZbttyGLYU59c55siOmJ/IlWXj3TFjCN9jeIuWzUIE4NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Zx+3ZvI2; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Zx+3ZvI2"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8423f236418so351163b3a.1
        for <loongarch@lists.linux.dev>; Mon, 01 Jun 2026 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780303761; x=1780908561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=myBbZVt9pZizoKTbw79TdKlIez+dzWm6VMZTcEDpjws=;
        b=Zx+3ZvI2Fn+0OYUm8Z0EeAh7Gp95cva5C+1nglgmA0lObav+2MjqsY6v+1T0slBcS0
         5zHbVvXEIDojEziehOmchIvWtii48G0T0lQXHAMth+c+64lGr5EYG2jtG+woZOxPsKrt
         /8wyVmfh55dXJjKXlc/cK8ybAg3jJeJiE0sM7/TjPvShbBg+AzFicjbxqcneV3xsfYSt
         BHa5nbhjiIgF6hJO3EhHnBBAmJvAm7lhM78H1xezC8uGDZGN0wmLI14YIG4222LmdtIP
         4hovXOvUjLlJHgHBZc9+wBV4mf2TK6rWqbMygkQX/17miXS8Y5vGxcIAbwRsWyEUuml0
         aD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303761; x=1780908561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=myBbZVt9pZizoKTbw79TdKlIez+dzWm6VMZTcEDpjws=;
        b=RdogUdCDqUon14Wvzd5aZivD3yqxMHnQIwjZNYP+mfk+7s9ljSawzM0FRdKwskKhaV
         TIwx1zbc5dv9234HLIfhVZEk4cA0GjJEnjWhOtYNe7VyGvT+6YOOMrrFU5zui9Zmcc4o
         I9rpCJGy36jwyHqCiKhc20A/Rz7GMM4PdEV3DdsL1wbwKgPu49CbOTXCsvEe2nJAxky1
         NteY4nmGqrEuIczZdljSqX52AQSO+2WxSsD+aiPVAWJNW8zhRWyBGPP4EU0lS2KvAJRY
         9FIY25L8ANiIy5dS8MWT3DJ/vtwwi1i2a1b1eSptEuqvTYNQ7zRZ7lYyb10PbZiIeUFC
         3Czw==
X-Forwarded-Encrypted: i=1; AFNElJ+A7e8rvd3JTJhT4HA96UT+EZucjSfxUEG08VyKZDXcB2jQh10JIE/VJti47eG+rv9uACUaEbvTvIs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi5UyOzv/Ke4m9saXdX3uazD7VsgPKD7/y76lwnSxLLSzDTOFt
	6vKSv121Pe3dN7UDkSNQUNmB73F4xw3LTJ4R4zIp58tlICNqpuUO0kLd8PNEkvAPGLI=
X-Gm-Gg: Acq92OFn3NPjSXSrQkC6sNl9+E6S9EsIID34CyuOrd8K+NT38AssTODh23gHrsmSeGW
	M2XUy4NF4WlG7kjasjZOyLLevo6SqUBW1W+rDYtzxX3Pq4e39JbHgUkSuKq8KNFuoSIkkWcbPGU
	cIR88l994g2g/qdJozhgE8xC0sVykzMCc0XaA+OROrkE1v7t2eDCqbk09fMEWkCHQcMCh44sA7E
	iEB7hUSQ4U0Jy+DeTAt42OwN1MRV1PS9qGWJ3Dj9uozkxDYSWfI8Bwj96klWtO9IfmsjYiR1+Kd
	n0xpOxVYik7ip86qhcws6t741sPDEcmfF9oWWAWcsiRqQzJz+L8tH646303dUmQW7olEy7UKKbH
	Yo84CMmp4xiLuJee6+b9cW4lb4vxkkIjGeiaUvh3sCHefT0e1Y4BbjukKhOgl6rJCXJVMCzmM08
	viYwewjmjWu+ze562mNRksfcfQ2KYV3qNFQPi2DY8WZCtLTuSF4qtVOA==
X-Received: by 2002:a05:6a00:3a0e:b0:838:29b3:9ed1 with SMTP id d2e1a72fcca58-842255c8233mr8977076b3a.41.1780303760714;
        Mon, 01 Jun 2026 01:49:20 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6316230b3a.12.2026.06.01.01.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:49:20 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	WANG Xuerui <kernel@xen0n.name>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v3 4/5] loongarch/mm: drop vmemmap_check_pmd helper and use generic code
Date: Mon,  1 Jun 2026 16:48:43 +0800
Message-ID: <20260601084845.3792171-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084845.3792171-1-songmuchun@bytedance.com>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic implementations now suffice; remove the loongarch copies.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/loongarch/mm/init.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index 687980b6e91f..3407030f3e7a 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -140,17 +140,6 @@ void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 	set_pmd_at(&init_mm, addr, pmd, entry);
 }
 
-int __meminit vmemmap_check_pmd(pmd_t *pmd, int node,
-				unsigned long addr, unsigned long next)
-{
-	int huge = pmd_val(pmdp_get(pmd)) & _PAGE_HUGE;
-
-	if (huge)
-		vmemmap_verify((pte_t *)pmd, node, addr, next);
-
-	return huge;
-}
-
 int __meminit vmemmap_populate(unsigned long start, unsigned long end,
 			       int node, struct vmem_altmap *altmap)
 {
-- 
2.54.0

