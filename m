Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5939136F
	for <loongarch@lists.linux.dev>; Thu, 29 Dec 2022 05:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1672292022; bh=Lk/3W8YURwqcMuK67GCQRuT8UXzGzGKjFc+Bs0Au71k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sw6Zgj6BkzzcpnHrF2DfuwYjZ+Poa0QfDxu/Xox1asXD+ttrie8Ajx7KjP+Ai7Tja
	 taAsXMstKFO+pem9gxOxij8EtMbg5xocUnRwaAcewJRM59xfIx1W1ynObaduiOTxWR
	 XQZhhkaqkPjvvodOdW/D2GfC2UDaCbC9Ph2ANvz8=
Received: from ld50.lan (unknown [101.88.134.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 2CE7A6014E;
	Thu, 29 Dec 2022 13:33:42 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v2 10/11] LoongArch: Humanize the ESTAT line when showing registers
Date: Thu, 29 Dec 2022 13:33:05 +0800
Message-Id: <20221229053306.3285457-11-kernel@xen0n.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229053306.3285457-1-kernel@xen0n.name>
References: <20221229053306.3285457-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Example output looks like:

[   xx.xxxxxx] estat: 00001000 [INT] (EsubCode=0 ECode=0 IS=12)

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 86 ++++++++++++++++++++++++++++++++---
 1 file changed, 79 insertions(+), 7 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 2b26e610cc8f..7dcb64ab5de8 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -232,11 +232,87 @@ static void print_ecfg(unsigned long x)
 	pr_cont(")\n");
 }
 
+static const char *humanize_exc_name(unsigned int ecode, unsigned int esubcode)
+{
+	/*
+	 * Right now the kernel source refers to the exceptions using mostly
+	 * MIPS-esque names, but LoongArch users and developers are probably
+	 * more familiar with those in the ISA manual, so we are going to
+	 * print out the latter. Expect much friction between the two sides
+	 * below...
+	 */
+	switch (ecode) {
+	case EXCCODE_RSV: return "INT";
+	case EXCCODE_TLBL: return "PIL";
+	case EXCCODE_TLBS: return "PIS";
+	case EXCCODE_TLBI: return "PIF";
+	case EXCCODE_TLBM: return "PME";
+	case EXCCODE_TLBNR: return "PNR";
+	case EXCCODE_TLBNX: return "PNX";
+	case EXCCODE_TLBPE: return "PPI";
+	case EXCCODE_ADE:
+		switch (esubcode) {
+		case EXSUBCODE_ADEF: return "ADEF";
+		case EXSUBCODE_ADEM: return "ADEM";
+		}
+		break;
+	case EXCCODE_ALE: return "ALE";
+	case EXCCODE_OOB: return "BCE";
+	case EXCCODE_SYS: return "SYS";
+	case EXCCODE_BP: return "BRK";
+	case EXCCODE_INE: return "INE";
+	case EXCCODE_IPE: return "IPE";
+	case EXCCODE_FPDIS: return "FPD";
+	case EXCCODE_LSXDIS: return "SXD";
+	case EXCCODE_LASXDIS: return "ASXD";
+	case EXCCODE_FPE:
+		switch (esubcode) {
+		case EXCSUBCODE_FPE: return "FPE";
+		case EXCSUBCODE_VFPE: return "VFPE";
+		}
+		break;
+	case EXCCODE_WATCH:
+		switch (esubcode) {
+		case EXCSUBCODE_WPEF: return "WPEF";
+		case EXCSUBCODE_WPEM: return "WPEM";
+		}
+		break;
+	case EXCCODE_BTDIS: return "BTD";
+	case EXCCODE_BTE: return "BTE";
+	case EXCCODE_PSI: return "GSPR";
+	case EXCCODE_HYP: return "HVC";
+	case EXCCODE_GCM:
+		switch (esubcode) {
+		case EXCSUBCODE_GCSC: return "GCSC";
+		case EXCSUBCODE_GCHC: return "GCHC";
+		}
+		break;
+	/*
+	 * The manual did not mention the EXCCODE_SE case, but print out it
+	 * nevertheless.
+	 */
+	case EXCCODE_SE: return "SE";
+	}
+
+	return "???";
+}
+
+static void print_estat(unsigned long x)
+{
+	unsigned int ecode = FIELD_GET(CSR_ESTAT_EXC, x);
+	unsigned int esubcode = FIELD_GET(CSR_ESTAT_ESUBCODE, x);
+
+	pr_cont("estat: %08lx [%s] (EsubCode=%d ECode=%d", x,
+		humanize_exc_name(ecode, esubcode), (int) esubcode,
+		(int) ecode);
+	print_intr_fragment("IS", FIELD_GET(CSR_ESTAT_IS, x));
+	pr_cont(")\n");
+}
+
 static void __show_regs(const struct pt_regs *regs)
 {
 	const int field = 2 * sizeof(unsigned long);
-	unsigned int excsubcode;
-	unsigned int exccode;
+	unsigned int exccode = FIELD_GET(CSR_ESTAT_EXC, regs->csr_estat);
 
 	show_regs_print_info(KERN_DEFAULT);
 
@@ -274,11 +350,7 @@ static void __show_regs(const struct pt_regs *regs)
 	print_prmd(regs->csr_prmd);
 	print_euen(regs->csr_euen);
 	print_ecfg(regs->csr_ecfg);
-	pr_cont("estat: %08lx\n", regs->csr_estat);
-
-	exccode = ((regs->csr_estat) & CSR_ESTAT_EXC) >> CSR_ESTAT_EXC_SHIFT;
-	excsubcode = ((regs->csr_estat) & CSR_ESTAT_ESUBCODE) >> CSR_ESTAT_ESUBCODE_SHIFT;
-	printk("ExcCode : %x (SubCode %x)\n", exccode, excsubcode);
+	print_estat(regs->csr_estat);
 
 	if (exccode >= EXCCODE_TLBL && exccode <= EXCCODE_ALE)
 		printk("BadVA : %0*lx\n", field, regs->csr_badvaddr);
-- 
2.38.1

