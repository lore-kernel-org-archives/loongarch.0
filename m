Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDC63612EE
	for <loongarch@lists.linux.dev>; Mon,  1 Jun 2026 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303749; cv=none; b=ujJWA4Z58ff0NYONwIWCEEE+8n+ElCKFT54WuMDNzDpbuNmdJGo81n75XPSDpTmklLtFLeWdF84iJ8oBal2BPXu49YqExuYPqze15RbolYBvEEPV4NEvJ9KPT27wXLQPEvK5KNDqSDUX+orTIIQmG3tii6UjlGVrho7gmsRsj8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303749; c=relaxed/simple;
	bh=wH70zWV2qRQtDszFuov+55ovrVEDAsgUnnbN6OqXmcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmrjHAAyDJNn+IDerws+TWkkcuddlQDvY5E14XVK8a6bk6gUIA1eLPlsuI0OerNoJcpZ9t372YbGCh9eX4wflWIyDmRhg4Difj5Oll8Z1HsChTLFujI6iPhfO5C+8u6CD95Bcu6NTGld6qcd7/G8hVP0hmwlhDyBVW451xztxYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=k0bdVo6o; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="k0bdVo6o"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8421f0e9c5bso779563b3a.3
        for <loongarch@lists.linux.dev>; Mon, 01 Jun 2026 01:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780303748; x=1780908548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ct8LTm9E0tar8OtNDyCoaad0P31p+YAvHyjb0MDrcWY=;
        b=k0bdVo6obADvAvHH9uhcFuA7H7gpVnT7B07w0VNCqr076PSoey2gsffRisuqVPitKv
         DKNT3wfsxJFOLpObeAExAeFIiICufIMxxp8molPFchpzd04UeMauhlEjMtFb0feKKN8K
         LX8//sIyYDZzFkZIVl6VHbq1sWkHx1w8zIc05mdukVIXPjuYNNHZgJpDkmLJDksNFKai
         IBnpZC0wRJg/WD2nwpnvX1vz8+tVfqxHBXPxj67utDtt3p6G4M51fg289U6KA0/hrT/U
         mnofU/sbY2b0FJ9c2n9G8bx9p6LOYZ07Cs7jlcTIROSX0rapUSRyzDlZY/vpomGaf4zM
         oRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303748; x=1780908548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ct8LTm9E0tar8OtNDyCoaad0P31p+YAvHyjb0MDrcWY=;
        b=CJgWRmvG969hxTtkGdG7k/o76adMpiSRSq+US+NtCP1y8579UxE6jAypD1lpFP3qKC
         KslkBPvmOgjDQKb/AVTUgKkKm/tCpDmwTgFouKZ3jzTZucITqAQCLX/KdpPDzHvqOPm+
         9Algt5M/4WGAXDzqzNKZzQUvOmgPr/hbLjgCI8rl+75/2iKfnFjBOjKVmyANGTkwc9+5
         tB/vDt6fxrMXkNUmhF0+pU3fcEm2j3H6KHqGZlhketTsBkDSshnC3e6DWHMSIqA7EZ9w
         EGGScqQtnYpZAg7wvXri1lRKYmxG6VgyTILRZcfG87DyMWkW2+zt4MsOx80sgQWcvtoe
         GJjw==
X-Forwarded-Encrypted: i=1; AFNElJ8EvFYEiKk74lh8tSC2xIhKAWGT7QRstaBjrmoEruiDvU4IYlE6TB2I/x6+4twZZIXJr87UnHqNyo4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZVvJG5Nx6e0uhvZcEHAFOPBhvnObnvEmIFYGBolhyHCG66Tac
	XHqUCInS0LowAAN9flHUELABeCzgFZYgvds7ShAWN6ypLKbwRVxpSWpQFxAtWgBWi5c=
X-Gm-Gg: Acq92OF33iXdesgRdUfZ2eJSqVzOLLtACEUxK+R2qvmApxTGFhyIV1LXQasgzpcIZj1
	7fz7LFPdBLklLr2d0DSxdYp4ImHGfEaikV00g4QtJRXxAkbY/+2ge8zUinMWJ28WPDETmQwDtD3
	lyAeZHr7RoNKqGpD1vFB7YawpxpbPeOuw6Srht48yKZrErXFGm0GpyceJAWUEL9livslGO2LAvr
	cf8I2HoYcO3ycz/5bH2r294vsiVPbA0esKw2sRwHdmQY/d+zqseFIQqUHI/bkBUyXAnhubzuWjW
	IsQTchXZbBwXA2Wcitu13y3OMxYUjAzof6BiNOveTKLjI2fRdtHfLSznou42UaAbo+gxmtknfzZ
	pG9Vjm6doiaSDnN2ec0VyhGKRLpZEinOw8VOQBjZNOuYeTYUeiFCYQ6ozyaJcrXCBoM+DXxqUP6
	pWv4v/RiTJaejyHX0RXJpbRmbrsNINiv1/aFf20dWDOn7ZPNlrmiVi1A==
X-Received: by 2002:a05:6a00:3903:b0:842:2382:a0ea with SMTP id d2e1a72fcca58-8422535fc9bmr8854602b3a.14.1780303747688;
        Mon, 01 Jun 2026 01:49:07 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6316230b3a.12.2026.06.01.01.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:49:07 -0700 (PDT)
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
Subject: [PATCH v3 2/5] arm64/mm: drop vmemmap_pmd helpers and use generic code
Date: Mon,  1 Jun 2026 16:48:41 +0800
Message-ID: <20260601084845.3792171-3-songmuchun@bytedance.com>
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

The generic implementations now suffice; remove the arm64 copies.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Will Deacon <will@kernel.org>
---
v2->v3:
- Collect Acked-by from Will Deacon
---
 arch/arm64/mm/mmu.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 24388e5c727d..ea10b0ebecd7 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1776,20 +1776,6 @@ static void free_empty_tables(unsigned long addr, unsigned long end,
 }
 #endif
 
-void __meminit vmemmap_set_pmd(pmd_t *pmdp, void *p, int node,
-			       unsigned long addr, unsigned long next)
-{
-	pmd_set_huge(pmdp, __pa(p), __pgprot(PROT_SECT_NORMAL));
-}
-
-int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
-				unsigned long addr, unsigned long next)
-{
-	vmemmap_verify((pte_t *)pmdp, node, addr, next);
-
-	return pmd_leaf(READ_ONCE(*pmdp));
-}
-
 int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 		struct vmem_altmap *altmap)
 {
-- 
2.54.0

