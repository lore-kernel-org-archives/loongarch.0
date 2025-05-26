Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597681D63C0
	for <loongarch@lists.linux.dev>; Mon, 26 May 2025 06:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748242523; cv=none; b=cSwReBJm4mljDTXD5r00cUKmDjZgOs7hFVRXyALSLTN8wqfxiYkpYMOFs3AMntlfxzs5JSu38LEh3ge8deixZrsxO/SsPrNUOXSrnTza+XY3nfH2pFGbOjeYuampNt668k5aMpRlH9Hk5Ea5ut05avz9wOcoUSSHSsS1iONHznI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748242523; c=relaxed/simple;
	bh=11uRemiH4yPMy8oCJMxXpaySk1ix9Nd4b3Ls/kbEcvs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GWioRoHnm4BCNAIfGF/eTo3s03B6zLWn2GKbhOcuuHKA9uCGy1Z3zTY897YdG/7FrZYUPur1uUKnhuMHutrIITpmsJrDXnV8q7c7R6BU8Pw2ZII+T3oyQFdm4BwlnQCh3JxsmG1zD5p29yTaisk2z3Rj+CNAJTJmj/3M+CTVnzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.10.34])
	by gateway (Coremail) with SMTP id _____8Bx32tUEDRo9ZX8AA--.14057S3;
	Mon, 26 May 2025 14:55:17 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.10.34])
	by front1 (Coremail) with SMTP id qMiowMCx7MRREDRolR3yAA--.32845S2;
	Mon, 26 May 2025 14:55:16 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	zhanghongchen@loongson.cn,
	wangming01@loongson.cn,
	peterx@redhat.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhangtianyang <zhangtianyang@loongson.cn>
Subject: [PATCH] Loongarch:Fixed up panic cause by a NULL-pmd
Date: Mon, 26 May 2025 14:55:12 +0800
Message-Id: <20250526065512.13215-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCx7MRREDRolR3yAA--.32845S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ww1fur4ktryUCFyftry8tFc_yoW8Wr1kpr
	y7C3Z5Gr40yryDJa17AFWkZFn7XasFkF4kW3Z2ya4DZwnxtw1jqFy8JwnI9F48ArWrJ3y0
	9F45Ka9YqF1UJagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU90b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07jjWlkUUUUU=

From: zhangtianyang <zhangtianyang@loongson.cn>

Fixes: bd51834d1cf6 ("LoongArch: Return NULL from huge_pte_offset() for invalid PMD")
ERROR INFO:

CPU 25 Unable to handle kernel paging request at virtual address 0x0
         ...
 Call Trace:
 [<900000000023c30c>] huge_pte_offset+0x3c/0x58
 [<900000000057fd4c>] hugetlb_follow_page_mask+0x74/0x438
 [<900000000051fee8>] __get_user_pages+0xe0/0x4c8
 [<9000000000522414>] faultin_page_range+0x84/0x380
 [<9000000000564e8c>] madvise_vma_behavior+0x534/0xa48
 [<900000000056689c>] do_madvise+0x1bc/0x3e8
 [<9000000000566df4>] sys_madvise+0x24/0x38
 [<90000000015b9e88>] do_syscall+0x78/0x98
 [<9000000000221f18>] handle_syscall+0xb8/0x158

In some cases, pmd may be NULL and rely on NULL as the return value
for processing, so it is necessary to determine this situation here
Signed-off-by: zhangtianyang <zhangtianyang@loongson.cn>
---
 arch/loongarch/mm/hugetlbpage.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/mm/hugetlbpage.c b/arch/loongarch/mm/hugetlbpage.c
index cea84d7f2b91..02dad4624fe3 100644
--- a/arch/loongarch/mm/hugetlbpage.c
+++ b/arch/loongarch/mm/hugetlbpage.c
@@ -47,7 +47,8 @@ pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr,
 				pmd = pmd_offset(pud, addr);
 		}
 	}
-	return pmd_none(pmdp_get(pmd)) ? NULL : (pte_t *) pmd;
+
+	return (!pmd || pmd_none(pmdp_get(pmd))) ? NULL : (pte_t *) pmd;
 }
 
 uint64_t pmd_to_entrylo(unsigned long pmd_val)
-- 
2.20.1

