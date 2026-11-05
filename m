Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793859173;
	b=yBOlOZDoEWuB8Gi4P/Gb+yLezYATivMJu1d7HBFkl442Mbvjc0dbl1njjjL1doSmBrV3
	 AXYIpYJX93njrBbFA2Vj+7t3zu3Pq7SnkPtzLMQdby55/PV92n1RKqpRBLaHz4AIf2ulo
	 lFNcpgbHQtJUDAhjFuWxbnvZhtiy50yaXNStPjGah1PDkTmIb7M2XwpTven/cJLo0t4uH
	 jtM5yol1jhqjO1ZKSHrZ9bT9G7tfZtTxvntW1yHsGZ+t8l4pIugqu1ncOOUMY3w2K7S3J
	 /lD6Ps+hi349q0kw+MEh4hLI/xl/7hFJgmu4nrl3uWIafSm8ZVRZrQDRY/e1O1yP5fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793859173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/SKim++0/v959SqW2Qj0ZN00Ia9M3Z26xYKJjxKUd6k=;
	b=QB0d6Gb9JQuEYTp+46piHe8HuFqLLei6i9WBnPObOKz7y7lePb67fPsW6rc02QoREIfN
	 W2GEJHr8XugBBp2/+zgn5oC5MnQbibnNmhumShL0IIkj+wQaBtbJsub31M5ncPi0oGFLP
	 NQx9REaTOzyMRsxlDeQudsW3Wmma6ioxthNnnhj1mRzttpv6pyDjDTNrVP3AUAw3WVOTd
	 QeSm0QyLEAXCyNR3amIIwDIHbx3Q6T0wAl2AXfZYBOUH4U+4yZQZxKTAdrOK0bxTFtKOU
	 rWhr7zNUC9kKZLJ5OMlDrD6MSXoAo6YirBs2Pcw827tLrNDBu5jztFn7S9MSpYrjqEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=dRZE0pLm;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE887606A328
	for <loongarch@lists.linux.dev>; Thu,  5 Nov 2026 06:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE887606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=dRZE0pLm
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab41538192so1275147a91.0
        for <loongarch@lists.linux.dev>; Wed, 04 Nov 2026 22:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793859172; x=1794463972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SKim++0/v959SqW2Qj0ZN00Ia9M3Z26xYKJjxKUd6k=;
        b=dRZE0pLmMsg07HhwP1Ad+ziwZhT0yIss4iLZYbvgHQy0rBOwc35hSyTH086i6aC/ql
         gqxGnJkWN4yMKTxGkxOia76RvQ6bRc1w3nkEXE59jBrZs5NOUrcnoar54X1AnUvXBuOq
         tuN5KpuXZlRfC+48+17wI8TrdXIqpvooncxLhsttxiJSdYe3lHzPCZeyoYlMHomIadSK
         PWjzZT9H4h6GDxiYYqgLch5UBD4kunygGkBxVWLhe2jwkY1/pBRXecc/xxBbEqqqcQAw
         U2ZNYJWp74nRxzDP6J5i7koBirWCPkSzZkZMvpKELYCDP0O8RKsn8UIEj6lSZOIM+FNy
         xStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859172; x=1794463972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SKim++0/v959SqW2Qj0ZN00Ia9M3Z26xYKJjxKUd6k=;
        b=KePCNPuY11pOnsczzZJY3XTUE/cYSxUW/Bes1PuuuujygNEwlm3FP0aJRRnzAiJLMW
         qsQHRoFULGvafu/5cLxio7Gt1MBTAQZb7rRSVRwA46DNhJViOxSsHT4+o24TX0uND1K/
         RK2JqTIGcP37vW2iLwaa26gZR3VZWrLtfca7u945GxNg7m8aSib94EySeJgtN8n4yUkT
         31r0cgBjAvx6ACWD0pNCE9lYTmrRMvAts8Jp5giJlY6aV/vNJH+zcPRNIJa+rWK4pc0D
         JSy2z8d3I7z3AU45GCiJtbfr8sqA2SC0YIt7XRZz0Q9sKZlFoXYHEOR/NeaWGEBcs8CX
         E0sA==
