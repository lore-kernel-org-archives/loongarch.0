Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A82F366DB9
	for <loongarch@lists.linux.dev>; Mon,  1 Jun 2026 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303769; cv=none; b=A8wv2RxMwt5gXne0sy3dc4jkI+pk64ADBjRoQ+MiyBA4uy2+HCnnfSSSS/ujyAslOwiwjH9WsARsDUIsVLeEoDtMbLevYlB6/6gSorfgHHZRXzlTNPPIOxrlLrl1QDVwCUO7+iQ/DZcyXU1tdOIp8XhEbaxgAezB4dsgJaAm2To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303769; c=relaxed/simple;
	bh=pwblFY2nzACXWSoP5Rom+zjueIYD5KdpIL15G4qchH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBlXJ85O8Sh2zQVb0MeuU8BBJlBPEXD7kfIv5XZjDoNK+cD6el0R+rdhInDM4nedrB/C6+P4tizG6q0bVvhGlNUO4tSAOdOiwzY7X9jIi+DLklXjJV2rbIFdTA3XBpVJRLZY7M8OTeexGMd8toUU/rap10Rqbip4lLXIAkhTNdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=GYE8rA5n; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="GYE8rA5n"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84230ab8857so579482b3a.1
        for <loongarch@lists.linux.dev>; Mon, 01 Jun 2026 01:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780303768; x=1780908568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs9Ftk//Eli+AipH1EmAF2SPdnVVPcjuiC9Ml1N6W44=;
        b=GYE8rA5nJJF7vq7mDY0lqOyWTif0KubvISPQGCEDgq7z5z83pWFBpUoWlTQYwMFiaA
         x9eFL1kjxvXpb/8hmiMeFH7w3wZG1HOOXgvyFySlNng7KOkVXjgyUqfndO1b+UG0v/3s
         gFQ+BHgWTpA11tBjihw4qLTeRSS7Ueezyz8rjmJtSdkeo0HvWrI8vt/Cg+ASwfuTjy2J
         ARch+BLD2hAaQOCLwkGdI8eCsgZIc74WQP8Xc2by67LEDjQUKN07sXc/92fgO4u0lxVm
         diKXUAcqanBtfB1fFITq9vkKdi1sIZbYj/jZB+ufDvX5DN7p+aEwRodpp9S2vs+JP0Cj
         HiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303768; x=1780908568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zs9Ftk//Eli+AipH1EmAF2SPdnVVPcjuiC9Ml1N6W44=;
        b=NVcTOrb41mNsx/qKqmhxU6xrmFwOy5ZkRxlxIbrKFCD+EHIuB+DtG9bccJJVdWKcW0
         BF6rnhu+oraeT/+GWN3b6dYXYJRIqRpRQCSibSq6a+4FLohQ9rEH3G2yUjM5UW4YC4qM
         Q7PjvNaxoHuj2U5ux1ZNfZcIS2CKhp8OMF3iCEFl/MH5ooxtstn5cLfDccW+xN8KTdfi
         9wwOuY7joPhmtdCn6Dyo3eVxBgpsersMCGp5L+kth0tLDvrxu/CNJYxovgcZ3jgMohuK
         9R1zX9Jki9ey8lxjouaU+JZ1kXyoumVRw2/nsbWr2vFT26aVTO53AEb6bZXfCYplADFp
         D+7A==
X-Forwarded-Encrypted: i=1; AFNElJ/B6dOTmwc0FT4H2UFjra0EkucKWf+6VajqnnhKGshF9zdd7r5L6wYeKTvuqcxWAkC4JXrqeVX+O0U=@lists.linux.dev
X-Gm-Message-State: AOJu0YyE27pRUUJf7nVdS5WfzGg/BbjhHZ9VbIEQy/7uZKwP5GslTwx+
	a6ZMtdhiZpfJsnBbffz11LVLaDRekRtMGFDMBxiwjA2jMASSkjlykhai9jcbz1RFntE=
X-Gm-Gg: Acq92OFS3uhcxdSXpsG/qSgx05isRH2aaz8C9lDwW/4WiroaL1MfTd+rHVjugGTrhCs
	djPgrf+tbQvH2S+sUvRvv37fQdrt4vsTDgmVD+2AL2oFh2nA5IpNuEAmrP37AJ68+JVOyGmxe6v
	tGVEHC0vE8RXxhRMj57f1pDNQMQbsjle9S6z89NSxPsMHRtMpr+97lNorajKP4Yd3QOQ68+sVHY
	0/nAzOfs+bzXO5OmBJzquTXhNXSVNEgFnZpfNrS9hkBUD4BGUP7EGmn+AjGosYW7zKfBG9jGghz
	lbCdW5ia/dQeXTWQIWmyeaxx8gQeLAEEdDSZE1I/u0lafnwfpt1g+sMRHcfNUqvT9E86SrqAr3G
	EcC2QiulH4YJwQWSxsyI5mv/AJ3jSaRx5skYRL3/hKUSFweQ/CXhWobVxyv6n+gq4GNiKTjIBG8
	ota2kmQQOznbg713sfpEqzefRpusjwDTHgfH8xOjGjA8mFLDmAzufzJQ==
X-Received: by 2002:a05:6a00:4c8b:b0:842:43d1:4b41 with SMTP id d2e1a72fcca58-84243d15007mr4884011b3a.47.1780303767463;
        Mon, 01 Jun 2026 01:49:27 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6316230b3a.12.2026.06.01.01.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:49:26 -0700 (PDT)
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
Subject: [PATCH v3 5/5] sparc/mm: drop vmemmap_check_pmd helper and use generic code
Date: Mon,  1 Jun 2026 16:48:44 +0800
Message-ID: <20260601084845.3792171-6-songmuchun@bytedance.com>
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

The generic implementations now suffice; remove the sparc copies.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/sparc/mm/init_64.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 3b679b1d1d72..103db4683b16 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2559,17 +2559,6 @@ void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 	pmd_val(*pmd) = pte_base | __pa(p);
 }
 
-int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
-				unsigned long addr, unsigned long next)
-{
-	int large = pmd_leaf(*pmdp);
-
-	if (large)
-		vmemmap_verify((pte_t *)pmdp, node, addr, next);
-
-	return large;
-}
-
 int __meminit vmemmap_populate(unsigned long vstart, unsigned long vend,
 			       int node, struct vmem_altmap *altmap)
 {
-- 
2.54.0

