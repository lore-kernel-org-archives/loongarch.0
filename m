Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ED62CA7
	for <loongarch@lists.linux.dev>; Sat, 23 Sep 2023 09:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B93C433C7;
	Sat, 23 Sep 2023 09:11:00 +0000 (UTC)
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
Subject: [GIT PULL] LoongArch fixes for v6.6-rc3
Date: Sat, 23 Sep 2023 17:10:31 +0800
Message-Id: <20230923091031.1075337-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit ce9ecca0238b140b88f43859b211c9fdfd8e5b70:

  Linux 6.6-rc2 (2023-09-17 14:40:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.6-1

for you to fetch changes up to e74a6b7f3744d122ff4544f19393dfab167166ec:

  docs/zh_CN/LoongArch: Update the links of ABI (2023-09-20 14:26:38 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.6-rc3

Fix lockdep, fix a boot failure, fix some build warnings, fix document
links, and some cleanups.
----------------------------------------------------------------
Andy Shevchenko (1):
      LoongArch: Use _UL() and _ULL()

Bibo Mao (1):
      LoongArch: Fix some build warnings with W=1

Helge Deller (1):
      LoongArch: Fix lockdep static memory detection

Huacai Chen (3):
      LoongArch: Set all reserved memblocks on Node#0 at initialization
      kasan: Cleanup the __HAVE_ARCH_SHADOW_MAP usage
      LoongArch: Don't inline kasan_mem_to_shadow()/kasan_shadow_to_mem()

Tiezhu Yang (3):
      LoongArch: Remove dead code in relocate_new_kernel
      docs/LoongArch: Update the links of ABI
      docs/zh_CN/LoongArch: Update the links of ABI

 Documentation/arch/loongarch/introduction.rst      |  4 +-
 .../zh_CN/arch/loongarch/introduction.rst          |  4 +-
 arch/loongarch/include/asm/addrspace.h             | 12 ++---
 arch/loongarch/include/asm/exception.h             | 45 +++++++++++++++++
 arch/loongarch/include/asm/kasan.h                 | 59 ++++------------------
 arch/loongarch/include/asm/smp.h                   |  1 +
 arch/loongarch/kernel/Makefile                     |  4 ++
 arch/loongarch/kernel/acpi.c                       |  1 -
 arch/loongarch/kernel/mem.c                        |  4 +-
 arch/loongarch/kernel/module-sections.c            |  1 +
 arch/loongarch/kernel/process.c                    |  1 +
 arch/loongarch/kernel/relocate_kernel.S            |  1 -
 arch/loongarch/kernel/signal.c                     |  7 +--
 arch/loongarch/kernel/smp.c                        |  3 ++
 arch/loongarch/kernel/syscall.c                    |  1 +
 arch/loongarch/kernel/time.c                       |  2 +-
 arch/loongarch/kernel/topology.c                   |  3 ++
 arch/loongarch/kernel/traps.c                      | 25 ++-------
 arch/loongarch/kernel/vmlinux.lds.S                | 55 ++++++++++----------
 arch/loongarch/mm/fault.c                          |  2 +-
 arch/loongarch/mm/hugetlbpage.c                    | 12 -----
 arch/loongarch/mm/ioremap.c                        |  1 +
 arch/loongarch/mm/kasan_init.c                     | 51 +++++++++++++++++++
 arch/loongarch/mm/tlb.c                            |  2 +-
 include/linux/kasan.h                              |  2 +-
 mm/kasan/kasan.h                                   |  8 ++-
 26 files changed, 177 insertions(+), 134 deletions(-)
 create mode 100644 arch/loongarch/include/asm/exception.h
