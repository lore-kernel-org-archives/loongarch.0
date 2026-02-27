Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBDF3806BB
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 06:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174684; cv=none; b=ZV7qdg5c8yEVtuwdsZ0QZUC4ux1NJsaDp0u7WDbD9DA7xXR89i+IaReb4P+8iuliLdmes04ensSQEbkc278OueUtCkp0h3y9sPMQBRKw2QThkxqpDAusVnS4E7lfktPYp8DRcgB6MEnHVE95jxxoMT8ELTxL8FROkUjA1lCNKBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174684; c=relaxed/simple;
	bh=B56aYMYQAdEmPujlFuVOYBxgPBhNNOzHKiu9popOBq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JrWgkMDOkerAdNkTnbLuNpS59ExCgf7gzJllGYlA+h62B5N2toy1uBk2d6RtuHQoX7TYMF8xLOA0QfqBk80sabDKWV327CR7vOPXipDICdeYxu7ifLiY9ykAA+0J5o+lXr6rak3edCpbdzrVhBaTxbmNhLspM5rIlvgSHKAvRVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=teLIpbJD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sqnSEXW8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="teLIpbJD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sqnSEXW8"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j41rfTYZDcPnORX6+H3qvB6/XTLHclkdQxhoSfZSj0Y=;
	b=teLIpbJDZ6ty4EgjyBCW0HNDQ34y6Z/GXXufwmzJ9LwvX3UJC767NVYgEO0dWOABJOe6Kh
	z+HJWNIcxCYB0GXNxmXgCAS8H/0wt4W6xzz6kpchpLwI0OiCnBQIJkfXTxsv0K3keVRjcA
	Zn/5jiYqYhQv+XPXUxPXU+XsHmZO0LaxiVSj2bdLrkpla+oImCr6cMtfd8bTEMrrc2zk2l
	/g1Fp7rXxGDHSUJFNFwcXAJmE09ZDDT7FRKrjb+BlA5OCRBIdfuEvwQ4v9UYZ12/GLk1s4
	655Aw+ZR5m/M+16gGq5fDWa1F9Pi1avC3N1OHab/nthSXnO9zRGI6fvAxp2yEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j41rfTYZDcPnORX6+H3qvB6/XTLHclkdQxhoSfZSj0Y=;
	b=sqnSEXW8Jtxu4AdEvoDJotRY5wYBKsIIkaMGtV3TVl8OfAUEgUeaTEYq7RJJG6dW062WZx
	wLWGxNssGv3lS0DA==
Date: Fri, 27 Feb 2026 07:44:27 +0100
Subject: [PATCH v2 01/15] arm64: vDSO: gettimeofday: Explicitly include
 vdso/clocksource.h
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-1-35d60acf7410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=846;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=B56aYMYQAdEmPujlFuVOYBxgPBhNNOzHKiu9popOBq0=;
 b=Icd6rTz9LQS9xz5L4WU3B7Au6NWvTQBRcgEdv4gqrl76kLvgpQ8QZfGaYsOPM26zB1bhzUCF0
 HQhi0n2m0/LB3MiaPP5WgRq43qkpYPVWp3cMShvvv8zUN57f7Tc5KGq
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The reference to VDSO_CLOCKMODE_NONE requires vdso/clocksource.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/vdso/gettimeofday.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
index 3658a757e255..96d2eccd4995 100644
--- a/arch/arm64/include/asm/vdso/gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/gettimeofday.h
@@ -9,6 +9,8 @@
 
 #ifndef __ASSEMBLER__
 
+#include <vdso/clocksource.h>
+
 #include <asm/alternative.h>
 #include <asm/arch_timer.h>
 #include <asm/barrier.h>

-- 
2.53.0

