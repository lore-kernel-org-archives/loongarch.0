Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D70C358369
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774187658; cv=none; b=BoL8fY/84ua9+wQeBId6PPLaVc+DYZGvSCzQr0f5Qf+7CqtDYc66e90BkA+o+l0To1lWTIXP3ZfYSSdrnFG9IemUnapejHWVhJgBGC0AAnsDGSGPD/zkUevkEjdnylHtheShnnJ5HQfm6q18sQ22ZQXQrZk/jT8ceSXYgcmz6Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774187658; c=relaxed/simple;
	bh=yk2/iPYEy+ynM7ehu4Ubr2FwrKv8PEKe91/P/QkZhqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oUK01DcN5RbTI85KFQFLHkkDOT4Q19Msv8ehorCH1Bj30Vocp3goGkeR4RlmJaiGoU/0K8oQ7n+fb09cvFfAeyl/4MWEcEEBWXKMXUvhC4tswlvwdLNHDCPGYqvM1vMYqkZSql9fP2U03WD5tRugSocYCijpqhy4TyzRdRK01d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.17])
	by gateway (Coremail) with SMTP id _____8AxScKC9L9pj4sdAA--.20074S3;
	Sun, 22 Mar 2026 21:54:10 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.17])
	by front1 (Coremail) with SMTP id qMiowJAxIMNw9L9pDsVaAA--.39100S3;
	Sun, 22 Mar 2026 21:54:09 +0800 (CST)
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
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org,
	Aurelien Jarno <aurel32@debian.org>
Subject: [PATCH 2/2] LoongArch: KVM: Handle the case that EIOINTC's coremap is empty
Date: Sun, 22 Mar 2026 21:53:46 +0800
Message-ID: <20260322135346.3720577-2-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260322135346.3720577-1-chenhuacai@loongson.cn>
References: <20260322135346.3720577-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxIMNw9L9pDsVaAA--.39100S3
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7XFyUCr4DCry5KrW8AF1kWFX_yoW8Jr1kpF
	W7C39ak3y5GFy3Xa4vqayfWF47Ar95Wr1IqF1UKFyUAFn8XF1rZrWrZr4DXFn0k34rGr40
	qr1xKw1Fva1UAacCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9jb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7IU8EeHDUUUUU==

EIOINTC's coremap in eiointc_update_sw_coremap() can be empty, currently
we get a cpuid with -1 in this case, but we actually need 0 because it's
similar as the case that cpuid >= 4.

This fix an out-of-bounds access to kvm_arch::phyid_map::phys_map[].

Cc: <stable@vger.kernel.org>
Fixes: 3956a52bc05bd81 ("LoongArch: KVM: Add EIOINTC read and write functions")
Reported-by: Aurelien Jarno <aurel32@debian.org>
Link: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1131431
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kvm/intc/eiointc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/eiointc.c
index d2acb4d09e73..c7badc813923 100644
--- a/arch/loongarch/kvm/intc/eiointc.c
+++ b/arch/loongarch/kvm/intc/eiointc.c
@@ -83,7 +83,7 @@ static inline void eiointc_update_sw_coremap(struct loongarch_eiointc *s,
 
 		if (!(s->status & BIT(EIOINTC_ENABLE_CPU_ENCODE))) {
 			cpuid = ffs(cpuid) - 1;
-			cpuid = (cpuid >= 4) ? 0 : cpuid;
+			cpuid = ((cpuid < 0) || (cpuid >= 4)) ? 0 : cpuid;
 		}
 
 		vcpu = kvm_get_vcpu_by_cpuid(s->kvm, cpuid);
-- 
2.52.0

