Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3C87B
	for <loongarch@lists.linux.dev>; Tue, 25 Apr 2023 08:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682410244; bh=z92rbgpKRC+4WgC7BsQofz8iaOhTslUF3SfZDkwRWM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rx4YyzkVpFLrmqNO3PxT7tG4HuZY88XhjDYN3rE08/4HmIHT/xJnLauH63d3j92GR
	 Jg2NGO0PeR0Ko8mdCQeV95zEU4wQ3u3Me3HJZ1OOAUc40y9dd1sn+8yxBafiCOVBl2
	 90I0A50dG/uCwU5/KGkRjD11Y9DzbKEuk//wGLTY=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id F1AAC60B17;
	Tue, 25 Apr 2023 16:10:43 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v7 12/12] LoongArch: Also include current CPU's full name in show_regs output
Date: Tue, 25 Apr 2023 16:10:23 +0800
Message-Id: <20230425081023.3809434-13-kernel@xen0n.name>
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

It may be more helpful for developers looking at the resulting dumps,
because multiple distinct CPU models may share the same PRID. Not having
this info available may hide problems only found on some but not all of
the models sharing one specific PRID.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index b2188cfe893b..4040f195db3a 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -353,8 +353,8 @@ static void __show_regs(const struct pt_regs *regs)
 	if (exccode >= EXCCODE_TLBL && exccode <= EXCCODE_ALE)
 		pr_cont(" BADV: %0*lx\n", field, regs->csr_badvaddr);
 
-	pr_cont(" PRID: %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
-	       cpu_family_string());
+	pr_cont(" PRID: %08x (%s, %s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
+		cpu_family_string(), cpu_full_name_string());
 }
 
 void show_regs(struct pt_regs *regs)
-- 
2.40.0

