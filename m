Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B3D17D3
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 14:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E0FC3411B;
	Fri, 17 Jun 2022 14:43:24 +0000 (UTC)
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
Subject: [GIT PULL] LoongArch fixes for v5.19-rc3
Date: Fri, 17 Jun 2022 22:44:28 +0800
Message-Id: <20220617144428.569247-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3:

  Linux 5.19-rc2 (2022-06-12 16:11:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-5.19-2

for you to fetch changes up to 03dfb4a3abc4cc497850e6968b59005485592369:

  docs/zh_CN/LoongArch: Fix notes rendering by using reST directives (2022-06-17 22:09:05 +0800)

----------------------------------------------------------------
LoongArch fixes for v5.19-rc3

Add missing ELF_DETAILS in vmlinux.lds.S and fix documents rendering.

----------------------------------------------------------------
Yanteng Si (2):
      docs/LoongArch: Fix notes rendering by using reST directives
      docs/zh_CN/LoongArch: Fix notes rendering by using reST directives

Youling Tang (1):
      LoongArch: vmlinux.lds.S: Add missing ELF_DETAILS

 Documentation/loongarch/introduction.rst           | 15 +++++++++------
 Documentation/loongarch/irq-chip-model.rst         | 22 +++++++++++++---------
 .../translations/zh_CN/loongarch/introduction.rst  | 14 ++++++++------
 .../zh_CN/loongarch/irq-chip-model.rst             | 14 ++++++++------
 arch/loongarch/kernel/vmlinux.lds.S                |  1 +
 5 files changed, 39 insertions(+), 27 deletions(-)
