Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C2B185D
	for <loongarch@lists.linux.dev>; Wed, 26 Apr 2023 07:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682495142; bh=AIWk/ZljdXOGn8AaOVUIKu6ft1S3e7OJ+UXtIDaqGCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FidJpybqkA7L+CtHiLNCxN8L4HxwAfbnFOtOtm0LmBio/IcqbUmSxw5Yv7D9Lkkf3
	 ld3lUeP53/mQYu1YoAok3BlFAelagWWHE2qNGM8qGdDLXa8sXj448y5zHvw7y7KAyt
	 AJ+DPMzGUQUmzXObeJzApJ8fDXUF8JrY7S1uviEI=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8EFCB60B16;
	Wed, 26 Apr 2023 15:45:42 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v8 06/12] LoongArch: Humanize the CRMD line when showing registers
Date: Wed, 26 Apr 2023 15:45:19 +0800
Message-Id: <20230426074525.3906327-7-kernel@xen0n.name>
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

[   xx.xxxxxx]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)

Some initial machinery for this pretty-printing format has been included
in this patch as well.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 51 ++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 434a7717face..97af82547725 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -3,6 +3,7 @@
  * Author: Huacai Chen <chenhuacai@loongson.cn>
  * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
  */
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/bug.h>
 #include <linux/compiler.h>
@@ -153,6 +154,54 @@ static void show_code(unsigned int *pc, bool user)
 	pr_cont("\n");
 }
 
+static void print_bool_fragment(const char *key, unsigned long val, bool first)
+{
+	/* e.g. "+PG", "-DA" */
+	pr_cont("%s%c%s", first ? "" : " ", val ? '+' : '-', key);
+}
+
+static void print_plv_fragment(const char *key, int val)
+{
+	/* e.g. "PLV0", "PPLV3" */
+	pr_cont("%s%d", key, val);
+}
+
+static void print_memory_type_fragment(const char *key, unsigned long val)
+{
+	const char *humanized_type;
+
+	switch (val) {
+	case 0:
+		humanized_type = "SUC";
+		break;
+	case 1:
+		humanized_type = "CC";
+		break;
+	case 2:
+		humanized_type = "WUC";
+		break;
+	default:
+		pr_cont(" %s=Reserved(%lu)", key, val);
+		return;
+	}
+
+	/* e.g. " DATM=WUC" */
+	pr_cont(" %s=%s", key, humanized_type);
+}
+
+static void print_crmd(unsigned long x)
+{
+	printk(" CRMD: %08lx (", x);
+	print_plv_fragment("PLV", (int) FIELD_GET(CSR_CRMD_PLV, x));
+	print_bool_fragment("IE", FIELD_GET(CSR_CRMD_IE, x), false);
+	print_bool_fragment("DA", FIELD_GET(CSR_CRMD_DA, x), false);
+	print_bool_fragment("PG", FIELD_GET(CSR_CRMD_PG, x), false);
+	print_memory_type_fragment("DACF", FIELD_GET(CSR_CRMD_DACF, x));
+	print_memory_type_fragment("DACM", FIELD_GET(CSR_CRMD_DACM, x));
+	print_bool_fragment("WE", FIELD_GET(CSR_CRMD_WE, x), false);
+	pr_cont(")\n");
+}
+
 static void __show_regs(const struct pt_regs *regs)
 {
 	const int field = 2 * sizeof(unsigned long);
@@ -194,7 +243,7 @@ static void __show_regs(const struct pt_regs *regs)
 #undef GPR_FIELD
 
 	/* Print saved important CSRs */
-	printk(" CRMD: %08lx\n", regs->csr_crmd);
+	print_crmd(regs->csr_crmd);
 	printk(" PRMD: %08lx\n", regs->csr_prmd);
 	printk(" EUEN: %08lx\n", regs->csr_euen);
 	printk(" ECFG: %08lx\n", regs->csr_ecfg);
-- 
2.40.0

