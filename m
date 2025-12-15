Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DB6248F47
	for <loongarch@lists.linux.dev>; Mon, 15 Dec 2025 08:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765786334; cv=none; b=RwElNUiQOOe+6JF/16H29MQfXiDHkSlfmI6ZKUZJC3mg8JGPcDrdYFHOt/ax6qAyro7KHyhF9Aga1G6lbttqigk2UYjeXT3CTO0VU2R5iTfc12mYJhT4V5IUKj3mlsox7DLdL9rDlHLijalE4DdrQOu70XRc57Tee5csOK/4mNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765786334; c=relaxed/simple;
	bh=1ydGX2ckPcbDTOaBlko8S4H7H/Su4Cxx0zFDcMsJB+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HALG1hIXmdOHvzNKxqh3dD0hqVcmiWTFUIOA7pwW3clMNlpPq4EPDIx5RVi/TDat55Afh0MKHUDkjEtSXYYkhE0RIEvhmfEMdH3VmoKEtKYZ37VgjM4GyaUIYgKoWEObw/Rov63gMG5x1H2Dg0N7+U3BqVNEWqBL4oBJdMX/2fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dYzHXzIT; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dYzHXzIT"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765786326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wbG/hNpFVx1z8RtgsmITOX2lkUrENsQeLW2JOQQh7ZM=;
	b=dYzHXzITbbEF+Dn+UGdYSw4YayLg/0H6x2JTnRBQWxvpCNYdaMJhym7s0LJb2ue98c87iq
	/d/xcrd6/O6Af6Oj+UNs8iFhHDRteRqIZnXYA4XlnKACITlAt4ZpfSsw6VNP3Y3cL5eRah
	j/FtZcWfA8U9IWyc4k9z3XQl1/ixHTQ=
From: George Guo <dongtai.guo@linux.dev>
Date: Mon, 15 Dec 2025 16:11:41 +0800
Subject: [PATCH v6 3/4] LoongArch: Use spinlock to emulate 128-bit cmpxchg
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-2-v6-3-c3ceeb281916@linux.dev>
References: <20251215-2-v6-0-c3ceeb281916@linux.dev>
In-Reply-To: <20251215-2-v6-0-c3ceeb281916@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 hengqi.chen@gmail.com
Cc: r@hev.cc, xry111@xry111.site, loongarch@lists.linux.dev, 
 linux-kernel@vger.kernel.org, George Guo <dongtai.guo@linux.dev>, 
 George Guo <guodongtai@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765786312; l=1861;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=PCzsPV7oGfaIDaA0cqRcyRoMNSMiHxOqDWfuZv8Lz68=;
 b=ewlh4ZYRNWXH1uLz3sbNn7NJZp1+RygJWdmue7qlknqelvjHWpG6qh14fvuduKkCWy0+2aG7n
 32m7Ig29bEtAL394ZSqhFQBZlx6cM5wbS7dFz8ZBD+eY4c0jWZJapBM
X-Developer-Key: i=dongtai.guo@linux.dev; a=ed25519;
 pk=yHUJPGx/kAXutP/NSHpj7hWW0KQNlv3w9H6ju4qUoTM=
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
index f7a0a9a032c513196ef186a5493b500787e0e9b6..814097bfc334184018747e47fb90fd2d2fb27ee2 100644
--- a/arch/loongarch/include/asm/cmpxchg.h
+++ b/arch/loongarch/include/asm/cmpxchg.h
@@ -8,6 +8,7 @@
 #include <linux/bits.h>
 #include <linux/build_bug.h>
 #include <asm/barrier.h>
+#include <asm/cpu-features.h>
 
 #define __xchg_asm(amswap_db, m, val)		\
 ({						\
@@ -149,6 +150,23 @@ union __u128_halves {
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
@@ -242,7 +260,8 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, unsigned int
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

