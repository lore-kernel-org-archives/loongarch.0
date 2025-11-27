Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE73F231858;
	Thu, 27 Nov 2025 15:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764258966; cv=none; b=boYVmoC9pHvNz8vn1t7kVstijRmKJGJeSEiYVe9hy/gXuLnpVwjbU+G0PpL/oT5cWm4Jqdonp7Y40jjzPwkp7wpWxcGsOQ41Q1rIBFyzAcgcgx3/EIOhf2Fr0Jz3MqdFF1iXdw47TcZq3bkAqMEfgEuXNpL2McMkFcWT3hmiiqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764258966; c=relaxed/simple;
	bh=o9qF1skZzzh/Vu0bNKiK4qbazRnAbN1q6TucGfD/FsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I9BJ64hnzPsjYCl6QKnkVbatuRDgLGcGILYoq1RQwWJrtM0NfkrYVQA4W8MhLPCqdVG4yqmkJzC/t4TRbV6EjWUuHTK0TG9hH8gt8H59LzLQA9pZa5hTHDJhC1Xhc6mKytWxsOiiwX1QWGMZDuWq5UXI6kxafsdBdyiY2+dDkx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7CAC4CEF8;
	Thu, 27 Nov 2025 15:56:03 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH V4 10/14] LoongArch: Adjust user accessors for 32BIT/64BIT
Date: Thu, 27 Nov 2025 23:48:28 +0800
Message-ID: <20251127154832.137925-11-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251127154832.137925-1-chenhuacai@loongson.cn>
References: <20251127154832.137925-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust user accessors for both 32BIT and 64BIT, including: get_user(),
put_user(), copy_user(), clear_user(), etc.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/uaccess.h | 63 ++++++++++++++++++++++++++--
 arch/loongarch/lib/clear_user.S      | 22 ++++++----
 arch/loongarch/lib/copy_user.S       | 28 ++++++++-----
 3 files changed, 91 insertions(+), 22 deletions(-)

diff --git a/arch/loongarch/include/asm/uaccess.h b/arch/loongarch/include/asm/uaccess.h
index 0d22991ae430..4e259d490e45 100644
--- a/arch/loongarch/include/asm/uaccess.h
+++ b/arch/loongarch/include/asm/uaccess.h
@@ -19,10 +19,16 @@
 #include <asm/asm-extable.h>
 #include <asm-generic/access_ok.h>
 
+#define __LSW	0
+#define __MSW	1
+
 extern u64 __ua_limit;
 
-#define __UA_ADDR	".dword"
+#ifdef CONFIG_64BIT
 #define __UA_LIMIT	__ua_limit
+#else
+#define __UA_LIMIT	0x80000000UL
+#endif
 
 /*
  * get_user: - Get a simple variable from user space.
@@ -126,6 +132,7 @@ extern u64 __ua_limit;
  *
  * Returns zero on success, or -EFAULT on error.
  */
+
 #define __put_user(x, ptr) \
 ({									\
 	int __pu_err = 0;						\
@@ -146,7 +153,7 @@ do {									\
 	case 1: __get_data_asm(val, "ld.b", ptr); break;		\
 	case 2: __get_data_asm(val, "ld.h", ptr); break;		\
 	case 4: __get_data_asm(val, "ld.w", ptr); break;		\
-	case 8: __get_data_asm(val, "ld.d", ptr); break;		\
+	case 8: __get_data_asm_8(val, ptr); break;			\
 	default: BUILD_BUG(); break;					\
 	}								\
 } while (0)
@@ -167,13 +174,39 @@ do {									\
 	(val) = (__typeof__(*(ptr))) __gu_tmp;				\
 }
 
+#ifdef CONFIG_64BIT
+#define __get_data_asm_8(val, ptr) \
+	__get_data_asm(val, "ld.d", ptr)
+#else /* !CONFIG_64BIT */
+#define __get_data_asm_8(val, ptr)					\
+{									\
+	u32 __lo, __hi;							\
+	u32 __user *__ptr = (u32 __user *)(ptr);			\
+									\
+	__asm__ __volatile__ (						\
+		"1:\n"							\
+		"	ld.w %1, %3				\n"	\
+		"2:\n"							\
+		"	ld.w %2, %4				\n"	\
+		"3:\n"							\
+		_ASM_EXTABLE_UACCESS_ERR_ZERO(1b, 3b, %0, %1)		\
+		_ASM_EXTABLE_UACCESS_ERR_ZERO(2b, 3b, %0, %1)		\
+		: "+r" (__gu_err), "=&r" (__lo), "=r" (__hi)		\
+		: "m" (__ptr[__LSW]), "m" (__ptr[__MSW]));		\
+	if (__gu_err)							\
+		__hi = 0;						\
+	(val) = (__typeof__(val))((__typeof__((val)-(val)))		\
+		((((u64)__hi << 32) | __lo)));				\
+}
+#endif /* CONFIG_64BIT */
+
 #define __put_user_common(ptr, size)					\
 do {									\
 	switch (size) {							\
 	case 1: __put_data_asm("st.b", ptr); break;			\
 	case 2: __put_data_asm("st.h", ptr); break;			\
 	case 4: __put_data_asm("st.w", ptr); break;			\
-	case 8: __put_data_asm("st.d", ptr); break;			\
+	case 8: __put_data_asm_8(ptr); break;				\
 	default: BUILD_BUG(); break;					\
 	}								\
 } while (0)
@@ -190,6 +223,30 @@ do {									\
 	: "Jr" (__pu_val));						\
 }
 
