Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C472E3D903C
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 06:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174687; cv=none; b=h3e2FjzxP0BLFptPY5v2AxQymJaKsoHeuV9TLKHXozcz7d8EMBb2E+JA9S4+tn2Zz0C+0kMEIBdSCfjUDAytIhYvE7476Gf4GyqlZWffGOalCsEOnKAOwijLP9T04ZbKD72M3L/gOUQppcLnSBenn+BbOS1/asxh8I9zLIOhZXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174687; c=relaxed/simple;
	bh=MsK41lHUHc/yAdslHPs0q9i5ib5Ft1iliGOxwDrf3Kg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UIbJNpi+HPKrGGF896kIZtbR9k3tFjlCBdHRvK+oLeXuMPVJTjU7jz+ByBuYxLGPTnnPaDFabYIVnmw9UBx7EL411xUEbNnnGXAmmE1fkcxV7X1mvblCVZf5QrZf21Ddd8mI2MHdYJrrfaCHDIfNfIdI5zlQfJQ4pQM/g7wMNB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JnWzCg7D; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tHlKNh6w; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JnWzCg7D";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tHlKNh6w"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XmucPrbDNMsefUcsKOtEJFfiebQUYcBxKvPhHkOrNBw=;
	b=JnWzCg7DEKYV2bv5K6E3fL2KDMQNza16vhQQfVP9nF3iJ/IoUaCDlBDz/d70U96JL4bnVy
	FjwNJ9HQBFViBxVX1Gf7tt25uFpAoDTwROf+MbHrNcMSCO2BKHTCiQ4FDqgpqOCTQFrdvf
	mGFzCCzjqfkLAEB+zSGT49adTuUHlugoT/PoXH4w67QEc3b3R9T1OWTP5SBlly1FzZ6+j8
	VQwAmWJkDUJaNh8453C/m5M/+IY2xg1jbnSi6PezuKdBjZ29sBF1qsT0JlbnUo664I0cGP
	okw1YIVfE58WIO6J75t6Hq77Do+5U/qzPqrwmdKbX0dTaMNdCohQ6L7r3AdNcg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XmucPrbDNMsefUcsKOtEJFfiebQUYcBxKvPhHkOrNBw=;
	b=tHlKNh6wS5kvkLXvS6aQz/UTvClSXPsl2MOfkm2W3fc7sbbFTwrKKMB7iR+WUCpFSo/B4Z
	EWK+/op+KpFGrVCQ==
Date: Fri, 27 Feb 2026 07:44:31 +0100
Subject: [PATCH v2 05/15] powerpc/vdso: Explicitly include asm/cputable.h
 and asm/feature-fixups.h
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-5-35d60acf7410@linutronix.de>
References: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
In-Reply-To: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=993;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=MsK41lHUHc/yAdslHPs0q9i5ib5Ft1iliGOxwDrf3Kg=;
 b=TfyA4IzI496eXTs3L/06kAAhPp3mHtun65YNoMVIs2Yhuq39YNDXrVKmQsQU6Y4LdaAnU2PQ0
 aCTV6rcrMRYADzKJ1REKA2yV8qrugygffNHq4VkMModR+niBGWTNBiB
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
2.53.0

