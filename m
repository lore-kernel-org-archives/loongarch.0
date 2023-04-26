Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85358185D
	for <loongarch@lists.linux.dev>; Wed, 26 Apr 2023 07:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682495151; bh=vkKXdiYRUMW7zncYGiJeLswMjjwbbEB73mk0AIEjdDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N1wYDB6ejeXVJanz9+U3NdQyJmSGLiEmoQD/TAF+pw+Q2uFUEzzufa3gWZ9OHYxns
	 v1fxl2ReWAeS77LV5UKwGDnSzu4XH0AeLgTbFy2u6WmlCIKheagqVfToVW4dE+WgZt
	 83zKzuUd2e7N6fgBqJN9SuyiZJ7bgfHlo43ICnKc=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8EF52600CE;
	Wed, 26 Apr 2023 15:45:51 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v8 12/12] LoongArch: Also include current CPU's full name in show_regs output
Date: Wed, 26 Apr 2023 15:45:25 +0800
Message-Id: <20230426074525.3906327-13-kernel@xen0n.name>
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

It may be more helpful for developers looking at the resulting dumps,
because multiple distinct CPU models may share the same PRID. Not having
this info available may hide problems only found on some but not all of
the models sharing one specific PRID.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kernel/traps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 66709f289f82..31624e8e15a9 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -356,8 +356,8 @@ static void __show_regs(const struct pt_regs *regs)
 	if (exccode >= EXCCODE_TLBL && exccode <= EXCCODE_ALE)
 		printk(" BADV: %0*lx\n", field, regs->csr_badvaddr);
 
-	printk(" PRID: %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
-	       cpu_family_string());
+	printk(" PRID: %08x (%s, %s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
+	       cpu_family_string(), cpu_full_name_string());
 }
 
 void show_regs(struct pt_regs *regs)
-- 
2.40.0

