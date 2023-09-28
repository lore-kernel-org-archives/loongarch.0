Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DB238DF9
	for <loongarch@lists.linux.dev>; Thu, 28 Sep 2023 15:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32547C433C8;
	Thu, 28 Sep 2023 15:26:02 +0000 (UTC)
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
Subject: [GIT PULL] LoongArch fixes for v6.6-rc4
Date: Thu, 28 Sep 2023 23:25:35 +0800
Message-Id: <20230928152535.2617047-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6465e260f48790807eef06b583b38ca9789b6072:

  Linux 6.6-rc3 (2023-09-24 14:31:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.6-2

for you to fetch changes up to b1dc55a3d6a86cc2c1ae664ad7280bff4c0fc28f:

  LoongArch: Add support for 64_PCREL relocation type (2023-09-27 16:19:13 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.6-rc4

Fix high_memory calculation and module loader errors with latest binutils.
----------------------------------------------------------------
Huacai Chen (1):
      LoongArch: numa: Fix high_memory calculation

Tiezhu Yang (3):
      LoongArch: Define relocation types for ABI v2.10
      LoongArch: Add support for 32_PCREL relocation type
      LoongArch: Add support for 64_PCREL relocation type

 arch/loongarch/include/asm/elf.h |  9 +++++++++
 arch/loongarch/kernel/module.c   | 22 +++++++++++++++++++++-
 arch/loongarch/kernel/numa.c     |  2 +-
 3 files changed, 31 insertions(+), 2 deletions(-)