+#ifdef CONFIG_64BIT
+#define __put_data_asm_8(ptr) \
+	__put_data_asm("st.d", ptr)
+#else /* !CONFIG_64BIT */
+#define __put_data_asm_8(ptr)						\
+{									\
+	u32 __user *__ptr = (u32 __user *)(ptr);			\
+	u64 __x = (__typeof__((__pu_val)-(__pu_val)))(__pu_val);	\
+									\
+	__asm__ __volatile__ (						\
+		"1:\n"							\
+		"	st.w %z3, %1				\n"	\
+		"2:\n"							\
+		"	st.w %z4, %2				\n"	\
+		"3:\n"							\
+		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %0)			\
+		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %0)			\
+		: "+r" (__pu_err),					\
+			"=m" (__ptr[__LSW]),				\
+			"=m" (__ptr[__MSW])				\
+		: "rJ" (__x), "rJ" (__x >> 32));			\
+}
+#endif /* CONFIG_64BIT */
+
 #define __get_kernel_nofault(dst, src, type, err_label)			\
 do {									\
 	int __gu_err = 0;						\
diff --git a/arch/loongarch/lib/clear_user.S b/arch/loongarch/lib/clear_user.S
index 7a0db643b286..58c667dde882 100644
--- a/arch/loongarch/lib/clear_user.S
+++ b/arch/loongarch/lib/clear_user.S
@@ -13,11 +13,15 @@
 #include <asm/unwind_hints.h>
 
 SYM_FUNC_START(__clear_user)
+#ifdef CONFIG_32BIT
+	b		__clear_user_generic
+#else
 	/*
 	 * Some CPUs support hardware unaligned access
 	 */
 	ALTERNATIVE	"b __clear_user_generic",	\
 			"b __clear_user_fast", CPU_FEATURE_UAL
+#endif
 SYM_FUNC_END(__clear_user)
 
 EXPORT_SYMBOL(__clear_user)
@@ -29,19 +33,20 @@ EXPORT_SYMBOL(__clear_user)
  * a1: size
  */
 SYM_FUNC_START(__clear_user_generic)
-	beqz	a1, 2f
+	beqz		a1, 2f
 
-1:	st.b	zero, a0, 0
-	addi.d	a0, a0, 1
-	addi.d	a1, a1, -1
-	bgtz	a1, 1b
+1:	st.b		zero, a0, 0
+	PTR_ADDI	a0, a0, 1
+	PTR_ADDI	a1, a1, -1
+	bgtz		a1, 1b
 
-2:	move	a0, a1
-	jr	ra
+2:	move		a0, a1
+	jr		ra
 
-	_asm_extable 1b, 2b
+	_asm_extable 	1b, 2b
 SYM_FUNC_END(__clear_user_generic)
 
+#ifdef CONFIG_64BIT
 /*
  * unsigned long __clear_user_fast(void *addr, unsigned long size)
  *
@@ -207,3 +212,4 @@ SYM_FUNC_START(__clear_user_fast)
 SYM_FUNC_END(__clear_user_fast)
 
 STACK_FRAME_NON_STANDARD __clear_user_fast
+#endif
diff --git a/arch/loongarch/lib/copy_user.S b/arch/loongarch/lib/copy_user.S
index 095ce9181c6c..c7264b779f6e 100644
--- a/arch/loongarch/lib/copy_user.S
+++ b/arch/loongarch/lib/copy_user.S
@@ -13,11 +13,15 @@
 #include <asm/unwind_hints.h>
 
 SYM_FUNC_START(__copy_user)
+#ifdef CONFIG_32BIT
+	b		__copy_user_generic
+#else
 	/*
 	 * Some CPUs support hardware unaligned access
 	 */
 	ALTERNATIVE	"b __copy_user_generic",	\
 			"b __copy_user_fast", CPU_FEATURE_UAL
+#endif
 SYM_FUNC_END(__copy_user)
 
 EXPORT_SYMBOL(__copy_user)
@@ -30,22 +34,23 @@ EXPORT_SYMBOL(__copy_user)
  * a2: n
  */
 SYM_FUNC_START(__copy_user_generic)
-	beqz	a2, 3f
+	beqz		a2, 3f
 
-1:	ld.b	t0, a1, 0
-2:	st.b	t0, a0, 0
-	addi.d	a0, a0, 1
-	addi.d	a1, a1, 1
-	addi.d	a2, a2, -1
-	bgtz	a2, 1b
+1:	ld.b		t0, a1, 0
+2:	st.b		t0, a0, 0
+	PTR_ADDI	a0, a0, 1
+	PTR_ADDI	a1, a1, 1
+	PTR_ADDI	a2, a2, -1
+	bgtz		a2, 1b
 
-3:	move	a0, a2
-	jr	ra
+3:	move		a0, a2
+	jr		ra
 
-	_asm_extable 1b, 3b
-	_asm_extable 2b, 3b
+	_asm_extable	1b, 3b
+	_asm_extable	2b, 3b
 SYM_FUNC_END(__copy_user_generic)
 
+#ifdef CONFIG_64BIT
 /*
  * unsigned long __copy_user_fast(void *to, const void *from, unsigned long n)
  *
@@ -281,3 +286,4 @@ SYM_FUNC_START(__copy_user_fast)
 SYM_FUNC_END(__copy_user_fast)
 
 STACK_FRAME_NON_STANDARD __copy_user_fast
+#endif
-- 
2.47.3

