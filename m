Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0531361
	for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 23:39:37 +0000 (UTC)
Message-ID: <20230613224545.431995857@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1686699575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=KovQmxHAduP9K1IJzcjAHDrTAJrP6R2ub7olKG/Nt4k=;
	b=S5XqhegzNMmoBMubC4ItUZLALBFvIxHYIXbLb+wSq8U5/4sbsbEarf8iLB9msAP1qQNBa5
	ZXBbLCCAhFFxXFpXnvc5g+UBRdkoIZHSkhNrY+/PNW92EAMhwurbX0Gee2JfqjfU4sji6t
	D1OcGpBTohbu+DkApu+YTPfgQS91Pv32pRG8Njvuh+uLhDEJFXjgsl23TIcupRDWmSLFni
	e0y2HTb5eKVlWzQoAFH3KSXswlde2jmlldgRU2AUJVOrMezYS5iSjwjvDKQYQjWpgCvkwZ
	4f+lkwOAUOkFk53rNJm4+VzWNVNItfmaysNTyqYgbMAYKZHQMR1/rGaEnXozYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1686699575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=KovQmxHAduP9K1IJzcjAHDrTAJrP6R2ub7olKG/Nt4k=;
	b=wguOJEto0a1kHNhs4bWY/QmwskE6nEyjtUyErmp0bbC7yJSrOpxmaDsWhVNxsSRcUqJ7BC
	1B2kAuQsawIOpDDw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Nikolay Borisov <nik.borisov@suse.com>,
 "Ahmed S. Darwish" <darwi@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-sh@vger.kernel.org,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 linux-um@lists.infradead.org,
 Richard Henderson <richard.henderson@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Chris Zankel <chris@zankel.net>,
 Tom Lendacky <thomas.lendacky@amd.com>
Subject: [patch 09/17] sparc/cpu: Switch to arch_cpu_finalize_init()
References: <20230613223827.532680283@linutronix.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jun 2023 01:39:35 +0200 (CEST)

check_bugs() is about to be phased out. Switch over to the new
arch_cpu_finalize_init() implementation.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org
---
 arch/sparc/Kconfig            |    1 +
 arch/sparc/include/asm/bugs.h |   18 ------------------
 arch/sparc/kernel/setup_32.c  |    7 +++++++
 3 files changed, 8 insertions(+), 18 deletions(-)

--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -52,6 +52,7 @@ config SPARC
 config SPARC32
 	def_bool !64BIT
 	select ARCH_32BIT_OFF_T
+	select ARCH_HAS_CPU_FINALIZE_INIT if !SMP
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select CLZ_TAB
 	select DMA_DIRECT_REMAP
--- a/arch/sparc/include/asm/bugs.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* include/asm/bugs.h:  Sparc probes for various bugs.
- *
- * Copyright (C) 1996, 2007 David S. Miller (davem@davemloft.net)
- */
-
-#ifdef CONFIG_SPARC32
-#include <asm/cpudata.h>
-#endif
-
-extern unsigned long loops_per_jiffy;
-
-static void __init check_bugs(void)
-{
-#if defined(CONFIG_SPARC32) && !defined(CONFIG_SMP)
-	cpu_data(0).udelay_val = loops_per_jiffy;
-#endif
-}
--- a/arch/sparc/kernel/setup_32.c
+++ b/arch/sparc/kernel/setup_32.c
@@ -412,3 +412,10 @@ static int __init topology_init(void)
 }
 
 subsys_initcall(topology_init);
+
+#if defined(CONFIG_SPARC32) && !defined(CONFIG_SMP)
+void __init arch_cpu_finalize_init(void)
+{
+	cpu_data(0).udelay_val = loops_per_jiffy;
+}
+#endif

