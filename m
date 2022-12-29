Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5966E111F
	for <loongarch@lists.linux.dev>; Thu, 29 Dec 2022 05:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1672292012; bh=Ov9J8OW86p5Uy1SvYBC3u0hcsayzP+/N7jBtCKjzVrE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P00iBqlg71VIljv+BYfXTjkR/uFCOqwwyvpAXIhwH2lzTH61O5pIhDpaF8yj+uBNc
	 9MEaNslSObSWsAaNEtsni2/tkK24kAwop73Hpm6gnjGLztkphEO87JRtO0Oq+oYn8F
	 LmheZTqVNhOwiCHxRMM3WVZ7IFK4kEoVz0NzLObw=
Received: from ld50.lan (unknown [101.88.134.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id CEF64600DA;
	Thu, 29 Dec 2022 13:33:32 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v2 05/11] LoongArch: Fix format of CSR lines during show_regs
Date: Thu, 29 Dec 2022 13:33:00 +0800
Message-Id: <20221229053306.3285457-6-kernel@xen0n.name>
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

Use lowercase CSR names throughout, and right-align the keys. The "CSR"
part is inferrable from context, hence dropped for more horizontal
space.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index f0720b219006..68524dea5c8c 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -194,13 +194,11 @@ static void __show_regs(const struct pt_regs *regs)
 	}
 
 	/* Print important CSRs */
-	printk("CSR crmd: %08lx	", regs->csr_crmd);
-	printk("CSR prmd: %08lx	", regs->csr_prmd);
-	printk("CSR euen: %08lx	", regs->csr_euen);
-	printk("CSR ecfg: %08lx	", regs->csr_ecfg);
-	printk("CSR estat: %08lx	", regs->csr_estat);
-
-	pr_cont("\n");
+	pr_cont(" crmd: %08lx\n", regs->csr_crmd);
+	pr_cont(" prmd: %08lx\n", regs->csr_prmd);
+	pr_cont(" euen: %08lx\n", regs->csr_euen);
+	pr_cont(" ecfg: %08lx\n", regs->csr_ecfg);
+	pr_cont("estat: %08lx\n", regs->csr_estat);
 
 	exccode = ((regs->csr_estat) & CSR_ESTAT_EXC) >> CSR_ESTAT_EXC_SHIFT;
 	excsubcode = ((regs->csr_estat) & CSR_ESTAT_ESUBCODE) >> CSR_ESTAT_ESUBCODE_SHIFT;
-- 
2.38.1

