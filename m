Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB1AC133
	for <loongarch@lists.linux.dev>; Sat,  8 Mar 2025 10:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741429492; cv=none; b=gqHgv3ri3QhmdkDJ57OHEOq46qGYCDsNWiKu2XB9L1tqBzpMsRxwDTAnWSTweJJfvcV0kk0T00uUcabpRb3T600nfj75moMmvsJ6azUinjNtD6VckBMykh/US+k5uSHZN89kcSR7w0+jZYyfC++I0dzbUky1qIbwErcXx0zyzvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741429492; c=relaxed/simple;
	bh=yuHqUZKAMZAMTIbjaRmiWha9srQx/kUYPRC2ncRQ/TI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pTgk+bNVU61zzeM30888OkFLfKvwz5N48zCLbiUhImbvZ5xIyUogQfPMXxu+58MnwfuB8QW11RjNFubcmekqozGRuBJps/C2S9nhW0V0kNukj/WeL4a6v9+YfqSu++UvPd70y+zW48IHInSu0kzGsmDzUFkEjXZmS6U+Jc7obv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.156])
	by gateway (Coremail) with SMTP id _____8CxvnLvGsxn7O6OAA--.47659S3;
	Sat, 08 Mar 2025 18:24:47 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.156])
	by front1 (Coremail) with SMTP id qMiowMCxasTmGsxnMyE+AA--.15162S2;
	Sat, 08 Mar 2025 18:24:46 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v6.14-rc6
Date: Sat,  8 Mar 2025 18:24:16 +0800
Message-ID: <20250308102416.3722203-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxasTmGsxnMyE+AA--.15162S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr4kZFWxGF4xur4rZr4rtFc_yoW8Ww1fpr
	yakFsxJr45JrnxJwnxt34Uurn8XryxG347XF4akry8Cr4UAr1UJry8WrWkXFyUt34rJr10
	qr1rJw4jgF1UJagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
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
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:

  Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-fixes-6.14-2

for you to fetch changes up to 6bdbb73dc8d99fbb77f5db79dbb6f108708090b4:

  LoongArch: KVM: Fix GPA size issue about VM (2025-03-08 13:52:04 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.14-rc6

Fix bugs about kernel build, hibernation, memory management and KVM.
----------------------------------------------------------------
Bibo Mao (5):
      LoongArch: Set max_pfn with the PFN of the last page
      LoongArch: Set hugetlb mmap base address aligned with pmd size
      LoongArch: KVM: Add interrupt checking for AVEC
      LoongArch: KVM: Reload guest CSR registers after sleep
      LoongArch: KVM: Fix GPA size issue about VM

Huacai Chen (1):
      LoongArch: Use polling play_dead() when resuming from hibernation

Tiezhu Yang (1):
      LoongArch: Convert unreachable() to BUG()

Yuli Wang (1):
      LoongArch: Eliminate superfluous get_numa_distances_cnt()

 arch/loongarch/kernel/acpi.c          | 12 ---------
 arch/loongarch/kernel/machine_kexec.c |  4 +--
 arch/loongarch/kernel/setup.c         |  3 +++
 arch/loongarch/kernel/smp.c           | 47 ++++++++++++++++++++++++++++++++++-
 arch/loongarch/kvm/exit.c             |  6 +++++
 arch/loongarch/kvm/main.c             |  7 ++++++
 arch/loongarch/kvm/vcpu.c             |  2 +-
 arch/loongarch/kvm/vm.c               |  6 ++++-
 arch/loongarch/mm/mmap.c              |  6 ++++-
 9 files changed, 75 insertions(+), 18 deletions(-)

