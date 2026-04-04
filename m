Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B906E2877CF
	for <loongarch@lists.linux.dev>; Sat,  4 Apr 2026 07:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775287086; cv=none; b=S6WnOh+DOfHygQvNdtv0fuf0y8f4r2FP8xj3dt0B+To3bodUnfs23J7FZ+7NIbUto8YBL9L6VO05gmKXlUuR8EfwhbaMBoVAGqvWLXJtDeJUtYj3pkBAsuCOeSQzoHUeKKw3MULaQgNTKzS5vxMlMFERy+B3I06kUDXz7UllVYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775287086; c=relaxed/simple;
	bh=xZcCH0/3zgi/uN6QHzZXXAJ3GhTwW+RyqtUwgedxB88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tfHn1g3GKT0kiAvG0sNMbwGfQT0f8TkRBD382VVeDnfSoswLNg/oF+gHkcMYULE0dcJaUuOnaNjhY7AUwtpCDYYN8IQvMbwB74ygxZESXi6mmQlc+qXwr208mhsjj+0Ed6uUrNHTGgUuu8Rr61yzV4HNkpE6Us9pcJ3rWwTt534=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=SFUNmWgk; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="SFUNmWgk"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b24fcc2b5dso16371985ad.1
        for <loongarch@lists.linux.dev>; Sat, 04 Apr 2026 00:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1775287085; x=1775891885; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKWhZ8riqXkPi9FKF5J+KPNzIU+feG9TnbkhlqmMtCM=;
        b=SFUNmWgkcW9kLwXZNMsB0umbBjQkmPqZZnbKZaGBhHIT7ThwYkqizEgcbS7t8fKjWT
         ceWOBm+KxCIEu5YEET0SPkBW1xZ4C1cCgbImnN5EY5qPOOykMhfnfBdyd/1JynDxDje5
         he32IqTiNmGSQz8GLv3JKtlyx4mOxN6dU+6XHukRm5mfskle2MH+rVzB5Rm9M6zALCF5
         ebA8lnztV+1y1JLiLx3Sld/srD21jA2pOmKtYRXQgPNdkyKG7fj63Z13+D2fCSrchRng
         ptO0quqlEN6ogOHmWqlSeTnh922KRF/l+3sG1WYfnIj8JE0K4a/gEVF8Q/97b1xeH77z
         EvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775287085; x=1775891885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKWhZ8riqXkPi9FKF5J+KPNzIU+feG9TnbkhlqmMtCM=;
        b=H2ECUJePtCouDwdXJ6Q70S/U1XZiCfIeCuoRRTHyxTppARkEs+j/P9PejfLjiVQssf
         c2A9KU82IlU02PL1Aa+FCjJtmdLpGjdyRHLOeUCgcbzkBbyGa0Zh61D+pXAXJA1hQ7bt
         R7c7rOT9LByixkBiaoR9tk047J6bXy/VEQw+k4pdiIfoAwfpMUcvUqsqPIeaCMS/xJT5
         oRiD6GrGXRmhudb2T96fKZCeo3CtA0Pxokij5quw9EqgYgSa8kaj/foIZeMYCvnM9Jp7
         7TnDVuR7YWUqkoX4QdEr/5olE9BhzpnmX8iO3jjDE+UMzc0zwlCuZY+XdLl+81z3ejGy
         P+xA==
X-Forwarded-Encrypted: i=1; AJvYcCUyKL1zZN8YmtHHKxPKFqVwkh/WTOVB7YaSTIJ20pou1jJqsT2aGvv+tqxGW1oKS4/5DWk85O2A7rY=@lists.linux.dev
X-Gm-Message-State: AOJu0YynCCQAH6aBEHcyLjPlZ7aNbuOvI2Mxc7Iq6spsKJykW1yc+fh2
	Oz5FcnL4fjL+FiWV30mvUZFKYH+OI6t1SdCI+QhTMdSh8jh0BiGbHrGAEajTLB9uajg=
X-Gm-Gg: AeBDiet8qPRz4QTc+gWsEWV58FvxryGJ+o89u8IY4SQ7mZBq+OdSExZ+ngAwGSsy82V
	dI96Se7maPI1BPDzv1Z88cyfM5gdR9XGpVB9xUsOEVfq9+2+5kelbme1nrLuEkQM0zXdvvRyFUn
	Jocx19CGM3UdzQqnSkdQ45oG1ieDB1H0bsvqNPDVthrutJ62s3JDf1PwWZC7R/FJq7KGQvYqRG+
	gMnphz4RCNmIM2pILhk/jLE6kmgYXx3GdBni5Tyo8xUpwrRk300cS6/+ICmy3bAL7LKw7fxJty9
	CYqg6BukoCS8GQMWp6h0Hbg8lfwN5xMCJpwquJLOCzK0jeQGNgQoRcC4OUpzFwfM/rwjOmI2bwQ
	3tuqMOsd5yQVbufIUW9hGRk9J1j0fSxp+zCc7K2H9P775yjM2gL1Kt8z3NfgorF7aU9I0h+Htth
	F5+a2vM92CHv2TiquvGQWaKCPCUvY2H+h5rNWK5lTIYSY=
X-Received: by 2002:a17:902:ccc9:b0:2b0:7e4d:f43f with SMTP id d9443c01a7336-2b281889829mr53447025ad.41.1775287085093;
        Sat, 04 Apr 2026 00:18:05 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274979525sm94675115ad.45.2026.04.04.00.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 00:18:04 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	WANG Xuerui <kernel@xen0n.name>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Petr Tesarik <ptesarik@suse.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] loongarch/mm: drop vmemmap_check_pmd helper and use generic code
Date: Sat,  4 Apr 2026 15:17:09 +0800
Message-Id: <20260404071720.3577290-6-songmuchun@bytedance.com>
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

