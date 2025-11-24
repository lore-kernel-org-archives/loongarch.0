Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2C12F5A33
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 09:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763976434; cv=none; b=lqFUUidnAE6Y49s4b0Zmrp2X6o2mv+VKDa+BXDS87U6IpdjlKx4A8pyR5PVV6NBIY2ba/vR1tXbsZ9K9mFucB20b2D6DAXziLuNXnvD9sPVDRStsi1YjSZ3skuMRXESYsLNbAkNu3BkinHK1heKECeZx0YP9qM9fCasDyTr2b7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763976434; c=relaxed/simple;
	bh=ROs7aVMGd7QSW0w67kNl+MAzQw9HrvqAw/bzV5q6w8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DANXJpu84d1P95CKGveTYefbbwI3ke0hlbsb6+90SpnYym6AshxTOkukGtJD/FGRQx0yTOt38hH/+B9Rnx4y5sBMd3nFkg4Pw0QynVYDSJKwTFw1G10nEDxGZQJq3FtFfUnIkTzmxt4ZWURY7TLmB7JIHJd3Cc3H9u8oRkvSyLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lUjgZ2dc; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lUjgZ2dc"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763976429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2UCdL5Dtw7FwYWB+KMFiaCubBgbWuiZk6AShXGbGZg=;
	b=lUjgZ2dcjPegh6bqWl/UbYIEpnu2j0YB4yUlbMeATyZwSgQR7gNEaeGTMY7Bpnukq6+FCa
	/oPThrGlA/Kf1iBjWcqkglXpdUgtIWCZyH30G5zAo8rdpVU0HtPNdd/bqrSakpI8LhfX2A
	4s1oh0VZ7agvlF5U7+9v+3Yo7czWPC8=
From: George Guo <dongtai.guo@linux.dev>
Date: Mon, 24 Nov 2025 17:26:29 +0800
Subject: [PATCH v2 1/2] LoongArch: Add 128-bit atomic cmpxchg support
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-2-v2-1-b38216e25fd9@linux.dev>
References: <20251124-2-v2-0-b38216e25fd9@linux.dev>
In-Reply-To: <20251124-2-v2-0-b38216e25fd9@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 George Guo <dongtai.guo@linux.dev>, George Guo <guodongtai@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763976426; l=2753;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=aVNhmXR2XNaSkwR9saFKIS2IY44sjX8A+tWBndQSsNY=;
 b=5AN1Xt3V28nWnq4wyjMaofNVra7wiNfynsMnYkOENfEnwRgLGUHJV5sqEqs9fKPpbt0R75nhS
 SiSGW7l10SaApzj4p53OTHFHvBur23RgB9Hnt++1wEAEIACnh1Pn8cF
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
 arch/loongarch/include/asm/cmpxchg.h | 47 ++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/include/asm/cmpxchg.h
index 979fde61bba8a42cb4f019f13ded2a3119d4aaf4..757f6e82b9880d04f4883dc9a802312111aa4588 100644
--- a/arch/loongarch/include/asm/cmpxchg.h
+++ b/arch/loongarch/include/asm/cmpxchg.h
@@ -111,6 +111,44 @@ __arch_xchg(volatile void *ptr, unsigned long x, int size)
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
+#define __cmpxchg128_asm(ptr, old, new)					\
+({									\
+	union __u128_halves __old, __new, __ret;			\
+	volatile u64 *__ptr = (volatile u64 *)(ptr);			\
+									\
+	__old.full = (old);                                             \
+	__new.full = (new);						\
+									\
+	__asm__ __volatile__(						\
+	"1:   ll.d    %0, %3		# 128-bit cmpxchg low	\n"	\
+	"     dbar    0			# memory barrier	\n"	\
+	"     ld.d    %1, %4		# 128-bit cmpxchg high	\n"	\
+	"     bne     %0, %z5, 2f				\n"	\
+	"     bne     %1, %z6, 2f				\n"	\
+	"     move    $t0, %z7					\n"	\
+	"     move    $t1, %z8					\n"	\
+	"     sc.q    $t0, $t1, %2				\n"	\
+	"     beqz    $t0, 1b					\n"	\
+	"2:							\n"	\
+	__WEAK_LLSC_MB							\
+	: "=&r" (__ret.low), "=&r" (__ret.high),			\
+	  "=ZB" (__ptr[0])						\
+	: "ZC" (__ptr[0]), "m" (__ptr[1]),				\
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
@@ -198,6 +236,15 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, unsigned int
 	__res;								\
 })
 
+/* cmpxchg128 */
+#define system_has_cmpxchg128()		1
+
+#define arch_cmpxchg128(ptr, o, n)					\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 16);				\
+	__cmpxchg128_asm(ptr, o, n);			\
+})
+
 #ifdef CONFIG_64BIT
 #define arch_cmpxchg64_local(ptr, o, n)					\
   ({									\

-- 
2.48.1

