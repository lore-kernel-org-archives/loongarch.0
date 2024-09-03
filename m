Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E490E1AD262
	for <loongarch@lists.linux.dev>; Tue,  3 Sep 2024 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725359031; cv=none; b=Q6qGiw5B+LOk6qDcr0BqBzDi6RjNdC2A2r26fZBUEABjcHpdhHnp009UhBxdKXsl3nSmFBEPdw2P06eJAOceZI2eXg3Vy6zy9G+c++3tq1NuFXnkO60nUF8NY1zTNFdVV8nDbL90eJI9FQoXdh0hAmhcnUC+KF3RD4uzLjhXnYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725359031; c=relaxed/simple;
	bh=uDUb6Kl+yRsf202h+UBICiKjtl7trH+w4Hzt+76v/Og=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=glFei+eirkJl62LiX2I2DUapgqI6z333zwbNOru7cKCSAiQVTvlieoL22yo3MDdVIAPsShdw3CaeK7yoIdP3oaTBqUCRmfLavi7/qIEEp/07uz0U0flNl0xpjrdCmKdT2V5lp1bA0ArueXASceim2yVFE9wwtNPxRWrW9/KDeBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXjY2YAu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXjY2YAu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42bbf138477so30172915e9.2
        for <loongarch@lists.linux.dev>; Tue, 03 Sep 2024 03:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725359028; x=1725963828; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yuL2Wilyj58PiNHXcsKnDwClQnWoQYNkYuKGppGZI2Y=;
        b=dXjY2YAuKb/qbmYN5Za6n+xF5JrS45RZkmq6rf70X2ZDJalo/WNsPo7Gr2fB5iyKH8
         ZZSFe3WrzeE5BLukJUhQ723K2ai70vfHrq98oUZJO0GcJrglpzhSPZTWuJ+XXibj3GcD
         jH0pFfqR7DgiTrDy5rt9THp4IPL0F4R7VZvzTdrFYvLEb6vzldTosucHTYnIG/pMLe8s
         ToKccGOv2c1iEULaSfeJTdigsjF0FMBMEa0oKyDH3RkFC4R2EVz7u0/eaRZbovWcyA3E
         ucDqBtB1IsyiN77HvCud/lOom6MZ5+6A90YBcdy1opxCoOQRBccANXxobPT9JUEDbEB0
         xxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725359028; x=1725963828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yuL2Wilyj58PiNHXcsKnDwClQnWoQYNkYuKGppGZI2Y=;
        b=sSjGe/DDtXRy2nyLK8C0ZOir1T98P2FnCErJqHZiLRK+WHm3uxA/5bfXT/zHImhWc7
         JRKnAqjjP/+DrGHE/FXGXICo6J2vpebehiJM2hF3d92s6kNH9VHzqZgzBjWruQ0tJPi0
         OVZ+wCOqSSkjenJtSVtw5knOmLfsioPWNg3lLY97udqzTcyRlTl6xPzTtEPzE3Ni6tjg
         Z7aQWsDAzwhV0Z1wdAuC9aHxXKTwWDOJuoQ+QYB0aQ6MkFBvHr5zRNiRD/g2LVWMumny
         mbBGATUqmsHKJBKq5JGfg3L2IDq5PxMEAXaWzQsXDOA0PuiNqBCSUIhndnCXCk7RN04s
         BIKw==
X-Gm-Message-State: AOJu0YyJ6C2wPYOhXLy9BiWpYAQUpXGofsoR/+nrfSVr/9mdAOGjre0Y
	MCNBEL1MnnBNIKjJSfUlkCPq6wNIzvdB/Lr5G6HbrVI9uMHr0MmPdyay65a9
X-Google-Smtp-Source: AGHT+IG7a/7PC8L6V63PjZG2vdWRcpHaI+5y8+7xoEPqoqFgeb1dCY+yS9+wPWqhU8YNx1eNmBiXsA==
X-Received: by 2002:a05:600c:5110:b0:426:6710:223c with SMTP id 5b1f17b1804b1-42c880ef921mr25143895e9.9.1725359027108;
        Tue, 03 Sep 2024 03:23:47 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bacaac810sm185955585e9.33.2024.09.03.03.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 03:23:46 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] longsoon/percpu: Simplify _percpu_read() and _percpu_write()
