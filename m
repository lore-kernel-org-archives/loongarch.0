Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C704D231C91
	for <loongarch@lists.linux.dev>; Sat, 23 May 2026 07:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779521136; cv=none; b=Pala11OlrUktMqXu6bXY2ymUwy11deAj2UFBMB8y8eX/GkXfVq9GaQQdHMZZ+ZjInmkt1Ym2GyvdOq5cKkfXrs4VdSvzUnoSWwzrEqxZGso9CCfJYZW4afHZmDcpsoay7CylddwbQJDalVuHqKQa06aKqTftlGkzE7lZDWSUIZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779521136; c=relaxed/simple;
	bh=AQ3c4I6eiPitzxoeho0O79rvwCxGC8au2CQKy21qeoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FRFs5dStGklj9rzdDlsV7XWPKkOgP9sUjo9AKSlmHAYkpf1QbQ8C4U0V6MHGym87U/jVe7Zw38vmhrrhEK1g1Iiov753r9QkxLXFKiMlQs38jm+MohsI4QglKMb5vNotF0AISzI6P8THTojB3RdvsCgPJrcfV1ekGHcBxeJ28t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8Bxt3hkVhFq0p8MAA--.11998S3;
	Sat, 23 May 2026 15:25:24 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJDxRMBUVhFqoayNAA--.13254S2;
	Sat, 23 May 2026 15:25:23 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v7.1-rc5
Date: Sat, 23 May 2026 15:25:01 +0800
Message-ID: <20260523072501.437301-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxRMBUVhFqoayNAA--.13254S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cr1fWrW8Cry7ArW5Zw15Jrc_yoW8AFW3pF
	y3urnxGr4UGrWfJwnxt3y3ur15Jrn7Gr12qF43Kr18A3WUZr1UXry8Kry8XFyUJ3yUKw1v
	qr18Jw1jgF1UJ3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

The following changes since commit 5200f5f493f79f14bbdc349e402a40dfb32f23c8:

  Linux 7.1-rc4 (2026-05-17 13:59:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.1-2

for you to fetch changes up to 4a09f4a23a3003d31f8545dd0770f2b3b0f54d8b:

  LoongArch: KVM: Move some variable declarations to paravirt.h (2026-05-22 15:05:12 +0800)

----------------------------------------------------------------
LoongArch fixes for v7.1-rc5

Rework KASLR to avoid initrd overlap, remove some unused code to avoid
a build warning, fix some bugs about kprobes and KVM.
----------------------------------------------------------------
Bibo Mao (1):
      LoongArch: KVM: Move some variable declarations to paravirt.h

Huacai Chen (1):
      LoongArch: Remove unused code to avoid build warning

Tiezhu Yang (2):
      LoongArch: kprobes: Use larch_insn_text_copy() to patch instructions
      LoongArch: kprobes: Fix handling of fatal unrecoverable recursions

WANG Rui (3):
      efi/loongarch: Randomize kernel preferred address for KASLR
      LoongArch: Skip relocation-time KASLR if already applied
      LoongArch: Avoid initrd overlap during kernel relocation

 arch/loongarch/include/asm/efi.h               |  4 ++-
 arch/loongarch/include/asm/paravirt.h          |  6 ++++
 arch/loongarch/include/asm/qspinlock.h         |  5 +--
 arch/loongarch/kernel/kprobes.c                | 14 ++++----
 arch/loongarch/kernel/relocate.c               | 50 ++++++++++++++++++++++++++
 arch/loongarch/mm/init.c                       |  4 ---
 drivers/firmware/efi/libstub/efi-stub-helper.c |  4 +++
 drivers/firmware/efi/libstub/loongarch.c       | 16 +++++++++
 8 files changed, 88 insertions(+), 15 deletions(-)

