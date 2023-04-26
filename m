Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8001874
	for <loongarch@lists.linux.dev>; Wed, 26 Apr 2023 07:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682495141; bh=jAx8zfO1ZRilHbiCUqi2aGtszN7KXksAz7PnaWaMW8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DQOaC5WqsfvyWXrPc7N4GvG+GGRp9j6ZWnt3KVsJeKj8btwGFdxEKAo+gQfrdz10i
	 2ivHTZd0EsPmbZfCr2wK5BSIDXuPee96uQkJTM0jjIK+1Jg1ytLmi45i43wPvnLv/X
	 WVKcNDefcCs1/81sgWJ3V2Ds6vQgel8QncxgwMCg=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 7C91A6014E;
	Wed, 26 Apr 2023 15:45:41 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v8 05/12] LoongArch: Fix format of CSR lines during show_regs
Date: Wed, 26 Apr 2023 15:45:18 +0800
Message-Id: <20230426074525.3906327-6-kernel@xen0n.name>
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

Use uppercase CSR names throughout for consistency with the manual
wording, and right-align the keys. The "CSR" part is inferrable from
context, hence dropped for more horizontal space.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index ab08548315b8..434a7717face 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -193,16 +193,12 @@ static void __show_regs(const struct pt_regs *regs)
 	}
 #undef GPR_FIELD
 
-	/*
-	 * Saved csr registers
-	 */
-	printk("CSR crmd: %08lx	", regs->csr_crmd);
-	printk("CSR prmd: %08lx	", regs->csr_prmd);
-	printk("CSR euen: %08lx	", regs->csr_euen);
-	printk("CSR ecfg: %08lx	", regs->csr_ecfg);
-	printk("CSR estat: %08lx	", regs->csr_estat);
-
-	pr_cont("\n");
+	/* Print saved important CSRs */
+	printk(" CRMD: %08lx\n", regs->csr_crmd);
+	printk(" PRMD: %08lx\n", regs->csr_prmd);
+	printk(" EUEN: %08lx\n", regs->csr_euen);
+	printk(" ECFG: %08lx\n", regs->csr_ecfg);
+	printk("ESTAT: %08lx\n", regs->csr_estat);
 
 	exccode = ((regs->csr_estat) & CSR_ESTAT_EXC) >> CSR_ESTAT_EXC_SHIFT;
 	excsubcode = ((regs->csr_estat) & CSR_ESTAT_ESUBCODE) >> CSR_ESTAT_ESUBCODE_SHIFT;
-- 
2.40.0

