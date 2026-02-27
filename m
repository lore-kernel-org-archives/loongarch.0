Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA2F3E9F8F
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 06:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174688; cv=none; b=Y7SPiry0k+pDSV4PSTGATU/PrQ7NfW6NfWVI9VGrJzRmPkzhpTg+NuwLiO0fC+myMnwKeDGZ1B33U044ZIlmV9MIXSmUcReuKo030AkmvdqsKcbeZ5EL0T13IG4DC50AVGW8AsZY1N/hPWZcVQx97iNdq2xZyxg2Ew6UWXN6QXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174688; c=relaxed/simple;
	bh=VlobGs7YuJXZk2xwqXObxL44WjrcbSo2bt+/5ArFOMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mOyJXpuudQgVcrAvv2V3YzCP1D6XngjVTf8woYAU61DEPIqygjJ3pivprM9151cClnp4daGJ0v8RC97St8MrkyKJA5/9AWWD8nhE7yk3vTWE3YZF9uHdt+Dg7QAYKbh6ipTshdAAMwOMNaFRST4uBVId81H0Ip8g/WObLYTQd2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=guerkA1Y; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G6YAL9w5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="guerkA1Y";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G6YAL9w5"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EdFmvezM/13UIBOLqXgkSN+e2a31t12dc0rZR5hjhsY=;
	b=guerkA1YpVG/5ursk9ictXBkrOLUMELSSFYdzfIgzPv24IBuzqV/7wSr6LdLb9JYULTYH8
	dxg4NGR/6WwGdzMw7x315is1hHEdPwGCRT+RigrCiJM8G+wGwMRsqvUjofLAPSSvxvGM0k
	Xs6pJhmYZkiSe7QKqib2OHT0y9E5PjUIyLRVExT8biNiErdN4Uw8GDxoBo/GS1Cx+T5hGe
	V15bDVIbrlwV/AA/8xxHfKCcUmze1+PCsIb0VJJsP1fEcwLUVbM2/ZrcrGaDIDPpk3yH8G
	SzFEq+99OudB8AxOw8z8p12MvcBZj6TWNcPo1wXOuPp2GiFtFe6E+VJPsjzsQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EdFmvezM/13UIBOLqXgkSN+e2a31t12dc0rZR5hjhsY=;
	b=G6YAL9w5VJlvv6SIhTbu4Ko1jVx8II4adcQjHgTqP1AVdKPNXJ9EYWoYeJJESJU2w7+TRn
	xkmQHK/gWn5P1HAg==
Date: Fri, 27 Feb 2026 07:44:32 +0100
Subject: [PATCH v2 06/15] LoongArch: vDSO: Explicitly include
 asm/vdso/vdso.h
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-6-35d60acf7410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=1174;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=VlobGs7YuJXZk2xwqXObxL44WjrcbSo2bt+/5ArFOMQ=;
 b=YdBHCMUo5DusjEOI4DV+0CTXJaCByr5krSoSQmpxScBLGKDg6mJmHX1d9paPZgVzpjmDM7K0h
 hnUOJW/a1xgBAzNcJyvU1/HV/dCuKogllRNecIi2DdX3xnqN10Ev6BB
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The usage of 'struct old_timespec32' requires asm/vdso/vdso.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/loongarch/kernel/process.c | 1 +
 arch/loongarch/kernel/vdso.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index 4ac1c3086152..ac3a0baa5d00 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -52,6 +52,7 @@
 #include <asm/switch_to.h>
 #include <asm/unwind.h>
 #include <asm/vdso.h>
+#include <asm/vdso/vdso.h>
 
 #ifdef CONFIG_STACKPROTECTOR
 #include <linux/stackprotector.h>
diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
index 0aa10cadb959..8ce8159c10b9 100644
--- a/arch/loongarch/kernel/vdso.c
+++ b/arch/loongarch/kernel/vdso.c
@@ -18,6 +18,7 @@
 
 #include <asm/page.h>
 #include <asm/vdso.h>
+#include <asm/vdso/vdso.h>
 #include <vdso/helpers.h>
 #include <vdso/vsyscall.h>
 #include <vdso/datapage.h>

-- 
2.53.0

