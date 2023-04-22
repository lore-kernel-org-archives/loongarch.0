Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3726AAD
	for <loongarch@lists.linux.dev>; Sat, 22 Apr 2023 17:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682184919; bh=mlMCNVxFU6TnQKNoNJi6/dba+lV6BSncrD+O3PUhO3w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EZcqBy143vH2pXsF09lTxP8mJXxkeu1FrT5SHQF4LwnZLthLrCrOBU1X9zltNZZxz
	 hotxJwWbWF/cH0ntRCinnYBV0pGxerbmod40VOKQ139PlGPReqyUjHgggujWufBiid
	 6iXB2hsaGzAhGnFzD7dMLGnrtNTbMnyQCPKYMV1M=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 6E25160B16;
	Sun, 23 Apr 2023 01:35:19 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v6 04/13] LoongArch: Print symbol info for CSR.ERA and $ra only for kernel-mode contexts
Date: Sun, 23 Apr 2023 01:34:46 +0800
Message-Id: <20230422173455.3354690-5-kernel@xen0n.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422173455.3354690-1-kernel@xen0n.name>
References: <20230422173455.3354690-1-kernel@xen0n.name>
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
 arch/loongarch/kernel/traps.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index b67607916b7f..801469cf9f90 100644
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
+		pr_cont("   ra: %0*lx\n", GPR_FIELD(1));
+		pr_cont("  ERA: %0*lx\n", field, regs->csr_era);
+	} else {
+		pr_cont("   ra: %0*lx %pS\n", GPR_FIELD(1), (void *) regs->regs[1]);
+		pr_cont("  ERA: %0*lx %pS\n", field, regs->csr_era, (void *) regs->csr_era);
+	}
+#undef GPR_FIELD
 
 	printk("CSR crmd: %08lx	", regs->csr_crmd);
 	printk("CSR prmd: %08lx	", regs->csr_prmd);
-- 
2.40.0