Date: Tue,  3 Sep 2024 12:23:18 +0200
Message-ID: <20240903102342.36957-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_percpu_read() and _percpu_write() macros call __percpu_read()
and __percpu_write() static inline functions that result in a single
assembly instruction. Percpu infrastructure expects its leaf
definitions to encode the size of their percpu variable, so the patch
merges asm clauses from the static inline function into the
corresponding leaf macros.

The secondary effect of this change is to avoid explicit __percpu
function arguments. Currently, __percpu macro is defined in
include/linux/compiler_types.h, but with proposed patch [1],
__percpu definition will need macros from include/asm-generic/percpu.h,
creating forward dependency loop.

The proposed solution is the same as x86 architecture uses.

Patch is compile tested only.

[1] https://lore.kernel.org/lkml/20240812115945.484051-4-ubizjak@gmail.com/

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
 arch/loongarch/include/asm/percpu.h | 120 ++++++++--------------------
 1 file changed, 35 insertions(+), 85 deletions(-)

diff --git a/arch/loongarch/include/asm/percpu.h b/arch/loongarch/include/asm/percpu.h
index 8f290e5546cf..c0f8e787223c 100644
--- a/arch/loongarch/include/asm/percpu.h
+++ b/arch/loongarch/include/asm/percpu.h
@@ -68,74 +68,36 @@ PERCPU_OP(and, and, &)
 PERCPU_OP(or, or, |)
 #undef PERCPU_OP
 
-static __always_inline unsigned long __percpu_read(void __percpu *ptr, int size)
-{
-	unsigned long ret;
+#define __pcpu_op_1(op)		op ".b "
+#define __pcpu_op_2(op)		op ".h "
+#define __pcpu_op_4(op)		op ".w "
+#define __pcpu_op_8(op)		op ".d "
 
-	switch (size) {
-	case 1:
-		__asm__ __volatile__ ("ldx.b %[ret], $r21, %[ptr]	\n"
-		: [ret] "=&r"(ret)
-		: [ptr] "r"(ptr)
-		: "memory");
-		break;
-	case 2:
-		__asm__ __volatile__ ("ldx.h %[ret], $r21, %[ptr]	\n"
-		: [ret] "=&r"(ret)
-		: [ptr] "r"(ptr)
-		: "memory");
-		break;
-	case 4:
-		__asm__ __volatile__ ("ldx.w %[ret], $r21, %[ptr]	\n"
-		: [ret] "=&r"(ret)
-		: [ptr] "r"(ptr)
-		: "memory");
-		break;
-	case 8:
-		__asm__ __volatile__ ("ldx.d %[ret], $r21, %[ptr]	\n"
-		: [ret] "=&r"(ret)
-		: [ptr] "r"(ptr)
-		: "memory");
-		break;
-	default:
-		ret = 0;
-		BUILD_BUG();
-	}
+#define _percpu_read(size, _pcp)					\
+({									\
+	unsigned long __pcp_ret;					\
+									\
+	__asm__ __volatile__ (__pcpu_op_##size("ldx") "%[ret], $r21, %[ptr]	\n" \
+		: [ret] "=&r"(__pcp_ret)				\
+		: [ptr] "r"(&(_pcp))					\
+		: "memory");						\
+	(typeof(_pcp))__pcp_ret;					\
+})
 
-	return ret;
-}
+#define __pcpu_cast_1(val)	(((unsigned long) val) & 0xff)
+#define __pcpu_cast_2(val)	(((unsigned long) val) & 0xffff)
+#define __pcpu_cast_4(val)	(((unsigned long) val) & 0xffffffff)
+#define __pcpu_cast_8(val)	(val)
 
