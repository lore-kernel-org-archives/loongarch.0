Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D9965F
	for <loongarch@lists.linux.dev>; Sun, 19 Nov 2023 02:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21CEC433C7;
	Sun, 19 Nov 2023 02:33:25 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Mark {dmw,tlb}_virt_to_page() exports as non-GPL
Date: Sun, 19 Nov 2023 10:33:17 +0800
Message-Id: <20231119023317.3359647-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark {dmw,tlb}_virt_to_page() exports as non-GPL, in order to let
out-of-tree modules (e.g. OpenZFS) be built without errors. Otherwise
we get:

ERROR: modpost: GPL-incompatible module zfs.ko uses GPL-only symbol 'dmw_virt_to_page'
ERROR: modpost: GPL-incompatible module zfs.ko uses GPL-only symbol 'tlb_virt_to_page'

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/mm/pgtable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
index 71d0539e2d0b..2aae72e63871 100644
--- a/arch/loongarch/mm/pgtable.c
+++ b/arch/loongarch/mm/pgtable.c
@@ -13,13 +13,13 @@ struct page *dmw_virt_to_page(unsigned long kaddr)
 {
 	return pfn_to_page(virt_to_pfn(kaddr));
 }
-EXPORT_SYMBOL_GPL(dmw_virt_to_page);
+EXPORT_SYMBOL(dmw_virt_to_page);
 
 struct page *tlb_virt_to_page(unsigned long kaddr)
 {
 	return pfn_to_page(pte_pfn(*virt_to_kpte(kaddr)));
 }
-EXPORT_SYMBOL_GPL(tlb_virt_to_page);
+EXPORT_SYMBOL(tlb_virt_to_page);
 
 pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-- 
2.39.3

