Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E2610F5
	for <loongarch@lists.linux.dev>; Sun, 16 Apr 2023 06:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1681625079; bh=iQ9rgWYJsljA03eshsQJSpVcvnHSKMsOsW6T7uFoSKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ewWTrS9AudYKHuK2wLMcfGP8oL/Tg3jA7oNOCPunweXkfcJCTGANGbOET5ZZXuhhE
	 KHu2NkAbR5o/r0ev74SnuJLmv+rL70tWJQp+d02Y2yoZ7JdytFqqVcziQzKGkcMnKs
	 vvoaJnl7F+CRePn5h2mB1AbN9CjLO7UwBj09aBg8=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id ACFDD6018A;
	Sun, 16 Apr 2023 14:04:39 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v4 12/12] LoongArch: Include CSR.BADV in show_regs in case of BCE exceptions
Date: Sun, 16 Apr 2023 14:03:56 +0800
Message-Id: <20230416060356.3711529-13-kernel@xen0n.name>
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

According to the LoongArch ISA Manual's description for CSR.BADV
(Volume 1, Section 7.4.8), CSR.BADV is supposed to be updated in case of
BCE [Bound checking error] too, in addition to the current implemented
list of exceptions.

Note: in my experiments CSR.BADV actually does *not* seem to reflect the
offending out-of-bounds value at all, regardless of the instruction used
(neither asrt{gt,le} nor {ld,st}{gt,le}). My wild guess is that when the
assertion fails, the execution of the instruction has not proceeded to
MEM stage yet, and that only in this stage is CSR.BADV potentially
updated. We show it nevertheless because it does not hurt and it is
generally better to maintain consistency with the manuals.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index e8708b362da4..a060481198af 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -354,7 +354,7 @@ static void __show_regs(const struct pt_regs *regs)
 	print_ecfg(regs->csr_ecfg);
 	print_estat(regs->csr_estat);
 
-	if (exccode >= EXCCODE_TLBL && exccode <= EXCCODE_ALE)
+	if (exccode >= EXCCODE_TLBL && exccode <= EXCCODE_OOB)
 		pr_cont(" badv: %0*lx\n", field, regs->csr_badvaddr);
 
 	pr_cont(" prid: %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
-- 
2.40.0

