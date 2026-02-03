Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC1A1EFF8D
	for <loongarch@lists.linux.dev>; Tue,  3 Feb 2026 03:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770089502; cv=none; b=tZvdTZN+I+uHN/Vyl44ZdKWyneqiDIt9QTWpBh2MId9HNxuH5p6cmQCwA/ALKum/0MpmyN9LCR7PnsIYLf5cvKVZus3HKt5z1YTtZDb4S21AkHzCBP0RvNSGxm0VA7NJpjqfk7KrLp9Xsi16mZduK5JyaqHKIDZJaBQqB2WX7VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770089502; c=relaxed/simple;
	bh=xC/mBpkw8yThP6c9unSLcf5AI5sUC6VB5UXkswDOcx4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=boUedxbGN5+vO/8yAN2bTLcYTRC0iOFrr9YLDPVo9CTY6imGb7YDcHMDC8ELS2NFmRxhLxhQvDECVuHrzwxKdUOMfYMKQlphdQGkYviRVx3NYeFYQnxGgZcUuXy/X3ehuJeXtKFA1wXceNee/EY/uGz0kmPm2Dr388zq4EweHp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8DxecIWbIFp2TwPAA--.49002S3;
	Tue, 03 Feb 2026 11:31:34 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJAxGMEVbIFpbtk+AA--.37628S2;
	Tue, 03 Feb 2026 11:31:34 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH v3 0/4] LoongArch: KVM: Add FPU delay load support
Date: Tue,  3 Feb 2026 11:31:27 +0800
Message-Id: <20260203033131.3372834-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxGMEVbIFpbtk+AA--.37628S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

FPU is lazy enabled in KVM hypervisor. After FPU is enabled and loaded,
vCPU can be preempted and FPU will be lost, there will be FPU exception
and FPU load again.

Here FPU is delay load until guest enter entry.

---
v2 ... v3:
  1. Add LBT delay load support also.

v1 ... v2:
  1. Keep funtion trace_kvm_aux() with FPU restore called still, only
     remove preempt disable/enable API call.
  2. Use one KVM_REQ_FPU_LOAD request bit and add fpu_load_type int
     type, remove KVM_REQ_LSX_LOAD/KVM_REQ_LASX_LOAD request bit
---
Bibo Mao (4):
  LoongArch: KVM: Move LSX capability check in LSX exception handler
  LoongArch: KVM: Move LASX capability check in LASX exception handler
  LoongArch: KVM: Move LBT capability checking in LBT exception handler
  LoongArch: KVM: Add FPU delay load support

 arch/loongarch/include/asm/kvm_host.h |  2 ++
 arch/loongarch/kvm/exit.c             | 21 +++++++++---
 arch/loongarch/kvm/vcpu.c             | 46 +++++++++++++++------------
 3 files changed, 44 insertions(+), 25 deletions(-)


base-commit: dee65f79364c18033cabdf0728c7e7025405cf40
-- 
2.39.3

