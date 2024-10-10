Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0601CF2A9
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728575101; cv=none; b=Ymvq8uNRqmFfpsivQw7nt7slkeAOVgoSCfAHKYhmuRwA81cfXIFFHWyxB1reqEsbjMcPAJQ8BKPBG4x6bXGV2VaFSLZr5r/Ys0z6Tujn0keviIxkVJuqbuei4/jfpbNpla3PjWmU9pdWkczb+vFbaEwmruA3ttZLKWVhStLrJJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728575101; c=relaxed/simple;
	bh=/bLPps0kAlBRHgd8VurrfZ2wFo+tXRF7XdxLtwWPU+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aiHIcfVsW5PzxynIJwEdvTec/yW3yNXIkQ3epY99OVehlOZCt2/YATt6TVCrPIrPUnYpvDt27EbPZzE1FxZZ85AoJnwIq+76iuh/tUkJiePWfEHAre34GC8Dip99uT4K1dx88mrY8HjWgd4/4ihPCVThn8rW8CY1eDe0/1pANeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1OiwjVdj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9vMVf9Cb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1OiwjVdj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9vMVf9Cb"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a2YqBVOHBfNFQlYc2gfs+s/qyh0QTOeEVhJlFH/p2/E=;
	b=1OiwjVdjrZF9JLf67Y/LK2PMnwLAF6f41w7jSmYgltcI3k2cD+n7bBb3R7AXe/M5orD3c+
	jNG47qrWfoeO74dHjhGwcCiplD51Ks4/wT8wVWFsAkjuLH8y+TdThHOIlghS0ejZ7F4aJa
	fdpD7VdAq91WotwCAmPne8F2NLFwMYZWf5cDB6bRigLRB+bdwIg6emBC7Dyzs8W7a+OKUm
	xzIv9EKcqqDk6zspMO0Spc74duaQFMTeiUOuvLkj/W4zrG6P7wdxMUk7y1gP4aWoksQl6V
	TbQmh1ZbbScffPyjmfP0nXGZR3w7Hdnc4ywqwQ0P5zuxX07uFPWXRTvgGEjLCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a2YqBVOHBfNFQlYc2gfs+s/qyh0QTOeEVhJlFH/p2/E=;
	b=9vMVf9CbfgONWR64KkrCcVV2A6E13/KxqF+wIJ6JAeIgkdde2/u1qMBZ2EVk1IjlQezOJt
	gT4pUMl2c2fdb5AA==
Date: Thu, 10 Oct 2024 17:44:52 +0200
Subject: [PATCH 9/9] MIPS: vdso: Remove timekeeper includes
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-9-7fe5a3ea4382@linutronix.de>
References: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
In-Reply-To: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-s390@vger.kernel.org, loongarch@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=1279;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=/bLPps0kAlBRHgd8VurrfZ2wFo+tXRF7XdxLtwWPU+E=;
 b=70spRKqHOmT+bRC0fNPVPL3cOST7P0HmO7QAaigcg8bU87MT4d/jPV/ffmUNPS4FcH3K4ltDk
 qXWF2y4zePwCAnlPQXanKbWKEAG//thS3UqbZsh6pujUgMXZF0G2YYS
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Since the generic VDSO clock mode storage is used, this header file is
unused and can be removed.

This avoids including a non-VDSO header while building the VDSO,
which can lead to compilation errors.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/include/asm/vdso/vsyscall.h | 1 -
 arch/mips/kernel/vdso.c               | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/mips/include/asm/vdso/vsyscall.h b/arch/mips/include/asm/vdso/vsyscall.h
index 47168aaf1eff051199cf668d584e903b1eb8a3be..a4582870aaea49ac288d62ec4fa1338a98621918 100644
--- a/arch/mips/include/asm/vdso/vsyscall.h
+++ b/arch/mips/include/asm/vdso/vsyscall.h
@@ -4,7 +4,6 @@
 
 #ifndef __ASSEMBLY__
 
-#include <linux/timekeeper_internal.h>
 #include <vdso/datapage.h>
 
 extern struct vdso_data *vdso_data;
diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index dda36fa26307e27d3de414c811450ed912294a0e..4c8e3c0aa210476d7b8cb349b99e9a5a453aa7ce 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -14,7 +14,6 @@
 #include <linux/random.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
-#include <linux/timekeeper_internal.h>
 
 #include <asm/abi.h>
 #include <asm/mips-cps.h>

-- 
2.47.0

