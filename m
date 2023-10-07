Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BF8F502
	for <loongarch@lists.linux.dev>; Sat,  7 Oct 2023 07:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8AxlPBgDiFl3rwvAA--.26351S3;
	Sat, 07 Oct 2023 15:53:04 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axm+RfDiFl7vIZAA--.57101S2;
	Sat, 07 Oct 2023 15:53:04 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"open list : LOONGARCH" <loongarch@lists.linux.dev>,
	KVM list <kvm@vger.kernel.org>,
	zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	Huacai Chen <chenhuacai@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH linux-next] LoongArch: mm: Export symbol for invalid_pud_table.
Date: Sat,  7 Oct 2023 15:53:03 +0800
Message-Id: <20231007075303.263407-1-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Axm+RfDiFl7vIZAA--.57101S2
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Export symbol for invalid_pud_table, so it can be used
by the files in other directories.

And this can resolve the problem caused in:
https://lore.kernel.org/lkml/20230927030959.3629941-5-zhaotianrui@loongson.cn/
ERROR: modpost: "invalid_pud_table" [arch/loongarch/kvm/kvm.ko] undefined!

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 arch/loongarch/mm/init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index f3fe8c06ba4d..ddf1330c924c 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -240,6 +240,7 @@ pgd_t swapper_pg_dir[_PTRS_PER_PGD] __section(".bss..swapper_pg_dir");
 pgd_t invalid_pg_dir[_PTRS_PER_PGD] __page_aligned_bss;
 #ifndef __PAGETABLE_PUD_FOLDED
 pud_t invalid_pud_table[PTRS_PER_PUD] __page_aligned_bss;
+EXPORT_SYMBOL(invalid_pud_table);
 #endif
 #ifndef __PAGETABLE_PMD_FOLDED
 pmd_t invalid_pmd_table[PTRS_PER_PMD] __page_aligned_bss;
-- 
2.39.1

