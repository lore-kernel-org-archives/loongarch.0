Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290F284FAD
	for <loongarch@lists.linux.dev>; Thu, 24 Apr 2025 06:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745477193; cv=none; b=kyoFbFXc29XxIGd0AqTgNOTIME17WjJHaxSBC1jbQhYsrMPorPgWOIs18yM335DQOVPrKkl+GE9AYgSIUMWY3lMPg8+PpoYKj3D5ghEQvaeC/sxsHU5ThCLqaeVDLVpArTNgDh2f5l6MOx2NCssLTk6rdcYqtxn+lJb7F14Trdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745477193; c=relaxed/simple;
	bh=V5PXF6w8St5Paxz9hyNzBo921xWGoUUg1XW8O7Zmiuo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LbFvVPApDGyOXblnx3nBYOows2UE9f5mDC43sR7xsavJP9xw9TDtnFmv0n8fj6aSCsw8firY/d18TOs6s3wGB5Tfn6TpjNsV8nfAZ/wk3tNYzxY+Msw5/PDNL31y7Av2OWyCVMtRqKBOR5uHqnEUnZMyUpoCOXS96duATxlunzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxaeBC3gloiR_FAA--.532S3;
	Thu, 24 Apr 2025 14:46:26 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMBxXsVB3gloABqTAA--.39186S2;
	Thu, 24 Apr 2025 14:46:25 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] LoongArch: KVM: Do not flush tlb if HW PTW supported
Date: Thu, 24 Apr 2025 14:46:23 +0800
Message-Id: <20250424064625.3928278-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxXsVB3gloABqTAA--.39186S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

With HW PTW supported, stale TLB is not added if page fault happens. With
EXCCODE_TLBM exception, stale TLB may exist because last read access, tlb
flush operation is necessary with EXCCODE_TLBM exception, and not necessary
with other memory page fault exceptions.

With SW PTW supported, invalid TLB is added in TLB refill exception.
TLB flush operation is necessary with all page fault exceptions.

Bibo Mao (2):
  LoongArch: KVM: Add parameter exception code with exception handler
  LoongArch: KVM: Do not flush tlb if HW PTW supported

 arch/loongarch/include/asm/kvm_host.h |  2 +-
 arch/loongarch/include/asm/kvm_vcpu.h |  2 +-
 arch/loongarch/kvm/exit.c             | 34 +++++++++++++--------------
 arch/loongarch/kvm/mmu.c              | 17 ++++++++++----
 4 files changed, 31 insertions(+), 24 deletions(-)


base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
-- 
2.39.3

