Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5942FFF95
	for <loongarch@lists.linux.dev>; Fri, 28 Nov 2025 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764323064; cv=none; b=bJj2XdXw2Rxmrs76ClDZVL4HdP5A+3SSowHpWjq74HbC0ARumZ3KsOzOs/X9nTJbwAyUa8sUuCTpWTHUriJjwIqUxfeKg+txY+2Y92MS60T/NE45IdpZ63E1yxPe1o+vyqzawvNa9rjxD8ZY31N4BHyqeY0c7e/RHODJaFbl9eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764323064; c=relaxed/simple;
	bh=UNzCbSy2W2YDrIIKQDgzM+Oe91LtgyoMwXE5MdAHZ/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aADb+ATmc3lV8MkFDRSlHjnnkdawQSXR8kDSvZz6blmDFySRtvGNhFJNayQiRjmYkPicwQvrkEagimUjv8Z/xTD37p7Ng34WKCDnl06aa4wyl6ar1gomjiNkDHzXRZ2sT1ZevxpXruIJz/21U7R0bJcm3XFDZ3zq1m1kkNW6APc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.219])
	by gateway (Coremail) with SMTP id _____8Cxf9PibilpJhApAA--.22233S3;
	Fri, 28 Nov 2025 17:44:02 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.219])
	by front1 (Coremail) with SMTP id qMiowJDxK8HXbilpRe5BAQ--.27776S2;
	Fri, 28 Nov 2025 17:44:01 +0800 (CST)
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
Subject: [GIT PULL] LoongArch KVM changes for v6.19
Date: Fri, 28 Nov 2025 17:43:43 +0800
Message-ID: <20251128094343.621879-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxK8HXbilpRe5BAQ--.27776S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WryDAry8try3tFWUXrykCrX_yoW5Jry5pa
	yfurnxKr4rGFy3Ar9rJ34kXryUtFn7Gr1Iv3W3try8Ar42vry8Jr1xKFykAFy3G3ykJry0
	vFyfGw15W3WUJacCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==

The following changes since commit ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d:

  Linux 6.18-rc7 (2025-11-23 14:53:16 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-kvm-6.19

for you to fetch changes up to 0f90fa6e2e9d98349492d9968c11ceaf2f958c98:

  KVM: LoongArch: selftests: Add time counter test case (2025-11-28 14:49:48 +0800)

----------------------------------------------------------------
LoongArch KVM changes for v6.19

1. Get VM PMU capability from HW GCFG register.
2. Add AVEC basic support.
3. Use 64-bit register definition for EIOINTC.
4. Add KVM timer test cases for tools/selftests.

----------------------------------------------------------------
Bibo Mao (8):
      LoongArch: KVM: Get VM PMU capability from HW GCFG register
      LoongArch: KVM: Use 64-bit register definition for EIOINTC
      KVM: LoongArch: selftests: Add system registers save/restore on exception
      KVM: LoongArch: selftests: Add basic interfaces
      KVM: LoongArch: selftests: Add exception handler register interface
      KVM: LoongArch: selftests: Add timer interrupt test case
      KVM: LoongArch: selftests: Add SW emulated timer test case
      KVM: LoongArch: selftests: Add time counter test case

Song Gao (1):
      LoongArch: KVM: Add AVEC basic support

 arch/loongarch/include/asm/kvm_eiointc.h           |  55 +-----
 arch/loongarch/include/asm/kvm_host.h              |   8 +
 arch/loongarch/include/asm/kvm_vcpu.h              |   1 +
 arch/loongarch/include/asm/loongarch.h             |   2 +
 arch/loongarch/include/uapi/asm/kvm.h              |   1 +
 arch/loongarch/kvm/intc/eiointc.c                  |  80 ++++-----
 arch/loongarch/kvm/interrupt.c                     |  15 +-
 arch/loongarch/kvm/vcpu.c                          |  19 +-
 arch/loongarch/kvm/vm.c                            |  40 +++--
 tools/testing/selftests/kvm/Makefile.kvm           |   1 +
 .../selftests/kvm/include/loongarch/arch_timer.h   |  85 +++++++++
 .../selftests/kvm/include/loongarch/processor.h    |  81 ++++++++-
 .../selftests/kvm/lib/loongarch/exception.S        |   6 +
 .../selftests/kvm/lib/loongarch/processor.c        |  47 ++++-
 tools/testing/selftests/kvm/loongarch/arch_timer.c | 200 +++++++++++++++++++++
 15 files changed, 534 insertions(+), 107 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/loongarch/arch_timer.h
 create mode 100644 tools/testing/selftests/kvm/loongarch/arch_timer.c

