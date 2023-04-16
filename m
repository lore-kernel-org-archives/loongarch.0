Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E4E7B
	for <loongarch@lists.linux.dev>; Sun, 16 Apr 2023 06:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1681625067; bh=6GDNc+4WSbIzzicjowrqHd/go+TtQUIqkKxVG3Ixcbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u2iGQTgeGGXPjV9ySnMpsuVkw9qwvAl+dnX+NQ/SJNgyk8lvdCZG1kqC5zJ0gHFcN
	 HtFgsUIPkkkltz4AEMTKbrVFqz/8JcnvBB6f7go73gMsuNNSBymEXt3ttPA+fT5Cvc
	 QIg+yUVgduX5i0rE1iRUnbaFFdGhknVBF236DvZs=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 65FC160157;
	Sun, 16 Apr 2023 14:04:27 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v4 08/12] LoongArch: Humanize the EUEN line when showing registers
Date: Sun, 16 Apr 2023 14:03:52 +0800
Message-Id: <20230416060356.3711529-9-kernel@xen0n.name>
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

[   xx.xxxxxx]  euen: 00000000 (-BTE -ASXE -SXE -FPE)

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index d1b7f0f7ef5f..6068d598c768 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -206,6 +206,16 @@ static void print_prmd(unsigned long x)
 	pr_cont(")\n");
 }
 
+static void print_euen(unsigned long x)
+{
+	pr_cont(" euen: %08lx (", x);
+	print_bool_fragment("BTE", FIELD_GET(CSR_EUEN_LBTEN, x), true);
+	print_bool_fragment("ASXE", FIELD_GET(CSR_EUEN_LASXEN, x), false);
+	print_bool_fragment("SXE", FIELD_GET(CSR_EUEN_LSXEN, x), false);
+	print_bool_fragment("FPE", FIELD_GET(CSR_EUEN_FPEN, x), false);
+	pr_cont(")\n");
+}
+
 static void __show_regs(const struct pt_regs *regs)
 {
 	const int field = 2 * sizeof(unsigned long);
@@ -251,7 +261,7 @@ static void __show_regs(const struct pt_regs *regs)
 	/* Print important CSRs */
 	print_crmd(regs->csr_crmd);
 	print_prmd(regs->csr_prmd);
-	pr_cont(" euen: %08lx\n", regs->csr_euen);
+	print_euen(regs->csr_euen);
 	pr_cont(" ecfg: %08lx\n", regs->csr_ecfg);
 	pr_cont("estat: %08lx\n", regs->csr_estat);
 
-- 
2.40.0

