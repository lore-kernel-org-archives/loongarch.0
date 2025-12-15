Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3163730BBB8
	for <loongarch@lists.linux.dev>; Mon, 15 Dec 2025 08:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765786965; cv=none; b=tvUKNQkTJ0crgyNQFA8MpBc3oZ+dlAF2msrqsGZqlpAJufhKcWh+aWWjaec0lEzxfgNhsV0rXEVRdOVZSh2GsEQ17lN3909MTYvG1Wq05Kb7c74En/wewtJnVlJD2uE5LRyde3s+4zugX2iHvAk6oaiph3mjRQmxxB/OaxyRPqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765786965; c=relaxed/simple;
	bh=1ydGX2ckPcbDTOaBlko8S4H7H/Su4Cxx0zFDcMsJB+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vohq28DiYZh11uqRMRCR6xOG+gtUUjubivYzzoPbjjMTNRc9xAK/zQXIZmqMyslZJrNQJykM/S1U0Cr+jxgvkaHfGMlFEnPi5A7Kg4YHyuw4gGFgwNZxmvhdxEZqo24rfYXfuwFPJN7zh0DiD3c67gMZ1l4oWRi1gfbUrQ9TTBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GHHcRbZw; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GHHcRbZw"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765786962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wbG/hNpFVx1z8RtgsmITOX2lkUrENsQeLW2JOQQh7ZM=;
	b=GHHcRbZw+d9jgizZdsPGQo+9tyHpkuyoJk3W/stLsT90YwnpanaBEGH465t9M7xx+yfGoK
	vxz9TQWo6F7XYyKpeBIkCORGnlbzyn0PqAo6oxx6aE0FjFy1T+YXv6CK8O4ooORjH7bX4U
	hmvPlpEI/g+47+4Wsg41NFeLGDlB7zw=
From: George Guo <dongtai.guo@linux.dev>
Date: Mon, 15 Dec 2025 16:22:03 +0800
Subject: [PATCH v6 3/4] LoongArch: Use spinlock to emulate 128-bit cmpxchg
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-2-v6-3-09a486e8df99@linux.dev>
References: <20251215-2-v6-0-09a486e8df99@linux.dev>
In-Reply-To: <20251215-2-v6-0-09a486e8df99@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 hengqi.chen@gmail.com
Cc: r@hev.cc, xry111@xry111.site, loongarch@lists.linux.dev, 
 linux-kernel@vger.kernel.org, George Guo <dongtai.guo@linux.dev>, 
 George Guo <guodongtai@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765786949; l=1861;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=PCzsPV7oGfaIDaA0cqRcyRoMNSMiHxOqDWfuZv8Lz68=;
 b=SBr2LlbovI73LnV5uHeY21CD3nGNBn4rnlKlI+sJpWsHzLVBQvc3oknqIzXC7P54IQvi8u4fN
 Lvkvnm7VTNIAgV9Iycg/TVCTxHMQH5tYLPdVl3nbR8p4t9i2eEnj2A5
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

