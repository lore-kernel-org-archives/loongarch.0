Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B5C33C9
	for <loongarch@lists.linux.dev>; Tue,  7 Feb 2023 14:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1675780169;
	bh=nzxLFo92EKu8lqBicholQ9z2qhCzdQ0w+5WmPOQyusM=;
	h=From:To:Cc:Subject:Date:From;
	b=QQdLesPIv8wFuu49I5y+pGnKnaHKW7WFyZES2AAe3X6A5sA4orv+LHQ0U3QUB7uO/
	 SSMaqVbeQbFFS0joiy6/WbUQnCt1V8oZXPNOTb6bXgO1C8JQvnsTaLvwPm1FLN6KwU
	 tZ1q4WJTf59d16RnMHQPA6XWoJYcLTuUMIvl+TL8=
Received: from xry111-x57s1.. (unknown [IPv6:240e:358:11cc:4100:dc73:854d:832e:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id CD77565DC6;
	Tue,  7 Feb 2023 09:29:21 -0500 (EST)
From: Xi Ruoyao <xry111@xry111.site>
To: Youling Tang <tangyouling@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jinyang He <hejinyang@loongson.cn>
Cc: Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH v2 0/5] LoongArch: Add kernel relocation and KASLR support
Date: Tue,  7 Feb 2023 22:28:17 +0800
Message-Id: <20230207142822.52172-1-xry111@xry111.site>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series to support kernel relocation and KASLR (only 64bit).

I've only tested new toolchains (CONFIG_AS_HAS_EXPLICIT_RELOCS=y)
consisted of Binutils-2.40, and GCC-12.2 heavily patched to support new
relocs.  Unfortunately I've purged my old toolchain installation (because
it contained a buggy GCC-12.1 miscompiling some code).  Please test the
configuration with old toolchain.

Test results with CONFIG_RANDOMIZE_BASE=y on a 3A5000-7A2000-EVB:

First boot:

$ sudo cat /proc/iomem | grep Kernel
  010e0000-018fffff : Kernel code
  01900000-01e4b5ff : Kernel data
  01e4b600-01f56e9f : Kernel bss

Second boot:

$ sudo cat /proc/iomem | grep Kernel
  019a0000-021bffff : Kernel code
  021c0000-0270b5ff : Kernel data
  0270b600-02816e9f : Kernel bss

Changes from v1:

- Relocate the handlers instead of using a trampoline, to avoid
  performance issue on NUMA systems.
- Fix compiler warnings.

Xi Ruoyao (2):
  LoongArch: Use la.pcrel instead of la.abs when it's trivially possible
  LoongArch: Use la.pcrel instead of la.abs for exception handlers

Youling Tang (3):
  LoongArch: Add JUMP_LINK_ADDR macro implementation to avoid using
    la.abs
  LoongArch: Add support for kernel relocation
  LoongArch: Add support for kernel address space layout randomization
    (KASLR)

 arch/loongarch/Kconfig                  |  37 +++++
 arch/loongarch/Makefile                 |   5 +
 arch/loongarch/include/asm/page.h       |   6 +
 arch/loongarch/include/asm/setup.h      |   6 +-
 arch/loongarch/include/asm/stackframe.h |  13 +-
 arch/loongarch/include/asm/uaccess.h    |   1 -
 arch/loongarch/kernel/Makefile          |   2 +
 arch/loongarch/kernel/entry.S           |   2 +-
 arch/loongarch/kernel/genex.S           |  40 ++++-
 arch/loongarch/kernel/head.S            |  30 +++-
 arch/loongarch/kernel/relocate.c        | 211 ++++++++++++++++++++++++
 arch/loongarch/kernel/setup.c           |   3 +
 arch/loongarch/kernel/traps.c           | 138 +++++++++++++---
 arch/loongarch/kernel/vmlinux.lds.S     |  11 +-
 arch/loongarch/mm/tlb.c                 |  23 +--
 arch/loongarch/mm/tlbex.S               |  72 +++++++-
 arch/loongarch/power/suspend_asm.S      |   5 +-
 17 files changed, 543 insertions(+), 62 deletions(-)
 create mode 100644 arch/loongarch/kernel/relocate.c

-- 
2.37.0

