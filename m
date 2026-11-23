Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426657;
	b=vC1mS3quRdvssQTaeKUAvK2Ou8bfyvJrY+OG484bbc/MiDlWjpjqphrZdYNcabyCSyXx
	 vMAXtzt+6m8DcimT9AxazWQPS4rYWwDtdJR9JgfH5zF9kUzYyzMg70oK4B7HiL/8GzO4D
	 2QkWIwriP/iMhlZwKbYMuNwyLFP52F1EGkrw1tc+oX7MAGP1EoF9vOT3p/yQNsWS/I3QT
	 j1M9O1jUEwjuGIe0gNlOgneORl+BZV9rKqwZXyzpPyeNf44POP1tfLPsFPsgt1oVd/Abx
	 jEsSgsjHC0J3nij6Lz55VCes2HUbRBVhu6IUfKE5OM69Pwy5T+TUEjkFTt2PTNdeTsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426657;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=OWddYtZFRBih+2kOOV/tz3cfLiO8YsvFVYLjnh/zs0c=;
	b=WSR2WJbzedJUNrokk+VXxcH6XKhS3P1YRPvwrsSuB/Prq7H9VLdcY8XOfPg4+wwdl8JE
	 2BcuaWjHPWm2pn1MpJS7qo4mPuIhnWhkWV2fQG/aOSvjnG513T/N3kdrmBIhGM141rwr9
	 GFlCrEX8YtR3MbxYvDFZez8yiavtaAHwfKDILbRMq4aDnTRMrTClb42nsR5BHbSrIB/n/
	 x4jTpOqSMQipLMp1AAARSSNaY1OEbBdoeEZouzYZufCD+zX/1wfSzFPzHJzOEdekFbwhE
	 hljgT5ifPL2fL4yiHJtXjyqSu4srp6lL3zUD3L/14roEQeozaHafHb26Qg3rAXoFe7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ka+3Z7Va;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+3FEC2I7;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DD060A381C
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 09:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95DD060A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ka+3Z7Va;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+3FEC2I7
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWddYtZFRBih+2kOOV/tz3cfLiO8YsvFVYLjnh/zs0c=;
	b=ka+3Z7VadWdisEHx0nhlsSjM+BJx26vRfZQSKZBaNmkldRHN9izmYdiJ3lbMxC0OucilQO
	x4wajeyPaG9SYXCOYo0mEJbrlyo1Qb6odgIgVyt7RHwE0LwAcOrEw/9ag3SpzJaSdD+/50
	cf84wqq101c0Y7SjIl9MAYkyB/NoCBBDvkAzs3gXDM9eKkDoC5J59Oj+2z90qtXEsKIYjb
	6NCDbIjwyDXjHKXIWzzJogKsraz1G6QbzIpx7dekdRzxvdML7vicPUoeYiNKxgM4iAtCSw
	txYM5rGc4MljvQElOkPCMxyj2ftSGcr1+DILod8yuYSdLAYTq5uXJQbNv9SkwQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWddYtZFRBih+2kOOV/tz3cfLiO8YsvFVYLjnh/zs0c=;
	b=+3FEC2I7ganDyUkYlSgk8p5ebQ/W+4z9rJpXxo/+Q6+NHLP1FitfABHLjtVREnjnKzyYQa
	inDCvMd1nvmg6DBA==
Date: Mon, 23 Nov 2026 10:37:17 +0100
Subject: [PATCH v3 12/15] sparc: Remove AT_VECTOR_SIZE_ARCH from UAPI
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
Message-Id: <20261123-at-vector-size-arch-v3-12-d342dae9e843@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1455;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=vD8CGJOm5QnknC9kSQAkUBhPNwBGIfJ1kH0awZZC4RM=;
 b=ZqXe3ujMdbEB5uqjyUQ/H+vOfXjC40uRBW01eTcsRo6t6/9jooGMDQTmAxN0GFYsNBJaxy0gu
 pb1295uByM8Ac2cxiZxLoRuOrUYtiCs9VE19YvlZd0nouwzkUZeW8Zd
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

There is nothing userspace can do with this value. In the kernel is
always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
userspace and also changes from time to time.

Move the symbol to a kernel-internal header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 arch/sparc/include/asm/auxvec.h      | 6 ++++++
 arch/sparc/include/uapi/asm/auxvec.h | 8 +++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/sparc/include/asm/auxvec.h b/arch/sparc/include/asm/auxvec.h
new file mode 100644
index 000000000000..50c249a8bd17
--- /dev/null
+++ b/arch/sparc/include/asm/auxvec.h
@@ -0,0 +1,6 @@
+#ifndef __ASMSPARC_AUXVEC_H
+#define __ASMSPARC_AUXVEC_H
+
+#define AT_VECTOR_SIZE_ARCH	4
+
+#endif /* !(__ASMSPARC_AUXVEC_H) */
diff --git a/arch/sparc/include/uapi/asm/auxvec.h b/arch/sparc/include/uapi/asm/auxvec.h
index ab8780fb9df1..0fab3b29148a 100644
--- a/arch/sparc/include/uapi/asm/auxvec.h
+++ b/arch/sparc/include/uapi/asm/auxvec.h
@@ -1,5 +1,5 @@
-#ifndef __ASMSPARC_AUXVEC_H
-#define __ASMSPARC_AUXVEC_H
+#ifndef __UAPI_ASMSPARC_AUXVEC_H
+#define __UAPI_ASMSPARC_AUXVEC_H
 
 #define AT_SYSINFO_EHDR		33
 
@@ -10,6 +10,4 @@
 #define AT_ADI_NBITS	49
 #define AT_ADI_UEONADI	50
 
-#define AT_VECTOR_SIZE_ARCH	4
-
-#endif /* !(__ASMSPARC_AUXVEC_H) */
+#endif /* !(__UAPI_ASMSPARC_AUXVEC_H) */

-- 
2.56.1

