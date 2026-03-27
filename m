Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919A12DB791
	for <loongarch@lists.linux.dev>; Fri, 27 Mar 2026 15:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774623647; cv=none; b=EKjv6b/bx6dPWt6eOAS6mCFGqd9Fo1J05+Ss6Tjp4lRr8YJZI9Pb+vOHb0sCKXiE8uyu437qRdxrklGuAeKxiOkOSVNrK1Z1bJkVF4B8x8uXJWxTej8OEHQS3uMI+pSqOeaXGurWugO8W1ZXWbJ5IizMkOB48iUI6/ZnmNVRbxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774623647; c=relaxed/simple;
	bh=ralaC8ajk9yCq3zz8x/Zl7i86THiKFa6a1l/pGFrUOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pULXMAUWS7r1yezMR/cKc0QLbAQqfIEJwwn+Zyc2y0/+n6iLzFoJ4WlWgYrDKPHMvMWZIa/y/Yqy/JB9RG/ZMKHHJgzi6MXJa5fzf+k3xoHlOT0Zjit5/ZDDgdGM9jLrCFyPFkP41ifQfZYq0VGkORAX1tg5aKFsb0eoP4Q7VhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.17])
	by gateway (Coremail) with SMTP id _____8BxWcKWm8ZpB1EfAA--.24223S3;
	Fri, 27 Mar 2026 23:00:38 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.17])
	by front1 (Coremail) with SMTP id qMiowJCxdcCPm8ZpTOFeAA--.30343S2;
	Fri, 27 Mar 2026 23:00:36 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v7.0-rc6
Date: Fri, 27 Mar 2026 23:00:16 +0800
Message-ID: <20260327150016.3076455-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxdcCPm8ZpTOFeAA--.30343S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WryDCFWfAFW3CFWkXrW8uFX_yoW8CrWUpr
	13uFn3Jr4rGFyfJrnxt347urn0yFn7Gr17XF47try8Ar1Yvr1UJr48GrWkJFyUt3y8JF10
	qF1rGwnFgF1UJ3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8hiSPUUUUU==

The following changes since commit c369299895a591d96745d6492d4888259b004a9e:

  Linux 7.0-rc5 (2026-03-22 14:42:17 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.0-2

for you to fetch changes up to 6bcfb7f46d667b04bd1a1169ccedf5fb699c60df:

  LoongArch: KVM: Fix base address calculation in kvm_eiointc_regs_access() (2026-03-26 14:29:09 +0800)

----------------------------------------------------------------
LoongArch fixes for v7.0-rc6

Fix missing NULL checks for kstrdup(), workaround LS2K/LS7A GPU DMA hang
bug, emit GNU_EH_FRAME for vDSO correctly, and fix some KVM-related bugs.
----------------------------------------------------------------
Bibo Mao (1):
      LoongArch: KVM: Fix base address calculation in kvm_eiointc_regs_access()

Huacai Chen (3):
      LoongArch: Workaround LS2K/LS7A GPU DMA hang bug
      LoongArch: KVM: Make kvm_get_vcpu_by_cpuid() more robust
      LoongArch: KVM: Handle the case that EIOINTC's coremap is empty

Li Jun (1):
      LoongArch: Fix missing NULL checks for kstrdup()

Xi Ruoyao (1):
      LoongArch: vDSO: Emit GNU_EH_FRAME correctly

 arch/loongarch/include/asm/linkage.h  | 36 ++++++++++++++++
 arch/loongarch/include/asm/sigframe.h |  9 ++++
 arch/loongarch/kernel/asm-offsets.c   |  2 +
 arch/loongarch/kernel/env.c           |  7 ++-
 arch/loongarch/kernel/signal.c        |  6 +--
 arch/loongarch/kvm/intc/eiointc.c     | 16 +++----
 arch/loongarch/kvm/vcpu.c             |  3 ++
 arch/loongarch/pci/pci.c              | 80 +++++++++++++++++++++++++++++++++++
 arch/loongarch/vdso/Makefile          |  4 +-
 arch/loongarch/vdso/sigreturn.S       |  6 +--
 10 files changed, 147 insertions(+), 22 deletions(-)
 create mode 100644 arch/loongarch/include/asm/sigframe.h

