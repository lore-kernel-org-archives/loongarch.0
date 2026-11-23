Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441885;
	b=BaiD0eSeuMb2OLWN1jS6ESxQXs+i+KhcKMUwM5wJTKMMbhGBRYKDn6HuWpvP88teW5Bi
	 xszMwHHNsYt5xgIIrz8tFKphJDm6cK9KMQQccJ0BXZX7BYOWoD/sEEhe6Ie7i0zYGUHki
	 8aUr2W4X0GCxzbws+ukylrqf/Wophb8ntNNBYjgiKf+r1F1wO4t6tUJlpGrFLrKDY3Zmu
	 Ket0yBShkI1gqqYU5590XodD3f3F3G0YbHtaMBGD7calm3bB5Emn2WV+nuQEdK5NCMejw
	 Oopn+4iWHlFYoTvtQX2BAzkdM0JkHTqPOgP7qdSNSpd5NfoRwUZqpVGTfQRb7EKExlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441885;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=wbaUWZC28smuRoW90pWpaXz3GGY4MsOKGg8st7PIjvw=;
	b=5gd0lX8N33QymgH091CvEkpx3BcCovqHG3ysrVog/3bxJCpq1LrWwx/p0WAOtUwas1vr
	 DbrmL0MfNwBRfMqmqFRhp6hK7hZfo3a1lQpyqidMndpYcCBbyn+ntdINzi7dAsbnmq+hx
	 gGI1uvcaZhSTLhkwZPaWgXPvjEgKJUpN4rVEwQLVByVYwdR9uonDfr7G+b4u2YjczzczC
	 HvVO6hr+SATUailewBMHVy83c/6/sHnsdHo0+tJdGMDnAdXByDk2mzMs7aEzn4zsyXjrx
	 plI52QJzr4Mkt+/koPg+lMz9i/axUEp9TXk1WSPuDz2GlNiWp13Tm4QALwQITVFDnIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="AdnWR/fT";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CiSYPSUw;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E94C606A6B9;
	Mon, 23 Nov 2026 13:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E94C606A6B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AdnWR/fT;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CiSYPSUw
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795441882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wbaUWZC28smuRoW90pWpaXz3GGY4MsOKGg8st7PIjvw=;
	b=AdnWR/fT44yXzm+ht95OqsrELNCyH358idfw54sxV+82ZCQh8b1aIvskImaSeMPYYiPAGX
	tMSFHMm39iz7ISqX2w8pj4D8L/qzXb1g+WS97tFqN8moTMNum/DjAz0AOhUR9mHeaYQxj9
	5LZEWcHDHmfyVG3iQ0WvT8vFcoQbpRxTznUUUuQTu76cbBTyn3KQ4CodP8l937jaO91ZuP
	Qt441N7af+F5t3S2BxLy/sH8WAJ3bW5O4y6lY0UQw0K7A+UQhTXKdNOY7nqA7niM/tyffr
	0vxJK9JiP8+NfpneuW9wJzwcEPrvj3p/SNvKjKHMhV35bVoateZvXcf6rspcBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795441882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wbaUWZC28smuRoW90pWpaXz3GGY4MsOKGg8st7PIjvw=;
	b=CiSYPSUwyavYYl1x/i+wWbxPyj9epV9FlY90gd2wiTfE4WxtGjnCDB5MgwLKxaEC26eTmC
	kUVvWJED9GTdvTAw==
Date: Mon, 23 Nov 2026 14:50:56 +0100
Subject: [PATCH v6 05/11] powerpc/vdso: Enable the vdsocheck tool
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
Message-Id: <20261123-vdso-absolute-reloc-v6-5-161e218dd217@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795441872; l=3226;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Cgbtb7qSJ3AcXOvZFi0BZIPMWqlXOiwZ1bBjbdIILZ8=;
 b=tf9jQyiu6Hx303xQeraxjP8OCezqMY+3qKghsgR/OWQajoh6hO04aKYTX/3KWhg5DquWsJP8b
 aAXQOlfMR3eDCtoARUDmA0kN0uVLstrGS/+wTZDeacxxM2luRimKr84
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The vdsocheck tool validates the object files and final .so library.
It can detect if the compiler created relocations which are incompatible
with the vDSO which need to be worked around.

Wire it up for the architecture.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/Kconfig              |  1 +
 arch/powerpc/kernel/vdso/Makefile |  4 ++--
 lib/vdso/check/vdsocheck.rs       | 27 +++++++++++++++++++++++++++
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c3b6cd655606..1c4a75c3a830 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -327,6 +327,7 @@ config PPC
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
+	select VDSO_CHECK
 	select VDSO_DATASTORE
 	select VDSO_GETRANDOM
 	#
diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 0d1a49529885..b2e399e10273 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -82,9 +82,9 @@ targets += vdso64.lds
 CPPFLAGS_vdso64.lds += -P -C
 
 # link rule for the .so file, .lds has to be first
-$(obj)/vdso32.so.dbg: $(obj)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday-32.o $(obj)/vgetrandom-32.o $(obj)/crtsavres-32.o FORCE
+$(obj)/vdso32.so.dbg: $(obj)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday-32.o $(obj)/vgetrandom-32.o $(obj)/crtsavres-32.o $(vdsocheck) FORCE
 	$(call if_changed,vdso32ld_and_check)
-$(obj)/vdso64.so.dbg: $(obj)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday-64.o $(obj)/vgetrandom-64.o FORCE
+$(obj)/vdso64.so.dbg: $(obj)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday-64.o $(obj)/vgetrandom-64.o $(vdsocheck) FORCE
 	$(call if_changed,vdso64ld_and_check)
 
 # assembly rules for the .S files
diff --git a/lib/vdso/check/vdsocheck.rs b/lib/vdso/check/vdsocheck.rs
index 0d5ceaca34d7..da58ff220eab 100644
--- a/lib/vdso/check/vdsocheck.rs
+++ b/lib/vdso/check/vdsocheck.rs
@@ -69,6 +69,33 @@ fn allowed_relocations_for_machine(machine: u16) -> Option<AllowedRelocations<'s
             ..Default::default()
         }
         .into(),
+        bindings::EM_PPC => AllowedRelocations {
+            in_object_file: &[
+                10,  /* R_PPC_REL24 */
+                11,  /* R_PPC_REL14 */
+                26,  /* R_PPC_REL32 */
+                249, /* R_PPC_REL16 */
+                250, /* R_PPC_REL16_LO */
+                251, /* R_PPC_REL16_HI */
+                252, /* R_PPC_REL16_HA */
+            ],
+            ..Default::default()
+        }
+        .into(),
+        bindings::EM_PPC64 => AllowedRelocations {
+            in_object_file: &[
+                10,  /* R_PPC64_REL24 */
+                11,  /* R_PPC64_REL14 */
+                26,  /* R_PPC64_REL32 */
+                44,  /* R_PPC64_REL64 */
+                249, /* R_PPC64_REL16 */
+                250, /* R_PPC64_REL16_LO */
+                251, /* R_PPC64_REL16_HI */
+                252, /* R_PPC64_REL16_HA */
+            ],
+            ..Default::default()
+        }
+        .into(),
         _ => None,
     }
 }

-- 
2.56.1

