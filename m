Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE9F1DF26B
	for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 12:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755779169; cv=none; b=pjgPdcdXfFAzXqEkkPF6zHMptewNLmykS0RcfVeerULpmSp+NopiooKNKDMiell8BbEIcQVlHoiAFH0hVy+Vfa1mxg/yLqLiGVt2sSUcY7hhKV0oz6WGSZWn5Wlvzu7Nc8l8tx+qnhsGq4oSE86UJ3QP/mzXIQ8rH4K11OAD1fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755779169; c=relaxed/simple;
	bh=YqoTewEht3AiwH7FFwLmhvsXBjLcxSAa1J+T9pF5rb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GZ1S2fHw7z0/C0EYqpEge+8yuyocgdZJ+exizc7/PZ7zoc58p8+QDtZ+sBcZ8wV1Sfs7vMQljKKXK+YprA8ARdsjCjwVHl/OcbQQ0l49SNaQeybKkWZTc+8pcCm/TTzeWoazEKXOwax5l2+VVn7VVnyKGjvzTWX+3Gn4IvbyoNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.89])
	by gateway (Coremail) with SMTP id _____8Dx_tIAEKdoOm4BAA--.2608S3;
	Thu, 21 Aug 2025 20:24:32 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.89])
	by front1 (Coremail) with SMTP id qMiowJCxrsP5D6do3ZldAA--.48716S2;
	Thu, 21 Aug 2025 20:24:31 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v6.17-rc3
Date: Thu, 21 Aug 2025 20:24:10 +0800
Message-ID: <20250821122410.1144154-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxrsP5D6do3ZldAA--.48716S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Wry3Xw45Gry7CFy8tryDtwc_yoW5JF4kpF
	13urnxGF4rGrZ3Xwnxt34UWr15Jr1xGr1jqF47K348Cr1UZr1UJr18XrZ7JFyUJ3yrJr10
	qF1rJr1YgFyUJacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:

  Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.17-1

for you to fetch changes up to 538c06e3964a8e94b645686cc58ccc4a06fa6330:

  LoongArch: KVM: Add address alignment check in pch_pic register access (2025-08-20 22:51:15 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.17-rc3

Fix a lot of build warnings for LTO-enabled objtool check, increase
COMMAND_LINE_SIZE up to 4096, rename a missing GCC_PLUGIN_STACKLEAK
to KSTACK_ERASE, and fix some bugs about arch timer, module loading,
LBT and KVM.
----------------------------------------------------------------
Bibo Mao (3):
      LoongArch: KVM: Make function kvm_own_lbt() robust
      LoongArch: KVM: Fix stack protector issue in send_ipi_data()
      LoongArch: KVM: Add address alignment check in pch_pic register access

Huacai Chen (2):
      LoongArch: Save LBT before FPU in setup_sigcontext()
      LoongArch: Rename GCC_PLUGIN_STACKLEAK to KSTACK_ERASE

Kanglong Wang (1):
      LoongArch: Optimize module load time by optimizing PLT/GOT counting

Ming Wang (1):
      LoongArch: Increase COMMAND_LINE_SIZE up to 4096

Song Gao (1):
      LoongArch: KVM: Use kvm_get_vcpu_by_id() instead of kvm_get_vcpu()

Tiezhu Yang (2):
      objtool/LoongArch: Get table size correctly if LTO is enabled
      LoongArch: Pass annotate-tablejump option if LTO is enabled

Xianglai Li (1):
      LoongArch: Add cpuhotplug hooks to fix high cpu usage of vCPU threads

 arch/loongarch/Makefile                 |  6 ++++++
 arch/loongarch/include/asm/stackframe.h |  2 +-
 arch/loongarch/include/uapi/asm/setup.h |  8 ++++++++
 arch/loongarch/kernel/module-sections.c | 36 ++++++++++++++++-----------------
 arch/loongarch/kernel/signal.c          | 10 ++++-----
 arch/loongarch/kernel/time.c            | 22 ++++++++++++++++++++
 arch/loongarch/kvm/intc/eiointc.c       |  7 ++++++-
 arch/loongarch/kvm/intc/ipi.c           |  8 ++++----
 arch/loongarch/kvm/intc/pch_pic.c       | 10 +++++++++
 arch/loongarch/kvm/vcpu.c               |  8 +++++---
 include/linux/cpuhotplug.h              |  1 +
 tools/objtool/arch/loongarch/special.c  | 23 +++++++++++++++++++++
 12 files changed, 109 insertions(+), 32 deletions(-)
 create mode 100644 arch/loongarch/include/uapi/asm/setup.h

