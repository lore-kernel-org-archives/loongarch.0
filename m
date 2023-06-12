Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F193A156C3
	for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 11:01:44 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxRukV+4ZkCrYDAA--.6072S3;
	Mon, 12 Jun 2023 19:01:41 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxfcoQ+4Zk19QVAA--.54161S4;
	Mon, 12 Jun 2023 19:01:41 +0800 (CST)
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
Subject: [PATCH v1 2/2] tools arch: Remove uapi bitsperlong.h of hexagon and microblaze
Date: Mon, 12 Jun 2023 19:01:34 +0800
Message-Id: <1686567694-20099-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1686567694-20099-1-git-send-email-yangtiezhu@loongson.cn>
References: <1686567694-20099-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8AxfcoQ+4Zk19QVAA--.54161S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJr1DAFWUWFykKr4UGFWxuFX_yoW5Jr1UpF
	95XwsrWF48CryjkrWFkF1jqrW3A39rGF4jga1xWry8ZrWxJF18Ar4S9FsFya47JayIqa1r
	uF93WryUKa1kKagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07Ul4E_UUUUU=
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

