Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868BC2102
	for <loongarch@lists.linux.dev>; Wed,  7 Dec 2022 14:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FCEC433C1;
	Wed,  7 Dec 2022 14:10:16 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rui Wang <wangrui@loongson.cn>
Subject: [PATCH] LoongArch: mm: Fix huge page entry update for virtual machine
Date: Wed,  7 Dec 2022 22:10:43 +0800
Message-Id: <20221207141043.1600863-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In virtual machine (guest mode), the tlbwr instruction can not write the
last entry of MTLB, so we need to make it non-present by invtlb and then
write it by tlbfill. This also simplify the whole logic.

Signed-off-by: Rui Wang <wangrui@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/mm/tlbex.S | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/loongarch/mm/tlbex.S b/arch/loongarch/mm/tlbex.S
index d8ee8fbc8c67..58781c6e4191 100644
--- a/arch/loongarch/mm/tlbex.S
+++ b/arch/loongarch/mm/tlbex.S
@@ -10,6 +10,8 @@
 #include <asm/regdef.h>
 #include <asm/stackframe.h>
 
+#define INVTLB_ADDR_GFALSE_AND_ASID	5
+
 #define PTRS_PER_PGD_BITS	(PAGE_SHIFT - 3)
 #define PTRS_PER_PUD_BITS	(PAGE_SHIFT - 3)
 #define PTRS_PER_PMD_BITS	(PAGE_SHIFT - 3)
@@ -136,13 +138,10 @@ tlb_huge_update_load:
 	ori		t0, ra, _PAGE_VALID
 	st.d		t0, t1, 0
 #endif
-	tlbsrch
-	addu16i.d	t1, zero, -(CSR_TLBIDX_EHINV >> 16)
-	addi.d		ra, t1, 0
-	csrxchg		ra, t1, LOONGARCH_CSR_TLBIDX
-	tlbwr
-
-	csrxchg		zero, t1, LOONGARCH_CSR_TLBIDX
+	csrrd		ra, LOONGARCH_CSR_ASID
+	csrrd		t1, LOONGARCH_CSR_BADV
+	andi		ra, ra, CSR_ASID_ASID
+	invtlb		INVTLB_ADDR_GFALSE_AND_ASID, ra, t1
 
 	/*
 	 * A huge PTE describes an area the size of the
@@ -287,13 +286,11 @@ tlb_huge_update_store:
 	ori		t0, ra, (_PAGE_VALID | _PAGE_DIRTY | _PAGE_MODIFIED)
 	st.d		t0, t1, 0
 #endif
-	tlbsrch
-	addu16i.d	t1, zero, -(CSR_TLBIDX_EHINV >> 16)
-	addi.d		ra, t1, 0
-	csrxchg		ra, t1, LOONGARCH_CSR_TLBIDX
-	tlbwr
+	csrrd		ra, LOONGARCH_CSR_ASID
+	csrrd		t1, LOONGARCH_CSR_BADV
+	andi		ra, ra, CSR_ASID_ASID
+	invtlb		INVTLB_ADDR_GFALSE_AND_ASID, ra, t1
 
-	csrxchg		zero, t1, LOONGARCH_CSR_TLBIDX
 	/*
 	 * A huge PTE describes an area the size of the
 	 * configured huge page size. This is twice the
@@ -436,6 +433,11 @@ tlb_huge_update_modify:
 	ori		t0, ra, (_PAGE_VALID | _PAGE_DIRTY | _PAGE_MODIFIED)
 	st.d		t0, t1, 0
 #endif
+	csrrd		ra, LOONGARCH_CSR_ASID
+	csrrd		t1, LOONGARCH_CSR_BADV
+	andi		ra, ra, CSR_ASID_ASID
+	invtlb		INVTLB_ADDR_GFALSE_AND_ASID, ra, t1
+
 	/*
 	 * A huge PTE describes an area the size of the
 	 * configured huge page size. This is twice the
@@ -466,7 +468,7 @@ tlb_huge_update_modify:
 	addu16i.d	t1, zero, (PS_HUGE_SIZE << (CSR_TLBIDX_PS_SHIFT - 16))
 	csrxchg		t1, t0, LOONGARCH_CSR_TLBIDX
 
-	tlbwr
+	tlbfill
 
 	/* Reset default page size */
 	addu16i.d	t0, zero, (CSR_TLBIDX_PS >> 16)
-- 
2.31.1

