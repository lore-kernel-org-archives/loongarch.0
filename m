Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1862F22
	for <loongarch@lists.linux.dev>; Fri, 29 Jul 2022 14:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CE0C433C1;
	Fri, 29 Jul 2022 14:42:02 +0000 (UTC)
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
Subject: [GIT PULL] LoongArch fixes for v5.19-final
Date: Fri, 29 Jul 2022 22:42:05 +0800
Message-Id: <20220729144205.3412161-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e0dccc3b76fb35bb257b4118367a883073d7390e:

  Linux 5.19-rc8 (2022-07-24 13:26:27 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-5.19-5

for you to fetch changes up to 45b53c9051770c0d9145083a328548745ee2e75b:

  LoongArch: Fix wrong "ROM Size" of boardinfo (2022-07-29 18:22:33 +0800)

----------------------------------------------------------------
LoongArch fixes for v5.19-final

1, Fix cache size calculation, stack protection attributes, ptrace's
   fpr_set and "ROM Size" in boardinfo;
2, Some cleanups and improvements of assembly.
3, Some cleanups of unused code and useless code.
----------------------------------------------------------------
Bibo Mao (2):
      LoongArch: Remove clock setting during cpu hotplug stage
      LoongArch: Remove unused variables

Huacai Chen (2):
      LoongArch: Disable executable stack by default
      LoongArch: Fix shared cache size calculation

Jun Yi (1):
      LoongArch: Remove useless header compiler.h

Qi Hu (1):
      LoongArch: Fix missing fcsr in ptrace's fpr_set

Tiezhu Yang (1):
      LoongArch: Fix wrong "ROM Size" of boardinfo

WANG Xuerui (8):
      LoongArch: Use ABI names of registers where appropriate
      LoongArch: Use the "jr" pseudo-instruction where applicable
      LoongArch: Use the "move" pseudo-instruction where applicable
      LoongArch: Simplify "BEQ/BNE foo, zero" with BEQZ/BNEZ
      LoongArch: Simplify "BLT foo, zero" with BLTZ
      LoongArch: Simplify "BGT foo, zero" with BGTZ
      LoongArch: Re-tab the assembly files
      LoongArch: Remove several syntactic sugar macros for branches

 arch/loongarch/Kconfig                   |   1 -
 arch/loongarch/include/asm/asmmacro.h    |  12 ---
 arch/loongarch/include/asm/atomic.h      |  37 +++----
 arch/loongarch/include/asm/barrier.h     |   4 +-
 arch/loongarch/include/asm/cmpxchg.h     |   4 +-
 arch/loongarch/include/asm/compiler.h    |  15 ---
 arch/loongarch/include/asm/elf.h         |   2 -
 arch/loongarch/include/asm/futex.h       |  11 +-
 arch/loongarch/include/asm/irqflags.h    |   1 -
 arch/loongarch/include/asm/local.h       |   1 -
 arch/loongarch/include/asm/loongson.h    |  16 +--
 arch/loongarch/include/asm/stacktrace.h  |  12 +--
 arch/loongarch/include/asm/thread_info.h |   4 +-
 arch/loongarch/include/asm/uaccess.h     |   2 +-
 arch/loongarch/kernel/cacheinfo.c        |  11 +-
 arch/loongarch/kernel/entry.S            |   4 +-
 arch/loongarch/kernel/env.c              |  20 ----
 arch/loongarch/kernel/fpu.S              | 174 +++++++++++++++----------------
 arch/loongarch/kernel/genex.S            |  12 +--
 arch/loongarch/kernel/head.S             |   8 +-
 arch/loongarch/kernel/ptrace.c           |  12 ++-
 arch/loongarch/kernel/reset.c            |   1 -
 arch/loongarch/kernel/setup.c            |   2 +-
 arch/loongarch/kernel/smp.c              | 113 +++-----------------
 arch/loongarch/kernel/switch.S           |   4 +-
 arch/loongarch/lib/clear_user.S          |   2 +-
 arch/loongarch/lib/copy_user.S           |   2 +-
 arch/loongarch/lib/delay.c               |   1 -
 arch/loongarch/mm/page.S                 | 118 ++++++++++-----------
 arch/loongarch/mm/tlbex.S                |  98 ++++++++---------
 include/linux/cpuhotplug.h               |   1 -
 31 files changed, 277 insertions(+), 428 deletions(-)
 delete mode 100644 arch/loongarch/include/asm/compiler.h
