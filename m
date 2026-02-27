Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FF138A28F
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174685; cv=none; b=eEZTpFmCf/9KAz2ujdWMONkAAoy6z91nlhEObBAZ6iq1rNTrWd2q/OFrXy/5TkPyainnVL2jrmuO8uZP4ymp3jS1oiUORdAvoCSuQhbOY28faYvSFE6csr+VY5ZMXRQskB8S8FKEjdn7I6AMFnvCQhJht0Salag1Uux1xAWoNe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174685; c=relaxed/simple;
	bh=aYrHWJd0bhmjChMmo+JGha4OUSHIgaD7jcuPC+kTlSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dhdeRIY7OTgtRh6LrQnNcVlqy7tjLdzvWU3baUNLxQcO32+7xnghZhk8fjPytWTP+D8yNDWUwkp7Ca/r5AQFuJIYixjZuyghNTecXiSwV3KkcWudsRQGCXOwcytkN0HEdYBl5to/656TeV8d+EWydKPKDS5eZ1i9iIbJaEHPe+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=E81MX9z2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=U94drMM5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="E81MX9z2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U94drMM5"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tIzyOBO0MUC1gjnQlOZaz5WdpoHJoIjGFPUUXU0dq7E=;
	b=E81MX9z27fb6iOgDPvOjHyZq9lLoj5k7Xn4lhkXaNGe+gQTytI7YYl/p5GxyCR0bpojyEl
	I+ytafun06DCmWYljV840vgi/0RqQ0PrTsgD1b6mau/3ev4WlS35Flv65khQJPJm69OB19
	5/Ui4qC67Lli03t78tLB3XaKiMWrgsXYg3sSUT5skJ7m85q/xhqehxm2ciaKp9LgGaqrtp
	cwgKZPwiOPxbxB2axoaVmFdKlSr87wTTQU7R3UTjM7UJQ2RyquhN7VyIdVNYjuAwr99jkn
	k7CNW3By19H79/yNTztN1GKacKgRTLbJVqum68Ca0M4YVfCpEteDCjyhoVNLMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tIzyOBO0MUC1gjnQlOZaz5WdpoHJoIjGFPUUXU0dq7E=;
	b=U94drMM56wMv6zpBylLQPwmLFuDXo72akf5+eb1y2OjPiFv44gi9g/toB2rqCZHPxOpY1/
	5xKusqE5XrZEMwBQ==
Date: Fri, 27 Feb 2026 07:44:29 +0100
Subject: [PATCH v2 03/15] ARM: vdso: gettimeofday: Add explicit includes
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-3-35d60acf7410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=899;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=aYrHWJd0bhmjChMmo+JGha4OUSHIgaD7jcuPC+kTlSg=;
 b=L+nxYTe4Xu7tbOaysmodJ3f65uyex5hwuv4KS3TnbH0HYi4mZ5/LtcKTrbLS5iK5/ygPPMWVi
 i+XTjg51+63DE4ZupdB1nrJ3vyHCCtJqQWsPOwIN0nJQy9oIttoD0qK
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The reference to VDSO_CLOCKMODE_NONE requires vdso/clocksource.h and
'struct old_timespec32' requires vdso/time32.h. Currently these headers
are included transitively, but those transitive inclusions are about to go
away.

Explicitly include the headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/include/asm/vdso/gettimeofday.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/include/asm/vdso/gettimeofday.h b/arch/arm/include/asm/vdso/gettimeofday.h
index 1e9f81639c88..26da5d8621cc 100644
--- a/arch/arm/include/asm/vdso/gettimeofday.h
+++ b/arch/arm/include/asm/vdso/gettimeofday.h
@@ -11,6 +11,8 @@
 #include <asm/errno.h>
 #include <asm/unistd.h>
 #include <asm/vdso/cp15.h>
+#include <vdso/clocksource.h>
+#include <vdso/time32.h>
 #include <uapi/linux/time.h>
 
 #define VDSO_HAS_CLOCK_GETRES		1

-- 
2.53.0

