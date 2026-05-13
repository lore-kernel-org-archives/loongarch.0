Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC7E383327
	for <loongarch@lists.linux.dev>; Wed, 13 May 2026 01:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778637334; cv=none; b=kbUZdDNZ8SjODuHn1T1PR6zohx5CofQXO+0gTnoq/eLbKHhYYXEGuuwiByZXbp+25g2g/omJTtn0hRfln+RBEstA22yo2qI2glRpy2rt9w6CjNslpSWGk1wM8I5MztPo6Vz3aufVgnbkh2G3fIs37rz4SxYZUh2x/FJ8g6Fo4ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778637334; c=relaxed/simple;
	bh=nIgcsWiOuVhi9LKARhImS7e1KVb0gw7qPX51cl1Cm7s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=apsmkMmTRpa2oOpJQDzP3r2/2UWTWwAzZ+OMMfxHbfP0Ghodg74fQKALGbaYyPhSOTGKkJ65ML6AtTatTkg/vIu4OkqUxOCdZ5d3bGyd4CyDKzlGpHE2E0h4iY03u4KeRjqg9dSozAMyIZBknJ0ho4ZNqUYqfxhmSqj6NUfColc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8DxsOoQ2gNq9FkJAA--.28724S3;
	Wed, 13 May 2026 09:55:28 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJDxSMEP2gNqeLyAAA--.34052S2;
	Wed, 13 May 2026 09:55:27 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] LoongArch: KVM: Remove timer interrupt injection with SW timer expired
Date: Wed, 13 May 2026 09:55:25 +0800
Message-Id: <20260513015525.1152240-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxSMEP2gNqeLyAAA--.34052S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

The software timer emulation is to wake up vCPU when vCPU executes idle
instruction and gives up host CPU, vCPU timer tick value and interrupt is
set when vCPU is scheduled in.

It is not necessary to inject timer interrupt when SW timer is expired.
Here remove it, also use common API kvm_vcpu_wake_up to wake up vCPU.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
v1 ... v2:
  1. Use common api kvm_vcpu_wake_up() rather than rcuwait_wake_up.
---
 arch/loongarch/kvm/timer.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/loongarch/kvm/timer.c b/arch/loongarch/kvm/timer.c
index 8356fce0043f..3829f35a4070 100644
--- a/arch/loongarch/kvm/timer.c
+++ b/arch/loongarch/kvm/timer.c
@@ -30,8 +30,7 @@ enum hrtimer_restart kvm_swtimer_wakeup(struct hrtimer *timer)
 	struct kvm_vcpu *vcpu;
 
 	vcpu = container_of(timer, struct kvm_vcpu, arch.swtimer);
-	kvm_queue_irq(vcpu, INT_TI);
-	rcuwait_wake_up(&vcpu->wait);
+	kvm_vcpu_wake_up(vcpu);
 
 	return HRTIMER_NORESTART;
 }

base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.39.3

