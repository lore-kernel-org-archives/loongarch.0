Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F906219DA
	for <loongarch@lists.linux.dev>; Fri, 11 Aug 2023 20:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B63C433C7;
	Fri, 11 Aug 2023 20:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691786981;
	bh=rV9vbzJcsDLbrTR0r62C6mgt6aJt3bQ6a1I4S900+ww=;
	h=From:To:Cc:Subject:Date:From;
	b=T0bAa0PN1KA5EthJaDC9+dL6YBE6UjrSrya80R1VV6DSTfajxLg5cWsfwKpF3td/O
	 UcISOPLdoMSw4gSAmBW86S3QQFiKaHRQpAvSr8P4jFCkiUzQCah09SKYOKTundA/L9
	 4YVzBescJsuOVOxgn4nOhi/hvmWMBAy2GH/KKyhL14fQD/IsL2G27Q/8asbXy09I+h
	 CSwl2zppsK27+7US684h4qL69LpJtKIK1s3OjZ4rb5JGd3Ug+1vrvIb7SpEpj0t6CG
	 XTyo27PT57hcpSizPl/ZLuy60M9MRzd+GeoA8SIijIBp7kHSv1qAhM0euWs8NZ0nCV
	 vchy9g/BjCiKA==
From: Arnd Bergmann <arnd@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <kernel@xen0n.name>,
	Huacai Chen <chenhuacai@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] asm-generic: partially revert "Unify uapi bitsperlong.h for arm64, riscv and loongarch"
Date: Fri, 11 Aug 2023 22:49:07 +0200
Message-Id: <20230811204930.1529925-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Unifying the asm-generic headers across 32-bit and 64-bit architectures
based on the compiler provided macros was a good idea and appears to work
with all user space, but it caused a regression when building old kernels
on systems that have the new headers installed in /usr/include, as this
combination trips an inconsistency in the kernel's own tools/include
headers that are a mix of userspace and kernel-internal headers.

This affects kernel builds on arm64, riscv64 and loongarch64 systems that
might end up using the "#define __BITS_PER_LONG 32" default from the old
tools headers. Backporting the commit into stable kernels would address
this, but it would still break building kernels without that backport,
and waste time for developers trying to understand the problem.

arm64 build machines are rather common, and on riscv64 this can also
happen in practice, but loongarch64 is probably new enough to not
be used much for building old kernels, so only revert the bits
for arm64 and riscv.

Link: https://lore.kernel.org/all/20230731160402.GB1823389@dev-arch.thelio-3990X/
Reported-by: Nathan Chancellor <nathan@kernel.org>
Fixes: 8386f58f8deda ("asm-generic: Unify uapi bitsperlong.h for arm64, riscv and loongarch")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/include/uapi/asm/bitsperlong.h     | 24 +++++++++++++++++++
 arch/riscv/include/uapi/asm/bitsperlong.h     | 14 +++++++++++
 .../arch/arm64/include/uapi/asm/bitsperlong.h | 24 +++++++++++++++++++
 .../arch/riscv/include/uapi/asm/bitsperlong.h | 14 +++++++++++
 4 files changed, 76 insertions(+)
 create mode 100644 arch/arm64/include/uapi/asm/bitsperlong.h
 create mode 100644 arch/riscv/include/uapi/asm/bitsperlong.h
 create mode 100644 tools/arch/arm64/include/uapi/asm/bitsperlong.h
 create mode 100644 tools/arch/riscv/include/uapi/asm/bitsperlong.h

diff --git a/arch/arm64/include/uapi/asm/bitsperlong.h b/arch/arm64/include/uapi/asm/bitsperlong.h
new file mode 100644
index 0000000000000..485d60bee26ca
--- /dev/null
+++ b/arch/arm64/include/uapi/asm/bitsperlong.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2012 ARM Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef __ASM_BITSPERLONG_H
+#define __ASM_BITSPERLONG_H
+
+#define __BITS_PER_LONG 64
+
+#include <asm-generic/bitsperlong.h>
+
+#endif	/* __ASM_BITSPERLONG_H */
diff --git a/arch/riscv/include/uapi/asm/bitsperlong.h b/arch/riscv/include/uapi/asm/bitsperlong.h
new file mode 100644
index 0000000000000..7d0b32e3b7017
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/bitsperlong.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2015 Regents of the University of California
+ */
+
+#ifndef _UAPI_ASM_RISCV_BITSPERLONG_H
+#define _UAPI_ASM_RISCV_BITSPERLONG_H
+
+#define __BITS_PER_LONG (__SIZEOF_POINTER__ * 8)
+
+#include <asm-generic/bitsperlong.h>
+
+#endif /* _UAPI_ASM_RISCV_BITSPERLONG_H */
diff --git a/tools/arch/arm64/include/uapi/asm/bitsperlong.h b/tools/arch/arm64/include/uapi/asm/bitsperlong.h
new file mode 100644
index 0000000000000..485d60bee26ca
--- /dev/null
+++ b/tools/arch/arm64/include/uapi/asm/bitsperlong.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2012 ARM Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef __ASM_BITSPERLONG_H
+#define __ASM_BITSPERLONG_H
+
+#define __BITS_PER_LONG 64
+
+#include <asm-generic/bitsperlong.h>
+
+#endif	/* __ASM_BITSPERLONG_H */
diff --git a/tools/arch/riscv/include/uapi/asm/bitsperlong.h b/tools/arch/riscv/include/uapi/asm/bitsperlong.h
new file mode 100644
index 0000000000000..0b9b58b57ff6e
--- /dev/null
+++ b/tools/arch/riscv/include/uapi/asm/bitsperlong.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2015 Regents of the University of California
+ */
+
+#ifndef _UAPI_ASM_RISCV_BITSPERLONG_H
+#define _UAPI_ASM_RISCV_BITSPERLONG_H
+
+#define __BITS_PER_LONG (__SIZEOF_POINTER__ * 8)
+
+#include <asm-generic/bitsperlong.h>
+
+#endif /* _UAPI_ASM_RISCV_BITSPERLONG_H */
-- 
2.39.2

