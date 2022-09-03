Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9977E1FA3
	for <loongarch@lists.linux.dev>; Sat,  3 Sep 2022 14:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A88C433C1;
	Sat,  3 Sep 2022 14:29:00 +0000 (UTC)
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
Subject: [GIT PULL] LoongArch fixes for v6.0-rc4
Date: Sat,  3 Sep 2022 22:28:23 +0800
Message-Id: <20220903142823.3436925-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b90cb1053190353cc30f0fef0ef1f378ccc063c5:

  Linux 6.0-rc3 (2022-08-28 15:05:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.0-2

for you to fetch changes up to ac9284db6b7b4af150940186b633a233d4ca2bed:

  LoongArch: mm: Remove the unneeded result variable (2022-09-03 18:01:27 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.0-rc4

Fix several build errors or warnings, cleanup some code, and adjust
arch_do_signal_or_restart() to adapt generic entry.
----------------------------------------------------------------
Ard Biesheuvel (1):
      LoongArch: Avoid orphan input sections

Huacai Chen (3):
      LoongArch: Adjust arch_do_signal_or_restart() to adapt generic entry
      LoongArch: Improve dump_tlb() output messages
      LoongArch: Fix section mismatch due to acpi_os_ioremap()

Yupeng Li (1):
      LoongArch: Fix arch_remove_memory() undefined build error

ye xingchen (1):
      LoongArch: mm: Remove the unneeded result variable

 arch/loongarch/Kconfig              |  2 ++
 arch/loongarch/include/asm/acpi.h   |  2 +-
 arch/loongarch/kernel/acpi.c        |  2 +-
 arch/loongarch/kernel/signal.c      |  4 ++--
 arch/loongarch/kernel/vmlinux.lds.S |  2 ++
 arch/loongarch/lib/dump_tlb.c       | 26 +++++++++++++-------------
 arch/loongarch/mm/init.c            | 19 +++++++------------
 7 files changed, 28 insertions(+), 29 deletions(-)
