Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE53723AE
	for <loongarch@lists.linux.dev>; Thu, 24 Nov 2022 09:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B6AC433C1;
	Thu, 24 Nov 2022 09:54:07 +0000 (UTC)
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
Subject: [GIT PULL] LoongArch fixes for v6.1-rc7
Date: Thu, 24 Nov 2022 17:51:20 +0800
Message-Id: <20221124095120.3116780-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit eb7081409f94a9a8608593d0fb63a1aa3d6f95d8:

  Linux 6.1-rc6 (2022-11-20 16:02:16 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.1-2

for you to fetch changes up to fa0e381290b134da53e65fb421b65825f23221b4:

  docs/zh_CN/LoongArch: Fix wrong description of FPRs Note (2022-11-23 10:28:08 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.1-rc7

Fix two build warnings, a copy_thread() bug, two page table manipulation
bugs, and some trivial cleanups.
----------------------------------------------------------------
Huacai Chen (5):
      LoongArch: Combine acpi_boot_table_init() and acpi_boot_init()
      LoongArch: SMP: Change prefix from loongson3 to loongson
      LoongArch: Clear FPU/SIMD thread info flags for kernel thread
      LoongArch: Set _PAGE_DIRTY only if _PAGE_WRITE is set in {pmd,pte}_mkdirty()
      LoongArch: Set _PAGE_DIRTY only if _PAGE_MODIFIED is set in {pmd,pte}_mkwrite()

KaiLong Wang (1):
      LoongArch: Fix unsigned comparison with less than zero

Tiezhu Yang (2):
      LoongArch: Makefile: Use "grep -E" instead of "egrep"
      docs/zh_CN/LoongArch: Fix wrong description of FPRs Note

 .../translations/zh_CN/loongarch/introduction.rst  |  4 +-
 arch/loongarch/Makefile                            |  2 +-
 arch/loongarch/include/asm/irq.h                   |  2 +-
 arch/loongarch/include/asm/pgtable.h               | 16 ++++++--
 arch/loongarch/include/asm/smp.h                   | 30 +++++++--------
 arch/loongarch/kernel/acpi.c                       | 31 +++++----------
 arch/loongarch/kernel/irq.c                        |  2 +-
 arch/loongarch/kernel/process.c                    |  9 +++--
 arch/loongarch/kernel/setup.c                      |  1 -
 arch/loongarch/kernel/smp.c                        | 44 +++++++++++-----------
 arch/loongarch/kernel/unwind_prologue.c            |  3 +-
 11 files changed, 71 insertions(+), 73 deletions(-)
