Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFBBEA2
	for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 02:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13495C433D6;
	Thu, 29 Sep 2022 02:44:40 +0000 (UTC)
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
Subject: [GIT PULL] LoongArch fixes for v6.0-final
Date: Thu, 29 Sep 2022 10:42:56 +0800
Message-Id: <20220929024256.319721-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f76349cf41451c5c42a99f18a9163377e4b364ff:

  Linux 6.0-rc7 (2022-09-25 14:01:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.0-3

for you to fetch changes up to 4f196cb64b693c64f8f981432b1ff326b7ea1c28:

  LoongArch: Clean up loongson3_smp_ops declaration (2022-09-29 10:15:00 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.0-final

Some trivial fixes and cleanup.
----------------------------------------------------------------
Huacai Chen (2):
      LoongArch: Align the address of kernel_entry to 4KB
      LoongArch: Fix and cleanup csr_era handling in do_ri()

Yanteng Si (1):
      LoongArch: Clean up loongson3_smp_ops declaration

 arch/loongarch/include/asm/loongson.h |  2 --
 arch/loongarch/kernel/head.S          |  2 ++
 arch/loongarch/kernel/traps.c         | 15 ++-------------
 3 files changed, 4 insertions(+), 15 deletions(-)
