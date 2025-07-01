Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26EA0223DFB
	for <loongarch@lists.linux.dev>; Tue,  1 Jul 2025 03:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751339339; cv=none; b=D6d346YspquUohhdQw0DI/sknWsd00Yd577N0gtTch4A0DV8B7MUf01pCuOCyb+MHjrn40rN2L4AHr9hXQcs5feUybKPYXms2UPggCPuLRUEmHhqM4fikoH2O6YNIax5WEg+gv1Ms9I3FHGwLfQWAmjsDSGAaSwXjmd5g4DF+k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751339339; c=relaxed/simple;
	bh=afqbiV2IJGeJIlyLZ8DsShl+0u4wGmjx3/Q6/Mi/jNw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F7KXNcW21JwDt8JXh8u0YhKpH+XO8NrFo91LmFFqO4/6Yq6Dr9BDX9t4dox40LAGgKGi2F3BXzB8MJTWrGS2mG0HDoNX1zcSbl5FNNPoYjtzX5LjP3WTq0TetTTmUH/bZR84i3wKOk8/BpNhG1HzSkDbuNU94MO5m48MgtjGHzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxQK1HUWNowE4gAQ--.53465S3;
	Tue, 01 Jul 2025 11:08:55 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJBxpeQ7UWNolGYEAA--.27732S10;
	Tue, 01 Jul 2025 11:08:55 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xianglai Li <lixianglai@loongson.cn>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/13] LoongArch: KVM: Use concise api __ffs()
Date: Tue,  1 Jul 2025 11:08:37 +0800
Message-Id: <20250701030842.1136519-9-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250701030842.1136519-1-maobibo@loongson.cn>
References: <20250701030842.1136519-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxpeQ7UWNolGYEAA--.27732S10
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Function __ffs() is simpler than API find_first_bit() since parameter
data is unsigned long type.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/intc/eiointc.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/eiointc.c
index 31f2c7476d6f..5b5b3a73a4fb 100644
--- a/arch/loongarch/kvm/intc/eiointc.c
+++ b/arch/loongarch/kvm/intc/eiointc.c
@@ -471,7 +471,7 @@ static int loongarch_eiointc_writeq(struct kvm_vcpu *vcpu,
 				struct loongarch_eiointc *s,
 				gpa_t addr, const void *val)
 {
-	int i, index, irq, bits, ret = 0;
+	int i, index, irq, ret = 0;
 	u8 cpu;
 	u64 data, old_data;
 	gpa_t offset;
@@ -528,12 +528,10 @@ static int loongarch_eiointc_writeq(struct kvm_vcpu *vcpu,
 		/* write 1 to clear interrupt */
 		s->coreisr.reg_u64[cpu][index] = old_data & ~data;
 		data &= old_data;
-		bits = sizeof(data) * 8;
-		irq = find_first_bit((void *)&data, bits);
-		while (irq < bits) {
-			eiointc_update_irq(s, irq + index * bits, 0);
-			bitmap_clear((void *)&data, irq, 1);
-			irq = find_first_bit((void *)&data, bits);
+		while (data) {
+			irq = __ffs(data);
+			eiointc_update_irq(s, irq + index * 64, 0);
+			data &= ~BIT_ULL(irq);
 		}
 		break;
 	case EIOINTC_COREMAP_START ... EIOINTC_COREMAP_END:
-- 
2.39.3

