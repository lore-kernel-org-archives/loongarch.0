Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DEF27A465
	for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 01:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767058473; cv=none; b=h15EyP8V0955tvQ6WgND59ZPTII3ht6QQIUefjbfPX51y+dt9IUTSr9hitFz7iwKW9S/b1Qt4aZpDAJF3mM07C7lypWxqr+uSC5wwCXHFHHHyk6bn83BjmrkbqdyC9RMCVeNGi7eixwaIOez2UJOxLjxhHNmY8r/birXOCOHB2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767058473; c=relaxed/simple;
	bh=YcCyE4sWR+scLLWTbqdvzA1M9onDStyOkC3vO2tYI7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=thPmsSvK5R2WT4Y8h3vDGqv8EzkskTHSFgQ7M8mNW0A7+CTlolZw89Jzih4B2bcI+PKL/0Mxnxm5W/hiWgEX/4US/znv3p/QMCRcTp738YSB/73/1j2lspZd8LE1i5UjXOUDfQl1WVAKxKR6ZKsCpCDID2qCyFFsh2GQz+rXOYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bs+zUhQt; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bs+zUhQt"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767058469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jlN3ZPg4mJZbFMBP3Elnj5zSylaTyq0UW3iibF0yXu0=;
	b=bs+zUhQtyaW+Itg5odaoywhYR9UeMPL021fy6D9sCiSgbAeeizWkYGn+p77ITKmAVQKmn5
	8pla4tx8x47RSKLz39U5cNlA/nUp3lgiGu7YRLBnaKpf2IlYqlsrQNwm28/rWCZUbicR6a
	03wNlw+NrJ3N5YlEBoBztnpB+t2iCjo=
From: George Guo <dongtai.guo@linux.dev>
To: hengqi.chen@gmail.com
Cc: chenhuacai@kernel.org,
	dongtai.guo@linux.dev,
	guodongtai@kylinos.cn,
	kernel@xen0n.name,
	lianyangyang@kylinos.cn,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	r@hev.cc,
	xry111@xry111.site
Subject: [PATCH v7 loongarch-next 3/4] LoongArch: Use spinlock to emulate 128-bit cmpxchg
Date: Tue, 30 Dec 2025 09:34:16 +0800
Message-ID: <20251230013417.37393-4-dongtai.guo@linux.dev>
In-Reply-To: <20251230013417.37393-1-dongtai.guo@linux.dev>
References: <CAEyhmHT1gRtGCiM7C6QmrF38xxzc2OLKgiNRWd0whpSSJoyrjg@mail.gmail.com>
 <20251230013417.37393-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

For LoongArch CPUs lacking 128-bit atomic instruction(e.g.,
the SCQ instruction on 3A5000), provide a fallback implementation
of __cmpxchg128 using a spinlock to emulate the atomic operation.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/include/asm/cmpxchg.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/include/asm/cmpxchg.h
index 61ce6a0889f0..ef793bcb7b25 100644
--- a/arch/loongarch/include/asm/cmpxchg.h
+++ b/arch/loongarch/include/asm/cmpxchg.h
@@ -8,6 +8,7 @@
 #include <linux/bits.h>
 #include <linux/build_bug.h>
 #include <asm/barrier.h>
+#include <asm/cpu-features.h>
 
 #define __xchg_amo_asm(amswap_db, m, val)	\
 ({						\
@@ -175,6 +176,23 @@ union __u128_halves {
 	__ret.full;							\
 })
 
+#define __cmpxchg128_locked(ptr, old, new)				\
+({									\
+	u128 __ret;							\
+	static DEFINE_SPINLOCK(lock);					\
+	unsigned long flags;						\
+									\
+	spin_lock_irqsave(&lock, flags);				\
+									\
+	__ret = *(volatile u128 *)(ptr);				\
+	if (__ret == (old))						\
+		*(volatile u128 *)(ptr) = (new);			\
+									\
+	spin_unlock_irqrestore(&lock, flags);				\
+									\
+	__ret;								\
+})
+
 static inline unsigned int __cmpxchg_small(volatile void *ptr, unsigned int old,
 					   unsigned int new, unsigned int size)
 {
@@ -268,7 +286,8 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, unsigned int
 #define arch_cmpxchg128(ptr, o, n)					\
 ({									\
 	BUILD_BUG_ON(sizeof(*(ptr)) != 16);				\
-	__cmpxchg128_asm(ptr, o, n);					\
+	cpu_has_scq ? __cmpxchg128_asm(ptr, o, n) :			\
+			__cmpxchg128_locked(ptr, o, n);			\
 })
 
 #ifdef CONFIG_64BIT
-- 
2.49.0

