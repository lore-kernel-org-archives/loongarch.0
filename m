Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FD02F43
	for <loongarch@lists.linux.dev>; Fri, 21 Apr 2023 11:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682077814; bh=5CB3CZAXk65tyAFaAcvcWGWtAPRO8iD0UpNZNqRjD24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SSfrS2ts9Y+onEHHTed8KidPW0YqU9ci/E0DnIXNRbPoBqn6ZeYj4guw9UJRuxl3w
	 sSH/IKoNEiez7oq/VAyPGqgIzMJ2CBjFz9LY8wPrcwGZkDvMfWPhLr4HAfjIJhogfe
	 LuM72aFXg70OD09Krk/bU6DdiQv8vSboMvlwmjSw=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 6FCA560B16;
	Fri, 21 Apr 2023 19:50:14 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v5 12/12] LoongArch: Include CSR.BADV in show_regs in case of BCE exceptions
Date: Fri, 21 Apr 2023 19:49:08 +0800
Message-Id: <20230421114908.2970567-13-kernel@xen0n.name>
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
index 19d954013ba6..d4e5283e441a 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -352,7 +352,7 @@ static void __show_regs(const struct pt_regs *regs)
 	print_ecfg(regs->csr_ecfg);
 	print_estat(regs->csr_estat);
 
-	if (exccode >= EXCCODE_TLBL && exccode <= EXCCODE_ALE)
+	if (exccode >= EXCCODE_TLBL && exccode <= EXCCODE_OOB)
 		pr_cont(" BADV: %0*lx\n", field, regs->csr_badvaddr);
 
 	pr_cont(" PRID: %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
-- 
2.40.0

