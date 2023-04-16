Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E707E7B
	for <loongarch@lists.linux.dev>; Sun, 16 Apr 2023 06:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1681625060; bh=DgdPrTTIy0r89NgMPYUARnQmB6IeUnsHq4Jl1Bnqn1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fHIO+uME5bNI4HoHUr9OLUW13Er0z3EAG/W9F+AGrrjixny9LsnD2qnmGQTP1D1JJ
	 cPrrqwH6iR5b1BifUNqBaH1HAK8TkuQwM0SF4MJ4L+v8W87/83X0YrKVBRsAroFvBs
	 OmkSa3E/RLDfT6ON67AfaIRjJxwS2Z7tTxExv0G0=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 9440F60195;
	Sun, 16 Apr 2023 14:04:20 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v4 07/12] LoongArch: Humanize the PRMD line when showing registers
Date: Sun, 16 Apr 2023 14:03:51 +0800
Message-Id: <20230416060356.3711529-8-kernel@xen0n.name>
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

Example output looks like:

[   xx.xxxxxx]  prmd: 00000004 (-PWE +PIE PPLV0)

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index a6935c6bd045..d1b7f0f7ef5f 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -197,6 +197,15 @@ static void print_crmd(unsigned long x)
 	pr_cont(")\n");
 }
 
+static void print_prmd(unsigned long x)
+{
+	pr_cont(" prmd: %08lx (", x);
+	print_bool_fragment("PWE", FIELD_GET(CSR_PRMD_PWE, x), true);
+	print_bool_fragment("PIE", FIELD_GET(CSR_PRMD_PIE, x), false);
+	print_plv_fragment("PPLV", (int) FIELD_GET(CSR_PRMD_PPLV, x));
+	pr_cont(")\n");
+}
+
 static void __show_regs(const struct pt_regs *regs)
 {
 	const int field = 2 * sizeof(unsigned long);
@@ -241,7 +250,7 @@ static void __show_regs(const struct pt_regs *regs)
 
 	/* Print important CSRs */
 	print_crmd(regs->csr_crmd);
-	pr_cont(" prmd: %08lx\n", regs->csr_prmd);
+	print_prmd(regs->csr_prmd);
 	pr_cont(" euen: %08lx\n", regs->csr_euen);
 	pr_cont(" ecfg: %08lx\n", regs->csr_ecfg);
 	pr_cont("estat: %08lx\n", regs->csr_estat);
-- 
2.40.0

