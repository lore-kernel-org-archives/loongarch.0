Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441892;
	b=oN+RVH4SpaXzAV37RyPSfBBZPtK3yJWWdMLY2xGtyA2rllvC/5cxEDPhlgd2M+YWfuyd
	 VGyC04/+cuYrW3FKXe1AReZsEeNtK5vW57DQC3FlV4wcUWJcnFz/doUeeqoAklM7m+TZN
	 R8h0o5Kl+QbCioPY5LdCbqcifjH32NLZ/+OimWoo3Dke5OXNk27BsMusnDmHHzWYO6F4r
	 Y6CxhzBZFCF1PERA9rlZ7fJc7nYUE8TZ9yK8bBvg5yQaJERgmz9eulNFp1Dp3Ck+wJhjD
	 9AZFaBVhyGZ7L2Y/H6otLMzwJ3GMefiHemedA1zzLDqwiKB71OhKcU8lIglqJSR+y7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441892;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=RL+8fambt78mNwxisCMhwkZMR57QQ7cEApXVSlXue4o=;
	b=QYKp35u2Bxs20emEnCprtmTqcRfUJcS1ox3a+xBk76whVEpBQVxU2Wf8tTGd3IN7v7X5
	 VBfp5+shjsTaRYbQ5HWpwrZkWh8XZq5KJDXRXA99MBKuKzBP6tdzn4VdRWTymKLr8qFq6
	 KnqLJp4ryd9xGIvaFrOUD2whuRKs0l0l3liDsVnczBv+LC5HMLq/J+GJHjoc7luTAUG9Z
	 RFUffuG5G8ybS5oJFKl8cDstCzlD1Bri0MMFW/lS/4OH744bTnxPS785GK54izhie1/wN
	 fqAv8w1jilp6N3IKeqpA/gApdE68urXC5KhkRHWXTryOLH7oz+mBFA7DBBTJkpHXeQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UCm14a2s;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="w3xYWjc/";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73120606A337;
	Mon, 23 Nov 2026 13:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73120606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UCm14a2s;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=w3xYWjc/
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795441886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RL+8fambt78mNwxisCMhwkZMR57QQ7cEApXVSlXue4o=;
	b=UCm14a2suDs4pglh8w+qnsBPKHLeHEFC0aBs4NmigP6scFBtkIBI/J6Fg7MNuiMQhyTM84
	fQ+UajBr1ZU1X13z/umg63so5OJp3sbMrvDox5uKCNPuS1dj4xkFcpSyEOsXMM9cy1Lam4
	yjoxyI30e+h+b71QsNArfMY8uEzy/AP0E+igPdPiFyoSAM458qSa9hfZ+WTPM/pBe0Xi5C
	v32oooJ95Ijl2sbbCXNxwvmAEX1bhzY+uCaZjFsMVpWnhAJKrFusuWTcOV9rGSM0UScVIU
	ZLDXXSOEG6KSPcy5pvDupgSxblKovbmtNRF1cKinji+SxcyCRx0FY/n/o0hzWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795441886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RL+8fambt78mNwxisCMhwkZMR57QQ7cEApXVSlXue4o=;
	b=w3xYWjc/sYaSNu5XMDIPl7PAUmBCHykHgym1hc8u00qkkIuNdJwoDEbQ3S05B7NDPjjFmP
	gLfAq7cUJUz9LlDA==
Date: Mon, 23 Nov 2026 14:50:59 +0100
Subject: [PATCH v6 08/11] s390/vdso: Enable the vdsocheck tool
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-vdso-absolute-reloc-v6-8-161e218dd217@linutronix.de>
References: <20261123-vdso-absolute-reloc-v6-0-161e218dd217@linutronix.de>
In-Reply-To: <20261123-vdso-absolute-reloc-v6-0-161e218dd217@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Christophe Leroy <chleroy@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795441872; l=2267;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=xAP5SBnE09iOs673j2X7juaBIh0SLYiSMvwxkvPBF8o=;
 b=pI1N3G+K/qs+GYoFHKTpDU9NLx4R70uPYtkOIAyTuD9UqHJwhtrgkO/1BhWuPvWT4X5KlRgJp
 W+/m5LTSDZoAvCxD8B1rriBO/48yR/a+uEqS8LfMyLjk45rPOG9PDUH
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The vdsocheck tool validates the object files and final .so library.
It can detect if the compiler created relocations which are incompatible
with the vDSO which need to be worked around.

Wire it up for the architecture.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/s390/Kconfig              | 1 +
 arch/s390/kernel/vdso/Makefile | 4 ++--
 lib/vdso/check/vdsocheck.rs    | 9 +++++++++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 7138d923d86f..71a614832886 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -289,6 +289,7 @@ config S390
 	select TRACE_IRQFLAGS_SUPPORT
 	select TTY
 	select USER_STACKTRACE_SUPPORT
+	select VDSO_CHECK
 	select VDSO_GETRANDOM
 	select VIRT_CPU_ACCOUNTING
 	select VMAP_STACK
diff --git a/arch/s390/kernel/vdso/Makefile b/arch/s390/kernel/vdso/Makefile
index 54bcf2984ca1..6bc2b7bffd89 100644
--- a/arch/s390/kernel/vdso/Makefile
+++ b/arch/s390/kernel/vdso/Makefile
@@ -45,10 +45,10 @@ CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
 $(obj)/vdso_wrapper.o : $(obj)/vdso.so
 
 quiet_cmd_vdso_and_check = VDSO    $@
-      cmd_vdso_and_check = $(cmd_ld); $(cmd_vdso_check)
+      cmd_vdso_and_check = $(cmd_ld_vdso); $(cmd_vdso_check)
 
 # link rule for the .so file, .lds has to be first
-$(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) $(obj-cvdso) FORCE
+$(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) $(obj-cvdso) $(vdsocheck) FORCE
 	$(call if_changed,vdso_and_check)
 
 # strip rule for the .so file
diff --git a/lib/vdso/check/vdsocheck.rs b/lib/vdso/check/vdsocheck.rs
index 7952ad6ba72b..1ef3f240f886 100644
--- a/lib/vdso/check/vdsocheck.rs
+++ b/lib/vdso/check/vdsocheck.rs
@@ -148,6 +148,15 @@ fn allowed_relocations_for_machine(machine: u16) -> Option<AllowedRelocations<'s
             ..Default::default()
         }
         .into(),
+        bindings::EM_S390 => AllowedRelocations {
+            in_object_file: &[
+                5,  /* R_390_PC32 */
+                19, /* R_390_PC32DBL */
+                20, /* R_390_PLT32DBL */
+            ],
+            ..Default::default()
+        }
+        .into(),
         _ => None,
     }
 }

-- 
2.56.1

