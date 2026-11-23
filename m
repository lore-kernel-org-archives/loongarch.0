Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426652;
	b=kvxe4sV0DOgyku3QLoo/DV0WQDPy0fRwiIX8k4bw7gdxlYHEG+WZdNHF26Fow1GFeS9l
	 63LpXFnthC+lm80MCF6RfuaUzzim3WXoRRIQ8wNNV4dhR9JA7raIrDx2vB9B1pc+kaDlO
	 +CxIqJkVBPhTUx5CgRxNRy9CQW0oVUf3yHYmrsQRawruiaC4J1NJ3u4SyuHUzo7fLbDZG
	 Rhvns3Wm70nKolz9QFxM1QIFQRbiOafOBn2QdrdRZsOqUxjV9kwH5LzxpDTodAofLwjps
	 /wsVzyMCdvWdiWrN6jHdW+LixuyNKF208YH3TI2LeLQR0NarM+A9fkXuQB+L9Lwf9PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426652;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=UIWLxGK1Vij7tiU90cRxSFqpScY7zQR7QJvEseKLzwo=;
	b=Si5klXXn2kIVSXr2fv/ZmyANy3FD55e5I4+dS0cLaX1EPvhdPzl2DGsVUxQn/P9UatSb
	 kzCDGJjSRuSoVUl4S/+njem7DNDJSTHuMA4YMbASThOMB/zUjSgTfgJ1LhUPq8lPflHdw
	 bJ6f2yXBfD+032cN5uAnng62oBfCVADopmuyeP8Q+jlFqCmFlDYTrLQjrNkrtKzsVYv1U
	 Vxj3oBpb+GE/u01gSAe/j2ZC8ldIM6KskJeM0lbVci0dEU8v83SeEakpzNo96y2lPNq84
	 Cm/LI5HQ1W8FB01itdw1SbrOMlb3cCG//8XW8WHI6zJtT9y5caqjSo/i4G1b9Mvtpcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2z10FrIE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=UGWZ7T+q;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562D860A2608
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 09:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 562D860A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2z10FrIE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=UGWZ7T+q
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIWLxGK1Vij7tiU90cRxSFqpScY7zQR7QJvEseKLzwo=;
	b=2z10FrIENPAZxNBu/4FgnLVDlG3M7eRID7PzxUiXKydy/rln1DK0lZio8yE3noqkjRh9oT
	e/b+tC4rq+6YEoAcrjJ3cO7WlEfdLeLM1li0q/Tu0ADcA+or6b8Go/sgxFoq3u5Jml76nL
	wEJatTYHV8KEwJ04HLx5bycTT8ZyBzDv/EG6zYCj2bUXUfvkPNDwJxK6iLrH1+oKwxdDm0
	M6du5ER5mMXwAVZIpKmMPCoHzkl1ZHZHlS6RXzVJrU/FNTiYSQ/havtLOL4i6YJNQIQTNc
	2tz4Vmrf1kO+R+LB3ZbFcXy/yLpQ6jr/eCHfaUARFPi2Tkk0Cg45knkrepuvNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIWLxGK1Vij7tiU90cRxSFqpScY7zQR7QJvEseKLzwo=;
	b=UGWZ7T+qthHBHDZwO2ZfnZZ4wdrxxNgHz6eoMYh19mIUB2kturgEFENUaaOBWGQCMbjlCJ
	6yQtRb64pG3v47Aw==
Date: Mon, 23 Nov 2026 10:37:12 +0100
Subject: [PATCH v3 07/15] RISC-V: Remove AT_VECTOR_SIZE_ARCH from UAPI
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-at-vector-size-arch-v3-7-d342dae9e843@linutronix.de>
References: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
In-Reply-To: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Andy Chiu <andybnac@gmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1592;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=d8drZZysn7iP84IJ7qJbdevEVmAtmC8DVsiKbIAXolk=;
 b=aNwL1kWJlo01PaCvebxGDmG5xP0glqFTyi1RyyWhaa+P/3M+1844nqqBisvg5ICRxsxQjd2Xb
 /DJ1mQEVkTCBkqSfISfQLtBeGU1DOULq9hjkJBkJp0rUsvPlCTIH+I2
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

There is nothing userspace can do with this value. In the kernel is
always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
userspace and also changes from time to time.

Move the symbol to a kernel-internal header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv
Reviewed-by: Andy Chiu <andybnac@gmail.com>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 arch/riscv/include/asm/auxvec.h      | 13 +++++++++++++
 arch/riscv/include/uapi/asm/auxvec.h |  2 --
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/auxvec.h b/arch/riscv/include/asm/auxvec.h
new file mode 100644
index 000000000000..0960bc07ccd0
--- /dev/null
+++ b/arch/riscv/include/asm/auxvec.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2015 Regents of the University of California
+ */
+
+#ifndef _ASM_RISCV_AUXVEC_H
+#define _ASM_RISCV_AUXVEC_H
+
+/* entries in ARCH_DLINFO */
+#define AT_VECTOR_SIZE_ARCH	10
+
+#endif /* _ASM_RISCV_AUXVEC_H */
diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
index 95050ebe9ad0..0a725f2aa2e7 100644
--- a/arch/riscv/include/uapi/asm/auxvec.h
+++ b/arch/riscv/include/uapi/asm/auxvec.h
@@ -33,8 +33,6 @@
 #define AT_L3_CACHESIZE		46
 #define AT_L3_CACHEGEOMETRY	47
 
-/* entries in ARCH_DLINFO */
-#define AT_VECTOR_SIZE_ARCH	10
 #define AT_MINSIGSTKSZ		51
 
 #endif /* _UAPI_ASM_RISCV_AUXVEC_H */

-- 
2.56.1

