Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2109E185D
	for <loongarch@lists.linux.dev>; Wed, 26 Apr 2023 07:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682495149; bh=jOVKoI9+Vn6ipxsCp61rNX4ZRp/wWaBlUUK5sROBrBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OQ7XGR6KAVp+Zkc93EVnpz4NgVtQgxBNuxWOo95ALXrcTl9xLCZwZqVHOWIFp02/V
	 RvIRLJxRVngrpsGl3WtPAW55Gw45C0bfIB9y2JYOhjPB0s3OEHZVhsXy2YMP0osYzA
	 1za5bIq56og1IcoH6XaGzYyKHMYALHKHJWdeHUiQ=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E2BC860B17;
	Wed, 26 Apr 2023 15:45:48 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v8 11/12] LoongArch: Use ISA manual names for BADV and CPUCFG.PRID lines in show_regs
Date: Wed, 26 Apr 2023 15:45:24 +0800
Message-Id: <20230426074525.3906327-12-kernel@xen0n.name>
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

For stylistic consistency with the other lines already touched.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index decb826f45bd..66709f289f82 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -354,9 +354,9 @@ static void __show_regs(const struct pt_regs *regs)
 	print_estat(regs->csr_estat);
 
 	if (exccode >= EXCCODE_TLBL && exccode <= EXCCODE_ALE)
-		printk("BadVA : %0*lx\n", field, regs->csr_badvaddr);
+		printk(" BADV: %0*lx\n", field, regs->csr_badvaddr);
 
-	printk("PrId  : %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
+	printk(" PRID: %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
 	       cpu_family_string());
 }
 
-- 
2.40.0

