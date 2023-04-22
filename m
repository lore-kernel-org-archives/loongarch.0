Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85196AAD
	for <loongarch@lists.linux.dev>; Sat, 22 Apr 2023 17:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682184925; bh=jng/QCPDwOJFcFlJnsOf0kUAJs4pOrD3zGxds8on7e0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TyGHJFxiR3IuLdIAjBugfxAL84d2nxeLWXz0tU6hio9rhaU52McKm+DYCs4cI4fw+
	 AvPeA+nI48104cZ9eV0cu+di48eOYco1m/QCaph4JHFfHCYffm7AEnp7RqLwhPUqds
	 CLg2lOGSREMZNkWGd+Exu/ljNKecwkBsRyMcpMu0=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E9997600DA;
	Sun, 23 Apr 2023 01:35:24 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v6 05/13] LoongArch: Fix format of CSR lines during show_regs
Date: Sun, 23 Apr 2023 01:34:47 +0800
Message-Id: <20230422173455.3354690-6-kernel@xen0n.name>
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

Use uppercase CSR names throughout for consistency with the manual
wording, and right-align the keys. The "CSR" part is inferrable from
context, hence dropped for more horizontal space.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 801469cf9f90..8130063ed553 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -193,13 +193,12 @@ static void __show_regs(const struct pt_regs *regs)
 	}
 #undef GPR_FIELD
 
-	printk("CSR crmd: %08lx	", regs->csr_crmd);
-	printk("CSR prmd: %08lx	", regs->csr_prmd);
-	printk("CSR euen: %08lx	", regs->csr_euen);
-	printk("CSR ecfg: %08lx	", regs->csr_ecfg);
-	printk("CSR estat: %08lx	", regs->csr_estat);
-
-	pr_cont("\n");
+	/* Print important CSRs */
+	pr_cont(" CRMD: %08lx\n", regs->csr_crmd);
+	pr_cont(" PRMD: %08lx\n", regs->csr_prmd);
+	pr_cont(" EUEN: %08lx\n", regs->csr_euen);
+	pr_cont(" ECFG: %08lx\n", regs->csr_ecfg);
+	pr_cont("ESTAT: %08lx\n", regs->csr_estat);
 
 	exccode = ((regs->csr_estat) & CSR_ESTAT_EXC) >> CSR_ESTAT_EXC_SHIFT;
 	excsubcode = ((regs->csr_estat) & CSR_ESTAT_ESUBCODE) >> CSR_ESTAT_ESUBCODE_SHIFT;
-- 
2.40.0

