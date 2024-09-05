Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD721922C7
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 06:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725519287; cv=none; b=g82P+FogxOFP2EFnZs/ULh10Wg0X4gZp613RYfN2glgNrfxPm5eNCMhpDiaR7i2z0Gp3OydyZEqVEc9tZbS/l9Gve99ZptOLq3fOQcSPvZDs5S9ZwkzuxWdntdG54ZRgs/kSTXQI1pvnlmd4YF7DDmDOLSjItVpl9ZzfxIGq69s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725519287; c=relaxed/simple;
	bh=QDgXDBvyQJOMWeoFGPVE0g8L+AOYRGndhi4MRkAUOHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KsUPXXWOGrwmoPGyrDtf1Ktq8AgBKsvxdreKLVGScFQqIpUIogTgckgqG4IFAMZQgjwSEX3yOFBpQ3at4WbssrDDxyiDl5WpzN1AVPUUz/BsEKnYAOsX92I/HuXQQ4Wxmu40yzAvNkJDdyzkSZqS91NRLpyc0el2JbNDw4ADadg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pgy0YozV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pgy0YozV"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42c94eb9822so2555835e9.0
        for <loongarch@lists.linux.dev>; Wed, 04 Sep 2024 23:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725519283; x=1726124083; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qyslWu7uboUrkYXcGmXap3x8F7eNeExx5bL2W+WbMOw=;
        b=Pgy0YozVow7R/Gg6JG3RMCQV+I/tv/iwyRqoWv5L0BBURu9FhjRzK7ZjIFh3vJvB99
         yKcny189hijMcFV8M2vMZIs07Dua8zDAqpKPvwfLUMIH9q3gLlqEBWfhp8od2R3sihOG
         sd8BFvE2gk4J3a6me27QR2zinC03ODgINe6YcSMf2TMzMTyJAuKhpvXh7QAuKcrPf7OQ
         RS9dbD+tKJnxQh0ihxcIT26A/DMLrXTtnBDCLp/dp6Bai10nMCTgck+rB9mS7E0CScKZ
         LT0VC1FPHmNI4bDETFV8WwrplOPQ+aW2cV+4/NRsorD3NaHu1L/07dQ5Q3zYrkj6qkns
         5UjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725519283; x=1726124083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qyslWu7uboUrkYXcGmXap3x8F7eNeExx5bL2W+WbMOw=;
        b=wnMH1mvWTZwmcDsqJ6cWDHZHbNuGO8v1pjlZrW07019onLXhHHSP4njYCwVPRHrMIw
         6CuXlXEs3TcssPtkY8mxUO6+ImBYu/9qyewhZ6B7HYbgoNkwH6+Qlyc8k1iwHcrQ5R0u
         E58H2Fbfcj3EKfhSWEXparYtADH3cQwfADzojWZT1oPtSwg2Y8r4p9peQ4L1B5f6XVh4
         vMCaAGJOAdT4oMX2jaT6yI3HNwF0M4cGfsOeGP5Ce5+K6MW89FiDrrSJruMTCEwc7agK
         nhYVcIvmtWcp5JZeosoZu4mC0kgN8bEw4Uk3qBPNC4ezNwpXMa2p8elWfHBJSnX5qDTk
         mr0A==
X-Gm-Message-State: AOJu0Yy7xtjIU+kEQG8UBdiK8Mo34iN0CIrF49OGijJEdNM4Xi8VjUkk
	ofmanyiP3mgU3h+M0ZVaLHFhRrmcUL2LbK3R/ov1CTthYE2GVvOyhU7EyTw6
X-Google-Smtp-Source: AGHT+IE/TXG3fOuCpU+RcDGLzyLz2FXHj81+VC9o1W4DUSuoU3W7IrdcOroIDd+Il9dmAqWXd9KTUQ==
X-Received: by 2002:a05:600c:5122:b0:428:1d27:f3db with SMTP id 5b1f17b1804b1-42c7b5f0fe4mr94861595e9.35.1725519282410;
        Wed, 04 Sep 2024 23:54:42 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bba57bb20sm201169855e9.4.2024.09.04.23.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 23:54:42 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Xi Ruoyao <xry111@xry111.site>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v3] LoongArch/percpu: Simplify _percpu_read() and _percpu_write()
Date: Thu,  5 Sep 2024 08:54:07 +0200
Message-ID: <20240905065438.802898-1-ubizjak@gmail.com>
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
Cc: Xi Ruoyao <xry111@xry111.site>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
v2: Add a missing cast and a missing coma in the asm template,
    reported by kernel test robot. Some formatting changes.
v3: Check the type of _val in _percpu_write().
---
 arch/loongarch/include/asm/percpu.h | 135 ++++++++++------------------
 1 file changed, 46 insertions(+), 89 deletions(-)

diff --git a/arch/loongarch/include/asm/percpu.h b/arch/loongarch/include/asm/percpu.h
index 8f290e5546cf..90ece62ec24c 100644
--- a/arch/loongarch/include/asm/percpu.h
+++ b/arch/loongarch/include/asm/percpu.h
@@ -68,75 +68,6 @@ PERCPU_OP(and, and, &)
 PERCPU_OP(or, or, |)
 #undef PERCPU_OP
 
-static __always_inline unsigned long __percpu_read(void __percpu *ptr, int size)
-{
-	unsigned long ret;
-
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
-
-	return ret;
-}
-
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
-
 static __always_inline unsigned long __percpu_xchg(void *ptr, unsigned long val, int size)
 {
 	switch (size) {
@@ -157,6 +88,44 @@ static __always_inline unsigned long __percpu_xchg(void *ptr, unsigned long val,
 	return 0;
 }
 
+#define __pcpu_op_1(op)		op ".b "
+#define __pcpu_op_2(op)		op ".h "
+#define __pcpu_op_4(op)		op ".w "
+#define __pcpu_op_8(op)		op ".d "
+
+#define _percpu_read(size, _pcp)					\
+({									\
+	unsigned long __pcp_ret;					\
+									\
+	__asm__ __volatile__(						\
+		__pcpu_op_##size("ldx") "%[ret], $r21, %[ptr]	\n"	\
+		: [ret] "=&r"(__pcp_ret)				\
+		: [ptr] "r"(&(_pcp))					\
+		: "memory");						\
+	(typeof(_pcp))__pcp_ret;					\
+})
+
+#define __pcpu_cast_1(val)	(((unsigned long) val) & 0xff)
+#define __pcpu_cast_2(val)	(((unsigned long) val) & 0xffff)
+#define __pcpu_cast_4(val)	(((unsigned long) val) & 0xffffffff)
+#define __pcpu_cast_8(val)	((unsigned long) val)
+
+#define _percpu_write(size, _pcp, _val)					\
+do {									\
+	unsigned long __pcp_val = __pcpu_cast_##size(_val);		\
+									\
+	if (0) {		                                        \
+		typeof(_pcp) pto_tmp__;					\
+		pto_tmp__ = (_val);					\
+		(void)pto_tmp__;					\
+	}								\
+	__asm__ __volatile__(						\
+		__pcpu_op_##size("stx") "%[val], $r21, %[ptr]	\n"	\
+		:							\
+		: [val] "r"(__pcp_val), [ptr] "r"(&(_pcp))		\
+		: "memory");						\
+} while (0)
+
 /* this_cpu_cmpxchg */
 #define _protect_cmpxchg_local(pcp, o, n)			\
 ({								\
@@ -167,18 +136,6 @@ static __always_inline unsigned long __percpu_xchg(void *ptr, unsigned long val,
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
@@ -215,15 +172,15 @@ do {									\
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

