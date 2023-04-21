Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C1028E2
	for <loongarch@lists.linux.dev>; Fri, 21 Apr 2023 11:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682077778; bh=Z61NGy0h/U1NsOP+vJcXcAca+Vs7fx1Hz7gQo/Oq1jI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=urRPo/TULBwFkTBhejzc+Tczq8VyX75OpM4NqQ4yW8K4j8i2lK9jK4J3sejE+MOXf
	 385WGWFDh/7fTxrotdlAA+i46jDsFVE9glY/yVDiNxMmxoizmscLneEVF/XL5EJ1Jn
	 iW1nvlEIe0WCvGUQSPJ4ip9YWsDNjvUhJj1G4eSM=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 2BB1460148;
	Fri, 21 Apr 2023 19:49:38 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v5 04/12] LoongArch: Print symbol info for CSR.ERA and $ra only for kernel-mode contexts
Date: Fri, 21 Apr 2023 19:49:00 +0800
Message-Id: <20230421114908.2970567-5-kernel@xen0n.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421114908.2970567-1-kernel@xen0n.name>
References: <20230421114908.2970567-1-kernel@xen0n.name>
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
 arch/loongarch/kernel/traps.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 4176b22144b7..abb638889914 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -183,15 +183,15 @@ static void __show_regs(const struct pt_regs *regs)
 	/* The slot for $zero is reused as the syscall restart flag */
 	if (regs->regs[0])
 		pr_cont("syscall restart flag: %0*lx\n", GPR_FIELD(0));
-#undef GPR_FIELD
 
-	/*
-	 * Saved csr registers
-	 */
-	printk("era   : %0*lx %pS\n", field, regs->csr_era,
-	       (void *) regs->csr_era);
-	printk("ra    : %0*lx %pS\n", field, regs->regs[1],
-	       (void *) regs->regs[1]);
+	if (user_mode(regs)) {
+		pr_cont("  ERA: %0*lx\n", field, regs->csr_era);
+		pr_cont("   ra: %0*lx\n", GPR_FIELD(1));
+	} else {
+		pr_cont("  ERA: %0*lx %pS\n", field, regs->csr_era, (void *) regs->csr_era);
+		pr_cont("   ra: %0*lx %pS\n", GPR_FIELD(1), (void *) regs->regs[1]);
+	}
+#undef GPR_FIELD
 
 	printk("CSR crmd: %08lx	", regs->csr_crmd);
 	printk("CSR prmd: %08lx	", regs->csr_prmd);
-- 
2.40.0

