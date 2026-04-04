Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029F02D4B68
	for <loongarch@lists.linux.dev>; Sat,  4 Apr 2026 07:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775287099; cv=none; b=fhpoyPyih72dwe27duMoSDND9Svf8wwKa7/ZBBd22aFyPtrwPXTwtf0gf1D78IXjSwfxcRJZIR6d5N7x6TqVuDpHU1LRABbHlgpV6cHe6YrK/oTFJlqvPaIDZ7AyvLMgIMxxp+AMi9akul0QNg4+0KuY4cb0x1NMR1toUuIU6Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775287099; c=relaxed/simple;
	bh=xZcCH0/3zgi/uN6QHzZXXAJ3GhTwW+RyqtUwgedxB88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZiZifVu4GzgnfpuosjaKY7JQJlxJ/6JMCWKz1luEhwYtZOYyYW8Zjm/Nfm896icn7cNWxGK5TVJstrpjHcf+HAm4x6kB2Pz94RfuXf8SqDZO8zYHimOvrtXdrP4DYrwTycNXzqnuqdZs47tOmkLPmA3KM+mi4tvoJfx4LSnx2ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RNsbnFBZ; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RNsbnFBZ"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c74f0c3fc16so835287a12.2
        for <loongarch@lists.linux.dev>; Sat, 04 Apr 2026 00:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1775287097; x=1775891897; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKWhZ8riqXkPi9FKF5J+KPNzIU+feG9TnbkhlqmMtCM=;
        b=RNsbnFBZUwWONPf2pdko4B1jinnJalss/uCxLtQAut5aSMBRO8FYAdEtTXxv9VugiB
         1eBsD3FSFHJfBsoF/sESFX4TfVw/kQDyNfnF8gGQ4hkrhBnjPEXmvCoOygQTBIrqQbjy
         eFoC1jlx4tUTvL4Vo1QjFbAnCTKxYd2hWJJs2dOnlFPt1SSomtEKt7wYtRxk3pT0qV14
         HvR6dMzLDUqyALQ7xgXP730RbvyPo6gC3JlKKd9jxN5fenrm5PY6LKzJqy2BMOormH9o
         gRSXV6cOz7/1JrsMvFdvUN0RGldc0e+fBqfICxPOQqGCAOH2dkLjBr5jC0WEwvV1fAyP
         p3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775287097; x=1775891897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKWhZ8riqXkPi9FKF5J+KPNzIU+feG9TnbkhlqmMtCM=;
        b=blkaMRFawGbTxt3nGXA9SeKmTqOzKGR3KTOHOhkiA82fWT0MMZi+Qb2DL7i/cyYkop
         7VTiANnIDf4hPhzvHGyez5BQXO5AJs6eyVFqomeYnJgUxtyAnoE5tOK3+5//98g6e3k4
         jTY73etcGszmzix41yHKkGeaqyHJQKXrqGBJHwRBc8CJZurpIyIDSDUsY9dsnVvijOaE
         KVe1h2cYmSt8xpmPrIXk1/qeis+D6ZXNPGhDL+K9rJLo0qg3sKpWug6wnkPWbHNv3oiO
         fSzWISrwSKsgqQpFAwpfxQQsISDOsKHDtm3d8Om+mwgEXQo5Y9PzBvzbgOhVAAR9EiZH
         tWbg==
X-Forwarded-Encrypted: i=1; AJvYcCWTi4MMR+yuYjocuOq+MJAgBNlvW0YcaedKEdLfkcCAPzGYmHE3289PxCJWbGbkamNwtfJZemxnHIY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm4n5f1inXSNgi/V3nY2ct98/VqX5eXDZVv/wsU9dCmRgJgeZs
	dbehzpRrXiw6oz4CTrZMPbw67tFlOfnFoXwSLs95q1KQ4OI82QjDHMlKcAEziPLZLIw=
X-Gm-Gg: AeBDies/kF1FF0MAwvyl8oDgIBqaP3XvUAn29atyrsnL55Kgri+YY6X2aZ6hBvl5t6o
	FFdWD+IRQlVfFuPwyFRq8PVaWCzwqHrkajTCwQSk0Pb1JEFdaL5tlVnxcKksu+BpqxkvuQIj1NF
	HOd7A8/jiNL1ebV/TrmMCcShNRyDvYUOpzayfk6O4ecD73kKP/GVJa3Nn5sgY8sMWmyla8lbfHU
	ojRmJgCjdV0QIfC/Hs/TfZ9Ph2SWHLVtackQxyz8rgbeNpsHeYMvd7cDFggapMXRnYxb+9eLrRs
	bVd0S4aoX+3C5r/d+tt4SAPy5tqGvXPZUw1nYgNUfFGVjTWGo2PyYZM8L9uWQbxItGMP4vyiKt4
	C0gKXv9s3KOxVVBfJ/c8zd/B1BunXVc2clsowYCxiuCjZgT/knzvEJiQxfUMUuEYP2hP8oXVYGl
	jFt9gnk1uFXApLcuVpHI6ohupy4GoMJh8ch/fub/YuYDY=
X-Received: by 2002:a17:903:22c7:b0:2b2:5203:acd3 with SMTP id d9443c01a7336-2b2818b3dfamr56282095ad.26.1775287097244;
        Sat, 04 Apr 2026 00:18:17 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274979525sm94675115ad.45.2026.04.04.00.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 00:18:16 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	WANG Xuerui <kernel@xen0n.name>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Helge Deller <deller@gmx.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Petr Tesarik <ptesarik@suse.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] loongarch/mm: drop vmemmap_check_pmd helper and use generic code
Date: Sat,  4 Apr 2026 15:17:11 +0800
Message-Id: <20260404071720.3577290-8-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260404071720.3577290-1-songmuchun@bytedance.com>
References: <20260404071720.3577290-1-songmuchun@bytedance.com>
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
index 00f3822b6e47..7356d4eea140 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -110,17 +110,6 @@ void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
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
2.20.1

