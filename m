Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F35158873
	for <loongarch@lists.linux.dev>; Wed,  4 Sep 2024 09:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725443551; cv=none; b=W7jZdmRn3VVVntbZKxbsb0APBPvRzoWIVSg/r4QUPzLL/ZasPWd6VFUR58F2k4frITGEHJ6oymIH5mAtJ+FRY9oYFMg/9y834hiDYtVicyxiSBiannHcRygwK57aBvjOH8OCqFxF1JkaTxQKPLrjS4b+nFE762FQYYuf7sGLiIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725443551; c=relaxed/simple;
	bh=EnappI5a9nIBuX2OrvDrft2ZiNqkHMaiAtA8/FqKzWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qxl8Z2FH2JJuO07fAGxESKnPhoLT13BGFkKLLMi9Q5sJy+S2lTVx6Qbf4BkDQQEPzOqOaqOq4TJbWbLdv3dlLC7T0gURR6lYCRslDQD3+08kWqLF2oU0DPilrvTqpPJVmztR09cSS2pwzUh9rTY5jucVbiv2ZzWToxsO9JHgFLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6s3kzCJ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6s3kzCJ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42c5347b2f7so37785575e9.0
        for <loongarch@lists.linux.dev>; Wed, 04 Sep 2024 02:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725443547; x=1726048347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N31sdjPZnU9gWDNDGrMFMo8pfc0/4uQTHslgdr3uxdw=;
        b=X6s3kzCJ4uzcs9DArwTJox4jPH0tJ2wKryCH3xuuoM7185DNtyXVS4nWkKpqX9uc1F
         flCagOoxdY13QG6u9flIAhxP+GyktiJzTS7zb7V+U4YJzABmzBmjkp5UqqRkVwk2g4vE
         DoEfNGWqDgM5hViM/07SO76cZLVP7eIN8c6rqEpX9GYh76dk32YtYzQx/rdQX3wOixCf
         PZKf9L+1QNchmKfoSYf6FPFBQXDoBHtxXZEWYWuAzA2NiPwk8bm++RsCxp5kg2iT/yYC
         7TL+TYWx7Wt3CHWxjf4jV/eAgnRBsTpP/m0+Jk19ghMy/uXMpcJCVPavDc/ECJMK5jE2
         qV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725443547; x=1726048347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N31sdjPZnU9gWDNDGrMFMo8pfc0/4uQTHslgdr3uxdw=;
        b=V/LNJ54FJbe9kO2cE3ty+y88OG03Q/KLknAsuHN8IsbFMRH1uu3kee+IL/W/bK7Oqj
         +SIvySMOIp0bgPoE03g64ludfNfLrpYm7xxYcbyjEtZjsMfdbpGlnaDlR+jwlQjnlOtb
         ylNBdz/D9DqG6H/Cgr99L3upGox6j92il+5XbBI1a46Ty1d8jH71zCxMYD50Fuj7Klzd
         fCWR5AdOnsKkd/N77ipmIewrmwdfGdLlZTPCy/VqyhsNxRctxaxCGJ4ExNQolrP07jpO
         tAObJT5NGQi28xo6F1EJIeEKIpV6iNJGIFcdREfEBUHRcVOozkJ+hdttHB1suB8/kzw9
         9tSQ==
X-Gm-Message-State: AOJu0YwuUibr4mivPR7SbfK+M59KsISQ2i2bVt5S8OsF0f5p/MANdA3l
	ifgfdP2EF3EjU+RtviLK685X1t+6rF5B/xYMkbqqH+HCix6QoLHKUwEn3jT4
X-Google-Smtp-Source: AGHT+IGylQ1hjz/deZtmanKVut58Xefs+Wl4dKDaaIIiODpf/o+wyN8I+JhibvK+w1ILtKu7k1jKrA==
X-Received: by 2002:a05:6000:186e:b0:374:c92e:f6a3 with SMTP id ffacd0b85a97d-374c92ef910mr7604779f8f.14.1725443546005;
        Wed, 04 Sep 2024 02:52:26 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e33d60sm199394895e9.43.2024.09.04.02.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:52:25 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Xi Ruoyao <xry111@xry111.site>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2] LoongArch/percpu: Simplify _percpu_read() and _percpu_write()
Date: Wed,  4 Sep 2024 11:51:40 +0200
Message-ID: <20240904095205.739422-1-ubizjak@gmail.com>
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
---
 arch/loongarch/include/asm/percpu.h | 130 +++++++++-------------------
 1 file changed, 41 insertions(+), 89 deletions(-)

diff --git a/arch/loongarch/include/asm/percpu.h b/arch/loongarch/include/asm/percpu.h
index 8f290e5546cf..2bb84227a8c5 100644
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
@@ -157,6 +88,39 @@ static __always_inline unsigned long __percpu_xchg(void *ptr, unsigned long val,
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
@@ -167,18 +131,6 @@ static __always_inline unsigned long __percpu_xchg(void *ptr, unsigned long val,
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
@@ -215,15 +167,15 @@ do {									\
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

