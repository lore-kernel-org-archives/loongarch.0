Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096B2373
	for <loongarch@lists.linux.dev>; Tue, 29 Aug 2023 00:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=lQ2jfoEoAOPZV5xJTc2ZtmivxP98noeI/ZYLd2mIOgE=; b=aGgde6YKSAEfan7rSeC7IIe+Fd
	qqyZK92oFC5kDFHOXR+V3tXy8SXdE/NHihUFm/jxMzP9WqY/5X++i3bnFxRVKGE8b4YaTVS7Lfw9l
	/Y1ArMT2R4lWiZq3d71xSQZfDg8p6DrByzRnoUWgL6XP6SlAod3PfE8/sXJRwy4lBTQ7S7eXt/Xbk
	bHYZr3SKt4gS8U1aNc/GPLzIqDOlmRRqVhEXzG4B2lZKXrLw5h6esaBeByBoUtLw6iiD+7wXjore6
	Jnlfd/M52i5uSCj3b42XefmfzlyNbYvczsu8RNWjnfvfChZorV474nuZQ6PVFnDauZt4mq7uuvk4Y
	fyIxwEVA==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qamVw-00AUqf-31;
	Tue, 29 Aug 2023 00:23:25 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Qing Zhang <zhangqing@loongson.cn>,
	Hui Li <lihui@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: [PATCH 2/2] Loongarch: KGDB: fix build when CPU_HAS_LBT not set
Date: Mon, 28 Aug 2023 17:23:23 -0700
Message-ID: <20230829002323.28303-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix build errors when CONFIG_CPU_HAS_LBT is not set:

loongarch64-linux-ld: arch/loongarch/kernel/kgdb.o: in function `dbg_get_reg':
arch/loongarch/kernel/kgdb.c:154:(.text+0xc7c): undefined reference to `_save_lbt'
loongarch64-linux-ld: arch/loongarch/kernel/kgdb.o: in function `dbg_set_reg':
arch/loongarch/kernel/kgdb.c:229:(.text+0x13a4): undefined reference to `_restore_lbt'

Fixes: 8968eb010689 ("LoongArch: Add basic KGDB & KDB support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Qing Zhang <zhangqing@loongson.cn>
Cc: Hui Li <lihui@loongson.cn>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev
---
 arch/loongarch/kernel/kgdb.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff -- a/arch/loongarch/kernel/kgdb.c b/arch/loongarch/kernel/kgdb.c
--- a/arch/loongarch/kernel/kgdb.c
+++ b/arch/loongarch/kernel/kgdb.c
@@ -150,7 +150,8 @@ char *dbg_get_reg(int regno, void *mem,
 	}
 
 	/* Handle LBT registers */
-	if ((regs->csr_euen & CSR_EUEN_LBTEN)) {
+	if (IS_ENABLED(CONFIG_CPU_HAS_LBT) &&
+	    (regs->csr_euen & CSR_EUEN_LBTEN)) {
 		_save_lbt(&current->thread.lbt);
 
 		switch (regno) {
@@ -211,7 +212,8 @@ int dbg_set_reg(int regno, void *mem, st
 	}
 
 	/* Handle LBT registers */
-	if ((regs->csr_euen & CSR_EUEN_LBTEN)) {
+	if (IS_ENABLED(CONFIG_CPU_HAS_LBT) &&
+	    (regs->csr_euen & CSR_EUEN_LBTEN)) {
 		switch (regno) {
 		case DBG_FTOP:				/* Process the ftop */
 			memcpy((char *)&current->thread.fpu.ftop, mem, reg_size);
