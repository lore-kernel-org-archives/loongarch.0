Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED19F1BC074
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 07:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543730; cv=none; b=qoVLR/w8BFlLMD1YpBejYWtskn9YesOQ1svvIxDjFUvY0WIxrVVng6IVFGAvAfxzNQDH2jlAJbNPv+ds2p7Q5zYNmCrfq1pBwnNZ+to0cIJzper2wVNUB4lxnevehnU8BJ7ciY94o15ZL314tPZ5VcnWQ0NK5zWxvEd/PyBtrb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543730; c=relaxed/simple;
	bh=26zrKbXgaegtQRF54QahNJ7RqrsVomxOEoCs/TkZNvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dOEVD2Ctzaihr+Q3/P6Y2/UigkCNh3sZd/5gMd+2i86t5QUqf3DD4mWHcyyqAngl/tjDln3Gyx6PF1HGoYQpsDGcLloOoKR15RxnlQHg4Fa5Tpmg7/NT3i8QVQkzp8giA9kP1ZfAlP4rsZudOdx5frbm2lC0mChY7KhbGK1gUeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YcZEzOUd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iyMEQhcf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YcZEzOUd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iyMEQhcf"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PwmVSRYHSb9/NywpACjYo1hL5y3FHne1vH2pikuaTow=;
	b=YcZEzOUdhlXiCUo9zBxtUEs1lRTFdUtoFZifHE65r17ffT91v48OykPMk0gsduWWnaXFnl
	QI4eADY1DxC1AT3lzNl8lysm9YCa7HnRo5mJcvO2W3L+xJOEvgW6fFbb2DiNKt3M/muTmI
	qVsmg5cNSfpMUhVMQ3xH4EG8d86mbmfH9NQp+zIkVfaRcEkaji8Pc2CznEzR9Buur86WOq
	DHvJY+63fQFNJ/xurgm7CZ6kF0HzLbpiK+ghx0TT/2mjVP+EeHfeboTvz4ubEdmUh3lZDp
	6/HrMR4WkAOYEwuxVs9iRv2xO7Rly29CgjXTkxYlkeAItbnYdrzryLbyddjlGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PwmVSRYHSb9/NywpACjYo1hL5y3FHne1vH2pikuaTow=;
	b=iyMEQhcf2QKpwhtXbu94btRjqz9d7oSo3Oe/vNDfj7ibZpre7LVj0Tw7sOLjCRJ54vanch
	RAVT0BDFlUfpQxCA==
Date: Thu, 10 Oct 2024 09:01:14 +0200
Subject: [PATCH 12/28] x86: vdso: Place vdso_data at beginning of vvar page
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-12-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1094;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=26zrKbXgaegtQRF54QahNJ7RqrsVomxOEoCs/TkZNvU=;
 b=cYpXZmqDh/Rorow/qfQz39qv6eqMnL/Rmdtt5VCTnsFoAYqSwN0e1dWkEh7d9D9sfDeqwtaYF
 jcGpydVABZ8Av8SYTSumXQRs9n9uAnjOWL/Jc4Q1I+J59hCir5Y9t1C
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The offset of the vdso_data only has historic reasons, as back then
other vvars also existed and offset 0 was already used.
(See commit 8c49d9a74bac ("x86-64: Clean up vdso/kernel shared variables"))
Over time most other vvars got removed and offset 0 is free again.

Moving vdso_data to the beginning of the vvar page aligns x86 with other
architectures and opens up the way for the removal of the custom x86
vvar machinery.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/include/asm/vvar.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/vvar.h b/arch/x86/include/asm/vvar.h
index 9d9af37f7cab9e3e6159c0b758e500ddcfc6b3e8..01e60e0f671e9625669dc8fdacf3cdddf8cbf4fb 100644
--- a/arch/x86/include/asm/vvar.h
+++ b/arch/x86/include/asm/vvar.h
@@ -58,7 +58,7 @@ extern char __vvar_page;
 
 /* DECLARE_VVAR(offset, type, name) */
 
-DECLARE_VVAR(128, struct vdso_data, _vdso_data)
+DECLARE_VVAR(0, struct vdso_data, _vdso_data)
 
 #if !defined(_SINGLE_DATA)
 #define _SINGLE_DATA

-- 
2.47.0

