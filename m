Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CF22EB859
	for <loongarch@lists.linux.dev>; Wed, 14 Jan 2026 08:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377708; cv=none; b=TZ5kJZ9D/V2KGWg5OqccPiWyJ1dzw+Xgpbk2GA7CyLo89IVbnEJJPURwx+bgdn5U9Jt2Fl/MZfNcwxNNWKv0g8aSIg1eD7oOs3Z1QT9vOJ970Pq7gQrYooGXS8zkXQyOn/98uH+4CBHe99HeBCoxbVNUSnDxluPxz8dh3WrJLVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377708; c=relaxed/simple;
	bh=wxh/lZEHTjkANuO+cr6cQs6D3XRXTHRzPbOQhCiCkSU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aqY0xdXmpMR/89clBkN5DRhTpY6Nl02w7BLNXb91lnullbxIHgrFw09QI19ungoA/IpnqFF44QHtJ6GjxBIG6wa1Z+zHwAls61rlcqdqcCRywUXL2To8OBD5ZQGst45n0om/05CMyqV85kj2JwCOx0KgSS5cIWTTBNUW7APfM2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=B/iA5OeX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6k4Q9ySm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="B/iA5OeX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6k4Q9ySm"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2Wh4jYBxUbDqkNC1LyZsqlM3fF48oaskW5vtJOy/5AE=;
	b=B/iA5OeXAur8JmwDoCwohBXj5/k5Yo2gcwe3o0RJcEBOSn/c0XpOiJi0QLEvYKosn458Tm
	lVHPdt5F+3Msn1ECJoqAN+FfS7Vxyn55S0455CCZjOuzojBHKsJ39ozWk3UcnPPKMZNqS7
	hZXYeN8TRkyHg53+0YVQ4XI+QModRkQW/Z7UPTtcbkhhS8nQdgRvxgFEj3jb1sFNWPijE1
	qYMBxuWTbMEIs82a0u5lvSBQ/StTql8GWBzttqhP2sOYFTW+SH9bXeHaupsEPaboOnL7aY
	IfVBwGvuCJJwxXhwXqlJ/W6KaI7TSdQXwS/5zdDLtb8JIrmWg4nM4Ir2c2BP/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2Wh4jYBxUbDqkNC1LyZsqlM3fF48oaskW5vtJOy/5AE=;
	b=6k4Q9ySmGiSqe/Wl/g53J8lWw1+8PDQYKK+d0zSkhvLtA0LQzcuuswimj1Nc/vJOsrR6i/
	7K3kM09t27bybADQ==
Subject: [PATCH 00/15] vDSO: header file cleanups
Date: Wed, 14 Jan 2026 09:01:32 +0100
Message-Id: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF1NZ2kC/x3MQQqDMBBG4auEWXfABLXiVaSL4PzqQImSwVAQ7
 97g8lu8d5EhK4xGd1FGUdM9VfiXo3mLaQWrVFNoQt9433IR23lDFGSev4jpPIwlLDH0724AhGp
 6ZCz6e7bT577/RIWjG2YAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=2638;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=wxh/lZEHTjkANuO+cr6cQs6D3XRXTHRzPbOQhCiCkSU=;
 b=GPjYp3y0vRDRH/x6JUzAXDk5XmpceiZ98m4XhE7M/WdobqKe6qNt7YHiUbFhKtNSYJ+eDaEQW
 OhhAcGtQ/qyC4aVLK5G++gEsO5qqE8nHuOLHAnTHs83uq+LCjyDkzD6
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
Thomas Weißschuh (15):
      arm64: vDSO: gettimeofday: Explicitly include vdso/clocksource.h
      arm64: vDSO: compat_gettimeofday: Add explicit includes
      ARM: vdso: gettimeofday: Add explicit includes
      powerpc/vdso/gettimeofday: Explicitly include vdso/time32.h
      powerpc/vdso: Explicitly include asm/cputable.h and asm/feature-fixups.h
      LoongArch: vDSO: Explicitly include asm/vdso/vdso.h
      MIPS: vdso: Add include guard to asm/vdso/vdso.h
      MIPS: vdso: Explicitly include asm/vdso/vdso.h
      random: vDSO: Add explicit includes
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
base-commit: dcf5b55ca66160879205b1ee7b9b711751070edd
change-id: 20260114-vdso-header-cleanups-d2fa26758eed

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

