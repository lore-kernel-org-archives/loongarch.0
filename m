Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DBF10F5
	for <loongarch@lists.linux.dev>; Sun, 16 Apr 2023 06:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1681625050; bh=1dkkStELx2iCRjepHGfbB6ccRiLg5q74KlHmNMqQNkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Igu1U/H4F37OEuwQAAanOFoXA9s2MWrKpxHh08H+5jsw2OseEkZUdzmUvVi+Ni+ay
	 cwMhW5FbyGmqTZeOn99BJCCu5SEjEE92ZhZlJF2cW7LdugkoQGuWwq0MfXugrEFvSe
	 fk5f3L+r5JUsXUjFkm0t0jY/jH6OPVN78LoLQLXA=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B716560195;
	Sun, 16 Apr 2023 14:04:10 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v4 04/12] LoongArch: Print symbol info for CSR.ERA and $ra only for kernel-mode contexts
Date: Sun, 16 Apr 2023 14:03:48 +0800
Message-Id: <20230416060356.3711529-5-kernel@xen0n.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416060356.3711529-1-kernel@xen0n.name>
References: <20230416060356.3711529-1-kernel@xen0n.name>
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
"estat:" line too.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index f61de72e0c3a..0cfcb1ba669f 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -187,14 +187,15 @@ static void __show_regs(const struct pt_regs *regs)
 	if (regs->regs[0])
 		pr_cont("syscall restart flag: %0*lx\n", field, regs->regs[0]);
 
-	/*
-	 * Saved csr registers
-	 */
-	printk("era   : %0*lx %pS\n", field, regs->csr_era,
-	       (void *) regs->csr_era);
-	printk("ra    : %0*lx %pS\n", field, regs->regs[1],
-	       (void *) regs->regs[1]);
+	if (user_mode(regs)) {
+		pr_cont("  era: %0*lx\n", field, regs->csr_era);
+		pr_cont("   ra: %0*lx\n", field, regs->regs[1]);
+	} else {
+		pr_cont("  era: %0*lx %pS\n", field, regs->csr_era, (void *) regs->csr_era);
+		pr_cont("   ra: %0*lx %pS\n", field, regs->regs[1], (void *) regs->regs[1]);
+	}
 
+	/* Print important CSRs */
 	printk("CSR crmd: %08lx	", regs->csr_crmd);
 	printk("CSR prmd: %08lx	", regs->csr_prmd);
 	printk("CSR euen: %08lx	", regs->csr_euen);
-- 
2.40.0