-static __always_inline void __percpu_write(void __percpu *ptr, unsigned long val, int size)
-{
-	switch (size) {
-	case 1:
-		__asm__ __volatile__("stx.b %[val], $r21, %[ptr]	\n"
-		:
-		: [val] "r" (val), [ptr] "r" (ptr)
-		: "memory");
-		break;
-	case 2:
-		__asm__ __volatile__("stx.h %[val], $r21, %[ptr]	\n"
-		:
-		: [val] "r" (val), [ptr] "r" (ptr)
-		: "memory");
-		break;
-	case 4:
-		__asm__ __volatile__("stx.w %[val], $r21, %[ptr]	\n"
-		:
-		: [val] "r" (val), [ptr] "r" (ptr)
-		: "memory");
-		break;
-	case 8:
-		__asm__ __volatile__("stx.d %[val], $r21, %[ptr]	\n"
-		:
-		: [val] "r" (val), [ptr] "r" (ptr)
-		: "memory");
-		break;
-	default:
-		BUILD_BUG();
-	}
-}
+#define _percpu_write(size, _pcp, _val)					\
+do {									\
+	unsigned long __pcp_val = __pcpu_cast_##size(_val);		\
+									\
+	__asm__ __volatile__ (__pcpu_op_##size("stx") "%[val] $r21, %[ptr]	\n" \
+		:							\
+		: [val] "r"(__pcp_val), [ptr] "r"(&(_pcp))		\
+		: "memory");						\
+} while (0)
 
 static __always_inline unsigned long __percpu_xchg(void *ptr, unsigned long val, int size)
 {
@@ -167,18 +129,6 @@ static __always_inline unsigned long __percpu_xchg(void *ptr, unsigned long val,
 	__ret;							\
 })
 
-#define _percpu_read(pcp)						\
-({									\
-	typeof(pcp) __retval;						\
-	__retval = (typeof(pcp))__percpu_read(&(pcp), sizeof(pcp));	\
-	__retval;							\
-})
-
-#define _percpu_write(pcp, val)						\
-do {									\
-	__percpu_write(&(pcp), (unsigned long)(val), sizeof(pcp));	\
-} while (0)								\
-
 #define _pcp_protect(operation, pcp, val)			\
 ({								\
 	typeof(pcp) __retval;					\
@@ -215,15 +165,15 @@ do {									\
 #define this_cpu_or_4(pcp, val) _percpu_or(pcp, val)
 #define this_cpu_or_8(pcp, val) _percpu_or(pcp, val)
 
-#define this_cpu_read_1(pcp) _percpu_read(pcp)
-#define this_cpu_read_2(pcp) _percpu_read(pcp)
-#define this_cpu_read_4(pcp) _percpu_read(pcp)
-#define this_cpu_read_8(pcp) _percpu_read(pcp)
+#define this_cpu_read_1(pcp) _percpu_read(1, pcp)
+#define this_cpu_read_2(pcp) _percpu_read(2, pcp)
+#define this_cpu_read_4(pcp) _percpu_read(4, pcp)
+#define this_cpu_read_8(pcp) _percpu_read(8, pcp)
 
-#define this_cpu_write_1(pcp, val) _percpu_write(pcp, val)
-#define this_cpu_write_2(pcp, val) _percpu_write(pcp, val)
-#define this_cpu_write_4(pcp, val) _percpu_write(pcp, val)
-#define this_cpu_write_8(pcp, val) _percpu_write(pcp, val)
+#define this_cpu_write_1(pcp, val) _percpu_write(1, pcp, val)
+#define this_cpu_write_2(pcp, val) _percpu_write(2, pcp, val)
+#define this_cpu_write_4(pcp, val) _percpu_write(4, pcp, val)
+#define this_cpu_write_8(pcp, val) _percpu_write(8, pcp, val)
 
 #define this_cpu_xchg_1(pcp, val) _percpu_xchg(pcp, val)
 #define this_cpu_xchg_2(pcp, val) _percpu_xchg(pcp, val)
-- 
2.46.0

