Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE103EDADF
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 06:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174691; cv=none; b=TrAkd2eSoJ/S0Oz7WETDDJZY9XFrMm8n/nwRzfbZ/ufhLG8BwAhj+X0jVHSsUIJx+oSxB3EoeQsh86L2yUsqok/xYp3uDeXyE7tv+DEujRoCMGeLQf3O4jnd/dL/1K2AtrEUY1/KY2dnGCTHHZe/NHSaBv2xg9l/4noYbIlxaqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174691; c=relaxed/simple;
	bh=ksAvbNu4g6GEEgEwDE4RqU2Mb+uIs9kO6obM62gGDDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ILnimbqtABqWAq3kpKFkGLctjpJs12qNwmpmgEOxo9FBTsTBAE1ZsAC+0Ma/Bn/jHwdudm06XigR6Rm2qFMDDGRX6sSdB2PDTJ2mzE0K4gkULxcEjHETrKHKmO3WPWlWb+EzcS1ER8JrDj5UaOITyG1WIXHGgAcQm7lEnOlMP+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Vw0vB8om; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rjQkLIGR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Vw0vB8om";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rjQkLIGR"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0EBIBm5jNpd3KIuLGszq3PazACWdDvXzo0/uNY329I=;
	b=Vw0vB8omZo7n15kO9jm6LrTkJPZPCyTUp7BYuIRcalRbmVrerP//B/YrsO/bVuRC8udPiT
	Tx4WT5VQ9gY7wC/GaUR2JbK6RKmJ/hwVpyjbBNGyQSn0ma2Vy9Pr/7MWbkqQ6z9rfh4347
	VjCtnblV+UrqlbRZID7ZEV25INf4LrJCikRBLY5WEXMADFbC7ADXNK6btC7Jk09vyomdw3
	eN1Yd3OwInZGcay04IFQ0tNnsZeSsJyNQ49cgmhblZox/8R78n8G1ObRfI3QYw1xQLCqpN
	nz3DOXY6/+ZaGAlwr+3V/r/IiWmyhmuAurbhWwGRe8eLBYlAbP/vOFgsklzxbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0EBIBm5jNpd3KIuLGszq3PazACWdDvXzo0/uNY329I=;
	b=rjQkLIGROHanTm4ZQKkRhxB+SoXQ85/KChGEgURGHZRk1xF73Af+heravUg1o4MI3/6Nmb
	ppUZ97iYyiOwdNCQ==
Date: Fri, 27 Feb 2026 07:44:37 +0100
Subject: [PATCH v2 11/15] vdso/helpers: Explicitly include vdso/processor.h
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-11-35d60acf7410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=694;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ksAvbNu4g6GEEgEwDE4RqU2Mb+uIs9kO6obM62gGDDM=;
 b=jfMCxjTvNN6/pYy+fIWrmEt0awSdB/wvT6klfnssMA8eEwpKV+gbcmPDAhbNs3euCJHVEtrES
 QylTA587HbwCMFzseU3rCypSwUO+LeHxhv6GYUU1xKBFDru1TJ7WJvw
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The usage of cpu_relax() requires vdso/processor.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/helpers.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/vdso/helpers.h b/include/vdso/helpers.h
index 1a5ee9d9052c..a1c995af4696 100644
--- a/include/vdso/helpers.h
+++ b/include/vdso/helpers.h
@@ -6,6 +6,7 @@
 
 #include <asm/barrier.h>
 #include <vdso/datapage.h>
+#include <vdso/processor.h>
 
 static __always_inline u32 vdso_read_begin(const struct vdso_clock *vc)
 {

-- 
2.53.0

