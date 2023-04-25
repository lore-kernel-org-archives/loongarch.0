Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B02B1113
	for <loongarch@lists.linux.dev>; Tue, 25 Apr 2023 08:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682410232; bh=DTm/vo3DHv7J2hlMZbe9yuoTUsILm+s025FlTle+HVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j4oV9wSXZz6C4zFE6odq+nRy3Uxr6JJ/NKIs5hBC2VzX79vKMUEZXzm3GF8Lmfnv9
	 RH4MXSC/5GN2LA6/t3RR7Ti4keqxUC4C7cx2SwIR4GMOADyrB7wf0FxHqpFsyptnVv
	 sjCIbzFbr2VM/JGfSxPTa87d8xbFbeG191gsMm/E=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id DC7BB60B17;
	Tue, 25 Apr 2023 16:10:31 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v7 03/12] LoongArch: Print GPRs with ABI names when showing registers
Date: Tue, 25 Apr 2023 16:10:14 +0800
Message-Id: <20230425081023.3809434-4-kernel@xen0n.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425081023.3809434-1-kernel@xen0n.name>
References: <20230425081023.3809434-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Show PC (CSR.ERA) in place of $zero, and also show the syscall restart
flag (conveniently stuffed in regs[0]) if non-zero.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 36 ++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 529165eb6e6b..cdb17d6afc77 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -158,22 +158,32 @@ static void __show_regs(const struct pt_regs *regs)
 	const int field = 2 * sizeof(unsigned long);
 	unsigned int excsubcode;
 	unsigned int exccode;
-	int i;
 
 	show_regs_print_info(KERN_DEFAULT);
 
-	/*
-	 * Saved main processor registers
-	 */
-	for (i = 0; i < 32; ) {
-		if ((i % 4) == 0)
-			printk("$%2d   :", i);
-		pr_cont(" %0*lx", field, regs->regs[i]);
-
-		i++;
-		if ((i % 4) == 0)
-			pr_cont("\n");
-	}
+	/* Print GPRs except $zero (substituting with PC/ERA) */
+#define GPR_FIELD(x) field, regs->regs[x]
+	pr_cont("pc %0*lx ra %0*lx tp %0*lx sp %0*lx\n",
+		field, regs->csr_era, GPR_FIELD(1), GPR_FIELD(2), GPR_FIELD(3));
+	pr_cont("a0 %0*lx a1 %0*lx a2 %0*lx a3 %0*lx\n",
+		GPR_FIELD(4), GPR_FIELD(5), GPR_FIELD(6), GPR_FIELD(7));
+	pr_cont("a4 %0*lx a5 %0*lx a6 %0*lx a7 %0*lx\n",
+		GPR_FIELD(8), GPR_FIELD(9), GPR_FIELD(10), GPR_FIELD(11));
+	pr_cont("t0 %0*lx t1 %0*lx t2 %0*lx t3 %0*lx\n",
+		GPR_FIELD(12), GPR_FIELD(13), GPR_FIELD(14), GPR_FIELD(15));
+	pr_cont("t4 %0*lx t5 %0*lx t6 %0*lx t7 %0*lx\n",
+		GPR_FIELD(16), GPR_FIELD(17), GPR_FIELD(18), GPR_FIELD(19));
+	pr_cont("t8 %0*lx u0 %0*lx s9 %0*lx s0 %0*lx\n",
+		GPR_FIELD(20), GPR_FIELD(21), GPR_FIELD(22), GPR_FIELD(23));
+	pr_cont("s1 %0*lx s2 %0*lx s3 %0*lx s4 %0*lx\n",
+		GPR_FIELD(24), GPR_FIELD(25), GPR_FIELD(26), GPR_FIELD(27));
+	pr_cont("s5 %0*lx s6 %0*lx s7 %0*lx s8 %0*lx\n",
+		GPR_FIELD(28), GPR_FIELD(29), GPR_FIELD(30), GPR_FIELD(31));
+
+	/* The slot for $zero is reused as the syscall restart flag */
+	if (regs->regs[0])
+		pr_cont("syscall restart flag: %0*lx\n", GPR_FIELD(0));
+#undef GPR_FIELD
 
 	/*
 	 * Saved csr registers
-- 
2.40.0

