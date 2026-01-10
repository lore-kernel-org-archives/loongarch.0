Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0D0345CAF
	for <loongarch@lists.linux.dev>; Sat, 10 Jan 2026 13:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768050702; cv=none; b=QzSlBC8X9Et06L2KMPX4b1OJYkgAzvCubB2rorwMUWnH6boW4NqldM44YV/aQvAKMlWWM6ahjpZn+IAEYZvKzK4OIbDARA3jqal3dSHnO/De48xgI6SbIrCZMTnl9jVV6Rl3OV+JBCDdzc4fXDZSV5qfz/KYUJPJPfXn+Xtwk5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768050702; c=relaxed/simple;
	bh=uOZnKZf6yAtdKjU6Ca5rsP0oyljxPvc5Qx6oKowl4C0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ADap0Jk6ZMStK4gqwtCeXwOOfRy7/u9HKj/QALCZA9Mjv78jByROL6LdosLbeomqpJ0ZR87+HwaqFGkrTeTbjfHccFywAYgrSpz5NHZWb6BPLH2xCLO8c6tr4t1ttrEhU1d8EtT5FXvnjJmdAJu1ozBbGjh3ZSIpPR/J9nccz/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=brdWQvxW; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="brdWQvxW"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768050696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4UEks7loLN2fnIS414ze+LIrWa/uXQyvGPLMWxyd64o=;
	b=brdWQvxWbyGqaic7rTdaeZejS0KQ2y1KAK38KOqQ0pIN9repa2QbLx6q8yS1cUgbBbdeAA
	3HTXZa9RmuihpZYu/HTpMO50jjTOxTBHC9Iry+sZjVX3nmshQYOhPWZFLbg1caxPGURyvR
	9mIfeTFxl+gz+yRmyiSx12JSZzHktd4=
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org
Cc: dongtai.guo@linux.dev,
	guodongtai@kylinos.cn,
	hengqi.chen@gmail.com,
	kernel@xen0n.name,
	lianyangyang@kylinos.cn,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	r@hev.cc,
	xry111@xry111.site
Subject: [PATCH v10 loongarch-next 2/3] LoongArch: Add 128-bit atomic cmpxchg support
Date: Sat, 10 Jan 2026 21:11:23 +0800
Message-ID: <20260110131124.99866-3-dongtai.guo@linux.dev>
In-Reply-To: <20260110131124.99866-1-dongtai.guo@linux.dev>
References: <20260110131124.99866-1-dongtai.guo@linux.dev>
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
 arch/loongarch/Kconfig               |  2 ++
 arch/loongarch/include/asm/cmpxchg.h | 48 ++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 730f34214519..f9845ebec1a4 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -114,6 +114,7 @@ config LOONGARCH
 	select GENERIC_TIME_VSYSCALL
 	select GPIOLIB
 	select HAS_IOPORT
+	select HAVE_ALIGNED_STRUCT_PAGE
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_BITREVERSE
 	select HAVE_ARCH_JUMP_LABEL
@@ -130,6 +131,7 @@ config LOONGARCH
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select HAVE_ARCH_USERFAULTFD_MINOR if USERFAULTFD
 	select HAVE_ASM_MODVERSIONS
+	select HAVE_CMPXCHG_DOUBLE
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_DEBUG_KMEMLEAK
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
2.49.0

