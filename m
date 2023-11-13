Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6541FB6
	for <loongarch@lists.linux.dev>; Mon, 13 Nov 2023 03:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B8CC433C7;
	Mon, 13 Nov 2023 03:25:23 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] LoongArch: Add __percpu annotation for __percpu_read()/__percpu_write()
Date: Mon, 13 Nov 2023 11:25:11 +0800
Message-Id: <20231113032511.860159-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When build kernel with C=1, we get:

arch/loongarch/kernel/process.c:234:46: warning: incorrect type in argument 1 (different address spaces)
arch/loongarch/kernel/process.c:234:46:    expected void *ptr
arch/loongarch/kernel/process.c:234:46:    got unsigned long [noderef] __percpu *
arch/loongarch/kernel/process.c:234:46: warning: incorrect type in argument 1 (different address spaces)
arch/loongarch/kernel/process.c:234:46:    expected void *ptr
arch/loongarch/kernel/process.c:234:46:    got unsigned long [noderef] __percpu *
arch/loongarch/kernel/process.c:234:46: warning: incorrect type in argument 1 (different address spaces)
arch/loongarch/kernel/process.c:234:46:    expected void *ptr
arch/loongarch/kernel/process.c:234:46:    got unsigned long [noderef] __percpu *
arch/loongarch/kernel/process.c:234:46: warning: incorrect type in argument 1 (different address spaces)
arch/loongarch/kernel/process.c:234:46:    expected void *ptr
arch/loongarch/kernel/process.c:234:46:    got unsigned long [noderef] __percpu *

Add __percpu annotation for __percpu_read()/__percpu_write() can avoid
such warnings. __percpu_xchg() and other functions don't need annotation
because their wrapper, i.e. _pcp_protect(), already suppresses warnings.

Also adjust the indentations in this file.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311080409.LlOfTR3m-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202311080840.Vc2kXhfp-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202311081340.3k72KKdg-lkp@intel.com/
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/percpu.h | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/include/asm/percpu.h b/arch/loongarch/include/asm/percpu.h
index ed5da02b1cf6..9b36ac003f89 100644
--- a/arch/loongarch/include/asm/percpu.h
+++ b/arch/loongarch/include/asm/percpu.h
@@ -40,13 +40,13 @@ static __always_inline unsigned long __percpu_##op(void *ptr,		\
 	switch (size) {							\
 	case 4:								\
 		__asm__ __volatile__(					\
-		"am"#asm_op".w"	" %[ret], %[val], %[ptr]	\n"		\
+		"am"#asm_op".w"	" %[ret], %[val], %[ptr]	\n"	\
 		: [ret] "=&r" (ret), [ptr] "+ZB"(*(u32 *)ptr)		\
 		: [val] "r" (val));					\
 		break;							\
 	case 8:								\
 		__asm__ __volatile__(					\
-		"am"#asm_op".d" " %[ret], %[val], %[ptr]	\n"		\
+		"am"#asm_op".d" " %[ret], %[val], %[ptr]	\n"	\
 		: [ret] "=&r" (ret), [ptr] "+ZB"(*(u64 *)ptr)		\
 		: [val] "r" (val));					\
 		break;							\
@@ -63,7 +63,7 @@ PERCPU_OP(and, and, &)
 PERCPU_OP(or, or, |)
 #undef PERCPU_OP
 
-static __always_inline unsigned long __percpu_read(void *ptr, int size)
+static __always_inline unsigned long __percpu_read(void __percpu *ptr, int size)
 {
 	unsigned long ret;
 
@@ -100,7 +100,7 @@ static __always_inline unsigned long __percpu_read(void *ptr, int size)
 	return ret;
 }
 
-static __always_inline void __percpu_write(void *ptr, unsigned long val, int size)
+static __always_inline void __percpu_write(void __percpu *ptr, unsigned long val, int size)
 {
 	switch (size) {
 	case 1:
@@ -132,8 +132,7 @@ static __always_inline void __percpu_write(void *ptr, unsigned long val, int siz
 	}
 }
 
-static __always_inline unsigned long __percpu_xchg(void *ptr, unsigned long val,
-						   int size)
+static __always_inline unsigned long __percpu_xchg(void *ptr, unsigned long val, int size)
 {
 	switch (size) {
 	case 1:
-- 
2.39.3

