Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1C81C05
	for <loongarch@lists.linux.dev>; Wed, 26 Apr 2023 07:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682495145; bh=L/AR4EX39PV+IunPdKoCcouGQqva3rRnO+FIcB/le74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YnVsUY9EIyXTh9DPgtBqJHTdyxx3yJDwG3+GWXlNF3mGslvkxKiVmCStgHSvgMSzS
	 KF80K5GS4eLWQ8lXlz+NLWuyKJvfcVbA8vVtTF8nE8s3qFKcggNgGLRMo81LG4kxN8
	 pUBiemOqLlSaX6SRrYwWjcow9wzP+jWxAxpwwm3M=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 577D1600CE;
	Wed, 26 Apr 2023 15:45:45 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v8 08/12] LoongArch: Humanize the EUEN line when showing registers
Date: Wed, 26 Apr 2023 15:45:21 +0800
Message-Id: <20230426074525.3906327-9-kernel@xen0n.name>
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

[   xx.xxxxxx]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 9f092e1cc782..bd6be798f81d 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -211,6 +211,16 @@ static void print_prmd(unsigned long x)
 	pr_cont(")\n");
 }
 
+static void print_euen(unsigned long x)
+{
+	printk(" EUEN: %08lx (", x);
+	print_bool_fragment("FPE", FIELD_GET(CSR_EUEN_FPEN, x), true);
+	print_bool_fragment("SXE", FIELD_GET(CSR_EUEN_LSXEN, x), false);
+	print_bool_fragment("ASXE", FIELD_GET(CSR_EUEN_LASXEN, x), false);
+	print_bool_fragment("BTE", FIELD_GET(CSR_EUEN_LBTEN, x), false);
+	pr_cont(")\n");
+}
+
 static void __show_regs(const struct pt_regs *regs)
 {
 	const int field = 2 * sizeof(unsigned long);
@@ -254,7 +264,7 @@ static void __show_regs(const struct pt_regs *regs)
 	/* Print saved important CSRs */
 	print_crmd(regs->csr_crmd);
 	print_prmd(regs->csr_prmd);
-	printk(" EUEN: %08lx\n", regs->csr_euen);
+	print_euen(regs->csr_euen);
 	printk(" ECFG: %08lx\n", regs->csr_ecfg);
 	printk("ESTAT: %08lx\n", regs->csr_estat);
 
-- 
2.40.0

