Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA71141987
	for <loongarch@lists.linux.dev>; Fri,  6 Sep 2024 06:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725605895; cv=none; b=bwJLQk7shARHZfYuRmE+F0Mw6RAEDAWdBtzAHupdsoQfJMPdA/CDF3KjmYr4TGqKefN7vDG+CZzSgJoDHGCMTBAXKvXMUcUrT3hn3s+GpzMbXFlnxxOUIuauDxg3FmRN4ZENFb3jyJFgGOz2n+rIxT/5YWi99Pef03fb/59ldO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725605895; c=relaxed/simple;
	bh=iyZLeCErRRVCM118tHhidzOmBpbdS6KX4+/vAwz4h3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jm9l8Im83bzXkDIqcNUizX6+/nKCHJ/kdtZPmb8qD5Sx8PEuEo9CMkCP20wNQ8xSOQiocMGQr8tfizHGmWlRaFBt0Y1zOGEmJX2XAmePEtZtBoSWcFalV8WNlacpwh04tMFF0/RSKY3JMGiIw9k+Zhqxyv1gzaDj9cUGfuOZrd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEFEIdiB; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEFEIdiB"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-374c1e5fe79so971118f8f.1
        for <loongarch@lists.linux.dev>; Thu, 05 Sep 2024 23:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725605892; x=1726210692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rSsbgZ07HMll75bsRy7iLPZ/YB3oKw1wz+dcZF7g3q0=;
        b=EEFEIdiBxkwEqHB6l7++kZpBHXpw1MqVLXAT+p7PiDOqXHR/ROO2XHtta7IXH0EYOS
         lztnZ00V5BTzGqaY0nUokBrtIsiXPQvJeAJ0bI7mFwwwMyAUEJwrPFYdF0nuN02PT5na
         8k6gpwO+A6L6bbotUDbGut0g5bI2zu9TvxoWxgSXTNENarTvSsFBvMV8ZNbWTGxmt/p0
         refVFjDFvd1eVJa4eGCrK/5r6de3DO8Amt8vK9RvAeokLbzy53VHnf0vykeW0CA6mm8s
         6w/cV3kyPD/XPQKoVEvKvZrPzaif8QKXzsEECDXDD8WIigIQPd5aIyMqfmbjRUXj1YwY
         imKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725605892; x=1726210692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSsbgZ07HMll75bsRy7iLPZ/YB3oKw1wz+dcZF7g3q0=;
        b=PzwDY2zR4JMJ95d6P9d3JjNnoxJG4FlbYO0byjQ8zQ/12K7tWFtuiCpmUkS0CFOxoN
         kgetf/FIK6QlkOPY0n2Z3l6HK9wN5Eg6UZR2ukD5JK24Bd1OOoPf574gXB8WEF7MKlbw
         RKM1W0RMcd6GQNJVnH9lP2dyM4u+bBiBSiDXLMpy6XqLKpFnDFMxQEOLtd/RFEUNIR8J
         vqz+1DoIXk/QFsXgKeEg/SKYwyaHxbXXVYmVNR1yCE0VQ0iPK48qhKK2tlP4bFQuRwCh
         7grUAL2nWDdMBd36b4bWBbWA77MHsQsHCel1ftFPycKsBtygOGwxeNHCANbKGZvUydKR
         gp1g==
X-Gm-Message-State: AOJu0YxSuTnjUGXWQQb6hWmXvs2Bu0p9uy0Vuo60HoW1SC5TFWKdsfIK
	3RAm7kLshfUnIOx7pYXmS5AsNT2oyIkgMyzt0evAzsXl8cHi7rsugPrIgBXTe3E=
X-Google-Smtp-Source: AGHT+IGrAksHcNrKI3rBAHsYnPIBhUHGuDza2sIIfw/+RgIxhqfnNhF90uhKKTYlWQlDara/0i8XHA==
X-Received: by 2002:adf:f345:0:b0:374:bf1b:1c20 with SMTP id ffacd0b85a97d-378895d5070mr852293f8f.23.1725605890805;
        Thu, 05 Sep 2024 23:58:10 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374ca0cef22sm12702367f8f.106.2024.09.05.23.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 23:58:10 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Xi Ruoyao <xry111@xry111.site>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v4] LoongArch/percpu: Simplify _percpu_read() and _percpu_write()
Date: Fri,  6 Sep 2024 08:57:05 +0200
Message-ID: <20240906065807.1103275-1-ubizjak@gmail.com>
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
v4: Remove type ckecking of _val. Remove unnecessary zero-extensions
    and truncations.
---
 arch/loongarch/include/asm/percpu.h | 124 ++++++++--------------------
 1 file changed, 35 insertions(+), 89 deletions(-)

diff --git a/arch/loongarch/include/asm/percpu.h b/arch/loongarch/include/asm/percpu.h
index 8f290e5546cf..87be9b14e9da 100644
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
@@ -157,6 +88,33 @@ static __always_inline unsigned long __percpu_xchg(void *ptr, unsigned long val,
 	return 0;
 }
 
+#define __pcpu_op_1(op)		op ".b "
+#define __pcpu_op_2(op)		op ".h "
+#define __pcpu_op_4(op)		op ".w "
+#define __pcpu_op_8(op)		op ".d "
+
+#define _percpu_read(size, _pcp)					\
+({									\
+	typeof(_pcp) __pcp_ret;						\
+									\
+	__asm__ __volatile__(						\
+		__pcpu_op_##size("ldx") "%[ret], $r21, %[ptr]	\n"	\
+		: [ret] "=&r"(__pcp_ret)				\
+		: [ptr] "r"(&(_pcp))					\
+		: "memory");						\
+									\
+	__pcp_ret;							\
+})
+
+#define _percpu_write(size, _pcp, _val)					\
+do {									\
+	__asm__ __volatile__(						\
+		__pcpu_op_##size("stx") "%[val], $r21, %[ptr]	\n"	\
+		:							\
+		: [val] "r"(_val), [ptr] "r"(&(_pcp))			\
+		: "memory");						\
+} while (0)
+
 /* this_cpu_cmpxchg */
 #define _protect_cmpxchg_local(pcp, o, n)			\
 ({								\
@@ -167,18 +125,6 @@ static __always_inline unsigned long __percpu_xchg(void *ptr, unsigned long val,
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
@@ -215,15 +161,15 @@ do {									\
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

