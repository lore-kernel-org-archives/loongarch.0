Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64730185D
	for <loongarch@lists.linux.dev>; Wed, 26 Apr 2023 07:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682495140; bh=bZmWuJJpwjh4eRFw022nm6hCGU6/LJZ0EqJZ6NK7E50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kuNukuS6fyzkZKusQsLgp2p8/EQuTgbr8q7kAOLtV2YrUwOcQ9qLU04QOdG1DyXqj
	 ey1yyyGYHVtvH1H2SJMW6F/qUWey2qPu7HCG67tfTKwQLVYFULoSo47PAUiqoBfcaQ
	 L1yLkC2MAeppRyCIoKWFPdyZwWjbjx8sbCI4YhLk=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 0421E600CE;
	Wed, 26 Apr 2023 15:45:39 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v8 04/12] LoongArch: Print symbol info for CSR.ERA and $ra only for kernel-mode contexts
Date: Wed, 26 Apr 2023 15:45:17 +0800
Message-Id: <20230426074525.3906327-5-kernel@xen0n.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426074525.3906327-1-kernel@xen0n.name>
References: <20230426074525.3906327-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Otherwise the addresses wouldn't make sense at all.

While at it, align the "map keys" to maintain right-alignment with the
"estat:" line too; also swap the ERA and ra lines so all CSRs are shown
together.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 57768a6de1cf..ab08548315b8 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -183,16 +183,19 @@ static void __show_regs(const struct pt_regs *regs)
 	/* The slot for $zero is reused as the syscall restart flag */
 	if (regs->regs[0])
 		printk("syscall restart flag: %0*lx\n", GPR_FIELD(0));
+
+	if (user_mode(regs)) {
+		printk("   ra: %0*lx\n", GPR_FIELD(1));
+		printk("  ERA: %0*lx\n", field, regs->csr_era);
+	} else {
+		printk("   ra: %0*lx %pS\n", GPR_FIELD(1), (void *) regs->regs[1]);
+		printk("  ERA: %0*lx %pS\n", field, regs->csr_era, (void *) regs->csr_era);
+	}
 #undef GPR_FIELD
 
 	/*
 	 * Saved csr registers
 	 */
-	printk("era   : %0*lx %pS\n", field, regs->csr_era,
-	       (void *) regs->csr_era);
-	printk("ra    : %0*lx %pS\n", field, regs->regs[1],
-	       (void *) regs->regs[1]);
-
 	printk("CSR crmd: %08lx	", regs->csr_crmd);
 	printk("CSR prmd: %08lx	", regs->csr_prmd);
 	printk("CSR euen: %08lx	", regs->csr_euen);
-- 
2.40.0

