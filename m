Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AAB34EEF6
	for <loongarch@lists.linux.dev>; Wed, 14 Jan 2026 08:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377716; cv=none; b=j9MxRTqY6cyrBB19QRfvrG+s6wCW7GQqXRO30AFuSkdf4Xze7mLmZGP8+Mp29pqKXfGfEl1vvl4zVOXb8T0gGPgoJUhRddR+N4zZJ+CAML1w93ksbDLKnEsnnhHj5H17c96cvAOnpoDBXDzPAvXtkDXp7ejvOjEGvvurA8pKC9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377716; c=relaxed/simple;
	bh=89K8mUiVvMvCZCKWls9fZ44jvFGy0m8pQ8qbm4twTa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RsTN3t+iZKsfpqiapIeiw872vl5TkE8WxRhdEFn0bxM/zEGnWE5oQFuQs1a+qgnHp9T6DE+akt2QdhBGzmeKMxyLtgFDfBzvV2ybM7dCcId5c0eK++vz3YPhHPqFLe/RjhLfQ38DDOKnzr6ibtYa1V1U048FijepeywlFRhialk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kFqoqabH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uZ3P/Kny; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kFqoqabH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uZ3P/Kny"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoyAobvtAA9UQIKcVjt4/vpR3BEv5id0iFKUdJTluTk=;
	b=kFqoqabHpDV3T9wPA9bmEv8kDqQYgyBf/ZZfxqDBpt+1iIEV/ozQJr3tRvH2CdmuUPEtmn
	OVZtQ50rFQDY8XWV0AjmFsYSPR6iwKjL19NrTeS1RvFEyJh6cQiGgiM7bZTE5Frq9LMdny
	Jq7q7MzaEsO/BHoFqPtjbFPhh89yzhV5ybYXZyHy8xlNG9OAUT3biLb1AppNWp+bNg/N3V
	Acvvvd3BW2iv7bb+kbuY7/lT1aQwwpCGoI5OgbxXScoV5Rp4sC8FQkvUxeSx1Nc9NnX74A
	k4j7Ae+6q126t8Yqf1PKJ3fWPB2BBYH8w9b49fiT3ilHr1YzbD2cqHIWJFVbgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoyAobvtAA9UQIKcVjt4/vpR3BEv5id0iFKUdJTluTk=;
	b=uZ3P/KnyGuUf0Nz8DcxWhm7MR3FURfwdGnxivNhb+GuDV1TNbVTSIOATNT/FHtFN44972t
	YczMt0bOwRA1ATAQ==
Date: Wed, 14 Jan 2026 09:01:40 +0100
Subject: [PATCH 08/15] MIPS: vdso: Explicitly include asm/vdso/vdso.h
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-8-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=696;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=89K8mUiVvMvCZCKWls9fZ44jvFGy0m8pQ8qbm4twTa8=;
 b=FSiu8UiGSl/Aaf2eVHxCWSFtrEdYyGw5+eoDFFvTdy8XTx/6gLGZt62GT7CmMMb0UEm6+GLmY
 7hN9XerTfMXCXKMzaGcSXECibAYr028LLgbUS0JbuJ5Xbboxu6aqhEx
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The usage of __VDSO_PAGES requires asm/vdso/vdso.h. Currently this header
is included transitively, but that transitive inclusion is about to go
away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/kernel/vdso.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index de096777172f..2fa4df3e46e4 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -21,6 +21,7 @@
 #include <asm/mips-cps.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
+#include <asm/vdso/vdso.h>
 #include <vdso/helpers.h>
 #include <vdso/vsyscall.h>
 

-- 
2.52.0

