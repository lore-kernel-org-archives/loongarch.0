Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ED71B9835
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543726; cv=none; b=aKGyY+GHKhcDIjxA0SLSPZRQHbxpWVAEJ0GX3sok+kKH0qR1c2xU0rEjPjFvu+iCTugxfhcpRQ6I5wkyTLq5P/jl46ijd9RsXkd/6jFmJvI7XNy5JUcmszkrc7Eppth6qufy4ppcaYB9qnubiZXcejd5O0rL7hBnPnuqF1KbJdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543726; c=relaxed/simple;
	bh=1izBRdFKuR8SiZvLAToZn5vA+gLSTJVX1IAtToMcJlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQdZu30MM/J1UnniBaJsfxUv8sYYqURMQT4vEX23tXN1G55szUEU8ev0+4BjiAlJMu/GT9ZTh4n8dDGRr+fBRldXRwrFezcg7+BLcXZCVVLt6NHDAS1bLD93f3G2Iu16h+3LV1iWgyoet0LKPN04ySoRCjq1NOqD06s3LU1LzNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kr0cxFj0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Syd5BM2c; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kr0cxFj0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Syd5BM2c"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ss7tdeW7PchzSqqaQvkxVTIKlW4rJNWH4B0dpyhMHfI=;
	b=kr0cxFj0gVSlMEE3fBkkaHeRSHUxueF9GFnuHyT8EoBrw5kM8z9A7vT7mHfaziowOHgko4
	emX0mO/Zcc6sAED1W8Q87MyLJ11VijeN3B41A73XSWNkjcjJ0zgFQU7D/4DH84wL07nojO
	+imFEsO8ptFPG62YvSNncYQJr+PMMPl/MlFT0G3GUHSWOc3xOcywW0dwwg21GaR5KbSc8/
	vouWYr8IZE13AcoN9V2+dsL1nR0HrrutlYI31CL28a3RcnoSFcMRJR4cYsbWKscZ0Jn3uu
	f13Da8Zj3tRcomPwpty86r2jmKQt1qRpgQtnGal2/nOn0xwuZzMTEaC0/M3thQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ss7tdeW7PchzSqqaQvkxVTIKlW4rJNWH4B0dpyhMHfI=;
	b=Syd5BM2cviXiq6R6Wad9Ulx87EPU2BhSVsgW+gBdV26KBptPbi9XoZM+1Ol+mh8u6Q5tH5
	SwnQrnYbe0DilLCg==
Date: Thu, 10 Oct 2024 09:01:06 +0200
Subject: [PATCH 04/28] arm64: vdso: Drop LBASE_VDSO
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-4-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=2310;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1izBRdFKuR8SiZvLAToZn5vA+gLSTJVX1IAtToMcJlk=;
 b=K3gDGZbsUbGnSEnKjQUn89/rq77MzDDW7/mmzjdHk4rROyRkipKRHf5H1neQZFJ9cgZDkviiF
 x2koXkmvm96DlweT1cv/Qb4IsOdhG841Mya56Frd3qzwTmxH5fdKJKa
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

This constant is always "0", providing no value and making the logic
harder to understand.
Also prepare for a consolidation of the vdso linkerscript logic by
aligning it with other architectures.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/include/asm/vdso.h       | 9 +--------
 arch/arm64/kernel/vdso/vdso.lds.S   | 2 +-
 arch/arm64/kernel/vdso32/vdso.lds.S | 2 +-
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/vdso.h b/arch/arm64/include/asm/vdso.h
index 4305995c8f82f416e6ce11280ac1dd19fbe25eec..3e3c3fdb184274abd20647335b19e81e709506db 100644
--- a/arch/arm64/include/asm/vdso.h
+++ b/arch/arm64/include/asm/vdso.h
@@ -5,13 +5,6 @@
 #ifndef __ASM_VDSO_H
 #define __ASM_VDSO_H
 
-/*
- * Default link address for the vDSO.
- * Since we randomise the VDSO mapping, there's little point in trying
- * to prelink this.
- */
-#define VDSO_LBASE	0x0
-
 #define __VVAR_PAGES    2
 
 #ifndef __ASSEMBLY__
@@ -20,7 +13,7 @@
 
 #define VDSO_SYMBOL(base, name)						   \
 ({									   \
-	(void *)(vdso_offset_##name - VDSO_LBASE + (unsigned long)(base)); \
+	(void *)(vdso_offset_##name + (unsigned long)(base)); \
 })
 
 extern char vdso_start[], vdso_end[];
diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
index f204a9ddc83359fcbe87f24171389bb64e7adceb..4ec32e86a8da22d5e2315e55ae2e86ec8e7f5f9a 100644
--- a/arch/arm64/kernel/vdso/vdso.lds.S
+++ b/arch/arm64/kernel/vdso/vdso.lds.S
@@ -25,7 +25,7 @@ SECTIONS
 #ifdef CONFIG_TIME_NS
 	PROVIDE(_timens_data = _vdso_data + PAGE_SIZE);
 #endif
-	. = VDSO_LBASE + SIZEOF_HEADERS;
+	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
 	.gnu.hash	: { *(.gnu.hash) }
diff --git a/arch/arm64/kernel/vdso32/vdso.lds.S b/arch/arm64/kernel/vdso32/vdso.lds.S
index 8d95d7d35057d27835dcd0643bb6a40adfcd8d5b..732702a187e9e8b62972ee0aad75c23568e5e779 100644
--- a/arch/arm64/kernel/vdso32/vdso.lds.S
+++ b/arch/arm64/kernel/vdso32/vdso.lds.S
@@ -22,7 +22,7 @@ SECTIONS
 #ifdef CONFIG_TIME_NS
 	PROVIDE_HIDDEN(_timens_data = _vdso_data + PAGE_SIZE);
 #endif
-	. = VDSO_LBASE + SIZEOF_HEADERS;
+	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
 	.gnu.hash	: { *(.gnu.hash) }

-- 
2.47.0

