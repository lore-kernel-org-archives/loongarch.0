Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6511F176
	for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 14:13:44 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx38cXV5Rk9HMAAA--.820S3;
	Thu, 22 Jun 2023 22:13:43 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxJ80TV5RkZSsCAA--.10045S3;
	Thu, 22 Jun 2023 22:13:41 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v3 1/2] asm-generic: Unify uapi bitsperlong.h for arm64, riscv and loongarch
Date: Thu, 22 Jun 2023 22:13:38 +0800
Message-Id: <1687443219-11946-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1687443219-11946-1-git-send-email-yangtiezhu@loongson.cn>
References: <1687443219-11946-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8DxJ80TV5RkZSsCAA--.10045S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW3tF4kCr4xJFW7AFyUJrWrJFc_yoWDtr4DpF
	95Crn7WF40krW3C3yrJF1Igry5Aws3GF4UtFW2gry0vrWfJF18Gr4v9FsxCa4xJayvqryr
	uF9Ig345Gan8t3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcDDGUUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Now we specify the minimal version of GCC as 5.1 and Clang/LLVM as 11.0.0
in Documentation/process/changes.rst, __CHAR_BIT__ and __SIZEOF_LONG__ are
usable, it is probably fine to unify the definition of __BITS_PER_LONG as
(__CHAR_BIT__ * __SIZEOF_LONG__) in asm-generic uapi bitsperlong.h.

In order to keep safe and avoid regression, only unify uapi bitsperlong.h
for some archs such as arm64, riscv and loongarch which are using newer
toolchains that have the definitions of __CHAR_BIT__ and __SIZEOF_LONG__.

Suggested-by: Xi Ruoyao <xry111@xry111.site>
Link: https://lore.kernel.org/all/d3e255e4746de44c9903c4433616d44ffcf18d1b.camel@xry111.site/
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/linux-arch/a3a4f48a-07d4-4ed9-bc53-5d383428bdd2@app.fastmail.com/
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/arm64/include/uapi/asm/bitsperlong.h          | 24 ----------------------
 arch/loongarch/include/uapi/asm/bitsperlong.h      |  9 --------
 arch/riscv/include/uapi/asm/bitsperlong.h          | 14 -------------
 include/uapi/asm-generic/bitsperlong.h             | 13 +++++++++++-
 tools/arch/arm64/include/uapi/asm/bitsperlong.h    | 24 ----------------------
 .../arch/loongarch/include/uapi/asm/bitsperlong.h  |  9 --------
 tools/arch/riscv/include/uapi/asm/bitsperlong.h    | 14 -------------
 tools/include/uapi/asm-generic/bitsperlong.h       | 14 ++++++++++++-
 tools/include/uapi/asm/bitsperlong.h               |  6 ------
 9 files changed, 25 insertions(+), 102 deletions(-)
 delete mode 100644 arch/arm64/include/uapi/asm/bitsperlong.h
 delete mode 100644 arch/loongarch/include/uapi/asm/bitsperlong.h
 delete mode 100644 arch/riscv/include/uapi/asm/bitsperlong.h
 delete mode 100644 tools/arch/arm64/include/uapi/asm/bitsperlong.h
 delete mode 100644 tools/arch/loongarch/include/uapi/asm/bitsperlong.h
 delete mode 100644 tools/arch/riscv/include/uapi/asm/bitsperlong.h

