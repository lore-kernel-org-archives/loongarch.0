Received: from mta21.hihonor.com (mta21.honor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB03329370
	for <loongarch@lists.linux.dev>; Thu, 18 Dec 2025 06:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766039963; cv=none; b=qxtNgaP+5Rsjh8VT24An2LZJQoVsrI7osxWTENZNbL2KQbdexMlrNpWT4PllLFHDNMAIsFZp/gP4noYeRGutZSoAg1nTnpgFEa+8eOaRrw3l7oxvooV5OJ+q9LM+K3SriU0khgsYidlOR0VGZw0xzZnZrCTGRYwnn9Lyc6FaAAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766039963; c=relaxed/simple;
	bh=A+Zuspe5VJtHd35LdgeCVdakZgmxI+9ysdFKHFGzjNQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rMeUi7pEVJNOGIE/MrJAcwx2atX2DoaBHwG6uPiY7/AiUqApvizkqTyI9ruFwwikhBwCpi3PTJP05v8imaqGhlSJYHr9bRrnVg9vMD3u+88hBhfQjdgDX3dRH4t3FBsgXVpeBFPwzADCe9564u5SjgBpbFEQYAzg5mezqFgzw0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w002.hihonor.com (unknown [10.68.28.120])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4dX1Ct0YCHzYl7Sg;
	Thu, 18 Dec 2025 14:36:42 +0800 (CST)
Received: from w025.hihonor.com (10.68.28.69) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Thu, 18 Dec
 2025 14:39:19 +0800
Received: from localhost.localdomain (10.144.17.252) by w025.hihonor.com
 (10.68.28.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Thu, 18 Dec
 2025 14:39:18 +0800
From: yuan linyu <yuanlinyu@honor.com>
To: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
	<akpm@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
	<kernel@xen0n.name>, <kasan-dev@googlegroups.com>, <linux-mm@kvack.org>,
	<loongarch@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, yuan linyu <yuanlinyu@honor.com>
Subject: [PATCH v2 1/2] LoongArch: kfence: avoid use CONFIG_KFENCE_NUM_OBJECTS
Date: Thu, 18 Dec 2025 14:39:15 +0800
Message-ID: <20251218063916.1433615-2-yuanlinyu@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251218063916.1433615-1-yuanlinyu@honor.com>
References: <20251218063916.1433615-1-yuanlinyu@honor.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: w010.hihonor.com (10.68.28.113) To w025.hihonor.com
 (10.68.28.69)

use common kfence macro KFENCE_POOL_SIZE for KFENCE_AREA_SIZE definition

Signed-off-by: yuan linyu <yuanlinyu@honor.com>
---
 arch/loongarch/include/asm/pgtable.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index f41a648a3d9e..e9966c9f844f 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -10,6 +10,7 @@
 #define _ASM_PGTABLE_H
 
 #include <linux/compiler.h>
+#include <linux/kfence.h>
 #include <asm/addrspace.h>
 #include <asm/asm.h>
 #include <asm/page.h>
@@ -96,7 +97,7 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
 #define MODULES_END	(MODULES_VADDR + SZ_256M)
 
 #ifdef CONFIG_KFENCE
-#define KFENCE_AREA_SIZE	(((CONFIG_KFENCE_NUM_OBJECTS + 1) * 2 + 2) * PAGE_SIZE)
+#define KFENCE_AREA_SIZE	(KFENCE_POOL_SIZE + (2 * PAGE_SIZE))
 #else
 #define KFENCE_AREA_SIZE	0
 #endif
-- 
2.25.1

