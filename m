Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665C51C3C14
	for <loongarch@lists.linux.dev>; Sat, 26 Apr 2025 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745663028; cv=none; b=vEbhWW5GG1aqgRu2pIC/7jP7Wm4dzVT1p55goQuWgXU8w3gdCrKHGlGxws+lU05GQ5FnL9ZTRYoVilHB2T+xpcdI7cR1Edyr4o1Idr++oZriKlfIe+rF1/0ya4XiPIvxQiMpCxz3k7TjBtL+N+1WtpBWw1QcY4D4XLAv3dfUnSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745663028; c=relaxed/simple;
	bh=ru15U/s3x3GM6bcn/BiGbM2DcGsqFmej86zNWz/DyU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X6SnFavv2RLGrzcauwHzlcUGDB5q8hzr8R7dDukpg+4lJT7s9r9i53a5L5m7yAiqdTyewnWHM46GT3Lf9NdeqQ5alqGBpGbTiSvDqUYsuyiBbi+4Lpmr74EYM/oFey3KB2AfMYfH9Pa7GsqRnB+24X4jikm2+ceOwYEiZYiDmvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.238])
	by gateway (Coremail) with SMTP id _____8BxrnIotAxoPL7GAA--.2060S3;
	Sat, 26 Apr 2025 18:23:36 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.238])
	by front1 (Coremail) with SMTP id qMiowMAxTsUjtAxo456WAA--.42675S2;
	Sat, 26 Apr 2025 18:23:35 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v6.15-rc4
Date: Sat, 26 Apr 2025 18:22:59 +0800
Message-ID: <20250426102259.1232395-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxTsUjtAxo456WAA--.42675S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WryfXFyxWry8JFyxZr4rtFc_yoW8Zw1Dpr
	ya9FnxGr4rGrWfXrnxt34UWrn8tr1xGr1SqF43try8Ar1UZr1UW348Xr97XFyUJ3yfJr40
	qr1rGw4YgF1UJ3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e259b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.15-1

for you to fetch changes up to 5add0dbbebd60628b55e5eb8426612dedab7311a:

  LoongArch: KVM: Fix PMU pass-through issue if VM exits to host finally (2025-04-26 09:58:13 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.15-rc4

Add a missing Kconfig option, fix some bugs about exception handler,
memory management and KVM.
----------------------------------------------------------------
Bibo Mao (2):
      LoongArch: KVM: Fully clear some CSRs when VM reboot
      LoongArch: KVM: Fix PMU pass-through issue if VM exits to host finally

Ming Wang (1):
      LoongArch: Return NULL from huge_pte_offset() for invalid PMD

Petr Tesarik (1):
      LoongArch: Remove a bogus reference to ZONE_DMA

Tiezhu Yang (3):
      LoongArch: Make regs_irqs_disabled() more clear
      LoongArch: Make do_xyz() exception handlers more robust
      LoongArch: Handle fp, lsx, lasx and lbt assembly symbols

Yuli Wang (1):
      LoongArch: Select ARCH_USE_MEMTEST

Yulong Han (1):
      LoongArch: KVM: Fix multiple typos of KVM code

 arch/loongarch/Kconfig              |  1 +
 arch/loongarch/include/asm/fpu.h    | 39 ++++++++++++++++++++++---------------
 arch/loongarch/include/asm/lbt.h    | 10 +++++++---
 arch/loongarch/include/asm/ptrace.h |  4 ++--
 arch/loongarch/kernel/fpu.S         |  6 ++++++
 arch/loongarch/kernel/lbt.S         |  4 ++++
 arch/loongarch/kernel/signal.c      | 21 --------------------
 arch/loongarch/kernel/traps.c       | 20 +++++++++++--------
 arch/loongarch/kvm/intc/ipi.c       |  4 ++--
 arch/loongarch/kvm/main.c           |  4 ++--
 arch/loongarch/kvm/vcpu.c           |  8 ++++++++
 arch/loongarch/mm/hugetlbpage.c     |  2 +-
 arch/loongarch/mm/init.c            |  3 ---
 13 files changed, 68 insertions(+), 58 deletions(-)

