Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3153D38F
	for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 23:39:44 +0000 (UTC)
Message-ID: <20230613224545.727330699@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1686699583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=3CR6tgLD7rhzvqZr45BM9V80YjsrczzKijoUucNo/+c=;
	b=EYe7iiF4scXvDMgiUbwXL/T+lduiRzS+SJhlEvazCoZJUCrGp1Hz5rf4m3IdPtjj8cDzzT
	oqHy2cl14gT+kMatDcbzWhLVe1PSnOyYVUFJPfQrT6U/YkVka5VPoxtUN9BEUfAS5YOkGU
	Bmv0b6/gTsXmP5xxTF5Gjn2rfGlKqFgbbrVhcewOMPGxUpVD3LhL5DRzVP+rlCGXe22osw
	IMvwikGyopJ7RkqTUMst4sZXg8rS7/bZ8HQ2sJMUFdCNsVjh6otKPg6G3uoZhB2yEl8rf6
	RUSzPq6J2UzRKMuVBo3SW8O1838X+cq4La+hJ0Uc9YVzwnEQGwLfR1FJb+8z2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1686699583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=3CR6tgLD7rhzvqZr45BM9V80YjsrczzKijoUucNo/+c=;
	b=LPsNrGxEP8Km+tZv8qRIJtaALFJmiJBfXpv6Uvz8QfFEr/ZN23NzxBgtjM8dYII5szXKtk
	mtfRZq8oVXIvAnCg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Nikolay Borisov <nik.borisov@suse.com>,
 "Ahmed S. Darwish" <darwi@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>,
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
Subject: [patch 14/17] x86/init: Initialize signal frame size late
References: <20230613223827.532680283@linutronix.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jun 2023 01:39:42 +0200 (CEST)

No point in doing this during really early boot. Move it to an early
initcall so that it is set up before possible user mode helpers are started
during device initialization.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/include/asm/sigframe.h |    2 --
 arch/x86/kernel/cpu/common.c    |    3 ---
 arch/x86/kernel/signal.c        |    4 +++-
 3 files changed, 3 insertions(+), 6 deletions(-)

--- a/arch/x86/include/asm/sigframe.h
+++ b/arch/x86/include/asm/sigframe.h
@@ -85,6 +85,4 @@ struct rt_sigframe_x32 {
 
 #endif /* CONFIG_X86_64 */
 
-void __init init_sigframe_size(void);
-
 #endif /* _ASM_X86_SIGFRAME_H */
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -64,7 +64,6 @@
 #include <asm/cpu_device_id.h>
 #include <asm/uv/uv.h>
 #include <asm/set_memory.h>
-#include <asm/sigframe.h>
 #include <asm/traps.h>
 #include <asm/sev.h>
 
@@ -1607,8 +1606,6 @@ static void __init early_identify_cpu(st
 
 	fpu__init_system(c);
 
-	init_sigframe_size();
-
 #ifdef CONFIG_X86_32
 	/*
 	 * Regardless of whether PCID is enumerated, the SDM says
--- a/arch/x86/kernel/signal.c
+++ b/arch/x86/kernel/signal.c
@@ -182,7 +182,7 @@ get_sigframe(struct ksignal *ksig, struc
 static unsigned long __ro_after_init max_frame_size;
 static unsigned int __ro_after_init fpu_default_state_size;
 
-void __init init_sigframe_size(void)
+static int __init init_sigframe_size(void)
 {
 	fpu_default_state_size = fpu__get_fpstate_size();
 
@@ -194,7 +194,9 @@ void __init init_sigframe_size(void)
 	max_frame_size = round_up(max_frame_size, FRAME_ALIGNMENT);
 
 	pr_info("max sigframe size: %lu\n", max_frame_size);
+	return 0;
 }
+early_initcall(init_sigframe_size);
 
 unsigned long get_sigframe_size(void)
 {

