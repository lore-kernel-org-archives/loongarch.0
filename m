Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3387615AC0
	for <loongarch@lists.linux.dev>; Thu, 19 Oct 2023 08:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C63C433C7;
	Thu, 19 Oct 2023 08:43:16 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v6.6-rc7
Date: Thu, 19 Oct 2023 16:42:27 +0800
Message-Id: <20231019084227.4111684-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 58720809f52779dc0f08e53e54b014209d13eebb:

  Linux 6.6-rc6 (2023-10-15 13:34:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.6-3

for you to fetch changes up to 278be83601dd1725d4732241f066d528e160a39d:

  LoongArch: Disable WUC for pgprot_writecombine() like ioremap_wc() (2023-10-18 08:42:52 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.6-rc7

Fix 4-level pagetable building, disable WUC for pgprot_writecombine()
like ioremap_wc(), use correct annotation for exception handlers, and
a trivial cleanup.
----------------------------------------------------------------
Huacai Chen (2):
      LoongArch: Export symbol invalid_pud_table for modules building
      LoongArch: Replace kmap_atomic() with kmap_local_page() in copy_user_highpage()

Icenowy Zheng (1):
      LoongArch: Disable WUC for pgprot_writecombine() like ioremap_wc()

Tiezhu Yang (1):
      LoongArch: Use SYM_CODE_* to annotate exception handlers

 arch/loongarch/include/asm/io.h           |  5 ++---
 arch/loongarch/include/asm/linkage.h      |  8 +++++++
 arch/loongarch/include/asm/pgtable-bits.h |  4 +++-
 arch/loongarch/kernel/entry.S             |  4 ++--
 arch/loongarch/kernel/genex.S             | 16 +++++++-------
 arch/loongarch/kernel/setup.c             | 10 ++++-----
 arch/loongarch/mm/init.c                  |  9 ++++----
 arch/loongarch/mm/tlbex.S                 | 36 +++++++++++++++----------------
 8 files changed, 51 insertions(+), 41 deletions(-)
