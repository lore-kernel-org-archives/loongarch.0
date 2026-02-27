Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352CA3314C5
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 06:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174684; cv=none; b=nO03woGOlLpPXQzQnM4myoIjtaVOQxqG3qCcAFpxiM0zfAMoLcsnmp1PWYg387fSpTse+9q2bVnTuLQ4N1N9EbDzTwjGoDFiW+8UsYmqt+2wnIvRwAnqGAhLqKDzahFjNp+tnaUmf7qk5I5BdVPGAT+zFIBHOrnrnFSK7EIJGXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174684; c=relaxed/simple;
	bh=zI4WNBxKE1oqYDsbwbv7mmrObw8MTsILZFRv4cugSQ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DBrGUgi0KdI4uQ7ExFKLxTqc0f6li/2/aJpVvHc2xygHWvnka51j1woAcXxONWR1JaA7zOP7PLMZOohiI8+PZgmy1IsgyoH6o4wKmQjbzojamoRRuXsWyBNgu7RL2/eOJTxa2/m/FF7y1+snQlOdIrRJGGfJATV2i+pJmBuJQWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M85pSVFQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R9NsRIvi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M85pSVFQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R9NsRIvi"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xJvj9oQFQeeMCbDd+GICAEc7FTw0NbC/VPhyAd1JJKo=;
	b=M85pSVFQdCyhtVthb4y3GdgjGae2qjnUR2acQJS/2Lz6ZG5gaWw+wfjB40Qze/eavODE6u
	ZfIOjPPAKbm/OV+pNLogLSoSIMlSVrz9xk3cG8Es+YowNSoTyYvmK54lERaBho6Q/4qFL7
	j3dkg3kLv/Zic3xdbtAZIb7YfyFPFZ4gFIjbhRWxNire+kIhHbIfkn46ylr6pUDvC/Wi0W
	gRt8oFP6BdPOVzyr9fOLDwhMxbuFtRE4r2Cr8ro0jk7B0RRAL7J8LFzRpkXfTe2pf65uvS
	e6oAGaRbMoZIVglqn6olNqsRL68TX3BO9O0dq7tWIDGmB3rU74bwh3khDIbIpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xJvj9oQFQeeMCbDd+GICAEc7FTw0NbC/VPhyAd1JJKo=;
	b=R9NsRIviSPQjcWSg0uQHOs18QhYxOdO58Gzs91l8uNso2iAl21Qya8XrkfoOaM4mLlsg/r
	y1Jn/BdTjCVaUCCA==
Subject: [PATCH v2 00/15] vDSO: header file cleanups
Date: Fri, 27 Feb 2026 07:44:26 +0100
Message-Id: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7Zi2IiAr72FYFDrYSUhLWmgwh
 LtbuYDL95L//g6RAlOEttghUOLI3mVQlwIGq92bkE1mUEJVQsoSk4keLWlDAYeJtFvniEaNWlX
 1vSEykKdzoJG3M/vqMluOiw+f8yXJn/0TTBIFNuLWN4LoUfflc2K3LsE73q6GoDuO4wvZQ+Q/v
 AAAAA==
X-Change-ID: 20260114-vdso-header-cleanups-d2fa26758eed
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=2786;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=zI4WNBxKE1oqYDsbwbv7mmrObw8MTsILZFRv4cugSQ8=;
 b=erC3nB1DKmuQs15OOkp3AAhmZKYK9eudzE8BP0VU2g3116caadMiZY0nDvfbDDgVCnj/hub0/
 Uaq1gn9VKGWAp3F6pRbxoqspNNYnUpIHkC4zAS+KyqX4uXIR65801d1
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The vDSO header files are a bit of a mess, relying on transitive
includes and pulling in much more definitions than necessary.

Clean up the headers and remove some ifdeffery in the rng core.

This was originally part of my SPARC generic vDSO patch series [0].
After feedback I am reworking that series and it may not require these
cleanups anymore. But as the code is already written I am submitting it
here standalone.

Based on tip/timers/vdso.

[0] https://lore.kernel.org/lkml/20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de/

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Rebase on v7.0-rc1
- Link to v1: https://lore.kernel.org/r/20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de

---
Thomas Weißschuh (15):
      arm64: vDSO: gettimeofday: Explicitly include vdso/clocksource.h
      arm64: vDSO: compat_gettimeofday: Add explicit includes
      ARM: vdso: gettimeofday: Add explicit includes
      powerpc/vdso/gettimeofday: Explicitly include vdso/time32.h
      powerpc/vdso: Explicitly include asm/cputable.h and asm/feature-fixups.h
      LoongArch: vDSO: Explicitly include asm/vdso/vdso.h
      MIPS: vdso: Add include guard to asm/vdso/vdso.h
      MIPS: vdso: Explicitly include asm/vdso/vdso.h
      random: vDSO: add explicit includes
      vdso/gettimeofday: Add explicit includes
      vdso/helpers: Explicitly include vdso/processor.h
      vdso/datapage: Remove inclusion of gettimeofday.h
      vdso/datapage: Trim down unnecessary includes
      random: vDSO: trim vDSO includes
      random: vDSO: remove ifdeffery

 arch/arm/include/asm/vdso/gettimeofday.h          |  2 ++
 arch/arm64/include/asm/vdso/compat_gettimeofday.h |  3 +++
 arch/arm64/include/asm/vdso/gettimeofday.h        |  2 ++
 arch/loongarch/kernel/process.c                   |  1 +
 arch/loongarch/kernel/vdso.c                      |  1 +
 arch/mips/include/asm/vdso/vdso.h                 |  5 +++++
 arch/mips/kernel/vdso.c                           |  1 +
 arch/powerpc/include/asm/vdso/gettimeofday.h      |  1 +
 arch/powerpc/include/asm/vdso/processor.h         |  3 +++
 drivers/char/random.c                             | 16 ++++++----------
 include/vdso/datapage.h                           | 23 ++---------------------
 include/vdso/helpers.h                            |  1 +
 lib/vdso/getrandom.c                              |  3 +++
 lib/vdso/gettimeofday.c                           | 17 +++++++++++++++++
 14 files changed, 48 insertions(+), 31 deletions(-)
---
base-commit: 375f574d703d3af5174d6357d3ca8990bd4a1e42
change-id: 20260114-vdso-header-cleanups-d2fa26758eed

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

