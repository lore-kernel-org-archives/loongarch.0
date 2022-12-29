Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6ED1363
	for <loongarch@lists.linux.dev>; Thu, 29 Dec 2022 05:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1672292022; bh=Rt2VKAHmxZjJQo2ey+eYAITgjJ3pg/7oLhBnN3iQrjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wF+qHLoHuNZIuL76WLVI52g3aBwYu3b+K18B0f2wPPz1tJRsrFRuBp1FjGLO7+KEN
	 2zxARFV1r0NckwxLcX/hPjXv+McCiiZn+cycGBREjidow/DZnPodEGtzO8xPBwWZyQ
	 28TzRfhW2MKDO3M9mZH7bb89pfk3/IjD5beTtmQA=
Received: from ld50.lan (unknown [101.88.134.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id A969C600DA;
	Thu, 29 Dec 2022 13:33:42 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v2 11/11] LoongArch: Use lowercase ISA manual names for BADV and CPUCFG.PRID lines in show_regs
Date: Thu, 29 Dec 2022 13:33:06 +0800
Message-Id: <20221229053306.3285457-12-kernel@xen0n.name>
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

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 7dcb64ab5de8..48c5247a74a8 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -353,9 +353,9 @@ static void __show_regs(const struct pt_regs *regs)
 	print_estat(regs->csr_estat);
 
 	if (exccode >= EXCCODE_TLBL && exccode <= EXCCODE_ALE)
-		printk("BadVA : %0*lx\n", field, regs->csr_badvaddr);
+		printk(" badv: %0*lx\n", field, regs->csr_badvaddr);
 
-	printk("PrId  : %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
+	printk(" prid: %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
 	       cpu_family_string());
 }
 
-- 
2.38.1

