Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A90111F
	for <loongarch@lists.linux.dev>; Thu, 29 Dec 2022 05:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1672292015; bh=cScTUtAgQvPD/LHvfnyIYGXw9Mu4WuGSA0lZpOh43OE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Un4qiUCbadB+hGDjZ0AwLfsAsM4g5qjIUsKubnN/HxiOzhcYDcYxtwkLwRa7v+Prl
	 sA8lg7kfdxJiJPOu6sD4jp5rfuctHYRGOOqrgdzVKokj5OFzGB7wU0F6oebqf9omyJ
	 P3l1LMJlwSwTUHMckDdZBrUb3m+iLMD/8s3V0CVw=
Received: from ld50.lan (unknown [101.88.134.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 1BA666019D;
	Thu, 29 Dec 2022 13:33:35 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v2 06/11] LoongArch: Humanize the CRMD line when showing registers
Date: Thu, 29 Dec 2022 13:33:01 +0800
Message-Id: <20221229053306.3285457-7-kernel@xen0n.name>
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

[   xx.xxxxxx]  crmd: 000000b0 (-WE DACM=CC DACF=CC +PG -DA -IE PLV0)

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 46 ++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 68524dea5c8c..c56d5c12c901 100644
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
@@ -156,6 +157,49 @@ static void show_code(unsigned int *pc, bool user)
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
@@ -194,7 +238,7 @@ static void __show_regs(const struct pt_regs *regs)
 	}
 
 	/* Print important CSRs */
-	pr_cont(" crmd: %08lx\n", regs->csr_crmd);
+	print_crmd(regs->csr_crmd);
 	pr_cont(" prmd: %08lx\n", regs->csr_prmd);
 	pr_cont(" euen: %08lx\n", regs->csr_euen);
 	pr_cont(" ecfg: %08lx\n", regs->csr_ecfg);
-- 
2.38.1

