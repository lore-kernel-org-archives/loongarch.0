Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E182900
	for <loongarch@lists.linux.dev>; Wed, 15 Feb 2023 08:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1676450063; bh=K2Gd3ufVgpXdRPUVXubZnpeOOFS7V5v5dSgGL1WZJ2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yg5cqyOmQg46U80EvcAYXrqMp0yy17HNAFnOm75nZaslseNHgYDkCW4srKaVFneIj
	 rfAI4nG+QhubP9T1B2IBd2IN2K/uxW3Vz2mVc6pvCldlEHj1iIbnxbbR53mQelm88D
	 ZKiSk3cB3+BSuhx6qH9LMEVz9C5XhgnvVOAo6c0w=
Received: from ld50.lan (unknown [114.93.192.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id F27DD607CD;
	Wed, 15 Feb 2023 16:34:22 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v3 04/11] LoongArch: Print symbol info for CSR.ERA and $ra only for kernel-mode contexts
Date: Wed, 15 Feb 2023 16:34:05 +0800
Message-Id: <20230215083412.3795357-5-kernel@xen0n.name>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215083412.3795357-1-kernel@xen0n.name>
References: <20230215083412.3795357-1-kernel@xen0n.name>
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
index 27dbd6d30be7..c52c488171ba 100644
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
2.39.1

