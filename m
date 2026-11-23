Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426650;
	b=qHOxldJvjeIVrwelB3OGT78f7JjIl8BYN1M6cdbNMBXsUOCKE/vPK+9YEaRzDyVhDAUf
	 38ngQqlbN5u3fRrY0yrROgjzGdyG+La0zDSkxlDxVha80RehF+HpX1XpObbl7VhokN47Z
	 AfqF0iFYQajBUs/3cdKQoHHilt2SEQwvhWVtVC/wby2AErGJ3DKu/PxAmzVO54FLhzzna
	 jpZtna1KKQDaCzU5/OjwlcsF+9yt1+2EMQXYG0CKSH1LtOGu3sFqUJq674wy07+MzPWn9
	 +a8yAt+vaRGW4c2gkH0pktwZSO6E+CjLnvxd0b0ceyMgZxeIvfsAt6KImlwlk4NI2Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426650;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=NCInxSxfWY/baS2gA67JI3oLj7pEl3r5Kks368DptXU=;
	b=aNJFN74EpjL55rpXX0NXG7XR4BnQS+mlceSDxG431OePPeyC/cU63uPGuRyq0qwk0xbt
	 FEUHy/ysbhZ6s0HoJ08Z2iSwWO93zXqsdzmjBFoaBgdHSNGonfotFl+3pFHdyJvEEXlEe
	 tmXMaP7WLzHISVDnvas4oTDv8pra0qSG7z/jLUKdGYtR0OTG5dSmPF+04W3JXOeYzJwST
	 118yqd+IIpBvSP5qAhqM+IifpMGx156nuQkjRF9QBZWJo9gEBh5xm7gLB1ko5XHJzsBpA
	 iTqYOb74zCUqbc0zY1iwToDlxb5l7y8KKTeQkPrTnhHEu9wHyZg42NbvCP/HXKM9JvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vjEARtx3;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Bv6jhs2k;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F1F606A696
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 09:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5F1F606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vjEARtx3;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Bv6jhs2k
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NCInxSxfWY/baS2gA67JI3oLj7pEl3r5Kks368DptXU=;
	b=vjEARtx3r8J59QJskATSoUZ4rv6pYKWSlfmjme3JMa5M4SMhc00pFtHMCDgyNo/RDm/jek
	LH4qTgii1hs/98kIl27mTmqCtZSi005DRO4Cjlc2DLVLNphLx+AmEpvn/Bo0ob0YX9+pRi
	JKPkk8wRQhRAMHgB6Hz4v/feQB1i6l2oWyVL0g82/uAuUTmASb7KSJTYlmmOGlOHSxLuDI
	qTwLjbVU4BCKhZW3Nr+zS+wL99k9eWL3ahDiUUJ9i066kUxhW342oFJsKah/cVGgfHJMKU
	gagoIjvT4cj9bTpv6rBImolLvfLwtzW6PjLz0ZdIa6vTYCH59nQyLSTMVlIjwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NCInxSxfWY/baS2gA67JI3oLj7pEl3r5Kks368DptXU=;
	b=Bv6jhs2k/3Z98uYG/xj1eKvxvDv2iFmRJNmQwdjgG+GwwWdPZh42RSCDYrGiOJfkoCQKPE
	FuYdk9Hk+TZrO+Dw==
Date: Mon, 23 Nov 2026 10:37:09 +0100
Subject: [PATCH v3 04/15] ARM: drop custom asm/auxvec.h
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
Message-Id: <20261123-at-vector-size-arch-v3-4-d342dae9e843@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=523;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=QV8Zwqe9GYXvbZYqVlVdwaxoS3NHmxQrRwiam48wlog=;
 b=fdt6Vfk48wvz262HQNr4SmvfAA10Ohk3rYDAIpAbpM/sJECol2LaeV8FpmmHNEQ1ymuzZ847s
 ZXFLZX7e+kYChBQotTOoDfC4e+OHkTMGZp7VlhKb0y5EVgfS9lHxPxn
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

With the introduction of asm-generic/auxvec.h, this header unnecessary.

Drop it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 arch/arm/include/asm/auxvec.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/include/asm/auxvec.h b/arch/arm/include/asm/auxvec.h
deleted file mode 100644
index fbd388c46299..000000000000
--- a/arch/arm/include/asm/auxvec.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <uapi/asm/auxvec.h>

-- 
2.56.1

