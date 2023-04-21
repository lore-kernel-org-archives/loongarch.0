Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379782F2C
	for <loongarch@lists.linux.dev>; Fri, 21 Apr 2023 11:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682077779; bh=B6z9AOz3JZNICC+a8AwHhs37r5dknMbF7C+hNDh8cdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jPT8+NfWfd5to0wC0HosxZxy7fsU/KnSzYC0XX/x6b3mqcvnmGZUHVksjqUXXnDQh
	 uNdOqwhKRtfnQfEcFn3v/tjWIdfY4IV0NOo+bkwS8U4kfaPn2n4dzcysZpvDQlX2xw
	 dWXA6TvrU2B3xKao12R37tvnJCnHh8SKl09lpsJA=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 2D61960B16;
	Fri, 21 Apr 2023 19:49:39 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v5 05/12] LoongArch: Fix format of CSR lines during show_regs
Date: Fri, 21 Apr 2023 19:49:01 +0800
Message-Id: <20230421114908.2970567-6-kernel@xen0n.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421114908.2970567-1-kernel@xen0n.name>
References: <20230421114908.2970567-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Use uppercase CSR names throughout for consistency with the manual
wording, and right-align the keys. The "CSR" part is inferrable from
context, hence dropped for more horizontal space.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index abb638889914..c6110c23738d 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -193,13 +193,12 @@ static void __show_regs(const struct pt_regs *regs)
 	}
 #undef GPR_FIELD
 
-	printk("CSR crmd: %08lx	", regs->csr_crmd);
-	printk("CSR prmd: %08lx	", regs->csr_prmd);
-	printk("CSR euen: %08lx	", regs->csr_euen);
-	printk("CSR ecfg: %08lx	", regs->csr_ecfg);
-	printk("CSR estat: %08lx	", regs->csr_estat);
-
-	pr_cont("\n");
+	/* Print important CSRs */
+	pr_cont(" CRMD: %08lx\n", regs->csr_crmd);
+	pr_cont(" PRMD: %08lx\n", regs->csr_prmd);
+	pr_cont(" EUEN: %08lx\n", regs->csr_euen);
+	pr_cont(" ECFG: %08lx\n", regs->csr_ecfg);
+	pr_cont("ESTAT: %08lx\n", regs->csr_estat);
 
 	exccode = ((regs->csr_estat) & CSR_ESTAT_EXC) >> CSR_ESTAT_EXC_SHIFT;
 	excsubcode = ((regs->csr_estat) & CSR_ESTAT_ESUBCODE) >> CSR_ESTAT_ESUBCODE_SHIFT;
-- 
2.40.0

