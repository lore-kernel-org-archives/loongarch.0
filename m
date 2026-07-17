Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFF83AB26B
	for <loongarch@lists.linux.dev>; Fri, 17 Jul 2026 06:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784268904; cv=none; b=DHhZPQlj5F7omWoQD5433VUANHn6JyHpHoICxKgxv+VNChFQ4RPhkDnAnNn5zaOU08Y4yRQ7QAQ1mH9joHlz18kg/r/8RzeQTnjakSNe4Uxr1TbW6E3slyjc7h39Jlgqqtuu6imgQ8wkVc8WssnjwVEpaxOQ3zmx+3baADRotAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784268904; c=relaxed/simple;
	bh=t3APLy9t2SZVxR8iClS2KaGCf82ju0LDxr/0aH1HIvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k/k38fSdNlLgY/h8m8aguYAHoAcE3LWptIRZDVeZx4jyhv0uBybZYPRRRYHR5x9pVkQWuv6PNwoD7Cf11wRHuFmdwoRSfMVgQeotvnnaOwt4sufdRcIezJ+lUIR5IKHjj1vwWglTB3Ye8vZ0/IRaOnzFD3ThjSFA/fMKkVVFlek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ovjYqPfP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=r4tWelha; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ovjYqPfP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="r4tWelha"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784268901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQbno2WvTFVUJzsRinFLe6H6OiW8r6h0VjyMcplhKIo=;
	b=ovjYqPfP49nfKV50tUridaUCmN2wEut8eA8C8vu1HpUDDDG4MKVHrU+TXQvRmHTHW/SZG9
	eBN4eN4cj8OOVwsHfa7RzuAN+xk7krnjKS5R+GB1U3UxER99/Eqb1/ZtQgpHkjTVKVWXUx
	6hNRIh6jvfY2o+Tys7CVxCKW9AjEmKTLZMeK7CIPuXd3YnXe12XnfHniJ6ECaxNzycCOsb
	NVYeZ3UvZzPN8GQ73OQ/rjH0KM3zUS0Xr5Mb1wLpmkM5S5XGbOO9e2Co0c+UZR21PGGTH0
	qM5qhKiWB6+VgQ1nxscWhy9jyFC5VfsKAWTvv53Q+rGOpW9cpcD9ssalzRtHIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784268901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQbno2WvTFVUJzsRinFLe6H6OiW8r6h0VjyMcplhKIo=;
	b=r4tWelhaNShXcQKY3JDouYaui2eyhEbnWAbHyyJe+5Jr4uhktzkJdfKjWxywa+MG1Bb1hX
	dMs3a1rcRJ+vIyBA==
Date: Fri, 17 Jul 2026 08:14:47 +0200
Subject: [PATCH v2 3/7] MIPS: csrc-r4k: Remove CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260717-vdso-arch-clockmodes-v2-3-756f5a5d1467@linutronix.de>
References: <20260717-vdso-arch-clockmodes-v2-0-756f5a5d1467@linutronix.de>
In-Reply-To: <20260717-vdso-arch-clockmodes-v2-0-756f5a5d1467@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784268894; l=1015;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=t3APLy9t2SZVxR8iClS2KaGCf82ju0LDxr/0aH1HIvc=;
 b=xI8NbmAXSs8ogUaOoFJQHyozFpyiKZY+gTXc6elvzxJ/8aAMz++2OBYOxxmDzQezptzAU4LCo
 C3mfof7qJeGDv8TsxQP4KGhrtSCFjQ1QLt4BHVyXQNIUkV1JNwmDam6
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Now that there is a definition of VDSO_CLOCKMODE_R4K even if no
vDSO is built, the ugly ifdeffery can be removed.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/kernel/csrc-r4k.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/kernel/csrc-r4k.c b/arch/mips/kernel/csrc-r4k.c
index 241a934543a8..59eca397f297 100644
--- a/arch/mips/kernel/csrc-r4k.c
+++ b/arch/mips/kernel/csrc-r4k.c
@@ -126,14 +126,12 @@ int __init init_r4k_clocksource(void)
 	clocksource_mips.rating = 200;
 	clocksource_mips.rating += clamp(mips_hpt_frequency / 10000000, 0, 99);
 
-#ifdef CONFIG_GENERIC_GETTIMEOFDAY
 	/*
 	 * R2 onwards makes the count accessible to user mode so it can be used
 	 * by the VDSO (HWREna is configured by configure_hwrena()).
 	 */
 	if (cpu_has_mips_r2_r6 && rdhwr_count_usable())
 		clocksource_mips.vdso_clock_mode = VDSO_CLOCKMODE_R4K;
-#endif
 
 	clocksource_register_hz(&clocksource_mips, mips_hpt_frequency);
 

-- 
2.55.0

