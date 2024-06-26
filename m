Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BE113A88B
	for <loongarch@lists.linux.dev>; Wed, 26 Jun 2024 06:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719383569; cv=none; b=Dm8bhMZCjt5TFrmgzx1UCfOkRsaOevxrpn31CmXJloYn4suHX0grMFpzsSmMgztSTNia0esjIAQPTKBOk5g3dhtSQRB4NF1vlT33ScV/DAhZdAd9PcEv0PxsLuwc4jMWPWSxqqHRfD1+6u1H7q55fQva47vgzCnomTCVG2kPdqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719383569; c=relaxed/simple;
	bh=04LylK4WLFzgwQvnXifumbQ9XXXgzpCJwzHl8Nf3rRM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=piyHsOXLZMphDBx6C2ec6tHKukhrDkcTsawNirUh8kUKZ9pUKE3BPLRMBXwipGTZWV3WtiQ4DlcouIShQH4dwWQVqqQHcb34YCubnE2kazcnqgzCDfyUtLGg6zCeU/1b0xDbbqTEz/043eoPa1BGKUWfjvQFdHl1b3i0f/aziKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Bxb+sItntm+SkKAA--.40649S3;
	Wed, 26 Jun 2024 14:32:40 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxHMcHtntmo5ExAA--.53222S2;
	Wed, 26 Jun 2024 14:32:39 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] LoongArch: KVM: Add Binary Translation extension support
Date: Wed, 26 Jun 2024 14:32:36 +0800
Message-Id: <20240626063239.3722175-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxHMcHtntmo5ExAA--.53222S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Loongson Binary Translation (LBT) is used to accelerate binary
translation, which contains 4 scratch registers (scr0 to scr3), x86/ARM
eflags (eflags) and x87 fpu stack pointer (ftop).

Like FPU extension, here late enabling method is used for LBT. LBT context
is saved/restored on vcpu context switch path.

Also this patch set BT capability detection, and BT register get/set
interface for userspace vmm, so that vm supports migration with BT
extension.

---
v3 ... v4:
  1. Merge LBT feature detection for VM and VCPU into one patch.
  2. Move function declaration such as kvm_lose_lbt()/kvm_check_fcsr()/
kvm_enable_lbt_fpu() from header file to c file, since it is only
used in one c file.

v2 ... v3:
  1. Split KVM_LOONGARCH_VM_FEAT_LBT capability checking into three
sub-features, KVM_LOONGARCH_VM_FEAT_X86BT/KVM_LOONGARCH_VM_FEAT_ARMBT
and KVM_LOONGARCH_VM_FEAT_MIPSBT. Return success only if host supports
the sub-feature.

v1 ... v2:
  1. With LBT register read or write interface to userpace, replace
device attr method with KVM_GET_ONE_REG method, since lbt register is
vcpu register and can be added in kvm_reg_list in future.
  2. Add vm device attr ctrl marcro KVM_LOONGARCH_VM_FEAT_CTRL, it is
used to get supported LBT feature before vm or vcpu is created.
---
Bibo Mao (3):
  LoongArch: KVM: Add HW Binary Translation extension support
  LoongArch: KVM: Add LBT feature detection function
  LoongArch: KVM: Add vm migration support for LBT registers

 arch/loongarch/include/asm/kvm_host.h |   8 ++
 arch/loongarch/include/asm/kvm_vcpu.h |  10 +++
 arch/loongarch/include/uapi/asm/kvm.h |  15 ++++
 arch/loongarch/kvm/exit.c             |   9 ++
 arch/loongarch/kvm/vcpu.c             | 121 +++++++++++++++++++++++++-
 arch/loongarch/kvm/vm.c               |  44 +++++++++-
 6 files changed, 205 insertions(+), 2 deletions(-)


base-commit: 55027e689933ba2e64f3d245fb1ff185b3e7fc81
-- 
2.39.3

