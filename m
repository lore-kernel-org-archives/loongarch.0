Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4A92590
	for <loongarch@lists.linux.dev>; Mon, 24 Oct 2022 12:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1666613592; bh=V7cm+HXDL7r61+Msc9zaVm9xgr55bW1kO5w1e6VaPIU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cl8dvM+P4ZusYqtz6FFoEbLd91Zs3OYfaiG1LAt33qtwGWtGyz7cIK5NJZbWrkrv+
	 T9bYMs5h9SACfmVkMR8HGDrVijNofLWLR2eOBXHLseFAlgMUEohZXLkOg8xeF3BLI2
	 w3jR0vrbdX8We1cjFX3+RiFzZpQnJgWmDaxItlE0=
Received: from ld50.lan (unknown [101.88.135.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 47A0B601A5;
	Mon, 24 Oct 2022 20:13:12 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH 11/13] LoongArch: Humanize the ECFG line when showing registers
Date: Mon, 24 Oct 2022 20:13:03 +0800
Message-Id: <20221024121305.381776-12-kernel@xen0n.name>
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

Example output looks like:

[   xx.xxxxxx]  ecfg: 00071c1c (VS=7 LIE=2-4,10-12)

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index b95e473eee58..1d3879d4aeeb 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -187,6 +187,12 @@ static void print_memory_type_fragment(const char *key, unsigned long val)
 	}
 }
 
+static void print_intr_fragment(const char *key, unsigned long val)
+{
+	/* e.g. "LIE=0-1,3,5-7" */
+	pr_cont(" %s=%*pbl", key, INT_NUM, &val);
+}
+
 static void print_crmd(unsigned long x)
 {
 	pr_cont(" crmd: %08lx (", x);
@@ -219,6 +225,13 @@ static void print_euen(unsigned long x)
 	pr_cont(")\n");
 }
 
+static void print_ecfg(unsigned long x)
+{
+	pr_cont(" ecfg: %08lx (VS=%d", x, (int) FIELD_GET(CSR_ECFG_VS, x));
+	print_intr_fragment("LIE", FIELD_GET(CSR_ECFG_LIE, x));
+	pr_cont(")\n");
+}
+
 static void __show_regs(const struct pt_regs *regs)
 {
 	const int field = 2 * sizeof(unsigned long);
@@ -260,7 +273,7 @@ static void __show_regs(const struct pt_regs *regs)
 	print_crmd(regs->csr_crmd);
 	print_prmd(regs->csr_prmd);
 	print_euen(regs->csr_euen);
-	pr_cont(" ecfg: %08lx\n", regs->csr_ecfg);
+	print_ecfg(regs->csr_ecfg);
 	pr_cont("estat: %08lx\n", regs->csr_estat);
 
 	exccode = ((regs->csr_estat) & CSR_ESTAT_ECODE) >> CSR_ESTAT_ECODE_SHIFT;
-- 
2.38.0

