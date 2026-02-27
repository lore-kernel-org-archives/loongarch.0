Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D593ECBC3
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 06:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174688; cv=none; b=QtFzjqkTPwjRVTpi/EvSt/b/SlGTyZdnc4lvcXKXDhLgAY7R7F++vM4Ct98/nqw25fAk4zDppaDliOzkxrVR1TmxhfQwM5xlsKreOfqg2vO35aln3bEw/rOxpz0mHxbad7N9YgaFlHW1aBL07xbz5dlNiSPtkhj+m6nl6Bw5Cjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174688; c=relaxed/simple;
	bh=96wQsD0ohJOJ5ijGqVXkm6xOH7JrZVn4eDcYG0UPpAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LHCLj1AEgzQL0mrBPJULMeF+FV5pWIS9rdyw/Q2M6Ji6qI/Qbbra3ZDZ2P7YTcJ64y9okBX9Whaxe/Z9iKFuSe+g/AryjAmPCLKUSfwrQ8bYrUgio1Tuy5jBTihaWoitWVfP//TkHfakZCG0NTKumaZQ8bR0+wXSD2es0GHIgnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tkqZ9rhb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hXEle++t; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tkqZ9rhb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hXEle++t"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AXZyqVV/pMt5wKYLJiKaZoCB+y3yJrXNlKmlMnaEA8o=;
	b=tkqZ9rhbKjYApCzfhBHJzZhvbJUPCq512TRlMzVk6w7ITzco+9byAp7TtN93I0XUkelFfA
	lQWZn/gzvfm3gYMwt6ettiIUOeqasaCkiN/ZKbYEZ4KCE70yS3jdsGoI23xWBZY++Djehs
	crQHrmRIW4CBQBTdb0QNPpPxkXLnV2vyW83wvBh5UzbJz2uKEXOCTSTaiz/DgJXJhX6K3V
	NeQLZtCvNuqazzkc5K6HLwquAvJhHL+0oCouh9QluOryQhfVfD9Z+cEs06uXjIZTNCJaW5
	lkeLCgyePSK6rfawiyGgps0f/zdw265IzuyNeMvTZh22SdqBLyultTKRFs3ZiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AXZyqVV/pMt5wKYLJiKaZoCB+y3yJrXNlKmlMnaEA8o=;
	b=hXEle++todjBCvkYkPp94pUXH9hqZA30TxNyJxQI3vtgT13T+EJKvoaKA+thvBTypfIkWY
	/PNgqssH6mf/Q0CA==
Date: Fri, 27 Feb 2026 07:44:33 +0100
Subject: [PATCH v2 07/15] MIPS: vdso: Add include guard to asm/vdso/vdso.h
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-7-35d60acf7410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=915;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=96wQsD0ohJOJ5ijGqVXkm6xOH7JrZVn4eDcYG0UPpAQ=;
 b=LwFitQ8PqQr5rpEJ5g+EpBJZFxWGmzMUFGuk60InI5VlUjGXxMTUa4LNiy9hbyTrE25+X7KRK
 4q1m70THNmBBvaHqnKgOL71CUgZtvfvm5zCIi9lEZ/tlWUwOgrbj1oR
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

An upcomming patch will lead to the header file being included multiple
times from the same source file.

Add an include guard so this is possible.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/include/asm/vdso/vdso.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/include/asm/vdso/vdso.h b/arch/mips/include/asm/vdso/vdso.h
index 6889e0f2e5db..ef50d33f3439 100644
--- a/arch/mips/include/asm/vdso/vdso.h
+++ b/arch/mips/include/asm/vdso/vdso.h
@@ -4,6 +4,9 @@
  * Author: Alex Smith <alex.smith@imgtec.com>
  */
 
+#ifndef __ASM_VDSO_VDSO_H
+#define __ASM_VDSO_VDSO_H
+
 #include <asm/sgidefs.h>
 #include <vdso/page.h>
 
@@ -70,3 +73,5 @@ static inline void __iomem *get_gic(const struct vdso_time_data *data)
 #endif /* CONFIG_CLKSRC_MIPS_GIC */
 
 #endif /* __ASSEMBLER__ */
+
+#endif /* __ASM_VDSO_VDSO_H */

-- 
2.53.0

