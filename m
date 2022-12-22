Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3C72F25
	for <loongarch@lists.linux.dev>; Thu, 22 Dec 2022 11:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671709682; x=1703245682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P1D9tmgH8/CSHAiLVPcpQPpEF0wSUpHitFyM9Wwb9a4=;
  b=Mef8LhX4d1SdZfmmnpOHr8Ge+X4jZDExLYmenGSMWJ6aK+aOMW3IyaUK
   5z0IKI3CAkgUkESxA9QhTxoQTcMrLR+VQ4igwH+AqX/z6o79rGg6XOW9D
   QB5uPTptbJ0ui80S/qIfUhq8B9NKFyYkMD1HbYRipyn0CF/aMpU3E6Wrj
   ewb+zkrIpubOTY2I4O/HFK63UhdlqSZ20i+88KJr+aG5D36SlA+fftx9w
   igHJn3RBcc+DrLydq00H5OGywatm3daCrSJwygDvBEEvZ06XY26U1cz8L
   vVS3YoEod5Mjt2SrS4GeavwGwFoF+jXQr9roV6li0t5I7jzeOQned5qIg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804606"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="318804606"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:48:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504567"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="629504567"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:47:54 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 06/19] arch/ia64: rename internal name __xchg to __arch_xchg
Date: Thu, 22 Dec 2022 12:46:22 +0100
Message-Id: <20221222114635.1251934-7-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

__xchg will be used for non-atomic xchg macro.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 arch/ia64/include/asm/cmpxchg.h      | 2 +-
 arch/ia64/include/uapi/asm/cmpxchg.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/ia64/include/asm/cmpxchg.h b/arch/ia64/include/asm/cmpxchg.h
index 94ef844298431a..8b2e644ef6a14e 100644
--- a/arch/ia64/include/asm/cmpxchg.h
+++ b/arch/ia64/include/asm/cmpxchg.h
@@ -5,7 +5,7 @@
 #include <uapi/asm/cmpxchg.h>
 
 #define arch_xchg(ptr, x)	\
-({(__typeof__(*(ptr))) __xchg((unsigned long) (x), (ptr), sizeof(*(ptr)));})
+({(__typeof__(*(ptr))) __arch_xchg((unsigned long) (x), (ptr), sizeof(*(ptr)));})
 
 #define arch_cmpxchg(ptr, o, n)		cmpxchg_acq((ptr), (o), (n))
 #define arch_cmpxchg64(ptr, o, n)	cmpxchg_acq((ptr), (o), (n))
diff --git a/arch/ia64/include/uapi/asm/cmpxchg.h b/arch/ia64/include/uapi/asm/cmpxchg.h
index ca2e0268534384..3fec9b037051bb 100644
--- a/arch/ia64/include/uapi/asm/cmpxchg.h
+++ b/arch/ia64/include/uapi/asm/cmpxchg.h
@@ -27,7 +27,7 @@
  */
 extern void ia64_xchg_called_with_bad_pointer(void);
 
-#define __xchg(x, ptr, size)						\
+#define __arch_xchg(x, ptr, size)					\
 ({									\
 	unsigned long __xchg_result;					\
 									\
@@ -55,7 +55,7 @@ extern void ia64_xchg_called_with_bad_pointer(void);
 
 #ifndef __KERNEL__
 #define xchg(ptr, x)							\
-({(__typeof__(*(ptr))) __xchg((unsigned long) (x), (ptr), sizeof(*(ptr)));})
+({(__typeof__(*(ptr))) __arch_xchg((unsigned long) (x), (ptr), sizeof(*(ptr)));})
 #endif
 
 /*
-- 
2.34.1

