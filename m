Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2137B
	for <loongarch@lists.linux.dev>; Sun, 16 Apr 2023 06:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1681625056; bh=dD3fslFerHi2FMLs3GMswSUH0VAYbyRaJ9n4VRYGk5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sEZGg+bcSPmxtj31q/Rsw8lMDh+ZmAJlJhV5jrd7HvW7vDhPhdJ6ntYgdNkdXMn/S
	 cEI08GgBlwBJJTsjJlkDXXSFvpdMYG33l95TW17wDnONLPubF93XHzcPXnL1gbl125
	 Lkn0OaZCcVH0clI+Qa5vhz5KZJUkinK1GcEWMzDA=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id A34E360157;
	Sun, 16 Apr 2023 14:04:16 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v4 05/12] LoongArch: Fix format of CSR lines during show_regs
Date: Sun, 16 Apr 2023 14:03:49 +0800
Message-Id: <20230416060356.3711529-6-kernel@xen0n.name>
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

Use lowercase CSR names throughout, and right-align the keys. The "CSR"
part is inferrable from context, hence dropped for more horizontal
space.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 0cfcb1ba669f..0bd0d6e827f6 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -196,13 +196,11 @@ static void __show_regs(const struct pt_regs *regs)
 	}
 
 	/* Print important CSRs */
-	printk("CSR crmd: %08lx	", regs->csr_crmd);
-	printk("CSR prmd: %08lx	", regs->csr_prmd);
-	printk("CSR euen: %08lx	", regs->csr_euen);
-	printk("CSR ecfg: %08lx	", regs->csr_ecfg);
-	printk("CSR estat: %08lx	", regs->csr_estat);
-
-	pr_cont("\n");
+	pr_cont(" crmd: %08lx\n", regs->csr_crmd);
+	pr_cont(" prmd: %08lx\n", regs->csr_prmd);
+	pr_cont(" euen: %08lx\n", regs->csr_euen);
+	pr_cont(" ecfg: %08lx\n", regs->csr_ecfg);
+	pr_cont("estat: %08lx\n", regs->csr_estat);
 
 	exccode = ((regs->csr_estat) & CSR_ESTAT_EXC) >> CSR_ESTAT_EXC_SHIFT;
 	excsubcode = ((regs->csr_estat) & CSR_ESTAT_ESUBCODE) >> CSR_ESTAT_ESUBCODE_SHIFT;
-- 
2.40.0

