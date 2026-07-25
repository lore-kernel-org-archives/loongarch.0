Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E8E368D71
	for <loongarch@lists.linux.dev>; Sat, 25 Jul 2026 10:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784975883; cv=none; b=hQvjMcrbzNItP97J/Y+pK7CFp+3fg9JdMj+rtqYUY4x2Z92hBBVZdt0kOaSDPGOEnGphHN7ULrb2jwKq77J2rZEjU4ZsRsFANz6LPhXeyeZC+dt32TTWdXRuxUnhypm55oY00CMAivBt6C2VWgvsM0TCav64+aJioQ1HppFwZUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784975883; c=relaxed/simple;
	bh=9Qt/cKmF3xBi4qLCK7lUq6O6VXb/XVa4yDeyfCR5Afg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KmrnJ8aoDUtSvYyI/cUR55QI8J42Yy77q2f+FatnSWtYRazlhcy8nLrWsJebod8MU7DYZ22KBccQw7cmj1QWkUgXYi9OWuQJbmV3foLbyj+PWipdQc7ZFA1RQiVc+qCJgEbmZQ0FgwoSnpQNigXVMB6v33jcAZ9rTXG6de55v08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.205])
	by gateway (Coremail) with SMTP id _____8BxHJv_kWRqez4HAA--.3071S3;
	Sat, 25 Jul 2026 18:37:51 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.205])
	by front1 (Coremail) with SMTP id qMiowJAxSsTSkWRqfXgYAA--.12749S2;
	Sat, 25 Jul 2026 18:37:11 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v7.2-rc5
Date: Sat, 25 Jul 2026 18:36:58 +0800
Message-ID: <20260725103658.815114-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxSsTSkWRqfXgYAA--.12749S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ur4DGF4DAr45JF43Gr4rZwc_yoW8trW8pr
	Wa9rsxJF48Gr9xX3Zxt34UWr15tr1fG3yxXF13A34rCF1UZr1UXr18JrykXFy7t3yxJw10
	qrn5Wa1UK3WUJ3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

The following changes since commit 1590cf0329716306e948a8fc29f1d3ee87d3989f:

  Linux 7.2-rc4 (2026-07-19 13:54:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.2-1

for you to fetch changes up to 91a70492c03040d51b36f595530d6491d5d6c541:

  platform/loongarch: laptop: Explicitly reset bl_powered state when suspend (2026-07-24 16:33:14 +0800)

----------------------------------------------------------------
LoongArch fixes for v7.2-rc5

Fix some build warnings and errors; move jump_label_init() before
parse_early_param(); retrieve CPU package ID from PPTT when available;
fix some bugs about KGDB, BPF JIT and the laptop platform driver.
----------------------------------------------------------------
George Guo (1):
      LoongArch: Fix address space mismatch in kexec command line lookup

Haoran Jiang (1):
      LoongArch: Fix oops during single-step debugging

Huacai Chen (2):
      LoongArch: Increase TASK_STRUCT_OFFSET up to 2040 for 32BIT
      LoongArch: Fix build errors due to wrong instructions for 32BIT

Kanglong Wang (1):
      LoongArch: Move jump_label_init() before parse_early_param()

Nicholas Dudar (1):
      LoongArch: BPF: Zero-extend signed ALU32 div/mod results

Pu Lehui (1):
      LoongArch: BPF: Fix memory leak in bpf_jit_free()

Rafael J. Wysocki (1):
      platform/loongarch: laptop: Stop setting acpi_device_class()

Rong Bao (1):
      LoongArch: Retrieve CPU package ID from PPTT when available

Zixing Liu (1):
      platform/loongarch: laptop: Explicitly reset bl_powered state when suspend

 arch/loongarch/include/asm/asmmacro.h        |  2 +-
 arch/loongarch/kernel/acpi.c                 | 27 ++++++++++++++++++++++++++-
 arch/loongarch/kernel/kgdb.c                 |  3 ++-
 arch/loongarch/kernel/machine_kexec.c        |  5 ++++-
 arch/loongarch/kernel/rethook_trampoline.S   | 18 +++++++++---------
 arch/loongarch/kernel/setup.c                |  3 +--
 arch/loongarch/kernel/smp.c                  |  4 ++--
 arch/loongarch/net/bpf_jit.c                 |  9 +++++----
 drivers/platform/loongarch/loongson-laptop.c |  4 +---
 9 files changed, 51 insertions(+), 24 deletions(-)

