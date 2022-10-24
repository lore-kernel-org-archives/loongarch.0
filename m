Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667E2259A
	for <loongarch@lists.linux.dev>; Mon, 24 Oct 2022 12:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1666613592; bh=rjD9bDw23Kwd0pvi9ry+fp4Upv4idyJYOnsqjQnlvmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ilj2dtzsObed1FXSFwPoAJh9xI5B1nwVMciQdjQYFXiTKorDj9xTdS1FhhlxfpsOj
	 P9FUD6Z5d1V85O5tt5TZ94v26WH143JKGBWHSiWCPYAn6XX1bCqFdcZC2IzpmMPoUI
	 Ih/QqB2KUpsUe0N3/+IhPOeyaDo+HQL55/SiM0xU=
Received: from ld50.lan (unknown [101.88.135.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C7989601A6;
	Mon, 24 Oct 2022 20:13:12 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH 12/13] LoongArch: Humanize the ESTAT line when showing registers
Date: Mon, 24 Oct 2022 20:13:04 +0800
Message-Id: <20221024121305.381776-13-kernel@xen0n.name>
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

[   xx.xxxxxx] estat: 00001000 [INT] (EsubCode=0 ECode=0 IS=12)

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 77 +++++++++++++++++++++++++++++++----
 1 file changed, 69 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 1d3879d4aeeb..27a4ac049d64 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -232,11 +232,76 @@ static void print_ecfg(unsigned long x)
 	pr_cont(")\n");
 }
 
+static const char *humanize_exc_name(unsigned int ecode, unsigned int esubcode)
+{
+	switch (ecode) {
+	case ECODE_INT: return "INT";
+	case ECODE_PIL: return "PIL";
+	case ECODE_PIS: return "PIS";
+	case ECODE_PIF: return "PIF";
+	case ECODE_PME: return "PME";
+	case ECODE_PNR: return "PNR";
+	case ECODE_PNX: return "PNX";
+	case ECODE_PPI: return "PPI";
+	case ECODE_ADE:
+		switch (esubcode) {
+		case ESUBCODE_ADEF: return "ADEF";
+		case ESUBCODE_ADEM: return "ADEM";
+		}
+		break;
+	case ECODE_ALE: return "ALE";
+	case ECODE_BCE: return "BCE";
+	case ECODE_SYS: return "SYS";
+	case ECODE_BRK: return "BRK";
+	case ECODE_INE: return "INE";
+	case ECODE_IPE: return "IPE";
+	case ECODE_FPD: return "FPD";
+	case ECODE_SXD: return "SXD";
+	case ECODE_ASXD: return "ASXD";
+	case ECODE_FPE:
+		switch (esubcode) {
+		case ESUBCODE_FPE: return "FPE";
+		case ESUBCODE_VFPE: return "VFPE";
+		}
+		break;
+	case ECODE_WPE:
+		switch (esubcode) {
+		case ESUBCODE_WPEF: return "WPEF";
+		case ESUBCODE_WPEM: return "WPEM";
+		}
+		break;
+	case ECODE_BTD: return "BTD";
+	case ECODE_BTE: return "BTE";
+	case ECODE_GSPR: return "GSPR";
+	case ECODE_HVC: return "HVC";
+	case ECODE_GCM:
+		switch (esubcode) {
+		case ESUBCODE_GCSC: return "GCSC";
+		case ESUBCODE_GCHC: return "GCHC";
+		}
+		break;
+	}
+
+	return "???";
+}
+
+static void print_estat(unsigned long x)
+{
+	unsigned int ecode = FIELD_GET(CSR_ESTAT_ECODE, x);
+	unsigned int esubcode = FIELD_GET(CSR_ESTAT_ESUBCODE, x);
+
+	pr_cont("estat: %08lx [%s] (EsubCode=%d ECode=%d", x,
+		humanize_exc_name(ecode, esubcode),
+		(int) FIELD_GET(CSR_ESTAT_ESUBCODE, x),
+		(int) FIELD_GET(CSR_ESTAT_ECODE, x));
+	print_intr_fragment("IS", FIELD_GET(CSR_ESTAT_IS, x));
+	pr_cont(")\n");
+}
+
 static void __show_regs(const struct pt_regs *regs)
 {
 	const int field = 2 * sizeof(unsigned long);
-	unsigned int excsubcode;
-	unsigned int exccode;
+	unsigned int ecode = FIELD_GET(CSR_ESTAT_ECODE, regs->csr_estat);
 
 	show_regs_print_info(KERN_DEFAULT);
 
@@ -274,13 +339,9 @@ static void __show_regs(const struct pt_regs *regs)
 	print_prmd(regs->csr_prmd);
 	print_euen(regs->csr_euen);
 	print_ecfg(regs->csr_ecfg);
-	pr_cont("estat: %08lx\n", regs->csr_estat);
-
-	exccode = ((regs->csr_estat) & CSR_ESTAT_ECODE) >> CSR_ESTAT_ECODE_SHIFT;
-	excsubcode = ((regs->csr_estat) & CSR_ESTAT_ESUBCODE) >> CSR_ESTAT_ESUBCODE_SHIFT;
-	printk("ExcCode : %x (SubCode %x)\n", exccode, excsubcode);
+	print_estat(regs->csr_estat);
 
-	if (exccode >= ECODE_PIL && exccode <= ECODE_ALE)
+	if (ecode >= ECODE_PIL && ecode <= ECODE_ALE)
 		printk("BadVA : %0*lx\n", field, regs->csr_badvaddr);
 
 	printk("PrId  : %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
-- 
2.38.0

