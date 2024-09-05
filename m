Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591671922C9
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 06:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725519227; cv=none; b=YwohlicSysdHUX0J7RrzrMGrbLShzpZyVmBWpdPF/b3jxXSTYChCNxreUPVwD73D2Bwyf4Cn87eY7MtH76C6ofxSG1AuYosKCDJAe190Jo1WTNrRHClAkjU5oLSK9qsA8k0UHe5lkmzxFrcA5iKIna9Q7wq2A+rWT2tpxZPJepI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725519227; c=relaxed/simple;
	bh=QDgXDBvyQJOMWeoFGPVE0g8L+AOYRGndhi4MRkAUOHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ooumVNl/j+ius3GMaUZVSzoNKEaEauUHyuXOiCa6AA6WQfU3Oc2+5WaNy5uNmXbPEywrsqPzaWEEZQfCKO81Lo0uMao8wsCrn/DC4VooJoMj3/79MHLassJ0Z7VIqBjGt3EuBL4B53/jkgbBrJa7FzhGbVWK/Fe2uGRmbWM+H1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcHCUlHk; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcHCUlHk"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3780c8d689aso202820f8f.0
        for <loongarch@lists.linux.dev>; Wed, 04 Sep 2024 23:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725519223; x=1726124023; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qyslWu7uboUrkYXcGmXap3x8F7eNeExx5bL2W+WbMOw=;
        b=BcHCUlHkW9trCdSTARFt2u4hqChkktrcyrZPJ2eH4BS71iOAStxN5mN/Vp8PhYvMJy
         70iGD2YtFz6f/+OvZtcI1hV1JxxtI/pTXUKwVjKScrUrKE3Liz/YsJMBLderJ5FiUl01
         mDy0ILbV/QeQktUvjskGysySxk7ZCDJCjAkeoHUL6BuCxde42hjL0BAK8bfMCqIA12Df
         3tGczSrcH1YBdrWV4fKFYEkyTb0BGJoy1ZYLNcBZy7XoYq2qiABh8JQ1CD/pVGbtyCbG
         AEP65Jtp+62QtAHsTbBPq08OojPz/ok3P1VkbXwqRh8oIm9FUrHGSUIv7rEhEmiddBcY
         JwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725519223; x=1726124023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qyslWu7uboUrkYXcGmXap3x8F7eNeExx5bL2W+WbMOw=;
        b=NxnNV4Y8JeWuASmYeoG/Ej4PeZ8fsQeCoJER4tHy1BE4mbgC6NVDNWEp27yKEmYRpk
         hraeXQ4hZ6LU3wFIIGEU9ybsD0evFMkCY6sjA45xwNupw8DbB+3anFr+Bw5RnjjBwHGq
         GV6iQpDh6jzi1YazbS7TpfjXrRDOt9bDAT6ZG8ZoXsqRa6fBHor87wccuLNLfTbwRNNz
         hjMMeYLQlh+T21afX6n/2/B4Z3KXJpt+LVBA7DT1AnpRqQyok0OlyQ89qsIVAHa3KX4r
         klnYaqsrK3Fu3GZqO6zH6NJcsh7MoJ9C1cukE2vnFXO7n5FXNl0BdhQXwyz7fgz6swnK
         jt6Q==
X-Gm-Message-State: AOJu0YyxO7fi1OOsVppSFhQ++1LnmwmyJNfhey4gvvq+2K93xY9nOQuT
	IZfqsSPifv0jlgalJLK+HCLILLLuUKq6nhyavypexhXRyi+QemnsWsGuy4TY
X-Google-Smtp-Source: AGHT+IFuKOI6pns6izkBDQ/HtfLgYLDt6UJkUMp7VyweB/BSLeCdto1JWlPuk81JkrDEKCvOruaklw==
X-Received: by 2002:a5d:5269:0:b0:368:420e:b790 with SMTP id ffacd0b85a97d-376dd15a8cemr4047302f8f.14.1725519221963;
        Wed, 04 Sep 2024 23:53:41 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c1b0a62esm13229366f8f.47.2024.09.04.23.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 23:53:41 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Xi Ruoyao <xry111@xry111.site>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] LoongArch/percpu: Simplify _percpu_read() and _percpu_write()
Date: Thu,  5 Sep 2024 08:52:58 +0200
Message-ID: <20240905065328.802874-1-ubizjak@gmail.com>
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

