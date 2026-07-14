Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997CD3F39F5
	for <loongarch@lists.linux.dev>; Tue, 14 Jul 2026 07:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784014365; cv=none; b=nXXdEgqGQ5wWqiu5oMmURATYmmztK6w7jvaL7GbsC7meTCiwsk9kSVFdrCewxmZHDGW4w67qPSyEeVbemLm8IsAbpxFotomTGv4HU+rR5mNLK4JwNJ4dSTUD/QZX6n4H28rDG6/bi/ZkJN8vY1Q3GSb9salWI/7TWqVwiS8U5Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784014365; c=relaxed/simple;
	bh=5QuXQTRY9zoxb7Rfm/SQ7/4XLEGBNHIPI5V1y8znjfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ujiGTJIq/YevTRtdgCnm8SJouU+2CzeyBk3ETgPT7At9o21X2a786295UXIbt/WI8UXKHo593zrRpWaPZUN6LCvHQSF9o5ZbPn4fpT/CTNF+gqPqMo+dJ6z9Mf4kK5uaY1AeLe6IM4GaV56Ge6G13qlobSJbuEe/3RH58aoIDak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8DxOOsa5lVqp1MDAA--.13443S3;
	Tue, 14 Jul 2026 15:32:42 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJCxIuQT5lVqzZEMAA--.38917S3;
	Tue, 14 Jul 2026 15:32:42 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Song Gao <gaosong@loongson.cn>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 1/5] LoongArch: KVM: Fix uninitialized stack variable issue with dmsintc
Date: Tue, 14 Jul 2026 15:25:16 +0800
Message-Id: <20260714072520.2745942-2-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20260714072520.2745942-1-maobibo@loongson.cn>
References: <20260714072520.2745942-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxIuQT5lVqzZEMAA--.38917S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Variable vector[] is declared on stack in function dmsintc_inject_irq()
and sometimes it is used without initialized. Here fix this issue.

Fixes: 03de5eecb0f0 ("LoongArch: KVM: Add DMSINTC inject msi to vCPU")
Cc: stable@vger.kernel.org
Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/intc/dmsintc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/kvm/intc/dmsintc.c b/arch/loongarch/kvm/intc/dmsintc.c
index de25735ce039..0a8492c4394c 100644
--- a/arch/loongarch/kvm/intc/dmsintc.c
+++ b/arch/loongarch/kvm/intc/dmsintc.c
@@ -21,6 +21,8 @@ void dmsintc_inject_irq(struct kvm_vcpu *vcpu)
 		old = atomic64_read(&(ds->vector_map[i]));
 		if (old)
 			vector[i] = atomic64_xchg(&(ds->vector_map[i]), 0);
+		else
+			vector[i] = 0;
 	}
 
 	if (vector[0]) {
-- 
2.39.3

