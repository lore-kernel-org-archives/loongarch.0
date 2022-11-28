Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522CA8F7C
	for <loongarch@lists.linux.dev>; Mon, 28 Nov 2022 17:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD21C433D6;
	Mon, 28 Nov 2022 17:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669657141;
	bh=wdLy3DGrffKX9Qj8o4u72weS2ccdp4pwLKa8Yk9H6Cg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tTuV8HFObQobzrVqnPd3D2XdGnOcEjY2SW29cwfqSSy63vXW+o/C+9Ib3vhhMiwAt
	 efD6BrQoIrz0UQRn/qV5XXGZ9ws+x2XU0R50rtnDkNaKAoEHIfjE4+hLcA6JlbWSBO
	 NUQfdxdbx+064pr37AwYXREgyjcPmTjV9NbQ/Zj2ZkahcSDbr8zfhS+deoaDAjrnCY
	 xE03Of1i9dV9V6+sWTMC1ei6jfwU6yyk+NmMaE3i3oBO6M7mPitG3jb89l633zVxNd
	 XNgM8ap7qrwEqbXf1HSUnPTctEkQziliW2lNDptIp5MAr3zUSGVNyl6vInJxCAjSKD
	 2HnOIBsmYuOMQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	jiaxun.yang@flygoat.com,
	git@xen0n.name,
	loongarch@lists.linux.dev
Subject: [PATCH AUTOSEL 6.0 25/39] LoongArch: Set _PAGE_DIRTY only if _PAGE_MODIFIED is set in {pmd,pte}_mkwrite()
Date: Mon, 28 Nov 2022 12:36:05 -0500
Message-Id: <20221128173642.1441232-25-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128173642.1441232-1-sashal@kernel.org>
References: <20221128173642.1441232-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Huacai Chen <chenhuacai@loongson.cn>

[ Upstream commit 54e6cd42a183b602e3627ad3aaeeed44f7443e67 ]

Set _PAGE_DIRTY only if _PAGE_MODIFIED is set in {pmd,pte}_mkwrite().
Otherwise, _PAGE_DIRTY silences the TLB modify exception and make us
have no chance to mark a pmd/pte dirty (_PAGE_MODIFIED) for software.

Reviewed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/loongarch/include/asm/pgtable.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 8ea57e2f0e04..79981ee8a171 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -355,7 +355,9 @@ static inline pte_t pte_mkdirty(pte_t pte)
 
 static inline pte_t pte_mkwrite(pte_t pte)
 {
-	pte_val(pte) |= (_PAGE_WRITE | _PAGE_DIRTY);
+	pte_val(pte) |= _PAGE_WRITE;
+	if (pte_val(pte) & _PAGE_MODIFIED)
+		pte_val(pte) |= _PAGE_DIRTY;
 	return pte;
 }
 
@@ -452,7 +454,9 @@ static inline int pmd_write(pmd_t pmd)
 
 static inline pmd_t pmd_mkwrite(pmd_t pmd)
 {
-	pmd_val(pmd) |= (_PAGE_WRITE | _PAGE_DIRTY);
+	pmd_val(pmd) |= _PAGE_WRITE;
+	if (pmd_val(pmd) & _PAGE_MODIFIED)
+		pmd_val(pmd) |= _PAGE_DIRTY;
 	return pmd;
 }
 
-- 
2.35.1

