Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D50510F7
	for <loongarch@lists.linux.dev>; Sun, 16 Apr 2023 06:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1681625059; bh=1YpC7GuBmo4FtlUuq4uNo76Zu8mQPsVsRaateapTjxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u/5AsGu2jOpqNbwcui6VL5GnBSP3NBfbvNLmqHsSvzt2y8mKPv4h8SV4aajQN8/Mw
	 IKNl1z9ExbLvSTfSCOAP6r4PpGSuCARQruOTfSy7v1HsGZy1QUWZcY7IgPVDGcaNnU
	 mvcPwYfp8dYb8sBXACZBqNOY6W4HOFxP2GEhy24Y=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 62B7660193;
	Sun, 16 Apr 2023 14:04:19 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v4 06/12] LoongArch: Humanize the CRMD line when showing registers
Date: Sun, 16 Apr 2023 14:03:50 +0800
Message-Id: <20230416060356.3711529-7-kernel@xen0n.name>
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

[   xx.xxxxxx]  crmd: 000000b0 (-WE DACM=CC DACF=CC +PG -DA -IE PLV0)

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 46 ++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 0bd0d6e827f6..a6935c6bd045 100644
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
@@ -153,6 +154,49 @@ static void show_code(unsigned int *pc, bool user)
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
+	pr_cont(" %s%d", key, val);
+}
+
+static void print_memory_type_fragment(const char *key, unsigned long val)
+{
+	/* e.g. "DATM=WUC" */
+	const char *humanized_type = NULL;
+
+	switch (val) {
+	case 0: humanized_type = "SUC"; break;
+	case 1: humanized_type = "CC"; break;
+	case 2: humanized_type = "WUC"; break;
+	}
+
+	if (humanized_type) {
+		pr_cont(" %s=%s", key, humanized_type);
+	} else {
+		pr_cont(" %s=Reserved(%lu)", key, val);
+	}
+}
+
+static void print_crmd(unsigned long x)
+{
+	pr_cont(" crmd: %08lx (", x);
+	print_bool_fragment("WE", FIELD_GET(CSR_CRMD_WE, x), true);
+	print_memory_type_fragment("DACM", FIELD_GET(CSR_CRMD_DACM, x));
+	print_memory_type_fragment("DACF", FIELD_GET(CSR_CRMD_DACF, x));
+	print_bool_fragment("PG", FIELD_GET(CSR_CRMD_PG, x), false);
+	print_bool_fragment("DA", FIELD_GET(CSR_CRMD_DA, x), false);
+	print_bool_fragment("IE", FIELD_GET(CSR_CRMD_IE, x), false);
+	print_plv_fragment("PLV", (int) FIELD_GET(CSR_CRMD_PLV, x));
+	pr_cont(")\n");
+}
+
 static void __show_regs(const struct pt_regs *regs)
 {
 	const int field = 2 * sizeof(unsigned long);
@@ -196,7 +240,7 @@ static void __show_regs(const struct pt_regs *regs)
 	}
 
 	/* Print important CSRs */
-	pr_cont(" crmd: %08lx\n", regs->csr_crmd);
+	print_crmd(regs->csr_crmd);
 	pr_cont(" prmd: %08lx\n", regs->csr_prmd);
 	pr_cont(" euen: %08lx\n", regs->csr_euen);
 	pr_cont(" ecfg: %08lx\n", regs->csr_ecfg);
-- 
2.40.0

