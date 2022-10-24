Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DE8A53
	for <loongarch@lists.linux.dev>; Mon, 24 Oct 2022 12:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1666613591; bh=NzqhvyTX94qZJ5V8qDx7sSPfEnu2i2gu6WC7xrOBTMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EOccIvJc0xK2XRuIqbZd/yUJvzCf2Bofllzt358bTw1QVnBT/Vyti0/F3Qmf/XEjE
	 y8NKs0eEp62qjSaXf+iBJxfoB1OSW0kXrqW68iU4FfaOU+YV8gx5Z+s8kwTqs+5s/1
	 anRg3PYhSYOhroVD5Offv3P9XbIEnWVnjcPG00qA=
Received: from ld50.lan (unknown [101.88.135.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 2A56B6019D;
	Mon, 24 Oct 2022 20:13:11 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH 05/13] LoongArch: Print GPRs with ABI names when showing registers
Date: Mon, 24 Oct 2022 20:12:57 +0800
Message-Id: <20221024121305.381776-6-kernel@xen0n.name>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221024121305.381776-1-kernel@xen0n.name>
References: <20221024121305.381776-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Print 3 registers per line to fit the entire line within 75 columns even
with timestamp prefixed to each line, to ease future copy-pastes for all.

And show PC (CSR.ERA) in place of $zero, like what arch/riscv does.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 36 ++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index d4dc35c39296..c6fe09bc5ccc 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -161,22 +161,32 @@ static void __show_regs(const struct pt_regs *regs)
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
+	/* Print PC and GPRs, 3 per row to fit output in 75 columns */
+	pr_cont(" pc %0*lx ra %0*lx tp %0*lx\n",
+		field, regs->csr_era, field, regs->regs[1], field, regs->regs[2]);
+	pr_cont(" sp %0*lx a0 %0*lx a1 %0*lx\n",
+		field, regs->regs[3], field, regs->regs[4], field, regs->regs[5]);
+	pr_cont(" a2 %0*lx a3 %0*lx a4 %0*lx\n",
+		field, regs->regs[6], field, regs->regs[7], field, regs->regs[8]);
+	pr_cont(" a5 %0*lx a6 %0*lx a7 %0*lx\n",
+		field, regs->regs[9], field, regs->regs[10], field, regs->regs[11]);
+	pr_cont(" t0 %0*lx t1 %0*lx t2 %0*lx\n",
+		field, regs->regs[12], field, regs->regs[13], field, regs->regs[14]);
+	pr_cont(" t3 %0*lx t4 %0*lx t5 %0*lx\n",
+		field, regs->regs[15], field, regs->regs[16], field, regs->regs[17]);
+	pr_cont(" t6 %0*lx t7 %0*lx t8 %0*lx\n",
+		field, regs->regs[18], field, regs->regs[19], field, regs->regs[20]);
+	pr_cont("r21 %0*lx s9 %0*lx s0 %0*lx\n",
+		field, regs->regs[21], field, regs->regs[22], field, regs->regs[23]);
+	pr_cont(" s1 %0*lx s2 %0*lx s3 %0*lx\n",
+		field, regs->regs[24], field, regs->regs[25], field, regs->regs[26]);
+	pr_cont(" s4 %0*lx s5 %0*lx s6 %0*lx\n",
+		field, regs->regs[27], field, regs->regs[28], field, regs->regs[29]);
+	pr_cont(" s7 %0*lx s8 %0*lx\n",
+		field, regs->regs[30], field, regs->regs[31]);
 
 	/*
 	 * Saved csr registers
-- 
2.38.0

