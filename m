Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A36710A19
	for <loongarch@lists.linux.dev>; Sun, 29 Oct 2023 22:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQ+VMYnp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D1AC04E60;
	Sun, 29 Oct 2023 22:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620195;
	bh=ns2PKopBoIS79sjmwtSqYl5R1c41T9jtDzXaqxR3lyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cQ+VMYnpf1Rll9/4gOgHEKxo0EVKpfPr65QxTcKO8/XcAwALQiW99phziSWZP8Ylg
	 P4tPyKroSBbhTqSkPxoLSfLoMFi2Kbq/k1eIMP3cyxtIWIo48Kn5fou2fsyGw1pfmL
	 7xoNo2UMuiKiWY95F1C73eQoKwGSd9qUMkVQ3d58JPSGsOqQ0ShQ7Ph9S9Hhr3G2KW
	 YfuSSdJDETN/XdLVKJLUhHhfuypP2wSRzHP1Kia7h9c4IJ29q2Neuz8HjD2TW/r1Z9
	 Kzpq+MqRN0pjym0SbKUPR3tgRHI6ntzrfA9UHZRNA/Uhc2y1ovhKydkikCYz65eJgP
	 o/rUhZzA0gT4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	maobibo@loongson.cn,
	akpm@linux-foundation.org,
	chenfeiyang@loongson.cn,
	arnd@arndb.de,
	loongarch@lists.linux.dev
Subject: [PATCH AUTOSEL 6.5 41/52] LoongArch: Export symbol invalid_pud_table for modules building
Date: Sun, 29 Oct 2023 18:53:28 -0400
Message-ID: <20231029225441.789781-41-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225441.789781-1-sashal@kernel.org>
References: <20231029225441.789781-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.9
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
index 3b7d8129570b8..51c9a6c90a169 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -267,6 +267,7 @@ pgd_t swapper_pg_dir[_PTRS_PER_PGD] __section(".bss..swapper_pg_dir");
 pgd_t invalid_pg_dir[_PTRS_PER_PGD] __page_aligned_bss;
 #ifndef __PAGETABLE_PUD_FOLDED
 pud_t invalid_pud_table[PTRS_PER_PUD] __page_aligned_bss;
+EXPORT_SYMBOL(invalid_pud_table);
 #endif
 #ifndef __PAGETABLE_PMD_FOLDED
 pmd_t invalid_pmd_table[PTRS_PER_PMD] __page_aligned_bss;
-- 
2.42.0

