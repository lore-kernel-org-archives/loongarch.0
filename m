Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA6C168B1
	for <loongarch@lists.linux.dev>; Mon, 26 Jun 2023 21:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6AAC433B7;
	Mon, 26 Jun 2023 21:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687816253;
	bh=ofrVMs/nYr5r1VsEbEpQv15M1fOFPjaBRN3PK0404Zo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ilmUlk94DRMHd+IM0IKODsRBEqyi5vEWwCRvKCNTfkt5q23LCSe+ENebJyJZYOJFY
	 LdM9yZvz6YSzCSfyxNZrno1UI0opCRsDQIRG+vYIN4awhSNV7/x2w60Wsm9xsy26up
	 FOfxXYrC3nRGluY8J/aa4opx5ef3HYSeiCV11+GfRfghIuz11hX/4YjAVPSY+r3Gsi
	 xT9g0IIy6cYPvpbrf1eKi5zDnJO8ahENtEib52wfIxMXNQHIQjynglM/jHdv5qd6gA
	 znE36lLBV82xLsa6Ebon44OgsUy5xba88v01bs5BkHsXiaEKourbEQDiLYihEsEeg7
	 qLKOqS2Vm235A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hongchen Zhang <zhanghongchen@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	akpm@linux-foundation.org,
	david@redhat.com,
	anshuman.khandual@arm.com,
	rppt@kernel.org,
	chenfeiyang@loongson.cn,
	zhengqi.arch@bytedance.com,
	wangkefeng.wang@huawei.com,
	loongarch@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 13/15] LoongArch: Let pmd_present() return true when splitting pmd
Date: Mon, 26 Jun 2023 17:50:29 -0400
Message-Id: <20230626215031.179159-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230626215031.179159-1-sashal@kernel.org>
References: <20230626215031.179159-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.35
Content-Transfer-Encoding: 8bit

From: Hongchen Zhang <zhanghongchen@loongson.cn>

[ Upstream commit ddc1729b07cc84bb29f577698b8d2e74a4004a6e ]

When we split a pmd into ptes, pmd_present() and pmd_trans_huge() should
return true, otherwise it would be treated as a swap pmd.

This is the same as arm64 does in commit b65399f6111b ("arm64/mm: Change
THP helpers to comply with generic MM semantics"), we also add a new bit
named _PAGE_PRESENT_INVALID for LoongArch.

Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/loongarch/include/asm/pgtable-bits.h | 2 ++
 arch/loongarch/include/asm/pgtable.h      | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/pgtable-bits.h b/arch/loongarch/include/asm/pgtable-bits.h
index 3d1e0a69975a5..5f2ebcea509cd 100644
--- a/arch/loongarch/include/asm/pgtable-bits.h
+++ b/arch/loongarch/include/asm/pgtable-bits.h
@@ -21,12 +21,14 @@
 #define	_PAGE_HGLOBAL_SHIFT	12 /* HGlobal is a PMD bit */
 #define	_PAGE_PFN_SHIFT		12
 #define	_PAGE_PFN_END_SHIFT	48
+#define	_PAGE_PRESENT_INVALID_SHIFT 60
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
index 79d5bfd913e0f..e748fad82f13e 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -208,7 +208,7 @@ static inline int pmd_bad(pmd_t pmd)
 static inline int pmd_present(pmd_t pmd)
 {
 	if (unlikely(pmd_val(pmd) & _PAGE_HUGE))
-		return !!(pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROTNONE));
+		return !!(pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROTNONE | _PAGE_PRESENT_INVALID));
 
 	return pmd_val(pmd) != (unsigned long)invalid_pte_table;
 }
@@ -525,6 +525,7 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 
 static inline pmd_t pmd_mkinvalid(pmd_t pmd)
 {
+	pmd_val(pmd) |= _PAGE_PRESENT_INVALID;
 	pmd_val(pmd) &= ~(_PAGE_PRESENT | _PAGE_VALID | _PAGE_DIRTY | _PAGE_PROTNONE);
 
 	return pmd;
-- 
2.39.2

