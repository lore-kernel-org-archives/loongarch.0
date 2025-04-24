Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3711FECAA
	for <loongarch@lists.linux.dev>; Thu, 24 Apr 2025 08:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483453; cv=none; b=GIsUy82sXatfDHiEoOuHVlgePQ60rPUYPFO2gWoFTkCF5BUn9kzCwbD7rOCWcDJpOPv1CiBquQ8kyWHVWU11Z47pOLCepnAPrChnwYpmppWB7q4L3WnXcWgGa5uHsaF2GXDayH+xs8n++yJCe0FzqmELia4sCV+5tWd5MnPgnrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483453; c=relaxed/simple;
	bh=WMxu0XEN/DHVqC6yGn8p7I0TCmrhNwC9jnEVc3ZOjWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SmiFjH9pw3U9FEGKIt4hetwstHY8PS47IaWr581jzpznJPfG3/8GjlDnoA3MsElXOnyMpdHvZ33A9HmOgNdOgQY0b2JPsdrVhUgnDE7HpkJRt6bfnmLcZGmWjRskh2i+/zWjcRs7Pl9zZ6ZloqctxQH3/+fl9N/hADj23yKLo5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.207.111.194])
	by gateway (Coremail) with SMTP id _____8CxdXCx9gloSjHFAA--.193S3;
	Thu, 24 Apr 2025 16:30:41 +0800 (CST)
Received: from ubuntu.. (unknown [111.207.111.194])
	by front1 (Coremail) with SMTP id qMiowMDxu8Sv9gloMD6TAA--.38428S2;
	Thu, 24 Apr 2025 16:30:40 +0800 (CST)
From: Ming Wang <wangming01@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Peter Xu <peterx@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hongchen Zhang <zhanghongchen@loongson.cn>,
	Ming Wang <wangming01@loongson.cn>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: lixuefeng@loongson.cn,
	gaojuxin@loongson.cn,
	chenhuacai@loongson.cn
Subject: [PATCH] mm/hugetlb: LoongArch: Return NULL from huge_pte_offset() for none PMD
Date: Thu, 24 Apr 2025 16:30:37 +0800
Message-ID: <20250424083037.2226732-1-wangming01@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxu8Sv9gloMD6TAA--.38428S2
X-CM-SenderInfo: 5zdqwzxlqjiio6or00hjvr0hdfq/1tbiAQECEmgJbWUK5QACsU
X-Coremail-Antispam: 1Uk129KBj93XoW7CFW3ZFy5tFy8Kr43urWkZrc_yoW8Ar4kpF
	sakwnYgr48CryDGa1ktFWrXrn7Aw1vgay7G3ZxCrWqvrnxtw1UXry8KwsIv3W8u395J3y2
	9r4Yq395XFWUJ3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU83DG5UU
	UUU==

LoongArch's huge_pte_offset() currently returns a pointer to a PMD slot
even if the underlying entry points to invalid_pte_table (indicating no
mapping). Callers like smaps_hugetlb_range() fetch this invalid entry
value (the address of invalid_pte_table) via this pointer.

The generic is_swap_pte() check then incorrectly identifies this address
as a swap entry on LoongArch, because it satisfies the !pte_present()
&& !pte_none() conditions. This misinterpretation, combined with a
coincidental match by is_migration_entry() on the address bits, leads
to kernel crashes in pfn_swap_entry_to_page().

Fix this at the architecture level by modifying huge_pte_offset() to
check the PMD entry's content using pmd_none() before returning. If the
entry is none (i.e., it points to invalid_pte_table), return NULL
instead of the pointer to the slot.

Co-developed-by: Hongchen Zhang <zhanghongchen@loongson.cn>
Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Ming Wang <wangming01@loongson.cn>
---
 arch/loongarch/mm/hugetlbpage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/mm/hugetlbpage.c b/arch/loongarch/mm/hugetlbpage.c
index e4068906143b..cea84d7f2b91 100644
--- a/arch/loongarch/mm/hugetlbpage.c
+++ b/arch/loongarch/mm/hugetlbpage.c
@@ -47,7 +47,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr,
 				pmd = pmd_offset(pud, addr);
 		}
 	}
-	return (pte_t *) pmd;
+	return pmd_none(pmdp_get(pmd)) ? NULL : (pte_t *) pmd;
 }
 
 uint64_t pmd_to_entrylo(unsigned long pmd_val)
-- 
2.43.0

