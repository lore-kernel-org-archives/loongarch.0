Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F84033FE
	for <loongarch@lists.linux.dev>; Wed, 15 Feb 2023 08:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1676450069; bh=faq41x47nboOGlayG8gYCNXppf4MMsfqlLiPc1nw8qY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R+85D2iWKmegY2LZGlR+73EQJpfVd9wxKHEP98q6AIlsvfx9xXecz57XJmSiSzGZZ
	 zNnXdRqx6M16BEQoPf9vEOtzPZM/Z9JH70+24fhlPvc+im5m97tCCB+kNNfGd4DWdp
	 lsjyZh5la7hXO6WSb3y1Yenvl2ve2I1CenJchU7g=
Received: from ld50.lan (unknown [114.93.192.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 9DD01607CD;
	Wed, 15 Feb 2023 16:34:29 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v3 11/11] LoongArch: Use lowercase ISA manual names for BADV and CPUCFG.PRID lines in show_regs
Date: Wed, 15 Feb 2023 16:34:12 +0800
Message-Id: <20230215083412.3795357-12-kernel@xen0n.name>
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

While at it, also change the printk to pr_cont.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 7b63d31bafed..517b0cbd0649 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -355,9 +355,9 @@ static void __show_regs(const struct pt_regs *regs)
 	print_estat(regs->csr_estat);
 
 	if (exccode >= EXCCODE_TLBL && exccode <= EXCCODE_ALE)
-		printk("BadVA : %0*lx\n", field, regs->csr_badvaddr);
+		pr_cont(" badv: %0*lx\n", field, regs->csr_badvaddr);
 
-	printk("PrId  : %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
+	pr_cont(" prid: %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
 	       cpu_family_string());
 }
 
-- 
2.39.1

