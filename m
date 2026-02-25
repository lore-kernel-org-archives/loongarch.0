Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDCF315D43
	for <loongarch@lists.linux.dev>; Wed, 25 Feb 2026 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772014189; cv=none; b=nle+OZOGic6WNp6WvpdFPNzEVHGW+YgeOU/rQAw8DLISQz0VNiTFKSAukHwiFlFBR3gTLmpbTZTIL2xY8LBxRQeHnEb4nFq3Xed/XzMMB5OD8r8NAp0dnZSOE6wwrLggPMidf0Nbf2rF2DTiR2/zk0k4btYcgrv2k8e6sxTr0ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772014189; c=relaxed/simple;
	bh=ktdUiwQuFu0TUtXNvJgTsi35rKqoSG6diE7RP/zY7qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VZW7APqlyvKPimDj1YHCC2oFDxJYMhCJkh2rDw7nfwBscLcoRaFo1xfZKaqV2QEGj90CWVwwBIDyiQ1CuYFu6i/8tRgQyUqcw2sFsx8tCWt7/RVvSab0B/AgH3BtH3NRHRKv0mDtSQPYZ/ocMP6ctKMNZ7LUXQVpiv9mWkdLNII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tMZlAxwD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H7C79p91; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tMZlAxwD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H7C79p91"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772014185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1XTSl1xFkwFm1MEaZgCOi3O8/dp8etYjZK8YFywLkoM=;
	b=tMZlAxwDT/0aulBxXsC1Qc6GMqXS/uEthGTd09vz8VxUcJS93Tk3VCsM/pYq2X5qXV+MQ6
	0hWawbQLotQyn+FidScGhMFDkiWIQ/ISRO8OxtSKLYokOgSXXZo4IvSbpjy9wLg39Sz9E3
	4kNaXjFo4NPrfmNeDA05XSr49XD6lzhUATUOWzmedkaYHI4Jk+6UqTWD1+JllKGbgtgYqU
	bWdGwXT+F9kl7Vi7jRP/k/a2/pSM+GRiNCSV7hTPpxYgOojuJ16OeLIkpRt9yj0JcVQhXC
	MDkm37kvTrBXKUXbsbmy+g/5MTLwtKISc9v0w/BCPuv5F1Zs2dZTJo5CtikCDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772014185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1XTSl1xFkwFm1MEaZgCOi3O8/dp8etYjZK8YFywLkoM=;
	b=H7C79p91Uyj1rM4Jp2qYkvb+TCiCuvMFEMigIJU9Oge2vt6jRSOWJUI7Z5lcoWhaBMef5X
	gEfmQWDIiuys43AQ==
Date: Wed, 25 Feb 2026 11:09:39 +0100
Subject: [PATCH] LoongArch: Only use SC.Q when supported by the assembler
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260225-loongarch-scq-v1-1-47acc2e45ec2@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBPULKKrRAsZJx0ILYUIpLsnL
 d/i/wqFMlOBpauQ6ebCKTaovgMMNnoS7JpBSz1JrWZxpBS9zRhEwUtoMxjC0RIaB605M+38/L9
 1e98PMe7Pr18AAAA=
X-Change-ID: 20260218-loongarch-scq-2434ec5aec4d
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 George Guo <guodongtai@kylinos.cn>, Hengqi Chen <hengqi.chen@gmail.com>, 
 Xi Ruoyao <xry111@xry111.site>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772014180; l=2368;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ktdUiwQuFu0TUtXNvJgTsi35rKqoSG6diE7RP/zY7qw=;
 b=6OVyzTd0/n/qTDhhCj45t4s2cvbFqcNNSzLtJyt7HfRvuwOSrO9gfPz63daDlT41bxZXTZ+SA
 bu9hFaM3Xg4CqZeUyPH9npx8YE7Aci6BoLzWp3M5N26hqSt26IMsd3p
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The 128-bit atomic cmpxchg implementation uses the SC.Q instruction.
Older versions of GNU AS do not support that instruction, erroring out:

ERROR:root:{standard input}: Assembler messages:
{standard input}:4831: Error: no match insn: sc.q	$t0,$t1,$r14
{standard input}:6407: Error: no match insn: sc.q	$t0,$t1,$r23
{standard input}:10856: Error: no match insn: sc.q	$t0,$t1,$r14
make[4]: *** [../scripts/Makefile.build:289: mm/slub.o] Error 1

(Binutils 2.41)

Test support for SC.Q in kconfig and disable the atomics if the
instruction is not available.

Fixes: f0e4b1b6e295 ("LoongArch: Add 128-bit atomic cmpxchg support")
Closes: https://lore.kernel.org/lkml/20260216082834-edc51c46-7b7a-4295-8ea5-4d9a3ca2224f@linutronix.de/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/loongarch/Kconfig               | 3 +++
 arch/loongarch/include/asm/cmpxchg.h | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index d211c6572b0a..92068ff38685 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -304,6 +304,9 @@ config AS_HAS_LBT_EXTENSION
 config AS_HAS_LVZ_EXTENSION
 	def_bool $(as-instr,hvcl 0)
 
+config AS_HAS_SCQ_EXTENSION
+	def_bool $(as-instr,sc.q \$t0$(comma)\$t1$(comma)\$t2)
+
 config CC_HAS_ANNOTATE_TABLEJUMP
 	def_bool $(cc-option,-mannotate-tablejump)
 
diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/include/asm/cmpxchg.h
index 58cabab6d90d..909f9274fe71 100644
--- a/arch/loongarch/include/asm/cmpxchg.h
+++ b/arch/loongarch/include/asm/cmpxchg.h
@@ -238,6 +238,8 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, unsigned int
 	arch_cmpxchg((ptr), (o), (n));					\
   })
 
+#ifdef CONFIG_AS_HAS_SCQ_EXTENSION
+
 union __u128_halves {
 	u128 full;
 	struct {
@@ -290,6 +292,9 @@ union __u128_halves {
 	BUILD_BUG_ON(sizeof(*(ptr)) != 16);				\
 	__arch_cmpxchg128(ptr, o, n, "");				\
 })
+
+#endif /* CONFIG_AS_HAS_SCQ_EXTENSION */
+
 #else
 #include <asm-generic/cmpxchg-local.h>
 #define arch_cmpxchg64_local(ptr, o, n) __generic_cmpxchg64_local((ptr), (o), (n))

---
base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122
change-id: 20260218-loongarch-scq-2434ec5aec4d

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