X-Forwarded-Encrypted: i=1; AKwUvBwaLiYVLC8W5fkeE1Zg1HDBxvhmPJMo9HRIkbMJ831M2Pt3q/EKGubBuoCGdKR+kWrF/Bf/SqPGEHs=@lists.linux.dev
X-Gm-Message-State: APuU4Z+YoCkZf/p/R4LuCPj5C09VWfiDMERWiA53HCwe5Sf9PPxtqgSA
	zrHnQ5KIhVs1AX5eA/ENRbaaA7NJvhC21b8CdXp4D7f0g9mXguO6HV1XiaNXyZAj240=
X-Gm-Gg: AYBFou3hn9/TS8v2nROxOemL2h5IICdkxd6qPtfJEg9BhUpr/6bmaNnaJ7habsiw8z6
	tUtbOJwGCFwVPiUEvOTrRgvuaexrSdZ+1EPey+cYc6UJ+E5flNqc/6dIXhdP+uBmV2WV9hEjEIg
	os8dTm7nWiYOc432vMZNhkzQL680LAH+0Mnlv+kuTqwvuSDM1EYSHFcn7qe67HbYInm85Gynhvv
	gKGCTKySbtBLbOhsWnuqjtu2/afNw5yE0jAqdNre1k1M2tkD3+NvJm5GkNr7oRx0qfPpicI5KzP
	M8qbVbzFnvXC97PBjg6YyvH+CmmIwKRNCt3gLEmCqM/JK6u/kPOEPcJrKh0crylGFrBi3V8RSIq
	PT0vxBmUnEzuTQIPu5vaUjrko8xO1mlBOIojD3jqWw8wSW47bdOJPmfmWH93mQtoJpLNy9qOxuM
	eUB6mj83fWCeok6Zu7lxHmvaFtTqMkBWlNkZWDkanUUHXaEG36HGzAi7XCHeNsa63gizZ9zzHsT
	bE16q9ofWTvfagtUfNhAVj8IMZ6Lh7rHa+liA/cLPx9lwUXbljx8Q9z3WaXu9LJZSPChpCRuJg4
	5sAiw/bDWw9ZYEIp5TbUBymlt0Fvf8yc3TqjaIrayfXRGZnlVAsM8z2e50/OCBL3bQMZFdUEzgE
	PS1t+lG3oPdo=
X-Received: by 2002:a17:90b:37d0:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3ae8979d2d3mr14790005a91.43.1793859171930;
        Wed, 04 Nov 2026 22:12:51 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm2107528a91.5.2026.11.04.22.12.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:12:51 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 3/5] loongarch/mm: disable device DAX vmemmap optimization
Date: Thu,  5 Nov 2026 14:12:15 +0800
Message-ID: <20261105061217.13302-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105061217.13302-1-songmuchun@bytedance.com>
References: <20261105061217.13302-1-songmuchun@bytedance.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LoongArch selects ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP but not
ARCH_WANT_OPTIMIZE_DAX_VMEMMAP. Its vmemmap_free() implementation is also
empty, so it cannot tear down optimized Device DAX mappings.

A later change removes the generic Device DAX architecture gate and lets
vmemmap_populate() decide whether a section can use optimization. Clear the
section compound order in the LoongArch path so Device DAX keeps using
unoptimized mappings.

This does not affect HugeTLB HVO: LoongArch does not support gigantic
pages, so HugeTLB does not use section-based vmemmap optimization there.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- New patch using section_vmemmap_optimization_disable() to keep Device
  DAX vmemmap optimization disabled on LoongArch (reported by Sashiko)
---
 arch/loongarch/mm/init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index f801f7097f03..ea769e479241 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -15,6 +15,7 @@
 #include <linux/memblock.h>
 #include <linux/memremap.h>
 #include <linux/mm.h>
+#include <linux/vmemmap-optimization.h>
 #include <linux/mman.h>
 #include <linux/highmem.h>
 #include <linux/swap.h>
@@ -143,6 +144,7 @@ void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 int __meminit vmemmap_populate(unsigned long start, unsigned long end,
 			       int node, struct vmem_altmap *altmap)
 {
+	section_vmemmap_optimization_disable(start, end);
 #if CONFIG_PGTABLE_LEVELS == 2
 	return vmemmap_populate_basepages(start, end, node, NULL);
 #else
-- 
2.54.0

