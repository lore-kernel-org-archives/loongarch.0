Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28519259A
	for <loongarch@lists.linux.dev>; Mon, 24 Oct 2022 12:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1666613593; bh=lejZulrJjlLlWMRd0DU0LEHrcdNUuiCGLMM4h8TzBUk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XBsPkQvQHDeD6rpsA0LJaO9Mtte/Fqmb7kfy5qdis5AVUs5Ryv5lii+owLsOxl12U
	 sCGpKVheJla9giNYGGKSXY3PeOnSxTHsr4vX15WXSBMHNceu0CRityN9s17knvIxT0
	 3jLQE6KSKMQVsYuh+7o70jqzhR9v9XcmIZcuCUxY=
Received: from ld50.lan (unknown [101.88.135.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 00EB6601A7;
	Mon, 24 Oct 2022 20:13:12 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH 13/13] LoongArch: Use lowercase ISA manual names for BADV and CPUCFG.PRID lines in show_regs
Date: Mon, 24 Oct 2022 20:13:05 +0800
Message-Id: <20221024121305.381776-14-kernel@xen0n.name>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221024121305.381776-1-kernel@xen0n.name>
References: <20221024121305.381776-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 27a4ac049d64..d1b9f5a891dd 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -342,9 +342,9 @@ static void __show_regs(const struct pt_regs *regs)
 	print_estat(regs->csr_estat);
 
 	if (ecode >= ECODE_PIL && ecode <= ECODE_ALE)
-		printk("BadVA : %0*lx\n", field, regs->csr_badvaddr);
+		printk(" badv: %0*lx\n", field, regs->csr_badvaddr);
 
-	printk("PrId  : %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
+	printk(" prid: %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
 	       cpu_family_string());
 }
 
-- 
2.38.0

