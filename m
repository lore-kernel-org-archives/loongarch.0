Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF299185D
	for <loongarch@lists.linux.dev>; Wed, 26 Apr 2023 07:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682495144; bh=X/AxOCrkDexV4uJZ/144Z8oiBQZJnFD3EvoICu1rcWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bwwdpPqTibEYLiWI8vy5nn+Mv7tkBJN0er8JyKlDRk7/eOpSPhU/wF9/FSLqxsREX
	 dk+UvZ3nxZ0r5APH/7QUqA+P5i0Blm6ii9QTyuG3NyfCYNcYO/l4ByUuu9c52SxyhF
	 egmeN38ATiSbqnTRE45qZq+WEOwF1MfrDfkYMPWQ=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 84D5D60B18;
	Wed, 26 Apr 2023 15:45:44 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v8 07/12] LoongArch: Humanize the PRMD line when showing registers
Date: Wed, 26 Apr 2023 15:45:20 +0800
Message-Id: <20230426074525.3906327-8-kernel@xen0n.name>
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

Example output looks like:

[   xx.xxxxxx]  PRMD: 00000004 (PPLV0 +PIE -PWE)

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 97af82547725..9f092e1cc782 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -202,6 +202,15 @@ static void print_crmd(unsigned long x)
 	pr_cont(")\n");
 }
 
+static void print_prmd(unsigned long x)
+{
+	printk(" PRMD: %08lx (", x);
+	print_plv_fragment("PPLV", (int) FIELD_GET(CSR_PRMD_PPLV, x));
+	print_bool_fragment("PIE", FIELD_GET(CSR_PRMD_PIE, x), false);
+	print_bool_fragment("PWE", FIELD_GET(CSR_PRMD_PWE, x), false);
+	pr_cont(")\n");
+}
+
 static void __show_regs(const struct pt_regs *regs)
 {
 	const int field = 2 * sizeof(unsigned long);
@@ -244,7 +253,7 @@ static void __show_regs(const struct pt_regs *regs)
 
 	/* Print saved important CSRs */
 	print_crmd(regs->csr_crmd);
-	printk(" PRMD: %08lx\n", regs->csr_prmd);
+	print_prmd(regs->csr_prmd);
 	printk(" EUEN: %08lx\n", regs->csr_euen);
 	printk(" ECFG: %08lx\n", regs->csr_ecfg);
 	printk("ESTAT: %08lx\n", regs->csr_estat);
-- 
2.40.0

