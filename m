Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E3D110E
	for <loongarch@lists.linux.dev>; Tue, 25 Apr 2023 08:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682410238; bh=MH0FijNPRY3ecOzlloz4DVZfgeGglolnRuy0Mm62xSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cjKbgBGc4J3T1gT3My0FjiGeQTlHasydqIqxlnEnM8OBZ6GRHjeRJmYys3bmNgke/
	 s/gt9BNR8nRtfHXnt9zb+J7tnP9rKKbopsTJE+ylKAxXw+TWzAY00i3YcGu523/IlL
	 CyI2vpnZ/iosGxTPYMFkC2ZtB+uAZA4iSjYEkOE4=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id ABDDB60B20;
	Tue, 25 Apr 2023 16:10:38 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v7 07/12] LoongArch: Humanize the PRMD line when showing registers
Date: Tue, 25 Apr 2023 16:10:18 +0800
Message-Id: <20230425081023.3809434-8-kernel@xen0n.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425081023.3809434-1-kernel@xen0n.name>
References: <20230425081023.3809434-1-kernel@xen0n.name>
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
index b93d3b44a5f9..ff8c72565c3c 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -197,6 +197,15 @@ static void print_crmd(unsigned long x)
 	pr_cont(")\n");
 }
 
+static void print_prmd(unsigned long x)
+{
+	pr_cont(" PRMD: %08lx (", x);
+	print_plv_fragment("PPLV", (int) FIELD_GET(CSR_PRMD_PPLV, x));
+	print_bool_fragment("PIE", FIELD_GET(CSR_PRMD_PIE, x), false);
+	print_bool_fragment("PWE", FIELD_GET(CSR_PRMD_PWE, x), false);
+	pr_cont(")\n");
+}
+
 static void __show_regs(const struct pt_regs *regs)
 {
 	const int field = 2 * sizeof(unsigned long);
@@ -239,7 +248,7 @@ static void __show_regs(const struct pt_regs *regs)
 
 	/* Print important CSRs */
 	print_crmd(regs->csr_crmd);
-	pr_cont(" PRMD: %08lx\n", regs->csr_prmd);
+	print_prmd(regs->csr_prmd);
 	pr_cont(" EUEN: %08lx\n", regs->csr_euen);
 	pr_cont(" ECFG: %08lx\n", regs->csr_ecfg);
 	pr_cont("ESTAT: %08lx\n", regs->csr_estat);
-- 
2.40.0

