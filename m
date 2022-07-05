Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356FB7C
	for <loongarch@lists.linux.dev>; Tue,  5 Jul 2022 15:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7A7C341CE;
	Tue,  5 Jul 2022 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657036050;
	bh=W1o4tQ4Mz3yoPsyKuae5TVdq4NrS0aa2i1+psL/+Jzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DEfK8Os2RNMFDVBTWjxNgDTEPS8wthdO66zbpawEt8SntE3Gem+uOfoOVr1jP2d7G
	 f/+L5+3qkfuwfOtVOkOK2iql5WDDuGalOI9a6yP7sallTvGc+gEKVW1lSd1d0y/Ge3
	 5WWv4FT+kjQhWlHc2E9QAh+W0dPydj21sRt9ExoLFSn9bKzKrBvdaqbM24DFa6y4jw
	 mxAPtkl0UzXEmzdGHBq1otPtO9TjqGJusv/EBXZiS+gRTB8pqpwgJ+ChLKJ3SbP2Cl
	 d5WIiwoBNelFfQKQvGe1DwdURYY1/7tMsrWUgPXmyqwlel9eyAb1Uz5bRvO6UyRw+k
	 dGBgMuJFIJMqQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Matthew Wilcox <willy@infradead.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Mike Rapoport <rppt@linux.ibm.com>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-parisc@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	loongarch@lists.linux.dev
Subject: [PATCH v2 01/15] csky: drop definition of PTE_ORDER
Date: Tue,  5 Jul 2022 18:46:54 +0300
Message-Id: <20220705154708.181258-2-rppt@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705154708.181258-1-rppt@kernel.org>
References: <20220705154708.181258-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mike Rapoport <rppt@linux.ibm.com>

This is the order of the page table allocation, not the order of a PTE.
Since its always hardwired to 0, simply drop it.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Acked-by: Guo Ren <guoren@kernel.org>
---
 arch/csky/include/asm/pgtable.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/csky/include/asm/pgtable.h b/arch/csky/include/asm/pgtable.h
index bbe245117777..f8bb1e12334b 100644
--- a/arch/csky/include/asm/pgtable.h
+++ b/arch/csky/include/asm/pgtable.h
@@ -19,11 +19,10 @@
  * C-SKY is two-level paging structure:
  */
 #define PGD_ORDER	0
-#define PTE_ORDER	0
 
 #define PTRS_PER_PGD	((PAGE_SIZE << PGD_ORDER) / sizeof(pgd_t))
 #define PTRS_PER_PMD	1
-#define PTRS_PER_PTE	((PAGE_SIZE << PTE_ORDER) / sizeof(pte_t))
+#define PTRS_PER_PTE	(PAGE_SIZE / sizeof(pte_t))
 
 #define pte_ERROR(e) \
 	pr_err("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, (e).pte_low)
-- 
2.34.1

