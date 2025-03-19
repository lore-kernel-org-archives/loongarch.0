Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1ECB664
	for <loongarch@lists.linux.dev>; Wed, 19 Mar 2025 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376570; cv=none; b=dMb/rT6dduKsaFZnB1tfqb1up5Bn7fE437iv/j9FKGsYDyQbJcXS4jcsTvCbkEuR8m25qouzO/zhUde2IxtMaMrib1XeoO+D3tU+qFKJwKAiMVHmOym2+jqewLhQ2vzRQwz3Ix9zxd//EVBmfnpWljYfTzlpQaftjEH6NQXpLlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376570; c=relaxed/simple;
	bh=4LRZMLzksZxps+TGcvXFGHIVLoGo+zW1O+tuIaJMRns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ogcf4nu4wbPvwuEadEiv8GSFMrX5+6thwnuFpwSm2iRU8HPkYRaNJQ8xzHfBABNkZcBw3Mc1coInzp7ADMjTmfggc1yQguUKNrunnd/LUCMc0+efgL55XnHE+aPuy7o/lrba9CmPcBXfsNd+iFCLGlGpfxLCxS4y0k5vbNW8L9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.198])
	by gateway (Coremail) with SMTP id _____8BxrOJyjtpnG+WcAA--.29232S3;
	Wed, 19 Mar 2025 17:29:22 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.198])
	by front1 (Coremail) with SMTP id qMiowMDxesRrjtpnSmdTAA--.21474S2;
	Wed, 19 Mar 2025 17:29:18 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch KVM changes for v6.15
Date: Wed, 19 Mar 2025 17:29:04 +0800
Message-ID: <20250319092904.3644227-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxesRrjtpnSmdTAA--.21474S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7AFy7ZF48Wr4fAr1fWry5ZFc_yoW8XF47pr
	1a9rnxKr4DGrnxJwnxt34Uurn8JFy8Gr1IqF42yw18AryUAw1UXr18Wrn5XFy5J3yrJry0
	qr18Jw1j9FyUJ3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOuc_UUUUU=

The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1ae1:

  Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-kvm-6.15

for you to fetch changes up to 6bfb3a715de924f8ddd4d782e2e2fdd2f5966fc7:

  LoongArch: KVM: Register perf callbacks for guest (2025-03-18 16:48:08 +0800)

----------------------------------------------------------------
LoongArch KVM changes for v6.15

1. Remove unnecessary header include path.
2. Remove PGD saving during VM context switch.
3. Add perf events support for guest VM.

----------------------------------------------------------------
Bibo Mao (4):
      LoongArch: KVM: Remove PGD saving during VM context switch
      LoongArch: KVM: Add stub for kvm_arch_vcpu_preempted_in_kernel()
      LoongArch: KVM: Implement arch-specific functions for guest perf
      LoongArch: KVM: Register perf callbacks for guest

Masahiro Yamada (1):
      LoongArch: KVM: Remove unnecessary header include path

 arch/loongarch/include/asm/kvm_host.h |  6 ++++++
 arch/loongarch/kernel/asm-offsets.c   |  1 +
 arch/loongarch/kvm/Kconfig            |  1 +
 arch/loongarch/kvm/Makefile           |  2 --
 arch/loongarch/kvm/main.c             |  3 +++
 arch/loongarch/kvm/switch.S           | 12 ++----------
 arch/loongarch/kvm/vcpu.c             | 37 +++++++++++++++++++++++++++++++++++
 7 files changed, 50 insertions(+), 12 deletions(-)

