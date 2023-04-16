Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081C310F5
	for <loongarch@lists.linux.dev>; Sun, 16 Apr 2023 06:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1681625049; bh=4xvr4rnMnOUPULji9NeKGy18qcqyBSpBn2/u4SQ4zt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S8Uvdh6MX/Mi23JVx9glnTcQElOxIktOXPBNS9cZU46TLQ/epUcy/KaPDEd65HAo7
	 63Lw6ZBYTdt+KzZEEI4wAEpp+y7OxVFkQ7CUYkunJ2RKFsrL70VqFgjAOou0SFAMNG
	 25ZWAGHwmPK2KTIR5Qsf2U85WjkizB6q4Cl8z934=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id A791360193;
	Sun, 16 Apr 2023 14:04:09 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v4 03/12] LoongArch: Print GPRs with ABI names when showing registers
Date: Sun, 16 Apr 2023 14:03:47 +0800
Message-Id: <20230416060356.3711529-4-kernel@xen0n.name>
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

Print 3 registers per line to fit the entire line within 75 columns even
with timestamp prefixed to each line, to ease future copy-pastes for all.

And show the syscall restart flag (in place of the saved "$zero") if
non-zero.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 38 +++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 2f4279f612e7..f61de72e0c3a 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -158,22 +158,34 @@ static void __show_regs(const struct pt_regs *regs)
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
+	/* Print most of the GPRs, 3 per row to fit output in 75 columns */
+	pr_cont("tp %0*lx sp %0*lx a0 %0*lx\n",
+		field, regs->regs[2], field, regs->regs[3], field, regs->regs[4]);
+	pr_cont("a1 %0*lx a2 %0*lx a3 %0*lx\n",
+		field, regs->regs[5], field, regs->regs[6], field, regs->regs[7]);
+	pr_cont("a4 %0*lx a5 %0*lx a6 %0*lx\n",
+		field, regs->regs[8], field, regs->regs[9], field, regs->regs[10]);
+	pr_cont("a7 %0*lx t0 %0*lx t1 %0*lx\n",
+		field, regs->regs[11], field, regs->regs[12], field, regs->regs[13]);
+	pr_cont("t2 %0*lx t3 %0*lx t4 %0*lx\n",
+		field, regs->regs[14], field, regs->regs[15], field, regs->regs[16]);
+	pr_cont("t5 %0*lx t6 %0*lx t7 %0*lx\n",
+		field, regs->regs[17], field, regs->regs[18], field, regs->regs[19]);
+	pr_cont("t8 %0*lx u0 %0*lx s9 %0*lx\n",
+		field, regs->regs[20], field, regs->regs[21], field, regs->regs[22]);
+	pr_cont("s0 %0*lx s1 %0*lx s2 %0*lx\n",
+		field, regs->regs[23], field, regs->regs[24], field, regs->regs[25]);
+	pr_cont("s3 %0*lx s4 %0*lx s5 %0*lx\n",
+		field, regs->regs[26], field, regs->regs[27], field, regs->regs[28]);
+	pr_cont("s6 %0*lx s7 %0*lx s8 %0*lx\n",
+		field, regs->regs[29], field, regs->regs[30], field, regs->regs[31]);
+
+	/* The slot for $zero is reused as the syscall restart flag */
+	if (regs->regs[0])
+		pr_cont("syscall restart flag: %0*lx\n", field, regs->regs[0]);
 
 	/*
 	 * Saved csr registers
-- 
2.40.0

