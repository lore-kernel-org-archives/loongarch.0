Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CD7389444
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174685; cv=none; b=Qs68oTLrmtfxGctHVLmcPQFhb+UJW0Y1EnvCtxHu2WDv4hRnjNyvisiJr3YCzMRfUgIKYAw99mlkVJTOVu3ppBixiy9b4xhCPRmhCe18bNHwfBocyxWMUlCXFligmozH537wwfMeSiIoq4oag/9ZFvCDDYwy+H+b6GNzf3LPfqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174685; c=relaxed/simple;
	bh=Eaw7e67Q2te9EZvmR96CdfmDp1KIfoTuR5UbP8dxulc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XPE9Qa3mIBR9ioDKdWyo5BkRONSSYqds0H+LyA3a5kzBh4bKB665xMqHLNJsrkBKmM/r6XieEHIUSEhPeSU/qJ1jyZpEKHvZrvNxUEffmVB/x0ctG5fC01ezjK2hkvvTT10EPKCCrVUXQ9JBvE2AO8v02YjVggWKyQpDPshPgTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=acXbSzcl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=64N+lwSN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="acXbSzcl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="64N+lwSN"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sdFUUlU8YM0o6VyeNKRzp/DOfUbD4WRTS4ygszyQZTo=;
	b=acXbSzclUrurp80PG0+fAyoUBWKSjXDVZqaEtoj8/RVPP+PLjt3GupUBLm3PILwGEDcmm6
	gmWi/+1jNyzdF+2sua8Q+R95D+RDd3PHW9wP/4vFUakNybRw4IJmUwJIuijbCOSu8qrWuC
	OX+b2BWAsQKuMCRMQraJ0m1p0psP86UgWSnAvf2UvZmmZUvyySDN+iwvZpY0O7r2/ZDwYK
	FCRfX5Yn8U/Oe21BUkcqS04TcsqWWw55ob8FZySl4dTnorTelm0ROWW8EfBvbTq/LkKJCt
	RwzHhuz634UZB6QRgbh3Kd9qbhl0kRB5IWvHp9LGIgUEaY4UM0fUgGGEZ6ifXA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sdFUUlU8YM0o6VyeNKRzp/DOfUbD4WRTS4ygszyQZTo=;
	b=64N+lwSNZac8Cf0Ey5PbaJQV7uGBG7blCdI+GkkIljVqGkR9CCp5iKvDa84caXy0u2IFPj
	MXM396HbFbJ2o+AQ==
Date: Fri, 27 Feb 2026 07:44:28 +0100
Subject: [PATCH v2 02/15] arm64: vDSO: compat_gettimeofday: Add explicit
 includes
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-2-35d60acf7410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=973;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Eaw7e67Q2te9EZvmR96CdfmDp1KIfoTuR5UbP8dxulc=;
 b=3OuahSNReBiPRuqoaLBpLN/JEX8iDVn/BcKBSiE+DA//SxSqiQPPogs7Z07/0DvpuO59Q7uZF
 J8H2ZtJgBREA4Y4SXfmQMnWLVugQZQSFq5ODdBR0W+0eK3JdfsNyOwv
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The reference to VDSO_CLOCKMODE_ARCHTIMER requires vdso/clocksource.h and
'struct old_timespec32' requires vdso/time32.h. Currently these headers
are included transitively, but those transitive inclusions are about to go
away.

Explicitly include the headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/vdso/compat_gettimeofday.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/vdso/compat_gettimeofday.h b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
index 0d513f924321..a03e34b572f1 100644
--- a/arch/arm64/include/asm/vdso/compat_gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
@@ -7,6 +7,9 @@
 
 #ifndef __ASSEMBLER__
 
+#include <vdso/clocksource.h>
+#include <vdso/time32.h>
+
 #include <asm/barrier.h>
 #include <asm/unistd_compat_32.h>
 #include <asm/errno.h>

-- 
2.53.0

