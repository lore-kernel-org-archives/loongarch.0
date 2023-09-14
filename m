Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156CF10A21
	for <loongarch@lists.linux.dev>; Thu, 14 Sep 2023 10:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694687695; x=1726223695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2FKCjcQ5u9vQaNDLGxcLVznEbCTrMpPIzmp+AvNgKs8=;
  b=QbVp6BDkuTkQJUA8t7oMuKhs56WCwcrrA2B+Njly3sz38BUeroOJYJ2I
   SxKAgJZaVki1wYihsFFxu5/t9AdMGKOcBfOccJixI7MvMuzhPyaofOyCV
   7d91IK+16a6LXHuujWiBxkJTf7V3oUYuAi2BvuJhu+4GpQWaXDxmYAr7N
   NMh/L1QUfFB9r3IQlGddee4qwWDOXmRjH08vePP7ZTtW+i+cf5aymx311
   Uexeh9taYIQ2xiKkTGi5e7+v8mELSPb1ex9eiqLkjrUA9KmeCb94oGUgg
   d7cJNe52QsW3tbKmGN85z/+Kd8tgJNHwCxyVXPvOgngflkZ+lj7dfDzsz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="409867731"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="409867731"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 03:34:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="814625073"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="814625073"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 14 Sep 2023 03:34:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A9E5FBC0; Thu, 14 Sep 2023 13:34:49 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH v1 2/2] LoongArch: Use _UL() and _ULL()
Date: Thu, 14 Sep 2023 13:34:45 +0300
Message-Id: <20230914103445.511285-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230914103445.511285-1-andriy.shevchenko@linux.intel.com>
References: <20230914103445.511285-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use _UL() and _ULL() that are provided by const.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/loongarch/include/asm/addrspace.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/include/asm/addrspace.h b/arch/loongarch/include/asm/addrspace.h
index eaf8ac098622..818077f62db8 100644
--- a/arch/loongarch/include/asm/addrspace.h
+++ b/arch/loongarch/include/asm/addrspace.h
@@ -21,7 +21,7 @@
  */
 #ifndef __ASSEMBLY__
 #ifndef PHYS_OFFSET
-#define PHYS_OFFSET	_AC(0, UL)
+#define PHYS_OFFSET	_UL(0)
 #endif
 extern unsigned long vm_map_base;
 #endif /* __ASSEMBLY__ */
@@ -45,7 +45,7 @@ extern unsigned long vm_map_base;
  * Memory above this physical address will be considered highmem.
  */
 #ifndef HIGHMEM_START
-#define HIGHMEM_START		(_AC(1, UL) << _AC(DMW_PABITS, UL))
+#define HIGHMEM_START		(_UL(1) << _UL(DMW_PABITS))
 #endif
 
 #define TO_PHYS(x)		(		((x) & TO_PHYS_MASK))
@@ -67,16 +67,16 @@ extern unsigned long vm_map_base;
 #define _ATYPE_
 #define _ATYPE32_
 #define _ATYPE64_
-#define _CONST64_(x)	x
 #else
 #define _ATYPE_		__PTRDIFF_TYPE__
 #define _ATYPE32_	int
 #define _ATYPE64_	__s64
+#endif
+
 #ifdef CONFIG_64BIT
-#define _CONST64_(x)	x ## UL
+#define _CONST64_(x)	_UL(x)
 #else
-#define _CONST64_(x)	x ## ULL
-#endif
+#define _CONST64_(x)	_ULL(x)
 #endif
 
 /*
-- 
2.40.0.1.gaa8946217a0b

