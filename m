Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61241208DC
	for <loongarch@lists.linux.dev>; Thu, 14 Sep 2023 10:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694687693; x=1726223693;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aN8wfY/EBvXBgqx7gt1Geu4H5jZOEEVWoImAqjfQ5So=;
  b=GNDywz9Y/hSoWCapeU1KErofwwQQSaMmhycer9/Mvpe9zhDOH+EbkjBq
   Vk1jKpJOG106vfycnYKSmBe+wXHaYErpaByGd0bF70APIieRB6tsQUJ+q
   Dgh6WtITNuOryXBZxL+1zjC74ppKZFjWXuh6Ke/pbP+0D6H5WNjZFGCxA
   GJnI7AajAGQtdaG4TpiIRE0SBvCjaVSaRAyAVqUS2628sFCqfGve62uug
   JUzfE6FxI6KG9uFzPz2xrNT/UrxqFNfjil/1KY+ApWd1gy+Nl0Ab1AAOM
   T+HHzflM+LVY0vRRYxQ/wwE56P+I8/4csqcXMLcY8Z8T7yIL2Uxf1pi9t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="409867727"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="409867727"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 03:34:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="814625070"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="814625070"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 14 Sep 2023 03:34:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 205838C9; Thu, 14 Sep 2023 13:34:48 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH v1 1/2] LoongArch: Add missing headers
Date: Thu, 14 Sep 2023 13:34:44 +0300
Message-Id: <20230914103445.511285-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header uses definitions from sizes.h, include it.
For __iomem we need the compiler_types.h, include it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/loongarch/include/asm/addrspace.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/include/asm/addrspace.h b/arch/loongarch/include/asm/addrspace.h
index 5c9c03bdf915..eaf8ac098622 100644
--- a/arch/loongarch/include/asm/addrspace.h
+++ b/arch/loongarch/include/asm/addrspace.h
@@ -10,7 +10,9 @@
 #ifndef _ASM_ADDRSPACE_H
 #define _ASM_ADDRSPACE_H
 
+#include <linux/compiler_types.h>
 #include <linux/const.h>
+#include <linux/sizes.h>
 
 #include <asm/loongarch.h>
 
-- 
2.40.0.1.gaa8946217a0b

