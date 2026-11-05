Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904006;
	b=ZehYW9przfHTp/aI52I1ynWTj7Hqz6ecD5aPLo0bz7zn0tFHfocVS87Bwltyzg6SCjk1
	 TKxG7gloAP0QgOM1oFMWc8MMZ92k4AzyOhemGvpfK0ijdU2c6P1hFfzykEPjpI+LtWL9V
	 6dh8SmLvUcqJcrxRJTqM1RIIRxBstq+Cwr8uV23yptt9I9D6nt8N8OWRnKxeEZ5IeoNUs
	 2a0AuGqOtLaxTYYrOukJ8WCO6KoOnCyd0aX6EIbBkkfd+9T8qRl2HLjwlrzk9YsfR1C3i
	 6zDGFsmmUHzke+FYxX2mB33aPa9nMZ4YgnGXzc94NrYs/Lio/DtOeFuBOyUToXLHR+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904006;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TAssQInwTzZeF9VmFhLMiXUuVNp0io3xxOUzWahhLeo=;
	b=02ibJMwePyQkaMmJPeTq0irGh6T7Vh9BXgZFghyZbLc5IVKu4zTira4IFqrOHmGraYfP
	 pZkgCVOvSBRg7J4rq56D13bsG/ELrU+5vf5Zs7K8R/HVHPQJlVjlACZZlkuPj3F2sbNJn
	 5euO0WOKsJZOyExRoYtQb6fOp0huKy89iXxW4PmzkMJhNOeuBIYdn/gCztIQUmVF4Y6Bp
	 F+lQoFZd9pEhgypyGgJZNQzzXh0QVyQcRD9G16r7iezBgSV6LfP3mBCiTqs8ehXhr3B8B
	 aBDDe8iIAbHXT36GPuKzTlTIsGvy251m1NtHFGp3q3dur8f5i2XnBH1vw2KI4lhs2Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nq305rAv;
	arc=none smtp.remote-ip=91.218.175.65
Received: from mta0.migadu.com (out-65.mta0.migadu.com [91.218.175.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E34606A332
	for <loongarch@lists.linux.dev>; Thu,  5 Nov 2026 18:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E34606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nq305rAv
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=pqwePApOX37WLHzM+DYHEdjaAYjW4/j8D/dxxSnSyeY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904003; v=1; x=1794508803;
 b=nq305rAvrvVVYJHBRX5INQ4WQaVWhPX/M0d2q4R8aYvbbAAbbNfrHlp8LhQLLr54GOFQobl8
 YweM0loiPIOJ2seeyM7JbMH+QbOmwR+R3hUvSrypPX9ehTWXe2XkaxWB6rJy3n8VQBxGexXOp9q
 KAewyTowABDNg+u0eGDA6dkw=
X-Envelope-To: loongarch@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 1f78b343f3c7b01b;
	Thu, 05 Nov 2026 18:40:02 +0000
X-Mizu-Trace-ID: 1f78b343f3c7b01b
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: chenhuacai@kernel.org,
	ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	Liam R. Howlett <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>,
	loongarch@lists.linux.dev
Subject: [PATCH v9 03/32] loongarch: mm: add PMD swap-exclusive helpers
Date: Thu,  5 Nov 2026 10:38:47 -0800
Message-ID: <20261105183940.2236717-4-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105183940.2236717-1-usama.arif@linux.dev>
References: <20261105183940.2236717-1-usama.arif@linux.dev>
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

Prepare for keeping a PMD-mapped anonymous THP mapped by a PMD across the
swap round-trip, which makes PG_anon_exclusive have to survive in a swap
PMD and not just in a swap PTE.

A LoongArch swap PMD is the swap PTE value plus _PAGE_HUGE, and
_PAGE_SWP_EXCLUSIVE sits outside both the type and the offset field, so the
PMD helpers can use the same bit.

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev
Signed-off-by: Usama Arif <usama.arif@linux.dev>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/loongarch/include/asm/pgtable.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index f876031351319..30a256a99bfcf 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -352,6 +352,25 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 	return pte;
 }
 
+#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
+static inline bool pmd_swp_exclusive(pmd_t pmd)
+{
+	return pmd_val(pmd) & _PAGE_SWP_EXCLUSIVE;
+}
+
+static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
+{
+	pmd_val(pmd) |= _PAGE_SWP_EXCLUSIVE;
+	return pmd;
+}
+
+static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
+{
+	pmd_val(pmd) &= ~_PAGE_SWP_EXCLUSIVE;
+	return pmd;
+}
+#endif
+
 #define pte_none(pte)		(!(pte_val(pte) & ~_PAGE_GLOBAL))
 #define pte_present(pte)	(pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROTNONE))
 #define pte_no_exec(pte)	(pte_val(pte) & _PAGE_NO_EXEC)
-- 
2.53.0-Meta

