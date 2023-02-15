Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20347323B
	for <loongarch@lists.linux.dev>; Wed, 15 Feb 2023 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1676450066; bh=MpFBJG62JtBaee3FB/IOo0DWm8pnUwVpsXWrvfHkW50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=di26YJeZXAV1KBrhr14p2/Xl6DBdSxazSHeiCEMW40cC4a6uABtoMJgnqQZIDN/F6
	 LX33ll1Xba7OshEbdMmv2up1pTPv42vn0JJf5wzY2cEK3JA1lqa7GHCjLq36EYEbiN
	 okkk8ax6y0z0YxuOR1Yltw2P/tbCQ14zqa1BdHNc=
Received: from ld50.lan (unknown [114.93.192.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B21B060111;
	Wed, 15 Feb 2023 16:34:26 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v3 08/11] LoongArch: Humanize the EUEN line when showing registers
Date: Wed, 15 Feb 2023 16:34:09 +0800
Message-Id: <20230215083412.3795357-9-kernel@xen0n.name>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215083412.3795357-1-kernel@xen0n.name>
References: <20230215083412.3795357-1-kernel@xen0n.name>
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
index 5ac64463aaa4..ee806fa55885 100644
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
2.39.1

