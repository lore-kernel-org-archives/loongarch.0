Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9DF22F148
	for <loongarch@lists.linux.dev>; Wed, 15 Jan 2025 02:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736908868; cv=none; b=K0dPWNbZ+rmOUGZ6f/wIjiFJtWyCC1zI1Au4/Niy4PCAEmiPzHDkQo2r2eWyXe0H6saHCCEn4NukG9OXKPEf9oVf63DhP/VImQUfnI8bjSjfEwrV+NI0xQHFTvqB4Yh5wch8m5feE9jGC2sX6mo3qZXjdbXkqvGGUfWf6G7dMSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736908868; c=relaxed/simple;
	bh=mXezzYPrWVP6C/CeuVPlU6hV5c8VGCFZ/3yUTN2Qm+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jJHpc08wkxAVD4LhIxagnef6naGLWbvZ7THeK1Q6gp5p/kO8aPy2ZJEN2d2x4ukWVTxStgMAVIX4GCnLfEDqYeNudaLgqookqQxsngAUegykfnLzF50db2GxxpbRSPlErNctxTBqALXQELoSkpQ3nxYPSgh7N1btraNMEhoOxFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.63])
	by gateway (Coremail) with SMTP id _____8AxQK0+IIdnrKhjAA--.24672S3;
	Wed, 15 Jan 2025 10:41:02 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
	by front1 (Coremail) with SMTP id qMiowMAxPMU5IIdnpwgjAA--.9762S2;
	Wed, 15 Jan 2025 10:41:01 +0800 (CST)
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
Subject: [GIT PULL] LoongArch KVM changes for v6.14
Date: Wed, 15 Jan 2025 10:40:54 +0800
Message-ID: <20250115024054.147630-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxPMU5IIdnpwgjAA--.9762S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Aw45GF1rJF4kZw47JF4UWrX_yoW8Gw4UpF
	13urnxGrs5GryfArnaqryUuryrJr18Gr1Sqa17Gr1rAF47Ar1UJr18Wrn5WFyUJ348Jr10
	qF1rJwn0gF1UJ3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8xuctUUUUU==

The following changes since commit 5bc55a333a2f7316b58edc7573e8e893f7acb532:

  Linux 6.13-rc7 (2025-01-12 14:37:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-kvm-6.14

for you to fetch changes up to 2737dee1067c2fc02256b2b15dab158c5e840568:

  LoongArch: KVM: Add hypercall service support for usermode VMM (2025-01-13 21:37:17 +0800)

----------------------------------------------------------------
LoongArch KVM changes for v6.14

1. Clear LLBCTL if secondary mmu mapping changed.
2. Add hypercall service support for usermode VMM.

This is a really small changeset, because the Chinese New Year
(Spring Festival) is coming. Happy New Year!

----------------------------------------------------------------
Bibo Mao (2):
      LoongArch: KVM: Clear LLBCTL if secondary mmu mapping is changed
      LoongArch: KVM: Add hypercall service support for usermode VMM

 arch/loongarch/include/asm/kvm_host.h      |  1 +
 arch/loongarch/include/asm/kvm_para.h      |  3 +++
 arch/loongarch/include/asm/kvm_vcpu.h      |  1 +
 arch/loongarch/include/uapi/asm/kvm_para.h |  1 +
 arch/loongarch/kvm/exit.c                  | 30 ++++++++++++++++++++++++++++++
 arch/loongarch/kvm/main.c                  | 18 ++++++++++++++++++
 arch/loongarch/kvm/vcpu.c                  |  7 ++++++-
 7 files changed, 60 insertions(+), 1 deletion(-)

