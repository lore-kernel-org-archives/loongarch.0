Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441882;
	b=4myHPtJcYFtFiA6tVgfFadCs5tpIQI0wu10pKaBo1rTFeEyYM+ZpoeiceqrfFvSjiwPM
	 NFK0BdqJqeRmgDhTwgk1fRPUyIJ84J2mgKfiEQtE2EvlUp8i3Uv8NEK4eCSpB+v8VOBzX
	 nqhJ2ZG5td8HGVmcVH2FIvVLjOk54/V6NTIHzUtIRc/7p0ksO5dLFXgrsbYlF9xp5BCj6
	 zUO2Olj/jO9j2yQ+GmztSajT9VUnDlu/pnMb7r9DAalfsrcapMwFlrJkDp2ARA09g1B2K
	 1X58rV21NRJBalJcjwYKtwVvI0M3U3HsvboEENGlagWnC8kdZdQsKUDwzXtTZtOoLtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441882;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=ogBMPA0Qx4PjkZ9OZjmL4avau0QGga2wYFkd3qrKkjA=;
	b=PhEFOBDbqTQeFm/dJJl9BiYmAB3t1FQlJD9b+NqCrAKwNPFEHdlfIbswPIJDkuKV+DC6
	 mMumEpw24EI7S+tlVA+oS/qx1TMRZM7cmvVBzatdNT1PO63RpD4j669yHYfMK+jwCowK9
	 K+kKFdlZ8wf+KSCAfj+k9YmKD8AsptmlW0ToxAI68s7PRxTa6O7YEEfd8rwFYAZKTAVor
	 sjXECYzjyIDhiqbv2p6ZYmfQbMkWiDbC1TPfHQ/Vki8IWWbD+tUvNKLGZrLwgrz1ARLbz
	 jrojpUmEgucMnveSXO1YBSc6z09iyMTvA49K0FqB3yw3V8CzhzE7+Bfy8Xyn++Qm/7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cmCyDGAo;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FI7TlzcC;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C8E606A33C;
	Mon, 23 Nov 2026 13:51:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22C8E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cmCyDGAo;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FI7TlzcC
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795441880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ogBMPA0Qx4PjkZ9OZjmL4avau0QGga2wYFkd3qrKkjA=;
	b=cmCyDGAoxa8oDitp4LrGWDkP4CDp+0lHo+E95wkqa425Lcn3w9cm+RbtYI5eSO9sXjWmat
	QoidlgrDeM4aH5qIvXHPl1TDVl5Iw559yftSUOCPc5GcBuxFifOb+nU3JxnfLbZdhCZ/Om
	61jBrg1gwc6UQdIBpO8pgask1Ph1G4gW3SA6b0NuVLd4pUoNaoNy0wPFXztdPp3d8hh+Zg
	svLYWwoSJyRDtbPyOPK0O339rD3z7Iwn0JP+dqM6WEftghcvuiSaHG4v/nGkA4phRhVCqH
	PJlYghaw7CnygCSTcXlznhUSRnaErzqNJ6mBTTdKTlafxylCV8WSXfEo+ZSzJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795441880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ogBMPA0Qx4PjkZ9OZjmL4avau0QGga2wYFkd3qrKkjA=;
	b=FI7TlzcCK0viQr5GdhmEG+URex60ciyYkkkN9vhgUpMrF77XhfzOHKSYvwvEX+q3uNF/qq
	5xO9jwTwQOfMlyDw==
Date: Mon, 23 Nov 2026 14:50:54 +0100
Subject: [PATCH v6 03/11] ARM: vdso: Enable the vdsocheck tool
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
Message-Id: <20261123-vdso-absolute-reloc-v6-3-161e218dd217@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795441872; l=2441;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=8GMxY0hgZLZmXIGNxEsx+zQJWvtZKAV9EO32aM3n8Sw=;
 b=LUKSJQixY6S9CU9mjQSgw2/Vb6bCSqXY+Xe0Ot0VvpO4DA94i5rRE3OxPHegS/C2s4VGPq1re
 6wJI1xLx7sRDEH/jE+pAglfUlG/v94LNXGZGAJwkNAq7NAX4/q3rqdM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The vdsocheck tool validates the object files and final .so library.
It can detect if the compiler created relocations which are incompatible
with the vDSO which need to be worked around.

Wire it up for the architecture.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/mm/Kconfig         | 1 +
 arch/arm/vdso/Makefile      | 4 ++--
 lib/vdso/check/vdsocheck.rs | 9 +++++++++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 41d7b495ec45..7f55ed37f464 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -943,6 +943,7 @@ config VDSO
 	depends on AEABI && MMU && CPU_V7
 	default y if ARM_ARCH_TIMER
 	select GENERIC_GETTIMEOFDAY
+	select VDSO_CHECK
 	help
 	  Place in the process address space an ELF shared object
 	  providing fast implementations of gettimeofday and
diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index cf8cd39ab804..fd34d0ff018a 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -37,7 +37,7 @@ endif
 $(obj)/vdso.o : $(obj)/vdso.so
 
 # Link rule for the .so file
-$(obj)/vdso.so.raw: $(obj)/vdso.lds $(obj-vdso) FORCE
+$(obj)/vdso.so.raw: $(obj)/vdso.lds $(obj-vdso) $(vdsocheck) FORCE
 	$(call if_changed,vdsold_and_vdso_check)
 
 $(obj)/vdso.so.dbg: $(obj)/vdso.so.raw $(obj)/vdsomunge FORCE
@@ -50,7 +50,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
 
 # Actual build commands
 quiet_cmd_vdsold_and_vdso_check = LD      $@
-      cmd_vdsold_and_vdso_check = $(cmd_ld); $(cmd_vdso_check)
+      cmd_vdsold_and_vdso_check = $(cmd_ld_vdso); $(cmd_vdso_check)
 
 quiet_cmd_vdsomunge = MUNGE   $@
       cmd_vdsomunge = $(objtree)/$(obj)/vdsomunge $< $@
diff --git a/lib/vdso/check/vdsocheck.rs b/lib/vdso/check/vdsocheck.rs
index 8cd8c7f3fec8..e28ee59a900d 100644
--- a/lib/vdso/check/vdsocheck.rs
+++ b/lib/vdso/check/vdsocheck.rs
@@ -48,6 +48,15 @@ fn allowed_relocations_for_machine(machine: u16) -> Option<AllowedRelocations<'s
             ..Default::default()
         }
         .into(),
+        bindings::EM_ARM => AllowedRelocations {
+            in_object_file: &[
+                0,  /* R_ARM_NONE */
+                3,  /* R_ARM_REL32 */
+                42, /* R_ARM_PREL31 */
+            ],
+            ..Default::default()
+        }
+        .into(),
         _ => None,
     }
 }

-- 
2.56.1

