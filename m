Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151103822A3
	for <loongarch@lists.linux.dev>; Mon, 30 Mar 2026 03:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774843126; cv=none; b=Jj49HRlFxg6MEH23NcKazpZn9rA85LzEfTz4Gt5f33NcUaQehPTQSsp4XpSaGgHJOaCeerEip9qoroBxJh4R5RSVsknnYVAAlcnadza1Yp2bzdI7DSM8aWeGMoqW4CTWX+fmw54tkwodbd2fyo9oMhLKZtUkBWfC1NDT6JWDYf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774843126; c=relaxed/simple;
	bh=Q/Qqosef7fd+GnpzML4D9oYplAc7kKtnLiWwgG1E/ek=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dVlmBJ+95qpDK7ybiKXHyD0T3dYDAcN7fHhphXdDAaxFnITV2Ue00P5dzYY3kcCqCk0ClsAVBqPRwUT+s8SrtywJrHEKrX0wy+gHPixZ7T/OjMdQnMYjHtJUzjrHMWBeCUBidqS7yNynvxnqTh9kPsOSq8X+z3Qe+uO94o/ZFpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8BxD6rr9MlpOdIfAA--.31456S3;
	Mon, 30 Mar 2026 11:58:35 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJCx_8Lq9MlpwXFgAA--.53173S2;
	Mon, 30 Mar 2026 11:58:34 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] LoongArch: KVM: Set max VM supported FPU type with FPU exception
Date: Mon, 30 Mar 2026 11:58:26 +0800
Message-Id: <20260330035832.2204720-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx_8Lq9MlpwXFgAA--.53173S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

With FPU save and restore flow, the cost is the same with different
FPU width 8/16/32 bytes, whatever from CPU cycle and cache line impaction.

Here is to enable FPU with max VM supported type, for example if
VM supports LASX instrction, enable FPU with LASX type even with FPU
exeception. So it can avoid possible LSX/LASX exception in future.

With context switch microbench which may touch FPU and LASX, there is 9%
improvement when halt_poll_ns is disabled. The command is
"./context --test=pipe" and source code located at:
  https://github.com/bibo-mao/context_switch/blob/main/context.c

Original     Wih patch      improvement
75232        82440          9%

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
v1 ... v2:
  1. Enable FPU with max VM supported FPU type, rather than max used type.
  2. Add new request bit KVM_REQ_LBT_LOAD for LBT restore
  3. Rename KVM_REQ_AUX_LOAD with KVM_REQ_FPU_LOAD
  3. Remove aux_ldtype and KVM_LARCH_LSX/KVM_LARCH_LSX
  4. Remove middle FPU state handling in kvm_own_lsx() and kvm_own_lasx(),
     directly enable LSX or LASX from FPU none state.
---
Bibo Mao (6):
  LoongArch: KVM: Add separate KVM_REQ_LBT_LOAD request bit
  LoongArch: KVM: Enable FPU with max VM supported FPU type
  LoongArch: KVM: Rename KVM_REQ_AUX_LOAD with KVM_REQ_FPU_LOAD
  LoongArch: KVM: Remove some middle FPU states
  LoongArch: KVM: Use vm_guest_has_fpu API in kvm_lose_fpu()
  LoongArch: KVM: Remove KVM_LARCH_LASX and KVM_LARCH_LSX

 arch/loongarch/include/asm/kvm_host.h |  6 +--
 arch/loongarch/kvm/exit.c             | 21 +++-----
 arch/loongarch/kvm/vcpu.c             | 78 ++++++++-------------------
 3 files changed, 30 insertions(+), 75 deletions(-)


base-commit: 7aaa8047eafd0bd628065b15757d9b48c5f9c07d
-- 
2.39.3

