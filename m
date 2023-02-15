Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1A72909
	for <loongarch@lists.linux.dev>; Wed, 15 Feb 2023 08:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1676450062; bh=8821jPz4qe2E9MUlgUUiO6fGvpWGPo6IGWmnw+5IMGw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tDO3VmHjve8G2K0fXa/s/ujrbM/lVnqt+KoukkAgTCcdG8+AlapgePCJWy7y2HJA7
	 /p3ChKbA/Vy//dmonXKMuLEs3m4dSJiyZduluUWPWy7mU8n8WVn7NSThXN1m3UYvwV
	 53Js0tQuHnjosAJzZag6N1S8s1gTPg9o4iINv1xg=
Received: from ld50.lan (unknown [114.93.192.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 299FB606AF;
	Wed, 15 Feb 2023 16:34:22 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v3 03/11] LoongArch: Print GPRs with ABI names when showing registers
Date: Wed, 15 Feb 2023 16:34:04 +0800
Message-Id: <20230215083412.3795357-4-kernel@xen0n.name>
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

Print 3 registers per line to fit the entire line within 75 columns even
with timestamp prefixed to each line, to ease future copy-pastes for all.

And show the syscall restart flag (in place of the saved "$zero") if
non-zero.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 38 +++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index b1387b893feb..27dbd6d30be7 100644
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
2.39.1

