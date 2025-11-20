Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490712F6922
	for <loongarch@lists.linux.dev>; Thu, 20 Nov 2025 07:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763624773; cv=none; b=fzb75OdVpndCyfzprp7qlM8VNGMXbcCTc1yktzN+lrNxwzMF1CaA2Y7BgWTNpSgub22+pBvGO7PkA9TaANvPxZ2/FZFdONrZBUKP2tJh4MgPymIVw2Npf+5BCmPglL1TJ89kZf8lJXDsk5m3q26QQ/y/jcSuWuDJ6urb7/8PIxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763624773; c=relaxed/simple;
	bh=M9IJF0QqE/CUIplt4Ypi5JxjdIpXRP/DQZogYtwlUeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+kiU+3pw6WCwYRSUXAUyggfk7PrI52C97CUANutnYR6ctpIoNZuwXKhmwGc86xTqUcNfFRS1/QanbOUrUMUAxjbnWX014JTuzJWks53Mp1Mc/ecHKe0F4tPIci3Rs3zziv3UitLF5dsmVef1Cb3KLLYh47w7CYVWmxixzuyH+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vWZ9JYFt; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vWZ9JYFt"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763624765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9rhAmzQKy1QlAi9bxqJZ87/omtCYgasUwaYWtDWjRKw=;
	b=vWZ9JYFtXpSNstCcB4ldhFHX4NvvD2v8KBdHnSMoLuHwTxOsyW9eFWRbRIJd1YyGuSIWgC
	m33yim0+X+sHrml93+mQCx+QMbshFiLILsDE9aCluiszJW+KPEJnqUVqpVTjREOPYFJB2c
	HBKClfd5SIGEqp1K1yDbFwIqQ9RLu/k=
From: George Guo <dongtai.guo@linux.dev>
Date: Thu, 20 Nov 2025 15:45:44 +0800
Subject: [PATCH 1/2] LoongArch: Add 128-bit atomic cmpxchg support
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-2-v1-1-705bdc440550@linux.dev>
References: <20251120-2-v1-0-705bdc440550@linux.dev>
In-Reply-To: <20251120-2-v1-0-705bdc440550@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 George Guo <dongtai.guo@linux.dev>, George Guo <guodongtai@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763624762; l=2895;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=E4dH0lCfA0/Vn9r2SCAt72zFmg5zgSxT/3ix6mJFo48=;
 b=7CJ4RjmnPjKYLNGPC50a88tEFvWCnoJ3f6EL68J7Odj6VoKxlXwG7uUqD0AHvK51G8vWSp+g6
 951sSwFiYUoCC24dq6q2YGaXlgZKISgw11/BZmnQmCVzPIJZ6TcgHRR
X-Developer-Key: i=dongtai.guo@linux.dev; a=ed25519;
 pk=yHUJPGx/kAXutP/NSHpj7hWW0KQNlv3w9H6ju4qUoTM=
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

Implement 128-bit atomic compare-and-exchange using LoongArch's
LL.D/SC.Q instructions.

At the same time, fix BPF scheduler test failures (scx_central scx_qmap)
caused by kmalloc_nolock_noprof returning NULL due to missing
128-bit atomics. The NULL returns led to -ENOMEM errors during
scheduler initialization, causing test cases to fail.

Verified by testing with the scx_qmap scheduler (located in
tools/sched_ext/). Building with `make` and running
./tools/sched_ext/build/bin/scx_qmap.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/include/asm/cmpxchg.h | 46 ++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/include/asm/cmpxchg.h
index 979fde61bba8a42cb4f019f13ded2a3119d4aaf4..5f8d418595cf62ec3153dd3825d80ac1fb31e883 100644
--- a/arch/loongarch/include/asm/cmpxchg.h
+++ b/arch/loongarch/include/asm/cmpxchg.h
@@ -111,6 +111,43 @@ __arch_xchg(volatile void *ptr, unsigned long x, int size)
 	__ret;								\
 })
 
+union __u128_halves {
+	u128 full;
+	struct {
+		u64 low;
+		u64 high;
+	};
+};
+
+#define __cmpxchg128_asm(ld, st, ptr, old, new)				\
+({									\
+	union __u128_halves __old, __new, __ret;			\
+	volatile u64 *__ptr = (volatile u64 *)(ptr);			\
+									\
+	__old.full = (old);                                             \
+	__new.full = (new);						\
+									\
+	__asm__ __volatile__(						\
+	"1:   " ld "  %0, %4          # 128-bit cmpxchg low  \n"	\
+	"     " ld "  %1, %5          # 128-bit cmpxchg high \n"	\
+	"     bne     %0, %z6, 2f			     \n"	\
+	"     bne     %1, %z7, 2f                            \n"	\
+	"     move    $t0, %z8				     \n"	\
+	"     move    $t1, %z9				     \n"	\
+	"     " st "  $t0, $t1, %2                           \n"	\
+	"     beqz    $t0, 1b                                \n"	\
+	"2:                                                  \n"	\
+	__WEAK_LLSC_MB							\
+	: "=&r" (__ret.low), "=&r" (__ret.high),			\
+	  "=ZB" (__ptr[0]), "=ZB" (__ptr[1])				\
+	: "ZB" (__ptr[0]), "ZB" (__ptr[1]),				\
+	  "Jr" (__old.low), "Jr" (__old.high),				\
+	  "Jr" (__new.low), "Jr" (__new.high)				\
+	: "t0", "t1", "memory");					\
+									\
+	__ret.full;							\
+})
+
 static inline unsigned int __cmpxchg_small(volatile void *ptr, unsigned int old,
 					   unsigned int new, unsigned int size)
 {
@@ -198,6 +235,15 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, unsigned int
 	__res;								\
 })
 
+/* cmpxchg128 */
+#define system_has_cmpxchg128()		1
+
+#define arch_cmpxchg128(ptr, o, n)					\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 16);				\
+	__cmpxchg128_asm("ll.d", "sc.d", ptr, o, n);			\
+})
+
 #ifdef CONFIG_64BIT
 #define arch_cmpxchg64_local(ptr, o, n)					\
   ({									\

-- 
2.48.1

