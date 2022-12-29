Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92C0111F
	for <loongarch@lists.linux.dev>; Thu, 29 Dec 2022 05:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1672292010; bh=IJvTzfzkObDNE7L4vM15w5bV8a1yXFalby7V2RDEruw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=v+YIAQUq875Pr/csNHwYxR5N51k3XJpRM0jJuvBr1AAd9IS8L6Jam+6rWwAeooC6G
	 F6H5rcW1Raq9MZ5RuUGmm8Tx1r0c0503mBzIk7Z4Jh82RHsW4XGjm4++GRDgXLWkHo
	 RDCDlbwKPBhA4f+3vR/b25Jq3qLGELOV+GcJQyBA=
Received: from ld50.lan (unknown [101.88.134.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id A40C46019E;
	Thu, 29 Dec 2022 13:33:30 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v2 04/11] LoongArch: Print symbol info for PC and $ra only for kernel-mode contexts
Date: Thu, 29 Dec 2022 13:32:59 +0800
Message-Id: <20221229053306.3285457-5-kernel@xen0n.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229053306.3285457-1-kernel@xen0n.name>
References: <20221229053306.3285457-1-kernel@xen0n.name>
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
index d05a3e14279b..f0720b219006 100644
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
2.38.1

