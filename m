Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3592459C5
	for <loongarch@lists.linux.dev>; Fri,  5 Dec 2025 06:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764916170; cv=none; b=OlPuKakUFseWgI0zFKJrFxTRL3n5f4tbm0gVNz3Wxax8Kj7Z9xJsnC4EcYKUuPT/ZuU+IqPslY+Bu1iLofgWc/kb1b+Xbf5YlaU2BA0HInmcJOsWAnUqrplL+JcfAWSX36YDUBseR31plM2z9nbYuobDKFbmjTOyI29lLgS3xC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764916170; c=relaxed/simple;
	bh=CHhZrO+seigQep4EcilCQI+NM2vFrNNb290ys6kF5LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H3h0BBo1bc79SszEe7w+LgBKqmTBct7MCc99YQbe4xSMB7thkymIgXJFHHR4pWC3DTu26zXtAtDgsp4TCCzCFd4y8A8ipSPaQenpFDKwBP4eUk2IH1TPu2BV+RULVlNsZ1IxwvVwXQKTX09NWhnqc3Ea4PmCYHDFEF1ruC5fnr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MBUeISDt; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MBUeISDt"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764916166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6KDuNOF7zwOqq4SGBvigFpNcY4PTnIkUpXxey+/fvOw=;
	b=MBUeISDtkCNLQKQ3KegCfIWXqWWsr3INUUNFKXiAV6d/33DjeOP0l005PdB/8zMSkIj9HO
	H91HL+h439tF0Y6NwHeo1ksSqKyoGt2uwYBaiHFRORS+YUibepNkbA9xJ/V+wX23c2Wqp2
	YrKyZuEFHFBRMVdA0emM2yk+ahiQT0A=
From: George Guo <dongtai.guo@linux.dev>
Date: Fri, 05 Dec 2025 14:29:04 +0800
Subject: [PATCH v4 1/4] LoongArch: Add 128-bit atomic cmpxchg support
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-2-v4-1-e5ab932cf219@linux.dev>
References: <20251205-2-v4-0-e5ab932cf219@linux.dev>
In-Reply-To: <20251205-2-v4-0-e5ab932cf219@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 George Guo <dongtai.guo@linux.dev>, George Guo <guodongtai@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764916159; l=2734;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=G9Rok0Fvrnc2B8Tx4x6JiuOW/GjTomdEObq8AwW7z40=;
 b=p6MsxaxhhQBgLsZkCDMOZpfjMMOauwytYCV0P0szR5s/vExh0iCmIv+ktcOeYgkgnloNQ+3Dg
 wE2LJyhSOFxA0cfV3DJ+p1MB3JpB5XP7nu8bih36dIu7AAe/Sxk9GEL
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
index 979fde61bba8a42cb4f019f13ded2a3119d4aaf4..f7a0a9a032c513196ef186a5493b500787e0e9b6 100644
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
@@ -198,6 +236,15 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, unsigned int
 	__res;								\
 })
 
+/* cmpxchg128 */
+#define system_has_cmpxchg128()		1
+
+#define arch_cmpxchg128(ptr, o, n)					\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 16);				\
+	__cmpxchg128_asm(ptr, o, n);					\
+})
+
 #ifdef CONFIG_64BIT
 #define arch_cmpxchg64_local(ptr, o, n)					\
   ({									\

-- 
2.49.0

