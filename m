Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A84E13AD3
	for <loongarch@lists.linux.dev>; Thu, 15 Jun 2023 12:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39EF0C433C8;
	Thu, 15 Jun 2023 12:23:31 +0000 (UTC)
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
Subject: [GIT PULL] LoongArch fixes for v6.4-rc7
Date: Thu, 15 Jun 2023 20:23:11 +0800
Message-Id: <20230615122311.3754870-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 858fd168a95c5b9669aac8db6c14a9aeab446375:

  Linux 6.4-rc6 (2023-06-11 14:35:30 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.4-1

for you to fetch changes up to 41efbb682de1231c3f6361039f46ad149e3ff5b9:

  LoongArch: Fix debugfs_create_dir() error checking (2023-06-15 14:35:56 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.4-rc7

Some trivial bug fixes for v6.4-rc7.
----------------------------------------------------------------
Hongchen Zhang (1):
      LoongArch: Let pmd_present() return true when splitting pmd

Huacai Chen (1):
      LoongArch: Fix perf event id calculation

Immad Mir (1):
      LoongArch: Fix debugfs_create_dir() error checking

Qi Hu (1):
      LoongArch: Fix the write_fcsr() macro

Qing Zhang (1):
      LoongArch: Avoid uninitialized alignment_mask

 arch/loongarch/include/asm/loongarch.h    | 2 +-
 arch/loongarch/include/asm/pgtable-bits.h | 2 ++
 arch/loongarch/include/asm/pgtable.h      | 3 ++-
 arch/loongarch/kernel/hw_breakpoint.c     | 2 ++
 arch/loongarch/kernel/perf_event.c        | 6 +++---
 arch/loongarch/kernel/unaligned.c         | 2 +-
 6 files changed, 11 insertions(+), 6 deletions(-)
