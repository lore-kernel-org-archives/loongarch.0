Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C163ED12A
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 06:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174690; cv=none; b=EbxvMQSeJZ4+z04nP4JNFtaXwFvqPw4Sf/kroUXrBjwRMBqazMlxHYiDeIZNUMLyyeyUGUjs6JrIsljABIT3zIeybTcwFgllHzigCibFoLA0sjwTH2V8t1dSGWKx6NIFTQefhieYqMwEoh2k6+ntOHwx81g8f3k6LLKbEJ+k3HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174690; c=relaxed/simple;
	bh=JcvE3kQiMg07X05oSReGQNnDSkDG6pLjGh3SaRJFDSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YvNpoCtzoUmVQRR629OWO4N3QLQW7tMkXQxa+xi/pSL/UqElWXwnro3Ur6THA6reeYxIOvH25Y7Abq1ZAOCYttvpztgvugBduq6GsDZ/Upklhg8ytQoidmh1jTMY2NqkZMx32YBacfc8FKr2WLy6j3oZuT9XCCxfTG7vqGtIJ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dCLNqQkf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eVLtN9AW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dCLNqQkf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eVLtN9AW"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NLji6Amx+w4gkoyKP87sApLv4hbvr/R4BbROA9mF7Qw=;
	b=dCLNqQkfH1i//wSvIpnoq3xDDTzR2xeibPPMp/z9eZz64hGWimn0Lzumwy5pZBFei6FZLf
	G1v7mQUgTptwXQOorAhU4ZJk6uoK4C6efBUGJuSSMAW+9LwDA65lAhe7BLSk1GcozF7A+h
	ZlAAYWN/CSrxWHeMBVbf0yTx1gerVfh7lptz5Ry5V2dWHSqH2M2TME6HCKkyYogti0sP2G
	P6tZEdTPnz+Ch4F3lgRI/UyLbXCV97/qFf8eP3ybFVgQsdVbUJOJHabtbAoOaVU3QyEflS
	7DG9IaKYRC6xXbioku99cIA+Ibmq04T5oJ9d97OkF/WEyLWHLQ4myVt0QjtBUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NLji6Amx+w4gkoyKP87sApLv4hbvr/R4BbROA9mF7Qw=;
	b=eVLtN9AWbevcPEHUTybrUg+PUlahm/LpMjWb5A6zQ6iJSsUcLh5Op7xSCyS6qNu2Uawows
	K8JJTt0JPIDm1MBg==
Date: Fri, 27 Feb 2026 07:44:35 +0100
Subject: [PATCH v2 09/15] random: vDSO: add explicit includes
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-9-35d60acf7410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=844;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=JcvE3kQiMg07X05oSReGQNnDSkDG6pLjGh3SaRJFDSk=;
 b=RZXvHH2HxCYtijPWzFmGuHR3sRa73ICHOAJnT8sgpwEldcg8giFkj0QCEeXbaQyeRwjE8NIZG
 3G4L52NK7P+AtsNoMk77ybqM5aiSaWAXCceP66bohc97O91JdCE0VU8
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Various used symbols are only visible through transitive includes.
These transitive includes are about to go away.

Explicitly include the necessary headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 lib/vdso/getrandom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index 440f8a6203a6..7e29005aa208 100644
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
2.53.0

