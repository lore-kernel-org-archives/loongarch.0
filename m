Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75802198
	for <loongarch@lists.linux.dev>; Sat, 29 Jul 2023 03:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97EBBC433C8;
	Sat, 29 Jul 2023 03:17:11 +0000 (UTC)
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
Subject: [GIT PULL] LoongArch fixes for v6.5-rc4
Date: Sat, 29 Jul 2023 11:16:48 +0800
Message-Id: <20230729031648.539276-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6eaae198076080886b9e7d57f4ae06fa782f90ef:

  Linux 6.5-rc3 (2023-07-23 15:24:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.5-1

for you to fetch changes up to 1e74ae32805b6630c78bd7fb746fbfe936fb8f86:

  LoongArch: Cleanup __builtin_constant_p() checking for cpu_has_* (2023-07-28 10:30:42 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.5-rc4

Some bug fixes for build system, builtin cmdline handling, bpf and
{copy, clear}_user, together with a trivial cleanup.

----------------------------------------------------------------
Chenguang Zhao (1):
      LoongArch: BPF: Enable bpf_probe_read{, str}() on LoongArch

Huacai Chen (3):
      LoongArch: Only fiddle with CHECKFLAGS if `need-compiler'
      LoongArch: Fix module relocation error with binutils 2.41
      LoongArch: Cleanup __builtin_constant_p() checking for cpu_has_*

Tiezhu Yang (1):
      LoongArch: BPF: Fix check condition to call lu32id in move_imm()

WANG Rui (1):
      LoongArch: Fix return value underflow in exception path

Zhihong Dong (1):
      LoongArch: Fix CMDLINE_EXTEND and CMDLINE_BOOTLOADER handling

 arch/loongarch/Kconfig           |  1 +
 arch/loongarch/Makefile          |  4 +++-
 arch/loongarch/include/asm/fpu.h | 15 ++++-----------
 arch/loongarch/kernel/setup.c    | 16 ++++++++++++++++
 arch/loongarch/lib/clear_user.S  |  3 ++-
 arch/loongarch/lib/copy_user.S   |  3 ++-
 arch/loongarch/net/bpf_jit.h     |  2 +-
 7 files changed, 29 insertions(+), 15 deletions(-)
