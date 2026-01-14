Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EFD37C100
	for <loongarch@lists.linux.dev>; Wed, 14 Jan 2026 08:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377721; cv=none; b=Elhuk5wh4FA8pP71UPDXqG2x77g67DLJCGhM2b+jksKpPNNKYNRVrjbmg/17UHIa3L18nI7r8Jm+6k8e2H+6T/04XyWWwvIWFON5IrTuZ/2dBSHCTHsH2PZmaA0Xhksp7hAkvpbaTerYUPNdfohmoBIF/nIIqihMorI39VYw4M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377721; c=relaxed/simple;
	bh=+Wcy7WXtx6fsZm7eFBJhy/yoGaqdcT1tYaHgYzL2d5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oiPNsutKgPLZ6GUbTT2T5Mz6sXe77fw38IUz2fRS8ZzcNZmCJwyxWyOqpm0atfYaOR4h1heD5dvVxUmkCuIJshU7oNad7cP2wRC1RDmnpbR4CDQFVu4bIYrQOWEr33nzi/j/hyaHBqOuhRV2wvLY7qvEtvwhEdP2g0E9+lrhJ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vCWAQtiI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WNTKAX2W; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vCWAQtiI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WNTKAX2W"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OgvUl7fZvLFsRnGSveNl7/DD5eX3IjONlFG6m4/kXis=;
	b=vCWAQtiIU3Wxd7rFg02B2t0bIwqjqYkHndYy0Uyf79vYVMslcQTzhvVeE/m1SfCrUa6FRE
	PTXOMQSrPT21K13gKvoKnLFS6KWiUUnxHw4DxKaOZYu5Zbe1tmfYSXXYDgc/bGLldbvAnu
	ULOdWef2He95wORAmod/Pj7zZDZ2+kzm0d36ogkQks9TqbicVqe1gNyLKdt/K9n921BqBi
	4p7Z6HVJB/GSk9mBLx/3F4JCu/YzF5WyIQrTsm9WYIOpjSdyXHuE7BzUVId2VjLXeUrcaR
	5Ei2h5lm33wqW3y3GQvmk3bg2Z2loHh+L0F//ZCGIre229a4CFoZ6rTlPkvteQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OgvUl7fZvLFsRnGSveNl7/DD5eX3IjONlFG6m4/kXis=;
	b=WNTKAX2WolqSRqQ6QiWJZQ4MY5tUqvJ6en8554tAfOvxm5SzOyi17gkoAypgq2gQnMkBtg
	YHldIiL/6Bppe0Cw==
Date: Wed, 14 Jan 2026 09:01:39 +0100
Subject: [PATCH 07/15] MIPS: vdso: Add include guard to asm/vdso/vdso.h
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-7-803b80ee97b4@linutronix.de>
References: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
In-Reply-To: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=915;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+Wcy7WXtx6fsZm7eFBJhy/yoGaqdcT1tYaHgYzL2d5g=;
 b=t7XGfclDQVcut4P0uQIZeoIZKH/awyXF/occ/9y7qxL+ZenmO6IU5vAWHxRt0qNMOD8MGLdlE
 GxhqnmdA1gsDUk6bg/wL5RRsr1MJ+aaQuEuZcbesWv+QXVekjQFNfF1
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

An upcomming patch will lead to the header file being included multiple
times from the same source file.

Add an include guard so this is possible.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/include/asm/vdso/vdso.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/include/asm/vdso/vdso.h b/arch/mips/include/asm/vdso/vdso.h
index 6889e0f2e5db..ef50d33f3439 100644
--- a/arch/mips/include/asm/vdso/vdso.h
+++ b/arch/mips/include/asm/vdso/vdso.h
@@ -4,6 +4,9 @@
  * Author: Alex Smith <alex.smith@imgtec.com>
  */
 
+#ifndef __ASM_VDSO_VDSO_H
+#define __ASM_VDSO_VDSO_H
+
 #include <asm/sgidefs.h>
 #include <vdso/page.h>
 
@@ -70,3 +73,5 @@ static inline void __iomem *get_gic(const struct vdso_time_data *data)
 #endif /* CONFIG_CLKSRC_MIPS_GIC */
 
 #endif /* __ASSEMBLER__ */
+
+#endif /* __ASM_VDSO_VDSO_H */

-- 
2.52.0

