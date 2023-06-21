Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62238BF8
	for <loongarch@lists.linux.dev>; Wed, 21 Jun 2023 08:39:15 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxkfExt5JkthEAAA--.142S3;
	Wed, 21 Jun 2023 16:39:13 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax3c4st5JkmlAAAA--.2097S4;
	Wed, 21 Jun 2023 16:39:12 +0800 (CST)
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
Subject: [PATCH v2 2/2] tools arch: Remove uapi bitsperlong.h of hexagon and microblaze
Date: Wed, 21 Jun 2023 16:39:08 +0800
Message-Id: <1687336748-4898-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1687336748-4898-1-git-send-email-yangtiezhu@loongson.cn>
References: <1687336748-4898-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8Ax3c4st5JkmlAAAA--.2097S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJr1DAFWUWFykKr4UGFWxuFX_yoW5Jr1UpF
	95XwsrWF48CryjkrWFkF1jqrW3A39rGF4jga1xWry8ZrWxJF18Ar4S9FsFya47JayIqa1r
	uF93WryUKa1kKagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcHUqUUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

After the following two commits:

  commit 872e24d5c698 ("hexagon: remove asm/bitsperlong.h")
  commit 83f0124ad81e ("microblaze: remove asm-generic wrapper headers")

the arch-specific headers of hexagon and microblaze have been removed,
the tools arch uapi headers are useless too, remove them.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/arch/hexagon/include/uapi/asm/bitsperlong.h  | 27 ----------------------
 .../arch/microblaze/include/uapi/asm/bitsperlong.h |  2 --
 2 files changed, 29 deletions(-)
 delete mode 100644 tools/arch/hexagon/include/uapi/asm/bitsperlong.h
 delete mode 100644 tools/arch/microblaze/include/uapi/asm/bitsperlong.h

diff --git a/tools/arch/hexagon/include/uapi/asm/bitsperlong.h b/tools/arch/hexagon/include/uapi/asm/bitsperlong.h
deleted file mode 100644
index 5adca0d..0000000
--- a/tools/arch/hexagon/include/uapi/asm/bitsperlong.h
+++ /dev/null
@@ -1,27 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * Copyright (c) 2010-2011, The Linux Foundation. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 and
- * only version 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
- * 02110-1301, USA.
- */
-
-#ifndef __ASM_HEXAGON_BITSPERLONG_H
-#define __ASM_HEXAGON_BITSPERLONG_H
-
-#define __BITS_PER_LONG 32
-
-#include <asm-generic/bitsperlong.h>
-
-#endif
diff --git a/tools/arch/microblaze/include/uapi/asm/bitsperlong.h b/tools/arch/microblaze/include/uapi/asm/bitsperlong.h
deleted file mode 100644
index 76da34b..0000000
--- a/tools/arch/microblaze/include/uapi/asm/bitsperlong.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#include <asm-generic/bitsperlong.h>
-- 
2.1.0

