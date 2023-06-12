Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1987156CB
	for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 11:01:44 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxL_AV+4ZkBbYDAA--.8150S3;
	Mon, 12 Jun 2023 19:01:41 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxfcoQ+4Zk19QVAA--.54161S3;
	Mon, 12 Jun 2023 19:01:40 +0800 (CST)
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
Subject: [PATCH v1 1/2] asm-generic: Unify uapi bitsperlong.h for arm64, riscv and loongarch
Date: Mon, 12 Jun 2023 19:01:33 +0800
Message-Id: <1686567694-20099-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1686567694-20099-1-git-send-email-yangtiezhu@loongson.cn>
References: <1686567694-20099-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8AxfcoQ+4Zk19QVAA--.54161S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW3tF4DXFy8ZrW8Xr17WFyDArc_yoWDCrWUpF
	95Crn7GF40krWak3yrJF1Igry5A393GF4UtFW2gry0vrWxJF18Gr4v9FsxCa4xJayqqryr
	uF9agry5Gan8t3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOb18UUUUU=
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
for arm64, riscv and loongarch which are added since the linux-3.x days.

Suggested-by: Xi Ruoyao <xry111@xry111.site>
Link: https://lore.kernel.org/all/d3e255e4746de44c9903c4433616d44ffcf18d1b.camel@xry111.site/
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/linux-arch/a3a4f48a-07d4-4ed9-bc53-5d383428bdd2@app.fastmail.com/
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/arm64/include/uapi/asm/bitsperlong.h          | 24 ----------------------
 arch/loongarch/include/uapi/asm/bitsperlong.h      |  9 --------
 arch/riscv/include/uapi/asm/bitsperlong.h          | 14 -------------
 include/uapi/asm-generic/bitsperlong.h             | 10 +++++++++
 tools/arch/arm64/include/uapi/asm/bitsperlong.h    | 24 ----------------------
 .../arch/loongarch/include/uapi/asm/bitsperlong.h  |  9 --------
 tools/arch/riscv/include/uapi/asm/bitsperlong.h    | 14 -------------
 tools/include/uapi/asm-generic/bitsperlong.h       | 11 ++++++++++
 tools/include/uapi/asm/bitsperlong.h               |  6 ------
 9 files changed, 21 insertions(+), 100 deletions(-)
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
index 693d9a4..fb104f9 100644
--- a/include/uapi/asm-generic/bitsperlong.h
+++ b/include/uapi/asm-generic/bitsperlong.h
@@ -3,6 +3,15 @@
 #define _UAPI__ASM_GENERIC_BITS_PER_LONG
 
 /*
+ * In order to keep safe and avoid regression, only unify uapi
+ * bitsperlong.h for arm64, riscv and loongarch which are added
+ * since the linux-3.x days. See the following link for more info:
+ * https://lore.kernel.org/linux-arch/b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com/
+ */
+#if defined(__aarch64__) || defined(__riscv) || defined(__loongarch__)
+#define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
+#else
+/*
  * There seems to be no way of detecting this automatically from user
  * space, so 64 bit architectures should override this in their
  * bitsperlong.h. In particular, an architecture that supports
@@ -12,5 +21,6 @@
 #ifndef __BITS_PER_LONG
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
index 23e6c41..fb104f9 100644
--- a/tools/include/uapi/asm-generic/bitsperlong.h
+++ b/tools/include/uapi/asm-generic/bitsperlong.h
@@ -1,7 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 #ifndef _UAPI__ASM_GENERIC_BITS_PER_LONG
 #define _UAPI__ASM_GENERIC_BITS_PER_LONG
 
 /*
+ * In order to keep safe and avoid regression, only unify uapi
+ * bitsperlong.h for arm64, riscv and loongarch which are added
+ * since the linux-3.x days. See the following link for more info:
+ * https://lore.kernel.org/linux-arch/b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com/
+ */
+#if defined(__aarch64__) || defined(__riscv) || defined(__loongarch__)
+#define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
+#else
+/*
  * There seems to be no way of detecting this automatically from user
  * space, so 64 bit architectures should override this in their
  * bitsperlong.h. In particular, an architecture that supports
@@ -11,5 +21,6 @@
 #ifndef __BITS_PER_LONG
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

