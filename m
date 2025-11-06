Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C316630DECD
	for <loongarch@lists.linux.dev>; Thu,  6 Nov 2025 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762423340; cv=none; b=NA9uU7I7KLHwGXS7ioXk8ADqQnKgcK1skBM/sc5XWPjh3zJzo+Krpz+LjceuENLh+NkGQtiToKTaC+Su6a9eZ2P+dxoD5ySN6vYwwCtoUgn2N+duM0ZGsqW4lBcUINhz7xNu4l56MqHaNjwlYnAauipWoDSaQxwViWgxcEQcI2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762423340; c=relaxed/simple;
	bh=M7OZaVgVTbQq1+qCCbg+AzkOEF9vaI8Civ95WdWNrvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O1T//8U/QDiUna87T/QZAzOr87HkXA/zwitScKjTGB3wWik29z4UCda0vKjvA8Vq8DsA+zTBXWxjjbBlFoHawojZr62hYNvmtxsgNh0qqJtmmLU1kt3s+SceN+ZA5bciaqeaIfqMC+nUaHYagCfTz6frH3yI75iA3SjOnG2oi54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TYplAVad; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VUlzyT5o; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TYplAVad";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VUlzyT5o"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DEoIwwFxHmh+hun5gVD8XghoaqJckg8nGzKi4HIXz7Q=;
	b=TYplAVad3/6WZhVJoZAW366/E/bj1kDoWzzO1ZiXxyfxcLXBEv1PQ6jchk/pJ9oYxvQfYZ
	QXHrDvZHzDlz8VLBZX11sGJGUE40QcR1iIKdv9hK6RlH1juTB97xR+2pxbW6g8LARS4ndp
	VlWkxNMq9AX0zSpqhw5gpKIzpC2pCV39BnVMXK77Pgtnk8PwvyGCYNin1eAOXe1IvBZarA
	p+3r8hXvb+hSG1BxGaHXxoDCSeNztLj8qetiL/2YrYJab3vPkFGnQWHcoWh1GReQSpwc8C
	qC1DQwIXnRxJGL3gppYEnlaq3p3MEjSV9DL3EvupYblXthLVKFj0A+IaI+/o4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DEoIwwFxHmh+hun5gVD8XghoaqJckg8nGzKi4HIXz7Q=;
	b=VUlzyT5oJOs/L3bV7lrazXxOwPi28oXE4emW/Gc3nI0kM4onPYShAu6v2lte+Gb/n/9GBk
	XqrpFnVNmA78pUDQ==
Date: Thu, 06 Nov 2025 11:02:04 +0100
Subject: [PATCH v5 11/34] random: vDSO: Add explicit includes
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251106-vdso-sparc64-generic-2-v5-11-97ff2b6542f7@linutronix.de>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=954;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=M7OZaVgVTbQq1+qCCbg+AzkOEF9vaI8Civ95WdWNrvI=;
 b=PPNDwDR8vYXS1omwB4AfBNge54KbfW/bl26EQHV2FvEM2YsH9BIZh64MVxYO48Rrl4R+n1ZGx
 vRKXl+6Ma49C0H7LFKrFeKs9bYwhix7q4SmVGae9gNE/UEChnfALNKw
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Various used symbols are only visible through transitive includes.
These transitive includes are about to go away.

Explicitly include the necessary headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 lib/vdso/getrandom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index 440f8a6203a69a6462aafee4ad8d5670cef6a353..7e29005aa208b498b68f16d3df80b048dce8ee21 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -7,8 +7,11 @@
 #include <linux/minmax.h>
 #include <vdso/datapage.h>
 #include <vdso/getrandom.h>
+#include <vdso/limits.h>
 #include <vdso/unaligned.h>
+#include <asm/barrier.h>
 #include <asm/vdso/getrandom.h>
+#include <uapi/linux/errno.h>
 #include <uapi/linux/mman.h>
 #include <uapi/linux/random.h>
 

-- 
2.51.0

