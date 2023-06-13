Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAF41361
	for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 23:39:34 +0000 (UTC)
Message-ID: <20230613224545.312438573@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1686699572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=wBQc/zChg4ZHu9OAL6oaU+W0aufJsVa+t+cps2UYOzo=;
	b=sHRgliPpDTjgmrteZw2uDQBUy+LhOlD3YNuUxaLosBPN+K+8BCzWKcPReE25Xi07QjPQcL
	WHxBiBob3DFaJk/2N9uf+OeuN8Hq+VDzDvLfA5UtScqlcGp5kBT5Xwx5SsCfaNH3pLOkcK
	OaKK3NqcYdxM5nvApmNp0HRDO2slf2ydverVHd74coSQyIKQURcg7JGrXjDYwEiZtKSFYt
	2fU2pGqYCaccQFmaN+qTg4IkKeFj53K071bPF00AJ4dPXMfCbJMrqNiHJBC0R5Y+HkvovW
	FLplREzOZ5ayqWY4iQUMr4rIn18sRC0mBw/C/OMxcmLs38IblSKmbvmzh1FyCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1686699572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=wBQc/zChg4ZHu9OAL6oaU+W0aufJsVa+t+cps2UYOzo=;
	b=dfmmyGF3Ntb3WpojTDArqr9OpUQlPdOpzLQomxxJDc1n/cQhmo6FJVRhmTyPC6gibO2eTb
	/aeCSO1mON4sepBA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Nikolay Borisov <nik.borisov@suse.com>,
 "Ahmed S. Darwish" <darwi@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-sh@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 linux-um@lists.infradead.org,
 Richard Henderson <richard.henderson@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Chris Zankel <chris@zankel.net>,
 Tom Lendacky <thomas.lendacky@amd.com>
Subject: [patch 07/17] mips/cpu: Switch to arch_cpu_finalize_init()
References: <20230613223827.532680283@linutronix.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jun 2023 01:39:32 +0200 (CEST)

check_bugs() is about to be phased out. Switch over to the new
arch_cpu_finalize_init() implementation.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/Kconfig            |    1 +
 arch/mips/include/asm/bugs.h |   17 -----------------
 arch/mips/kernel/setup.c     |   13 +++++++++++++
 3 files changed, 14 insertions(+), 17 deletions(-)

--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -4,6 +4,7 @@ config MIPS
 	default y
 	select ARCH_32BIT_OFF_T if !64BIT
 	select ARCH_BINFMT_ELF_STATE if MIPS_FP_SUPPORT
+	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_CURRENT_STACK_POINTER if !CC_IS_CLANG || CLANG_VERSION >= 140000
 	select ARCH_HAS_DEBUG_VIRTUAL if !64BIT
 	select ARCH_HAS_FORTIFY_SOURCE
--- a/arch/mips/include/asm/bugs.h
+++ b/arch/mips/include/asm/bugs.h
@@ -1,17 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * This is included by init/main.c to check for architecture-dependent bugs.
- *
  * Copyright (C) 2007  Maciej W. Rozycki
- *
- * Needs:
- *	void check_bugs(void);
  */
 #ifndef _ASM_BUGS_H
 #define _ASM_BUGS_H
 
 #include <linux/bug.h>
-#include <linux/delay.h>
 #include <linux/smp.h>
 
 #include <asm/cpu.h>
@@ -24,17 +18,6 @@ extern void check_bugs64_early(void);
 extern void check_bugs32(void);
 extern void check_bugs64(void);
 
-static inline void __init check_bugs(void)
-{
-	unsigned int cpu = smp_processor_id();
-
-	cpu_data[cpu].udelay_val = loops_per_jiffy;
-	check_bugs32();
-
-	if (IS_ENABLED(CONFIG_CPU_R4X00_BUGS64))
-		check_bugs64();
-}
-
 static inline int r4k_daddiu_bug(void)
 {
 	if (!IS_ENABLED(CONFIG_CPU_R4X00_BUGS64))
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -11,6 +11,8 @@
  * Copyright (C) 2000, 2001, 2002, 2007	 Maciej W. Rozycki
  */
 #include <linux/init.h>
+#include <linux/cpu.h>
+#include <linux/delay.h>
 #include <linux/ioport.h>
 #include <linux/export.h>
 #include <linux/screen_info.h>
@@ -841,3 +843,14 @@ static int __init setnocoherentio(char *
 }
 early_param("nocoherentio", setnocoherentio);
 #endif
+
+void __init arch_cpu_finalize_init(void)
+{
+	unsigned int cpu = smp_processor_id();
+
+	cpu_data[cpu].udelay_val = loops_per_jiffy;
+	check_bugs32();
+
+	if (IS_ENABLED(CONFIG_CPU_R4X00_BUGS64))
+		check_bugs64();
+}

