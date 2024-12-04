Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878AA1F759D
	for <loongarch@lists.linux.dev>; Wed,  4 Dec 2024 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733321926; cv=none; b=kKFEDUJA4mTbE0LJf+C9btwoD/92VAPzGWSjLJLSJGf6RnS2glu1gJP400vOtyjPd9QElo5MtZaODyJTZjaVWM4CZcFuJr/Kgr5HpoO/Tn+DAfbhCus1Cn2TmgTDHB5YZcnwvNqPoYvRMWLtu+6wvt+xNkDBGedJdzDlo91iG5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733321926; c=relaxed/simple;
	bh=GmZWMuugyo6caCqVaQEDgXKASXNxQvYls+9mTgX7TaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k41WmTwFt4yiI9TPM5UbEeHwENbi9SF6nYqETjs9m3e5CaDBnbTyQ2Vgx8HxpSMI1khWPjs6LuGy6hQr9dJaQjpJe3BcmjFCPuODdNseIxhsQZ1YXpmsVsYE7m0gV8Sd/BDxpURio1dl4lCi6GkbfLyuzKpr8HLFbNcu4sG1hwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.38])
	by gateway (Coremail) with SMTP id _____8Dx_665ZFBnxcNQAA--.52604S3;
	Wed, 04 Dec 2024 22:18:33 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.38])
	by front1 (Coremail) with SMTP id qMiowMCxecG2ZFBnUrd1AA--.10506S2;
	Wed, 04 Dec 2024 22:18:33 +0800 (CST)
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
Subject: [GIT PULL] LoongArch fixes for v6.13-rc2
Date: Wed,  4 Dec 2024 22:18:18 +0800
Message-ID: <20241204141818.2091423-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxecG2ZFBnUrd1AA--.10506S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFy8AF1xZr15WFWrAF4DKFX_yoW8Ar17pr
	43uFnxJr4rGrn3Jr13tw1DWrn8Jr1xGryaq3W3ArW8Ar4UZr1UXr1rWrykXFyUJ3yxJr1I
	qF1rJw15KF1UJ3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
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
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxU2MKZDUUUU

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.13-1

for you to fetch changes up to 7f71507851fc7764b36a3221839607d3a45c2025:

  LoongArch: KVM: Protect kvm_io_bus_{read,write}() with SRCU (2024-12-03 19:49:28 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.13-rc2

Fix bugs about EFI screen info, hugetlb pte clear and Lockdep-RCU splat
in KVM, plus some trival cleanups.
----------------------------------------------------------------
Bibo Mao (1):
      LoongArch: Add architecture specific huge_pte_clear()

David Wang (1):
      LoongArch/irq: Use seq_put_decimal_ull_width() for decimal values

Huacai Chen (3):
      LoongArch: Fix reserving screen info memory for above-4G firmware
      LoongArch: KVM: Protect kvm_check_requests() with SRCU
      LoongArch: KVM: Protect kvm_io_bus_{read,write}() with SRCU

Tiezhu Yang (1):
      LoongArch: BPF: Adjust the parameter of emit_jirl()

 arch/loongarch/include/asm/hugetlb.h | 10 ++++++++++
 arch/loongarch/include/asm/inst.h    | 12 +++++++++++-
 arch/loongarch/kernel/efi.c          |  2 +-
 arch/loongarch/kernel/inst.c         |  2 +-
 arch/loongarch/kernel/smp.c          |  2 +-
 arch/loongarch/kvm/exit.c            | 31 +++++++++++++++++++++----------
 arch/loongarch/kvm/intc/ipi.c        |  6 +++++-
 arch/loongarch/kvm/vcpu.c            |  4 +++-
 arch/loongarch/net/bpf_jit.c         |  6 +++---
 9 files changed, 56 insertions(+), 19 deletions(-)