diff --git a/arch/arm64/include/uapi/asm/bitsperlong.h b/arch/arm64/include/uapi/asm/bitsperlong.h
deleted file mode 100644
index 485d60be..0000000
--- a/arch/arm64/include/uapi/asm/bitsperlong.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * Copyright (C) 2012 ARM Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef __ASM_BITSPERLONG_H
-#define __ASM_BITSPERLONG_H
-
-#define __BITS_PER_LONG 64
-
-#include <asm-generic/bitsperlong.h>
-
-#endif	/* __ASM_BITSPERLONG_H */
diff --git a/arch/loongarch/include/uapi/asm/bitsperlong.h b/arch/loongarch/include/uapi/asm/bitsperlong.h
deleted file mode 100644
index 00b4ba1..0000000
--- a/arch/loongarch/include/uapi/asm/bitsperlong.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef __ASM_LOONGARCH_BITSPERLONG_H
-#define __ASM_LOONGARCH_BITSPERLONG_H
-
-#define __BITS_PER_LONG (__SIZEOF_LONG__ * 8)
-
-#include <asm-generic/bitsperlong.h>
-
-#endif /* __ASM_LOONGARCH_BITSPERLONG_H */
diff --git a/arch/riscv/include/uapi/asm/bitsperlong.h b/arch/riscv/include/uapi/asm/bitsperlong.h
deleted file mode 100644
index 7d0b32e..0000000
--- a/arch/riscv/include/uapi/asm/bitsperlong.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
-/*
- * Copyright (C) 2012 ARM Ltd.
- * Copyright (C) 2015 Regents of the University of California
- */
-
-#ifndef _UAPI_ASM_RISCV_BITSPERLONG_H
-#define _UAPI_ASM_RISCV_BITSPERLONG_H
-
-#define __BITS_PER_LONG (__SIZEOF_POINTER__ * 8)
-
-#include <asm-generic/bitsperlong.h>
-
-#endif /* _UAPI_ASM_RISCV_BITSPERLONG_H */
diff --git a/include/uapi/asm-generic/bitsperlong.h b/include/uapi/asm-generic/bitsperlong.h
index 693d9a4..352cb81 100644
--- a/include/uapi/asm-generic/bitsperlong.h
+++ b/include/uapi/asm-generic/bitsperlong.h
@@ -2,6 +2,17 @@
 #ifndef _UAPI__ASM_GENERIC_BITS_PER_LONG
 #define _UAPI__ASM_GENERIC_BITS_PER_LONG
 
+#ifndef __BITS_PER_LONG
+/*
+ * In order to keep safe and avoid regression, only unify uapi
+ * bitsperlong.h for some archs which are using newer toolchains
+ * that have the definitions of __CHAR_BIT__ and __SIZEOF_LONG__.
+ * See the following link for more info:
+ * https://lore.kernel.org/linux-arch/b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com/
+ */
+#if defined(__CHAR_BIT__) && defined(__SIZEOF_LONG__)
+#define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
+#else
 /*
  * There seems to be no way of detecting this automatically from user
  * space, so 64 bit architectures should override this in their
@@ -9,8 +20,8 @@
  * both 32 and 64 bit user space must not rely on CONFIG_64BIT
  * to decide it, but rather check a compiler provided macro.
  */
-#ifndef __BITS_PER_LONG
 #define __BITS_PER_LONG 32
 #endif
+#endif
 
 #endif /* _UAPI__ASM_GENERIC_BITS_PER_LONG */
