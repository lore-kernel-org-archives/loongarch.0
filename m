Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9C2328624
	for <loongarch@lists.linux.dev>; Mon,  5 Jan 2026 10:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610531; cv=none; b=czwrSR7ncBpOl+Y1Ndj+SB2IwGH21ua5//eXqLuj3zrUe5Ue2LzGI1VZa1AKY7tavwbFVAhpdMDPbn+LNSBsmhkFHZ57dmqwJ2nMEmUIfJKM9NXxq0hUTO0YOwl+lgTQDoLUbuaomOsH0jnC3u2ZeSKCZZ6qRlWiaHQX0AQDlcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610531; c=relaxed/simple;
	bh=/uklI3Yx2aTfLR0NYka6DpqDTM5XhBglwtgakW9Stjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gk/98rHlMq79zWzS9jyvGHLxdVwlYOD/O2RAiwfvGil8eajQGkCSDryezD1ugHO1TWUu3C7ZtWXbwsdGcFQo9ARBs3C650bwF2OGzXtbQaaj+jeoPwfY2Ixa0//WfjH77jDKv0J2CH8kHnXOr4isEJ6dY3/KhtA9nHsVLbp5F1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ajQ6d8y5; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ajQ6d8y5"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767610527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D6rvEwZD8QRZ7Ipur3Iub81lCQbfAfUNvjx39IoX1tE=;
	b=ajQ6d8y5Dd4dTaCmrNihZvpstMNcCL7nHJ7+zCqCbHw0BJBlnndYfS6B0WCdlUZgeizK/4
	0m/Qj9Q1I06Oh+fEaRj1/ChBU6vj8LSL6Xfxd4KozPlItbGN2Kh7vYrGvLQhnyQr5AETJK
	xXCLQi5n1GIIt8SR27REQFpp7VHBwbI=
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org
Cc: dongtai.guo@linux.dev,
	hengqi.chen@gmail.com,
	kernel@xen0n.name,
	lianyangyang@kylinos.cn,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	r@hev.cc,
	xry111@xry111.site,
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH v9 loongarch-next 3/4] LoongArch: Add 128-bit atomic cmpxchg support
Date: Mon,  5 Jan 2026 18:55:13 +0800
Message-ID: <20260105105514.76021-4-dongtai.guo@linux.dev>
In-Reply-To: <20260105105514.76021-1-dongtai.guo@linux.dev>
References: <20260105105514.76021-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Link: https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/commit/?id=5fb750e8a9ae
Acked-by: Hengqi Chen <hengqi.chen@gmail.com>
Tested-by: Hengqi Chen <hengqi.chen@gmail.com>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/include/asm/cmpxchg.h | 48 ++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/include/asm/cmpxchg.h
index 0494c2ab553e..d25e25d8fc9e 100644
--- a/arch/loongarch/include/asm/cmpxchg.h
+++ b/arch/loongarch/include/asm/cmpxchg.h
@@ -8,6 +8,7 @@
 #include <linux/bits.h>
 #include <linux/build_bug.h>
 #include <asm/barrier.h>
+#include <asm/cpu-features.h>
 
 #define __xchg_amo_asm(amswap_db, m, val)	\
 ({						\
@@ -137,6 +138,44 @@ __arch_xchg(volatile void *ptr, unsigned long x, int size)
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
+#define __arch_cmpxchg128(ptr, old, new)					\
+({									\
+	union __u128_halves __old, __new, __ret;			\
+	volatile u64 *__ptr = (volatile u64 *)(ptr);			\
+									\
+	__old.full = (old);                                             \
+	__new.full = (new);						\
+									\
+	__asm__ __volatile__(						\
+	"1:   ll.d    %0, %3		# 128-bit cmpxchg low	\n"	\
+	__WEAK_LLSC_MB							\
+	"     ld.d    %1, %4		# 128-bit cmpxchg high	\n"	\
+	"     bne     %0, %z5, 2f				\n"	\
+	"     bne     %1, %z6, 2f				\n"	\
+	"     move    $t0, %z7					\n"	\
+	"     move    $t1, %z8					\n"	\
+	"     sc.q    $t0, $t1, %2				\n"	\
+	"     beqz    $t0, 1b					\n"	\
+	"2:							\n"	\
+	__WEAK_LLSC_MB							\
+	: "=&r" (__ret.low), "=&r" (__ret.high)				\
+	: "r" (__ptr),							\
+	  "ZC" (__ptr[0]), "m" (__ptr[1]),				\
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
@@ -224,6 +263,15 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, unsigned int
 	__res;								\
 })
 
+/* cmpxchg128 */
+#define system_has_cmpxchg128()		(cpu_has_scq)
+
+#define arch_cmpxchg128(ptr, o, n)					\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 16);				\
+	__arch_cmpxchg128(ptr, o, n);					\
+})
+
 #ifdef CONFIG_64BIT
 #define arch_cmpxchg64_local(ptr, o, n)					\
   ({									\
-- 
2.43.0

