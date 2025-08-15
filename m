Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363A8298CB7
	for <loongarch@lists.linux.dev>; Fri, 15 Aug 2025 02:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755224793; cv=none; b=tPq0d7f/RDpmxpVChSVndg+ocyoMtI5gGR3WxR4i4I2x1bi6oN/E+8GA7dk9ZU9YFacok37+SOMsv+LPEz5ZZEVlNl4wlr29m9gHxWkWwblmg0N5YnfbAVte/0FK3/y+UtK3A1fvKuQWLUXoM73D30o2GPuDUuAK1+OROlkfkGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755224793; c=relaxed/simple;
	bh=PesLW11khJRpGmSVJfT+LbNggq4Xf0R0wDY67UVzXGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JOEmpNG/ETsksR+Bs+09pUaRUNradbttFgkyOIc43MXBEriHilDhMvWMEsNGNgzLL4QqKM2ljYL43qb4y5jppiq/sS4wHmBCbFOSet5B1pQ4Lc0NKX7WbTCMW3hRvgpEWXn3VPfnMfPPRs7lEuUzJUmOUk3u9j4p62DWyZuHqs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxQK3Ump5oURpAAQ--.39060S3;
	Fri, 15 Aug 2025 10:26:28 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJAxQMLOmp5oMPRMAA--.26771S6;
	Fri, 15 Aug 2025 10:26:28 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xianglai Li <lixianglai@loongson.cn>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] LoongArch: KVM: Make function kvm_own_lbt() robust
Date: Fri, 15 Aug 2025 10:26:21 +0800
Message-Id: <20250815022621.508174-5-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250815022621.508174-1-maobibo@loongson.cn>
References: <20250815022621.508174-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxQMLOmp5oMPRMAA--.26771S6
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Add flag KVM_LARCH_LBT checking in function kvm_own_lbt(), so that
it can be called safely rather than duplicated enabling again.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/vcpu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index d1b8c50941ca..ce478151466c 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -1283,9 +1283,11 @@ int kvm_own_lbt(struct kvm_vcpu *vcpu)
 		return -EINVAL;
 
 	preempt_disable();
-	set_csr_euen(CSR_EUEN_LBTEN);
-	_restore_lbt(&vcpu->arch.lbt);
-	vcpu->arch.aux_inuse |= KVM_LARCH_LBT;
+	if (!(vcpu->arch.aux_inuse & KVM_LARCH_LBT)) {
+		set_csr_euen(CSR_EUEN_LBTEN);
+		_restore_lbt(&vcpu->arch.lbt);
+		vcpu->arch.aux_inuse |= KVM_LARCH_LBT;
+	}
 	preempt_enable();
 
 	return 0;
-- 
2.39.3

