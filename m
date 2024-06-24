Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A248E45BEC
	for <loongarch@lists.linux.dev>; Mon, 24 Jun 2024 07:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719213270; cv=none; b=QeDlYkENKqqRnYm3YBrYUECW7v/+Vj98Mp8doumRkRfVvGJBc0Y0vBgt3iAVhZjcvv2hlr0/8fcJV5XasgTB63GtV6FRScQzU+t7ie53dhoDwLQ0MO16un8+k5+puktR6HqlTddRmZ16jHJvRLqdWyS+3cXNAG2lYT/P9ldP4qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719213270; c=relaxed/simple;
	bh=tMij1kigYbysiBVjoK1zx02otlNc/5BcBakZSzod/Sw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k2zrYqH0SufiUC1xkfQgxCe/gGoXkVkPiPG52OwuZOfqU4o8Vw7VEre6oGRncGcxSHVZKVdnN1W5Q+bR4hYagi88RQkLrVgUySobPov17R9e2SdS0djzPCP8BrXPi6mlSZZq8y+MkHX9Ng97ACyEFJxmA02OYDHztfWjxmSv5XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8CxyOnSHHlmJXEJAA--.25137S3;
	Mon, 24 Jun 2024 15:14:26 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxMMTPHHlmftsuAA--.9847S9;
	Mon, 24 Jun 2024 15:14:25 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Sean Christopherson <seanjc@google.com>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	WANG Rui <wangrui@loongson.cn>
Subject: [PATCH v3 7/7] LoongArch: KVM: Sync pending interrupt when getting ESTAT from user mode
Date: Mon, 24 Jun 2024 15:14:22 +0800
Message-Id: <20240624071422.3473789-8-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240624071422.3473789-1-maobibo@loongson.cn>
References: <20240624071422.3473789-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxMMTPHHlmftsuAA--.9847S9
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Currently interrupt is posted and cleared with asynchronous mode, and it
is saved in SW state vcpu::arch::irq_pending and vcpu::arch::irq_clear.
When vcpu is ready to run, pending interrupt is written back to ESTAT
CSR register from SW state vcpu::arch::irq_pending at guest entrance.

During VM migration stage, vcpu is put into stopped state, however
pending interrupt is not synced to ESTAT CSR register. So there will be
interrupt lost when VCPU is migrated to other host machines.

Here when ESTAT CSR register is read from VMM user mode, pending
interrupt is synchronized to ESTAT also. So that vcpu can get correct
pending interrupt.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/vcpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index b747bd8bc037..6b612b8390f7 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -371,6 +371,17 @@ static int _kvm_getcsr(struct kvm_vcpu *vcpu, unsigned int id, u64 *val)
 		return -EINVAL;
 
 	if (id == LOONGARCH_CSR_ESTAT) {
+		preempt_disable();
+		vcpu_load(vcpu);
+		/*
+		 * Sync pending interrupt into estat so that interrupt
+		 * remains during migration stage
+		 */
+		kvm_deliver_intr(vcpu);
+		vcpu->arch.aux_inuse &= ~KVM_LARCH_SWCSR_LATEST;
+		vcpu_put(vcpu);
+		preempt_enable();
+
 		/* ESTAT IP0~IP7 get from GINTC */
 		gintc = kvm_read_sw_gcsr(csr, LOONGARCH_CSR_GINTC) & 0xff;
 		*val = kvm_read_sw_gcsr(csr, LOONGARCH_CSR_ESTAT) | (gintc << 2);
-- 
2.39.3

