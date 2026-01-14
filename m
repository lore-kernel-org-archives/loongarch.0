Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1828937C0F2
	for <loongarch@lists.linux.dev>; Wed, 14 Jan 2026 08:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377715; cv=none; b=m7yFKM4fRHhPxTSuNHa8dY1UPWtvCNXzVT3QmChggOPtzwqmNmhOKW4WDTaFbLsUqRpovL8gkgtZQeuvVwesLzZA7oNozr+B9z0tg9h8tlqFVZHrN+hM/jGQ/AMv4wqBK01LhwxnsTyMGVTa5bcXKwbCSHla/BuHYdNMEdYEdto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377715; c=relaxed/simple;
	bh=+1lVkIKKJkoQnYmow98Tw437AO4O84MXjHTDHSn6twc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IC+5irE2Ev/j9eNKcvUGVo7RexdYitvdJANXBnNyvkd9i1j5Q3ey3ssMvTWBEu3MBwg0wuoRIixExI+rX9hF8vTmxj0WgB5gzedSrkmB+6QrLsqkrRHxdN4wmOE+vjZGrQa+L51+h1wJnaNsw7jfrOJsfxU08iidH3+YW+K8a2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cA25spE+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SgMua/Vu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cA25spE+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SgMua/Vu"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiYZplVIU2bMswWsXnCI5OxX7s9uc9ivxQhrNyMPrMI=;
	b=cA25spE+wAim8f1k+7WuJqzkDZvys6GTSxpb2KmSk+Q+nQBzXS6tfqlpAIRKvEWYEGEjvt
	M5JYrhtF4/V7c4vtQje/H0cuZpahEmHorlI/aBdZoeMr51ZcqUWKmDVzJtHrHHS2taSN91
	1YNJm9KnYtXgoX3ro/D2d3WfFLskk6NY52CUjWd0s76hHvC6jTvROMwulq0w/PUhx2DJ8e
	llKyvPoPCo8CkP0T9hesoHw/d3X/z3lSpfBKSjqNkxL9PS13hDmD8aNhFTOBJtRuK7vGIt
	fyj9kweuwPRVmPQctCN7GIKojrBoYO9FlPcIX81ToULXHAYvm51VYRQLw21shQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiYZplVIU2bMswWsXnCI5OxX7s9uc9ivxQhrNyMPrMI=;
	b=SgMua/VuHoFPAPNG81enXWwvuyMKNcRB1exKhqZ6mzcCPvQlL56vFKb2yy2OPUAZMGjSg4
	mjGySB7DwP2mtJCw==
Date: Wed, 14 Jan 2026 09:01:38 +0100
Subject: [PATCH 06/15] LoongArch: vDSO: Explicitly include asm/vdso/vdso.h
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-6-803b80ee97b4@linutronix.de>
References: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
In-Reply-To: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=1174;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+1lVkIKKJkoQnYmow98Tw437AO4O84MXjHTDHSn6twc=;
 b=pCjZhMqwiVM5dgHItzyl6ajTK4aOPh7tLHVrMhOvnWvfFRUP3zDl4L0c5DomJbGojdZtYsvCu
 PpRT02OC5rBD9WS5fmROTezk+B3uOUsN8u/z0qHvLnFrQyxBXL7Gviz
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
index dee1a15d7f4c..663660f08a1f 100644
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
2.52.0

