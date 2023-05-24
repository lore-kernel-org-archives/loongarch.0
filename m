Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAFE8467
	for <loongarch@lists.linux.dev>; Wed, 24 May 2023 07:42:02 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.185])
	by gateway (Coremail) with SMTP id _____8Bxy_LIv21kEVgAAA--.1045S3;
	Wed, 24 May 2023 15:42:00 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.13.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx673Cv21kE2RzAA--.60844S2;
	Wed, 24 May 2023 15:42:00 +0800 (CST)
From: Hongchen Zhang <zhanghongchen@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Hongchen Zhang <zhanghongchen@loongson.cn>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Feiyang Chen <chenfeiyang@loongson.cn>,
	Qi Zheng <zhengqi.arch@bytedance.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH] LoongArch: let pmd_present return true when splitting pmd
Date: Wed, 24 May 2023 15:41:32 +0800
Message-Id: <20230524074132.10916-1-zhanghongchen@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bx673Cv21kE2RzAA--.60844S2
X-CM-SenderInfo: x2kd0w5krqwupkhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Zr45Gw4Dtr43Ww4kAry3CFg_yoW8KFWrp3
	Z7CFykurW5Ka4Sy343tF13Xry7CrsrGFnaqryqgw1UAFy3X397Jrn8Kwn8ZFy8XayvvFW8
	Wr1xWa15WFy3JwUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxV
	Aaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxY
	O2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4U
	YxBIdaVFxhVjvjDU0xZFpf9x07jOiSdUUUUU=

when we split a pmd into ptes, pmd_present() and pmd_trans_huge() should
return true,otherwise it would be treated as a swap pmd.
As arm64 does in
commit b65399f6111b ("arm64/mm: Change THP helpers to comply with generic MM semantics")
we add a _PAGE_PRESENT_INVALID bit for LoongArch.

Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
---
 arch/loongarch/include/asm/pgtable-bits.h | 2 ++
 arch/loongarch/include/asm/pgtable.h      | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/pgtable-bits.h b/arch/loongarch/include/asm/pgtable-bits.h
index 8b98d22a145b..a7469d28d9d0 100644
--- a/arch/loongarch/include/asm/pgtable-bits.h
+++ b/arch/loongarch/include/asm/pgtable-bits.h
@@ -22,12 +22,14 @@
 #define	_PAGE_PFN_SHIFT		12
 #define	_PAGE_SWP_EXCLUSIVE_SHIFT 23
 #define	_PAGE_PFN_END_SHIFT	48
+#define _PAGE_PRESENT_INVALID_SHIFT 60
 #define	_PAGE_NO_READ_SHIFT	61
 #define	_PAGE_NO_EXEC_SHIFT	62
 #define	_PAGE_RPLV_SHIFT	63
 
 /* Used by software */
 #define _PAGE_PRESENT		(_ULCAST_(1) << _PAGE_PRESENT_SHIFT)
+#define _PAGE_PRESENT_INVALID	(_ULCAST_(1) << _PAGE_PRESENT_INVALID_SHIFT)
 #define _PAGE_WRITE		(_ULCAST_(1) << _PAGE_WRITE_SHIFT)
 #define _PAGE_ACCESSED		(_ULCAST_(1) << _PAGE_ACCESSED_SHIFT)
 #define _PAGE_MODIFIED		(_ULCAST_(1) << _PAGE_MODIFIED_SHIFT)
diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index d28fb9dbec59..9a9f9ff9b709 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -213,7 +213,7 @@ static inline int pmd_bad(pmd_t pmd)
 static inline int pmd_present(pmd_t pmd)
 {
 	if (unlikely(pmd_val(pmd) & _PAGE_HUGE))
-		return !!(pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROTNONE));
+		return !!(pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROTNONE | _PAGE_PRESENT_INVALID));
 
 	return pmd_val(pmd) != (unsigned long)invalid_pte_table;
 }
@@ -558,6 +558,7 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 
 static inline pmd_t pmd_mkinvalid(pmd_t pmd)
 {
+	pmd_val(pmd) |= _PAGE_PRESENT_INVALID;
 	pmd_val(pmd) &= ~(_PAGE_PRESENT | _PAGE_VALID | _PAGE_DIRTY | _PAGE_PROTNONE);
 
 	return pmd;

base-commit: f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
-- 
2.31.1

