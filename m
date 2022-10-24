Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB54A5D
	for <loongarch@lists.linux.dev>; Mon, 24 Oct 2022 12:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1666613591; bh=Gzoa7nUowzryRMbeDDIl86Oad3OHEZ2qzIRC4QATeLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DTax0p+Yj3ZxqF5IEDEovsC6F9hO5o0Zsoj15aE/BeY/M4iiYPY7bpP7l8QhPtMYb
	 fpxP8pDZHGWXEfDyD/ASiXeuZFo5aeJta7LAo3yH3Gg4KERIJ1ViTMXOC5PhVClJfB
	 +fuOPveGJZzIXXPA9kp157LVSxgDVQN3EvgilHbw=
Received: from ld50.lan (unknown [101.88.135.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 5800E6019E;
	Mon, 24 Oct 2022 20:13:11 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH 06/13] LoongArch: Print symbol info for PC and $ra only for kernel-mode contexts
Date: Mon, 24 Oct 2022 20:12:58 +0800
Message-Id: <20221024121305.381776-7-kernel@xen0n.name>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221024121305.381776-1-kernel@xen0n.name>
References: <20221024121305.381776-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Otherwise the addresses wouldn't make sense at all. And show "pc"
instead of "era" for a tiny bit of user friendliness.

While at it, align the "map keys" to maintain right-alignment with the
"estat:" line too.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index c6fe09bc5ccc..e24435c78086 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -188,14 +188,12 @@ static void __show_regs(const struct pt_regs *regs)
 	pr_cont(" s7 %0*lx s8 %0*lx\n",
 		field, regs->regs[30], field, regs->regs[31]);
 
-	/*
-	 * Saved csr registers
-	 */
-	printk("era   : %0*lx %pS\n", field, regs->csr_era,
-	       (void *) regs->csr_era);
-	printk("ra    : %0*lx %pS\n", field, regs->regs[1],
-	       (void *) regs->regs[1]);
+	if (!user_mode(regs)) {
+		pr_cont("   pc: %0*lx %pS\n", field, regs->csr_era, (void *) regs->csr_era);
+		pr_cont("   ra: %0*lx %pS\n", field, regs->regs[1], (void *) regs->regs[1]);
+	}
 
+	/* Print important CSRs */
 	printk("CSR crmd: %08lx	", regs->csr_crmd);
 	printk("CSR prmd: %08lx	", regs->csr_prmd);
 	printk("CSR euen: %08lx	", regs->csr_euen);
-- 
2.38.0

