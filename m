Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE162C9C
	for <loongarch@lists.linux.dev>; Sat, 26 Aug 2023 16:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BDFFC433C7;
	Sat, 26 Aug 2023 16:34:57 +0000 (UTC)
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
Subject: [GIT PULL] LoongArch fixes for v6.5-final
Date: Sun, 27 Aug 2023 00:34:27 +0800
Message-Id: <20230826163427.4193691-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 706a741595047797872e669b3101429ab8d378ef:

  Linux 6.5-rc7 (2023-08-20 15:02:52 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.5-2

for you to fetch changes up to 9730870b484e9de852b51df08a8b357b1129489e:

  LoongArch: Fix hw_breakpoint_control() for watchpoints (2023-08-26 22:21:57 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.5-final

Fix a ptrace bug, a hw_breakpoint bug, some build errors/warnings and
some trivial cleanups.

----------------------------------------------------------------
Huacai Chen (2):
      LoongArch: Ensure FP/SIMD registers in the core dump file is up to date
      LoongArch: Fix hw_breakpoint_control() for watchpoints

Masahiro Yamada (3):
      LoongArch: Remove unneeded #include <asm/export.h>
      LoongArch: Replace #include <asm/export.h> with #include <linux/export.h>
      LoongArch: Remove <asm/export.h>

Tiezhu Yang (4):
      LoongArch: Do not kill the task in die() if notify_die() returns NOTIFY_STOP
      LoongArch: Return earlier in die() if notify_die() returns NOTIFY_STOP
      LoongArch: Add identifier names to arguments of die() declaration
      LoongArch: Put the body of play_dead() into arch_cpu_idle_dead()

WANG Xuerui (1):
      LoongArch: Replace -ffreestanding with finer-grained -fno-builtin's

Xi Ruoyao (1):
      LoongArch: Remove redundant "source drivers/firmware/Kconfig"

 arch/loongarch/Kconfig                |  2 --
 arch/loongarch/Makefile               |  2 +-
 arch/loongarch/include/asm/Kbuild     |  1 -
 arch/loongarch/include/asm/fpu.h      | 22 ++++++++++++++++++----
 arch/loongarch/include/asm/ptrace.h   |  2 +-
 arch/loongarch/include/asm/smp.h      |  2 --
 arch/loongarch/kernel/fpu.S           |  2 +-
 arch/loongarch/kernel/hw_breakpoint.c |  3 +--
 arch/loongarch/kernel/mcount.S        |  2 +-
 arch/loongarch/kernel/mcount_dyn.S    |  1 -
 arch/loongarch/kernel/process.c       |  7 -------
 arch/loongarch/kernel/ptrace.c        |  4 ++++
 arch/loongarch/kernel/smp.c           |  2 +-
 arch/loongarch/kernel/traps.c         | 14 ++++++++------
 arch/loongarch/lib/clear_user.S       |  2 +-
 arch/loongarch/lib/copy_user.S        |  2 +-
 arch/loongarch/lib/memcpy.S           |  2 +-
 arch/loongarch/lib/memmove.S          |  2 +-
 arch/loongarch/lib/memset.S           |  2 +-
 arch/loongarch/lib/unaligned.S        |  1 -
 arch/loongarch/mm/page.S              |  2 +-
 arch/loongarch/mm/tlbex.S             |  1 -
 22 files changed, 42 insertions(+), 38 deletions(-)
