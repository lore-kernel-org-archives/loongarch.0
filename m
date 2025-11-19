Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1AA1C84DE
	for <loongarch@lists.linux.dev>; Wed, 19 Nov 2025 07:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537565; cv=none; b=r3SRezJU398hklsJ/M5KwyiurZDSueh/1ieXLpN0Kq6Idfs4M6mWLLfWBowi8G9GF5PJ8YnKzLSlpblLXx9DEmsVpRCOK7S9I9O8xQwarz75n2kxj7IDFIqaEeqb4A81MAn78fgTNl6VK/7lQib/drOH0Majq9jBgD81wRaBhnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537565; c=relaxed/simple;
	bh=J/3ntIk/FVsMM/cx480xqZtN/m3bUjrIkaLHKtbxWQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=szygqQBCHE5ONyI0Ch7AXgJweMq+OQkEaa0ZCEkdxTWyRWNrVLUeA1dYdERbnBxH6tWEabCJ+J7At5Pfpl5Pn1TfT1VG/qMDfPj+uDETp8bIe8cmThk2nQeU69VCr29qQgKlRcamSWhLSltoDnSazRL9wqajFl2l5A8A/snU+iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vbucHj67; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vbucHj67"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763537560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x1iNplE99sGAypoCEEPI8YVyyZSSPtGtkqVo740CsVs=;
	b=vbucHj67nP76kiXE1QyY8BDwAzCLOGQUCC0PuxiMX09JuvuPEDA7TD6Faql30bLUhiVf76
	IOCfwQsCxOzvk1jJIx6cB/4wVYkH1Ymgi7/nv/RuHvh3YJEurHzaNl8B/s41J5hlfHjpnD
	Wr8XalvYuqFraXJCvIIVSZfyHo2LYco=
From: Qi Zheng <qi.zheng@linux.dev>
To: will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	peterz@infradead.org,
	dev.jain@arm.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ioworker0@gmail.com,
	linmag7@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-alpha@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 1/7] mm: change mm/pt_reclaim.c to use asm/tlb.h instead of asm-generic/tlb.h
Date: Wed, 19 Nov 2025 15:31:18 +0800
Message-ID: <e9d510106b5bf72a9b577b8c5ad161fd3c29c2b6.1763537007.git.zhengqi.arch@bytedance.com>
In-Reply-To: <cover.1763537007.git.zhengqi.arch@bytedance.com>
References: <cover.1763537007.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Qi Zheng <zhengqi.arch@bytedance.com>

Generally, the asm/tlb.h will include asm-generic/tlb.h, so change
mm/pt_reclaim.c to use asm/tlb.h instead of asm-generic/tlb.h. This can
also fix compilation errors on some architecture when CONFIG_PT_RECLAIM
is enabled (such as alpha).

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/pt_reclaim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/pt_reclaim.c b/mm/pt_reclaim.c
index 0d9cfbf4fe5d8..46771cfff8239 100644
--- a/mm/pt_reclaim.c
+++ b/mm/pt_reclaim.c
@@ -2,7 +2,7 @@
 #include <linux/hugetlb.h>
 #include <linux/pgalloc.h>
 
-#include <asm-generic/tlb.h>
+#include <asm/tlb.h>
 
 #include "internal.h"
 
-- 
2.20.1

