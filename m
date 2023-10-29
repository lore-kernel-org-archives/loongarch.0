Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E9512E7B
	for <loongarch@lists.linux.dev>; Sun, 29 Oct 2023 22:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpJS+v1E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773E3C116B0;
	Sun, 29 Oct 2023 22:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620318;
	bh=j2JBGih18O6OPWJGpMBPuhz/exYJMtXqF1apiFSql0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VpJS+v1EGxTD7M/U9C6A0S/6CORJ9LG5bCsEe2ox8ofmfwDP1f/Uh49WaC5QUa90l
	 7+yAbWNTmav8kRZ19KpFQyVYzLOOoYGANPvnp3EWZ/6DsOLIr3ofqYqCG1Xgm/CYfe
	 ESaojSYpjJApcEa3pgomChucQ05zoMeqBLU8PNZCZb52m/ekjOHe0Vkt/A5vdjpNbJ
	 vmj5hJTDuj+W+H2k8Duo5cLzs9hlt7lt6VyJLZTBJGwVCs1/yjye6T5L327e0Ex9oH
	 xkyFXnm7f4ZmQecKCiZVObvmc5wtZ1l13rEpwPBcm0bK8xFjkB7EC45EqjuTREoa+/
	 IbNpubmom/Arg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	akpm@linux-foundation.org,
	chenfeiyang@loongson.cn,
	arnd@arndb.de,
	maobibo@loongson.cn,
	loongarch@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 30/39] LoongArch: Export symbol invalid_pud_table for modules building
Date: Sun, 29 Oct 2023 18:57:02 -0400
Message-ID: <20231029225740.790936-30-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225740.790936-1-sashal@kernel.org>
References: <20231029225740.790936-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.60
Content-Transfer-Encoding: 8bit

From: Huacai Chen <chenhuacai@loongson.cn>

[ Upstream commit 449c2756c2323c9e32b2a2fa9c8b59ce91b5819d ]

Export symbol invalid_pud_table for modules building (such as the KVM
module) if 4-level page tables enabled. Otherwise we get:

ERROR: modpost: "invalid_pud_table" [arch/loongarch/kvm/kvm.ko] undefined!

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/loongarch/mm/init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index c7e9c96719fa3..c74da7770e39e 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -228,6 +228,7 @@ pgd_t swapper_pg_dir[_PTRS_PER_PGD] __section(".bss..swapper_pg_dir");
 pgd_t invalid_pg_dir[_PTRS_PER_PGD] __page_aligned_bss;
 #ifndef __PAGETABLE_PUD_FOLDED
 pud_t invalid_pud_table[PTRS_PER_PUD] __page_aligned_bss;
+EXPORT_SYMBOL(invalid_pud_table);
 #endif
 #ifndef __PAGETABLE_PMD_FOLDED
 pmd_t invalid_pmd_table[PTRS_PER_PMD] __page_aligned_bss;
-- 
2.42.0

