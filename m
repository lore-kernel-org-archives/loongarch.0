Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822D6434E33
	for <loongarch@lists.linux.dev>; Fri, 24 Jul 2026 13:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784900294; cv=none; b=UQZq2MhLI98Xbof0lbRlGimPBNJapNdszFoCYVyF+kfHetWFOH07qgA7HkV5dklzIcNxvcsu0r03PzRy95YmsoUbWrWqK3auCYQmywp0PFLrzlmjULpZHfyn6i2HyPOoQ8yoYv9k0+Y1KtP7lqwtqTIRPj1gVXW79XCpOVjwQNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784900294; c=relaxed/simple;
	bh=6yZi1E2ORWX3erxZ2iLgMw+pOXO/qHsB3RdbekGUNbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GdhnGPnSQJ8BJhMMlsLch9W4IQKWQy/HidCxQ/ErrnUB0Ee1u7m3oPVB6mSgjaK3WYfQHOftAvxq80Xk4caaepQ2S+GqDAvLSttgBsn2tSwO333yJzmZUj8041/xls3pfAIdjEIvtiZbiD8fQfO2/1qywxh/6wzLSZJl9xxBebM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fJQA63Ah; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=86dQJzWW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fJQA63Ah";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="86dQJzWW"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784900290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wb2SX77zyxaYXrQzUmclJ/k81+yHIaZBLWgIqd5QYek=;
	b=fJQA63AhXqN0Wt6TrowHVZuSsMNP0G4WVVoLUsYDckEfWkcsS+utv4/QPUaNH5Bg828tO2
	ZTiTmBU2Z5XxJ/irTdAXpPPtpRqd7/nltgO5vmspMfkiLohJxq4mSeSa+Gh2msVxqp/i9O
	cv7/xUuqPSE29eGuUNPF+01vv6DY500HCfGh2Okt3fMAhmeSzdpVZiL6rU6hKW5z4Os9XD
	1InV/Grh5c8MB9aVWJfaPBqdruV8IbWeAxN2H/yvpPeOTTu0PjydJfuQ1M0R9w2HfCaqSh
	PvifLZ3qpIXrQgiYmLPaM0AfsYJGvnvMKHUjwNcj9o8kQlwDDPqdcsmR/RfwFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784900290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wb2SX77zyxaYXrQzUmclJ/k81+yHIaZBLWgIqd5QYek=;
	b=86dQJzWWaZAgS+vRVMF0ZufUKVhSBsgdu+ylGsup4jHHNu757Z3axqD9G1bvaW38+rYPvv
	C+R/sJ+vgrg3XOBg==
Date: Fri, 24 Jul 2026 15:36:23 +0200
Subject: [PATCH v4 6/7] clocksource/drivers/timer-riscv: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260724-vdso-arch-clockmodes-v4-6-ddbe447be860@linutronix.de>
References: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784900286; l=898;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6yZi1E2ORWX3erxZ2iLgMw+pOXO/qHsB3RdbekGUNbY=;
 b=nmad2uoX7O2hqUY1EMlB36avIhjqVM82Dv1sCDRFVS/iKzjJOA2F5DmkLQrmhAf+pwqMcVWqO
 BT3A90/wOmTB3fU2MFpx3uScqaGM9MwiSK27/z2LrHGJXh7kGVc5def
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Now that there is a definition of VDSO_CLOCKMODE_ARCHTIMER
even if no vDSO is built, the ugly ifdeffery can be removed.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/clocksource/timer-riscv.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index cfc4d83c42c0..b310e6721fac 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -98,11 +98,7 @@ static struct clocksource riscv_clocksource = {
 	.mask		= CLOCKSOURCE_MASK(64),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	.read		= riscv_clocksource_rdtime,
-#if IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY)
 	.vdso_clock_mode = VDSO_CLOCKMODE_ARCHTIMER,
-#else
-	.vdso_clock_mode = VDSO_CLOCKMODE_NONE,
-#endif
 };
 
 static int riscv_timer_starting_cpu(unsigned int cpu)

-- 
2.55.0

