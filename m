Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936C817D5
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 02:56:55 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8Bxddh2+OpjZlcAAA--.344S3;
	Tue, 14 Feb 2023 10:56:54 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axeb1w+OpjmZwyAA--.28802S13;
	Tue, 14 Feb 2023 10:56:54 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Mark Brown <broonie@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v1 11/24] LoongArch: KVM: Implement update VM id function
Date: Tue, 14 Feb 2023 10:56:35 +0800
Message-Id: <20230214025648.1898508-12-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230214025648.1898508-1-zhaotianrui@loongson.cn>
References: <20230214025648.1898508-1-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Axeb1w+OpjmZwyAA--.28802S13
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Aw1kJrW5GFWrWry3CF4rZrb_yoW8tFW8pr
	WxCrn5Xr4rXrnxC3sIq3Wvqr1Y93yrGF13XasrAa4Yyry7t3sFkrZYk3yDAFyxXr1rAryI
	qF1FyF4YkF1kA37anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bz8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
	kF7I0E14v26r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l
	57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaV
	Av8VWrMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxG
	rwCF04k20xvE74AGY7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI
	0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Ar0_tr1lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCT
	nIWIevJa73UjIFyTuYvj4RKtC7UUUUU

Implement kvm check vmid and update vmid, the vmid should be checked before
vcpu enter guest.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 arch/loongarch/kvm/vmid.c | 64 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 arch/loongarch/kvm/vmid.c

diff --git a/arch/loongarch/kvm/vmid.c b/arch/loongarch/kvm/vmid.c
new file mode 100644
index 000000000..82729968e
--- /dev/null
+++ b/arch/loongarch/kvm/vmid.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020-2023 Loongson Technology Corporation Limited
+ */
+
+#include <linux/kvm_host.h>
+#include "trace.h"
+
+static void _kvm_update_vpid(struct kvm_vcpu *vcpu, int cpu)
+{
+	struct kvm_context *context;
+	unsigned long vpid;
+
+	context = per_cpu_ptr(vcpu->kvm->arch.vmcs, cpu);
+	vpid = context->vpid_cache + 1;
+	if (!(vpid & context->vpid_mask)) {
+		/* finish round of 64 bit loop */
+		if (unlikely(!vpid))
+			vpid = context->vpid_mask + 1;
+
+		/* vpid 0 reserved for root */
+		++vpid;
+
+		/* start new vpid cycle */
+		kvm_flush_tlb_all();
+	}
+
+	context->vpid_cache = vpid;
+	vcpu->arch.vpid[cpu] = vpid;
+}
+
+void _kvm_check_vmid(struct kvm_vcpu *vcpu, int cpu)
+{
+	struct kvm_context *context;
+	bool migrated;
+	unsigned long ver, old, vpid;
+
+	/*
+	 * Are we entering guest context on a different CPU to last time?
+	 * If so, the VCPU's guest TLB state on this CPU may be stale.
+	 */
+	context = per_cpu_ptr(vcpu->kvm->arch.vmcs, cpu);
+	migrated = (vcpu->arch.last_exec_cpu != cpu);
+	vcpu->arch.last_exec_cpu = cpu;
+
+	/*
+	 * Check if our vpid is of an older version
+	 *
+	 * We also discard the stored vpid if we've executed on
+	 * another CPU, as the guest mappings may have changed without
+	 * hypervisor knowledge.
+	 */
+	ver = vcpu->arch.vpid[cpu] & ~context->vpid_mask;
+	old = context->vpid_cache  & ~context->vpid_mask;
+	if (migrated || (ver != old)) {
+		_kvm_update_vpid(vcpu, cpu);
+		trace_kvm_vpid_change(vcpu, vcpu->arch.vpid[cpu]);
+	}
+
+	/* Restore GSTAT(0x50).vpid */
+	vpid = (vcpu->arch.vpid[cpu] & context->vpid_mask)
+		<< CSR_GSTAT_GID_SHIFT;
+	change_csr_gstat(context->vpid_mask << CSR_GSTAT_GID_SHIFT, vpid);
+}
-- 
2.31.1

