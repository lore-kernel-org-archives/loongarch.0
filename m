Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA271F2380
	for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 06:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766990064; cv=none; b=LvS/loZrgTCRyeUGbM8VQ7XRbdU1Oxzv7RSQS/YfAycHHc9HVsIWyIatUC14/K2zE4y7ZnzQpOH7BmiCRcpF1HmijlBZjX6WOGVkvCDxVNDV9+F8foOh/AihdGMEMI9pyVj/mp3hr1UMwsENxRDNajAJaP9hfHOkmnAp76/5eFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766990064; c=relaxed/simple;
	bh=YcCyE4sWR+scLLWTbqdvzA1M9onDStyOkC3vO2tYI7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XlNim7YsEcC5lKSZ5rbuJNC9/XjswF94t+BKk2B7LG5qA3feoNnZ36fTt5h+sbF7r0IpcL7oMbNoLRcbjXfzsVPfPHsSdQrkw5FFjt3ZjFvWRAFQa17CGiwmDjyKf9hC9pfZwKfpUFcODWnp7Pbfc4i3rlnEnYcU/L7k2ftAgdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lz9W7aIg; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lz9W7aIg"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766990060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jlN3ZPg4mJZbFMBP3Elnj5zSylaTyq0UW3iibF0yXu0=;
	b=lz9W7aIgqzuvCUashaA83rDnv8wKnu4V/vqzlC7S31fqimDSMoAhR2CCvPvCuEY49Mm09g
	FUeca0zStpJVMLwxb/FA492TDBo8prK0L4p5l3ouSYBzqHls2cCrM8fJxbuoM9eKvN13Ac
	2guA1eKQQMGlEew5gA0p17gbL3ZQ13s=
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
Subject: [PATCH loongarch-next 3/4] LoongArch: Use spinlock to emulate 128-bit cmpxchg
Date: Mon, 29 Dec 2025 14:34:07 +0800
Message-ID: <20251229063408.34340-4-dongtai.guo@linux.dev>
In-Reply-To: <20251229063408.34340-1-dongtai.guo@linux.dev>
References: <CAEyhmHQgkgU-c6rmBc0672oNCdQAzz4Ob5kN4p7k6MUo9B4Okw@mail.gmail.com>
 <20251229063408.34340-1-dongtai.guo@linux.dev>
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

