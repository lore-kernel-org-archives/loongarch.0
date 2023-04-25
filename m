Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C601115
	for <loongarch@lists.linux.dev>; Tue, 25 Apr 2023 08:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682410243; bh=ZvzLLDmerRpGEQfCAzOgdmeEmd5yjwFuZ/6PLU88Cfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s0B7IfgYYVCWM0FBUKcBzW0fecRP37UobZ11Pohs8g6Z+uvnNwhDprsGs27uWG24q
	 aAKJl93GnXy1subjRBC+GTpby5/gH58PjZFh5F9uZl8KqWnIb7C5i1MAN4c+AX7BtE
	 n7Uqos9V9QXY7D1eN7fp11u2c2UsfzDlSyYlDJn8=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 444E46014B;
	Tue, 25 Apr 2023 16:10:43 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v7 11/12] LoongArch: Use ISA manual names for BADV and CPUCFG.PRID lines in show_regs
Date: Tue, 25 Apr 2023 16:10:22 +0800
Message-Id: <20230425081023.3809434-12-kernel@xen0n.name>
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

While at it, also change the printk to pr_cont.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index c7ef902800a4..b2188cfe893b 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -351,9 +351,9 @@ static void __show_regs(const struct pt_regs *regs)
 	print_estat(regs->csr_estat);
 
 	if (exccode >= EXCCODE_TLBL && exccode <= EXCCODE_ALE)
-		printk("BadVA : %0*lx\n", field, regs->csr_badvaddr);
+		pr_cont(" BADV: %0*lx\n", field, regs->csr_badvaddr);
 
-	printk("PrId  : %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
+	pr_cont(" PRID: %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
 	       cpu_family_string());
 }
 
-- 
2.40.0

