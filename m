Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6952F5498
	for <loongarch@lists.linux.dev>; Sun,  5 Apr 2026 02:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775355218; cv=none; b=qlZWhw2dPpJJ1S0Y7cATP0X4kmhMTswC7aD8eXrmcJ5SlDvHyevTd0Dlm4KxmUDnYBmHAvesp11m8c4zWS3W9/CCwf3OWY8bzwE3tTD16bndZAAcUSqiCwIVLkdy5e80sFRdeCR9hdFIwpf7W5mxgIQKTWg07z2RsGH50D27sV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775355218; c=relaxed/simple;
	bh=8QEKA6OwSoPywHdFsz2wgeivXb4Y/LGKY4NfdS6ZJ/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H200PKuGE7EhTMox3g2Pjt5ry24XKSzPfrmIPiNCvMbvHW3oc/soBA7It/AHOh7thfENfpi1asV95+WvVYD/3iAFStVNGLo8zkfH2V8zo4qb64c0HkY5BNVJ6yPk/27jULNNhp6/SLYPgXZO9hu9GQSq1rkyJM127JWksaZwuR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HxG7GtPl; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HxG7GtPl"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775355213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/IUunuyShnV6dc1LpgOX5YyhCvt0pPZSRrYc0CEHWQI=;
	b=HxG7GtPl133mvg87dYsU5I+B2oKATTFaZL6UQJM/uP1HUwWTyx5s+9VCAFDmv6rVaK2m28
	nkHCC0vkN3f/uwF6adqGJAcsWNnS7cGZ57hDA+nIJZZY9tvsePKrfyV+yy+Mys6o9Q2T2q
	YH6OPHlb/0Mya4TaT9NPlL/no8VVDMY=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH v2 1/2] LoongArch: Add flush_icache_all()/local_flush_icache_all()
Date: Sun,  5 Apr 2026 10:12:26 +0800
Message-ID: <20260405021227.532599-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Youling Tang <tangyouling@kylinos.cn>

LoongArch maintains ICache/DCache coherency by hardware,
we just need "ibar 0" to avoid instruction hazard here.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 arch/loongarch/include/asm/cacheflush.h | 16 +++++++++++++++-
 arch/loongarch/mm/cache.c               | 10 ----------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/arch/loongarch/include/asm/cacheflush.h b/arch/loongarch/include/asm/cacheflush.h
index f8754d08a31a..95416e788d2a 100644
--- a/arch/loongarch/include/asm/cacheflush.h
+++ b/arch/loongarch/include/asm/cacheflush.h
@@ -32,8 +32,22 @@ static inline unsigned int cpu_last_level_cache_line_size(void)
 }
 
 asmlinkage void __flush_cache_all(void);
-void local_flush_icache_range(unsigned long start, unsigned long end);
 
+/*
+ * LoongArch maintains ICache/DCache coherency by hardware,
+ * we just need "ibar" to avoid instruction hazard here.
+ */
+static inline void local_flush_icache_all(void)
+{
+	asm volatile ("ibar\t0\n"::);;
+}
+
+static inline void local_flush_icache_range(unsigned long start, unsigned long end)
+{
+	asm volatile ("ibar\t0\n"::);;
+}
+
+#define flush_icache_all	local_flush_icache_all
 #define flush_icache_range	local_flush_icache_range
 #define flush_icache_user_range	local_flush_icache_range
 
diff --git a/arch/loongarch/mm/cache.c b/arch/loongarch/mm/cache.c
index 496916845ff7..06dc570eb429 100644
--- a/arch/loongarch/mm/cache.c
+++ b/arch/loongarch/mm/cache.c
@@ -31,16 +31,6 @@ void cache_error_setup(void)
 	set_merr_handler(0x0, &except_vec_cex, 0x80);
 }
 
-/*
- * LoongArch maintains ICache/DCache coherency by hardware,
- * we just need "ibar" to avoid instruction hazard here.
- */
-void local_flush_icache_range(unsigned long start, unsigned long end)
-{
-	asm volatile ("\tibar 0\n"::);
-}
-EXPORT_SYMBOL(local_flush_icache_range);
-
 static void flush_cache_leaf(unsigned int leaf)
 {
 	int i, j, nr_nodes;
-- 
2.43.0

