Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A39A3ED13D
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 06:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174691; cv=none; b=dYCDp3ddQlZkueNZy7/ytVAOKkAme9OyvGdJinJi6X9w8a0Wd3K2tU3Wkp05ENPqtbK1wfoWrvBIwIKxepVIPmmkwXaeNAyDR+AvyvazQ+Un0BC4Ll9iSIwLBkKw1YYCyTsUtxw/erwNfiUkJtNaF7coEf03aN5JSJB7JdHhqHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174691; c=relaxed/simple;
	bh=I1SCO5giHITu1X8K8iGKyItIGK/4mCTfzb50bCLrYKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ofb0NH8I0M3Fg+bv3/AefZxAyOfb7MXr72fi/xzb7vNkMyOTJCcRSQbzJNdMjSbCDR7/MmXMVBFUdOuOIn3+EnNBBqxigv71v/WXZJINjtWNw+txzw699BEXcQyBpRa2WVEZbDUaGN14yBrQH4Pq06awbT0pjbpi4MIrRsTZtPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rMSSg6Kk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=z+7rDyIY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rMSSg6Kk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="z+7rDyIY"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3e/NNt95zCxtiCGoXkbHwk0qG7BgGrrwg5COo+2IR4M=;
	b=rMSSg6KkrB+0JkEM1SVz4yxaMDvQUAxB07ZFP9o0HFv6OnuLmfJlM9CHLY8ayOT8Uhnze8
	pLV4mfEgu3dsHx834eCRUmmtN4sob50LIxDOtoV4HLJRpckcONip2LvGVDl/0uetoYfdme
	WYlrXelcW8RoqItBz4pgzGh0g3/tsixL2/scHhnwHl1qFr+6VQK4fNZ+uICoU6db8BK5HX
	mvQ7TDFgU4wiudUQVcteSfUyFjtl7tnEOJkifbpUujp3RFT4F/vZMuuRQtgKgxv4iRvb0q
	NnJyjvFya4aexIexIuGGS4UVVQB8PDNaK4qjW4e55/9HW15nge6lQefC55Rdkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3e/NNt95zCxtiCGoXkbHwk0qG7BgGrrwg5COo+2IR4M=;
	b=z+7rDyIYn1phXQcYGsAZsKJBR7n26KW4uUnlAVjzkZZjU2TqDmha5eFw4erHfLHmHrpl4F
	mpFNzwgxd8QHywBg==
Date: Fri, 27 Feb 2026 07:44:38 +0100
Subject: [PATCH v2 12/15] vdso/datapage: Remove inclusion of gettimeofday.h
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-12-35d60acf7410@linutronix.de>
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
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=1781;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=I1SCO5giHITu1X8K8iGKyItIGK/4mCTfzb50bCLrYKk=;
 b=cXXrn6n7S+LEJc/Pp/MqAwi+lbezgl7mZP2vqpUPRpYbrjF+hNOZx1xoGZnMYsL/8exZLnqct
 PS2lFy9vGRJA92TiwY/nge/emrraWRcMcE51aTOIQcxtePRxMwT5RuF
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

vdso/datapage.h is useful without pulling in the architecture-specific
gettimeofday() helpers.

Move the include to the only users which needs it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/datapage.h | 11 -----------
 lib/vdso/gettimeofday.c | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 23c39b96190f..752856b36a3a 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -184,17 +184,6 @@ enum vdso_pages {
 	VDSO_NR_PAGES
 };
 
-/*
- * The generic vDSO implementation requires that gettimeofday.h
- * provides:
- * - __arch_get_hw_counter(): to get the hw counter based on the
- *   clock_mode.
- * - gettimeofday_fallback(): fallback for gettimeofday.
- * - clock_gettime_fallback(): fallback for clock_gettime.
- * - clock_getres_fallback(): fallback for clock_getres.
- */
-#include <asm/vdso/gettimeofday.h>
-
 #else /* !__ASSEMBLY__ */
 
 #ifdef CONFIG_VDSO_GETRANDOM
diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 73b079eb4511..a4b0f06cf970 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -12,6 +12,17 @@
 #include <vdso/time32.h>
 #include <vdso/time64.h>
 
+/*
+ * The generic vDSO implementation requires that gettimeofday.h
+ * provides:
+ * - __arch_get_hw_counter(): to get the hw counter based on the
+ *   clock_mode.
+ * - gettimeofday_fallback(): fallback for gettimeofday.
+ * - clock_gettime_fallback(): fallback for clock_gettime.
+ * - clock_getres_fallback(): fallback for clock_getres.
+ */
+#include <asm/vdso/gettimeofday.h>
+
 /* Bring in default accessors */
 #include <vdso/vsyscall.h>
 

-- 
2.53.0

