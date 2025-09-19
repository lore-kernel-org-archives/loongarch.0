Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04061E32A2
	for <loongarch@lists.linux.dev>; Fri, 19 Sep 2025 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758286734; cv=none; b=oXt4RiPBKwt9hTtNNKk42EoYeC/0dDtJgEOU6iVnh907ikx2CPX/ydNRx026D4SHrer/JlPtJEx5eL3df29n/w26iIpw+7jB6NO7+wrf6XDNc3XSFi80o9Kbe5pkoeD0lEekqcSadGiR/QVGKFKcuep4UleCGtnlRNJ2zOLSAvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758286734; c=relaxed/simple;
	bh=UqZPKjOghmkUG63/f5MtcyvviVRnMG+ZaWlI+fBKYkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R3dX33oapfGR6e2HY14A/zNk2K6ApB6Kyf+oD7uDndBMo50MniB3Ag+Ok1vROPOU6C2EdT6WkzKnW92Zd8SP/BwiR27eYFZAKhn1bxiI+SA9/E8g0DvUyfpuRCdzv3DI6T9P7V7K39TGS6j4RdhdAfjEEGtWkvfxVIdGzzGyiEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=aa+Yr6yl; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="aa+Yr6yl"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4D5A32654B;
	Fri, 19 Sep 2025 14:58:50 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id le6wcmcofI2V; Fri, 19 Sep 2025 14:58:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1758286729; bh=UqZPKjOghmkUG63/f5MtcyvviVRnMG+ZaWlI+fBKYkA=;
	h=From:To:Cc:Subject:Date;
	b=aa+Yr6ylX17nEX8EK4RlKgRuRDHqli3dwz7Wb9fty120Qgx5Kw70GkohSQdiZtN8F
	 fIQ3Srd4TrY0U9stCxzNgFR4zi0l/kyHyWw8oEqv8RFnW2i8zNdi28bXJfrksYrP8N
	 x+LtTsUSeU1MUP6gMKtuVhv5J319bGrHEUaO8/GESTVvNluOha6XxJkLMiLmyipREu
	 dkjqxfvdBdZz26k07HxdwIo69oBP1Cy2FB98doth98eevXvy8TPJ0z2YzE6D3ai8tw
	 OwfFAKArsHPPuPGl5BH+j4AxmhwaYg56DEQe9ksHzalwqYOU6fh7ySmmwsFAiHAy6k
	 MyGGJ1Y+V4mEg==
From: Yao Zi <ziyao@disroot.org>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Huth <thuth@redhat.com>,
	Yao Zi <ziyao@disroot.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Xi Ruoyao <xry111@xry111.site>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Fix bitflag conflict for TIF_FIXADE
Date: Fri, 19 Sep 2025 12:58:29 +0000
Message-ID: <20250919125829.37951-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After LoongArch was converted to use the generic TIF bits in commit
f9629891d407 ("loongarch: Use generic TIF bits"), its TIF_FIXADE flag
takes the same bit with TIF_RESTORE_SIGMASK in thread_info.flags.

Such conflict causes TIF_FIXADE being considered cleared when
TIF_RESTORE_SIGMASK is cleared during deliver of a signal. And since
TIF_FIXADE determines whether unaligned access emulation works for a
task, userspace making use of unaligned access will receive unexpected
SIGBUS (and likely terminate) after receiving its first signal.

This conflict looks like a simple typo, let's just switch to a free bit.

Fixes: f9629891d407 ("loongarch: Use generic TIF bits")
Signed-off-by: Yao Zi <ziyao@disroot.org>
---

Note the problematic commit is contained in next-20250918, but not
master.

 arch/loongarch/include/asm/thread_info.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/thread_info.h b/arch/loongarch/include/asm/thread_info.h
index def7cb14467e..4d7117fcdc78 100644
--- a/arch/loongarch/include/asm/thread_info.h
+++ b/arch/loongarch/include/asm/thread_info.h
@@ -77,7 +77,7 @@ register unsigned long current_stack_pointer __asm__("$sp");
 #define TIF_NOHZ		16	/* in adaptive nohz mode */
 #define TIF_USEDFPU		17	/* FPU was used by this task this quantum (SMP) */
 #define TIF_USEDSIMD		18	/* SIMD has been used this quantum */
-#define TIF_FIXADE		10	/* Fix address errors in software */
+#define TIF_FIXADE		19	/* Fix address errors in software */
 #define TIF_LOGADE		20	/* Log address errors to syslog */
 #define TIF_32BIT_REGS		21	/* 32-bit general purpose registers */
 #define TIF_32BIT_ADDR		22	/* 32-bit address space */
-- 
2.50.1

