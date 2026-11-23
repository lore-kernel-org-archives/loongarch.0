Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426657;
	b=XFY6jR1Ei74YyuIxGqJZkIQ7F77egGoZEsLXZkzGtKHVyRcmugdECG2GJDBrJt7Szw8H
	 JGvHoOXtJPB2s7+VGvNv6nCnew3RtCrqACskr/6kqyI7ETmykw9HeTQw2VL/ts303+rFE
	 uE0ycmBg+TuLQW64GdMb60TcCD5BKzyzZWxQvmh/yT5DY/wtV6IOkVkxY+ajuU8dbpYPH
	 q58QYdy7WEawwowwOwldpybZ3qvum6tIKe0lFHfmGWGX3paFCKVoxi6fjQ1DCAC2tK6nt
	 oAhs4+OX5ZGG0FHgYcad8rO63KG4RTGZeECCOPut2/mkg/AkldQ4Vivb8duYXNFTZxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426657;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=Dp9YyKBWCSEjb6xrb6VMG09P6jqIzXjTgw7J5S2fTA4=;
	b=c2FqEZ/UJS/EPATF7KojcURFGuXUaRCDZAg3cw4BD+ye9Q5pcRx4hRV0hNgl5JQvg9PR
	 /raRXjopUiaOhLRW+nJILmv1FErXAW022Y93KNf+q+ZcuDaD1bJJLhferewKOcZNg6r+g
	 ZtxJkWcL7Fw9Tw4v+k/2bUXdEHh+9es5oZn3e9lZmS8FDuT54wDyBbG0xss5+fC8Iv2L5
	 ONVCDuFcpmx6ILhm1bC539hvgZtzd9X9KuWvyumeYcRIJ8WS/NIi4ldB5BPUnvnc7q6tL
	 FOpDedonAj227EPJXTlbeWKDr9qi0sDuUVelS9/zU2OAkM00Dq9M2jJOvMIVwVz6Zow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TyvVEjET;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=UeyrNx36;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153CB60A382F
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 09:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 153CB60A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TyvVEjET;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=UeyrNx36
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dp9YyKBWCSEjb6xrb6VMG09P6jqIzXjTgw7J5S2fTA4=;
	b=TyvVEjET6MQnliSzrqpnj+WkaFtU1zdWalGJrq4lM+AG+q+GryJ6uLyXM3uuKuMjPwI8Q7
	hXW9l92VNUnHMqFEWfhzIP/+ank7W2QypcCihnx37IfZQBhZP3LFb7GNb+YNj3CHfGSbs5
	ZhZR+iPlg/bcytywj2VDrgqzMWW1DBlh2cJuaI/J0WVIFHmyAwJi5zM/82k6QefOlFt1dz
	tg0ik+MAZFWoUZhTqe87bhvHbNeg3maMBV/cDtE0aW/fZiImJGJWeAXysA5to544DrSSxJ
	G84S2kJq5OpbCqnzmKWFT3UfGcp35UD7EOdsH8gcGg1UZbcf7aAajTe5p6hbsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dp9YyKBWCSEjb6xrb6VMG09P6jqIzXjTgw7J5S2fTA4=;
	b=UeyrNx36ELx+2TKAHU7bC/JsVRcYrQLbDiG5FMpmWcJSPNqa84GS7ohHzM60dWu8RXOreK
	Iht1lJnEMVjGIzAg==
Date: Mon, 23 Nov 2026 10:37:18 +0100
Subject: [PATCH v3 13/15] sh: Remove AT_VECTOR_SIZE_ARCH from UAPI
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
Message-Id: <20261123-at-vector-size-arch-v3-13-d342dae9e843@linutronix.de>
References: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
In-Reply-To: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1608;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ztfIXLUSH0CwIJyGBvoNgGeeiOG70QOYQ4pFqwwxIFQ=;
 b=LKBQXJ0mP2V6uYDx8P6XIyIzFshAJA1+7kRDjBNYWfzYxsdonu5uj4s7DWGYZrkTi/6jZXHLX
 /DLzlefFrAKCVL70qHWqHj3o6sDBv0xorI5veF399VQjaRzOqml8CsX
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

There is nothing userspace can do with this value. In the kernel is
always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
userspace and also changes from time to time.

Move the symbol to a kernel-internal header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 arch/sh/include/asm/auxvec.h      | 7 +++++++
 arch/sh/include/uapi/asm/auxvec.h | 8 +++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/sh/include/asm/auxvec.h b/arch/sh/include/asm/auxvec.h
new file mode 100644
index 000000000000..f0830808eb19
--- /dev/null
+++ b/arch/sh/include/asm/auxvec.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_SH_AUXVEC_H
+#define __ASM_SH_AUXVEC_H
+
+#define AT_VECTOR_SIZE_ARCH 5 /* entries in ARCH_DLINFO */
+
+#endif /* __ASM_SH_AUXVEC_H */
diff --git a/arch/sh/include/uapi/asm/auxvec.h b/arch/sh/include/uapi/asm/auxvec.h
index 63fcc39e2c6a..cf0f13da977a 100644
--- a/arch/sh/include/uapi/asm/auxvec.h
+++ b/arch/sh/include/uapi/asm/auxvec.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef __ASM_SH_AUXVEC_H
-#define __ASM_SH_AUXVEC_H
+#ifndef __UAPI_ASM_SH_AUXVEC_H
+#define __UAPI_ASM_SH_AUXVEC_H
 
 /*
  * Architecture-neutral AT_ values in 0-17, leave some room
@@ -30,6 +30,4 @@
 #define AT_L1D_CACHESHAPE	35
 #define AT_L2_CACHESHAPE	36
 
-#define AT_VECTOR_SIZE_ARCH 5 /* entries in ARCH_DLINFO */
-
-#endif /* __ASM_SH_AUXVEC_H */
+#endif /* __UAPI_ASM_SH_AUXVEC_H */

-- 
2.56.1