diff --git a/tools/arch/arm64/include/uapi/asm/bitsperlong.h b/tools/arch/arm64/include/uapi/asm/bitsperlong.h
deleted file mode 100644
index 485d60be..0000000
--- a/tools/arch/arm64/include/uapi/asm/bitsperlong.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * Copyright (C) 2012 ARM Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef __ASM_BITSPERLONG_H
-#define __ASM_BITSPERLONG_H
-
-#define __BITS_PER_LONG 64
-
-#include <asm-generic/bitsperlong.h>
-
-#endif	/* __ASM_BITSPERLONG_H */
diff --git a/tools/arch/loongarch/include/uapi/asm/bitsperlong.h b/tools/arch/loongarch/include/uapi/asm/bitsperlong.h
deleted file mode 100644
index 00b4ba1..0000000
--- a/tools/arch/loongarch/include/uapi/asm/bitsperlong.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef __ASM_LOONGARCH_BITSPERLONG_H
-#define __ASM_LOONGARCH_BITSPERLONG_H
-
-#define __BITS_PER_LONG (__SIZEOF_LONG__ * 8)
-
-#include <asm-generic/bitsperlong.h>
-
-#endif /* __ASM_LOONGARCH_BITSPERLONG_H */
diff --git a/tools/arch/riscv/include/uapi/asm/bitsperlong.h b/tools/arch/riscv/include/uapi/asm/bitsperlong.h
deleted file mode 100644
index 0b9b58b..0000000
--- a/tools/arch/riscv/include/uapi/asm/bitsperlong.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2012 ARM Ltd.
- * Copyright (C) 2015 Regents of the University of California
- */
-
-#ifndef _UAPI_ASM_RISCV_BITSPERLONG_H
-#define _UAPI_ASM_RISCV_BITSPERLONG_H
-
-#define __BITS_PER_LONG (__SIZEOF_POINTER__ * 8)
-
-#include <asm-generic/bitsperlong.h>
-
-#endif /* _UAPI_ASM_RISCV_BITSPERLONG_H */
diff --git a/tools/include/uapi/asm-generic/bitsperlong.h b/tools/include/uapi/asm-generic/bitsperlong.h
index 23e6c41..352cb81 100644
--- a/tools/include/uapi/asm-generic/bitsperlong.h
+++ b/tools/include/uapi/asm-generic/bitsperlong.h
@@ -1,6 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 #ifndef _UAPI__ASM_GENERIC_BITS_PER_LONG
 #define _UAPI__ASM_GENERIC_BITS_PER_LONG
 
+#ifndef __BITS_PER_LONG
+/*
+ * In order to keep safe and avoid regression, only unify uapi
+ * bitsperlong.h for some archs which are using newer toolchains
+ * that have the definitions of __CHAR_BIT__ and __SIZEOF_LONG__.
+ * See the following link for more info:
+ * https://lore.kernel.org/linux-arch/b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com/
+ */
+#if defined(__CHAR_BIT__) && defined(__SIZEOF_LONG__)
+#define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
+#else
 /*
  * There seems to be no way of detecting this automatically from user
  * space, so 64 bit architectures should override this in their
@@ -8,8 +20,8 @@
  * both 32 and 64 bit user space must not rely on CONFIG_64BIT
  * to decide it, but rather check a compiler provided macro.
  */
-#ifndef __BITS_PER_LONG
 #define __BITS_PER_LONG 32
 #endif
+#endif
 
 #endif /* _UAPI__ASM_GENERIC_BITS_PER_LONG */
diff --git a/tools/include/uapi/asm/bitsperlong.h b/tools/include/uapi/asm/bitsperlong.h
index da52065..c65267a 100644
--- a/tools/include/uapi/asm/bitsperlong.h
+++ b/tools/include/uapi/asm/bitsperlong.h
@@ -1,8 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #if defined(__i386__) || defined(__x86_64__)
 #include "../../../arch/x86/include/uapi/asm/bitsperlong.h"
-#elif defined(__aarch64__)
-#include "../../../arch/arm64/include/uapi/asm/bitsperlong.h"
 #elif defined(__powerpc__)
 #include "../../../arch/powerpc/include/uapi/asm/bitsperlong.h"
 #elif defined(__s390__)
@@ -13,12 +11,8 @@
 #include "../../../arch/mips/include/uapi/asm/bitsperlong.h"
 #elif defined(__ia64__)
 #include "../../../arch/ia64/include/uapi/asm/bitsperlong.h"
-#elif defined(__riscv)
-#include "../../../arch/riscv/include/uapi/asm/bitsperlong.h"
 #elif defined(__alpha__)
 #include "../../../arch/alpha/include/uapi/asm/bitsperlong.h"
-#elif defined(__loongarch__)
-#include "../../../arch/loongarch/include/uapi/asm/bitsperlong.h"
 #else
 #include <asm-generic/bitsperlong.h>
 #endif
-- 
2.1.0

