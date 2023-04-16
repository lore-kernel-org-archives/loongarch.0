Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01D210F5
	for <loongarch@lists.linux.dev>; Sun, 16 Apr 2023 06:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1681625077; bh=vM0vv+9iHCQ4C6xHRva8bJ0vlZTgyNeLdrlYvnvCjvo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fU9TCrxWUohb5/up1eU80/1+rQWW+xD/WMNtNUqRk7+GhG7yktpB/IFwYTRh7QGIH
	 eacGhQ2c6me4xQDEF1Ei87qtpzPmXEjk4UiiphWzia7BCeHyRidVV5Dl2DapqbABfS
	 G6CyMQ0bUAbkeCCf8I5bp5zXL8pADAkbreCKB9xg=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C299B6015B;
	Sun, 16 Apr 2023 14:04:37 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v4 11/12] LoongArch: Use lowercase ISA manual names for BADV and CPUCFG.PRID lines in show_regs
Date: Sun, 16 Apr 2023 14:03:55 +0800
Message-Id: <20230416060356.3711529-12-kernel@xen0n.name>
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

While at it, also change the printk to pr_cont.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index a1961c423244..e8708b362da4 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -355,9 +355,9 @@ static void __show_regs(const struct pt_regs *regs)
 	print_estat(regs->csr_estat);
 
 	if (exccode >= EXCCODE_TLBL && exccode <= EXCCODE_ALE)
-		printk("BadVA : %0*lx\n", field, regs->csr_badvaddr);
+		pr_cont(" badv: %0*lx\n", field, regs->csr_badvaddr);
 
-	printk("PrId  : %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
+	pr_cont(" prid: %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
 	       cpu_family_string());
 }
 
-- 
2.40.0

