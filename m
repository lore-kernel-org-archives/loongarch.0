Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FB237BE99
	for <loongarch@lists.linux.dev>; Wed, 14 Jan 2026 08:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377715; cv=none; b=DYbjq9ne4Pf9C9HwsBZ0qKiATbZsxBwrgcaITGw4nioXTZJ4ryJoAetf/e2tybT8mNDX6jGkB1USxa03qQr3+d37wRX92prjZAxqCLeYtVI24c1dVcHiXMikQQKWIkzy5Sa41uU54YZLLmpcOAjOwzJ9mkmF8ZE/ki/SGC8UeQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377715; c=relaxed/simple;
	bh=7hrCYWBIqqPuqZi+KWMOs5v3zvUVJXWvUMyMvUSo5Cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fX1m/SLgl2SkuNkWe5TAFTFStCSPSRzmYA3QcC9W0V4qu5Tqj7+Mu7P2g4q5oIqwQxltzB/BQVi4ShwBBLj1tGmSjUhM0bE8ovT6oJpeBgCiSXcKO5+1DbJv78he27Up6Lqmy/ghlFbNYxxynjfXMJ7+YIrko91KCS17ax4HlTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KA+Ept47; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CkgHGL1i; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KA+Ept47";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CkgHGL1i"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wPDeUtfk02gHkXYGBZ6ArUYeEEiuysvRM9FvgAfiA68=;
	b=KA+Ept47Bd52d2/CrPrkEZSPfwLpgpLDw4bnKDsi6WumEYorcDbZZKJYnNxG31YwW4vUuy
	gwLhcrBzAdm9l5h+GKhwRtV9yXgQ3+8wXjd226AUV0mBOMn1JQu73HX2f9UuHTnEDqbTbv
	XyVYn8xdbupp6W+zWJHBiJWHPjNu2Tls9g15Q9irbG+alB7Lb/2bIofuJqt8pwaW8IdITW
	O5tBJmikrnAllU6Z45bV2kAF7aII/LibRGnYcEGbcEUbvHREVMDmzCMMrLvhg+je7DvFwt
	KIx9wuGjnknqEEXA+hU0z/AeemLw80m7m0ozqx6HNwzoCPPjEo7vb+y6n+d+hw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wPDeUtfk02gHkXYGBZ6ArUYeEEiuysvRM9FvgAfiA68=;
	b=CkgHGL1i5vm5cOgKwU/TkM7lIjYX5ldER62/KQXJQKU5UBvEIci5xB8RsuUekmoXyNnkhj
	fH1NraHpwS5weXBQ==
Date: Wed, 14 Jan 2026 09:01:37 +0100
Subject: [PATCH 05/15] powerpc/vdso: Explicitly include asm/cputable.h and
 asm/feature-fixups.h
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-5-803b80ee97b4@linutronix.de>
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
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Christophe Leroy <chleroy@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=993;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=7hrCYWBIqqPuqZi+KWMOs5v3zvUVJXWvUMyMvUSo5Cs=;
 b=5G8pe5gnO/uaJrl3YNLb+SRx27aTKPHePxwprX/8ayO9vjOBKWD1kl8EpPsqbHsEolHPugS36
 Y5hl6ZC3/d5DaK8Qfv6u5lr6ualVqzmnQ0NAnk8z4scWYc31yPN6e5V
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The usage of ASM_FTR_IFCLR(CPU_TR_ARCH_31) requires asm/cputable.h and
asm/feature-fixups.h. Currently these headers are included transitively,
but that transitive inclusion is about to go away.

Explicitly include the headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vdso/processor.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/include/asm/vdso/processor.h b/arch/powerpc/include/asm/vdso/processor.h
index c1f3d7aaf3ee..4c6802c3a580 100644
--- a/arch/powerpc/include/asm/vdso/processor.h
+++ b/arch/powerpc/include/asm/vdso/processor.h
@@ -4,6 +4,9 @@
 
 #ifndef __ASSEMBLER__
 
+#include <asm/cputable.h>
+#include <asm/feature-fixups.h>
+
 /* Macros for adjusting thread priority (hardware multi-threading) */
 #ifdef CONFIG_PPC64
 #define HMT_very_low()		asm volatile("or 31, 31, 31	# very low priority")

-- 
2.52.0

