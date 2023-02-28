Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B4C81F
	for <loongarch@lists.linux.dev>; Tue, 28 Feb 2023 07:02:11 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8Cxf9uupv1jvWAGAA--.6352S3;
	Tue, 28 Feb 2023 15:01:02 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxc+Wppv1jPG9AAA--.15462S18;
	Tue, 28 Feb 2023 15:01:02 +0800 (CST)
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
	Alex Deucher <alexander.deucher@amd.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	maobibo@loongson.cn,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH v3 16/29] LoongArch: KVM: Implement update VM id function
Date: Tue, 28 Feb 2023 15:00:43 +0800
Message-Id: <20230228070057.3687180-17-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230228070057.3687180-1-zhaotianrui@loongson.cn>
References: <20230228070057.3687180-1-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bxc+Wppv1jPG9AAA--.15462S18
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Aw1kJrWDZF4Dur48Aw1UWrg_yoW8tryDpF
	WxCrn5Wr48Xwnxu3sIqw10qr1Y9395JF13Xa47Ja4Yyr17t3sFkrWvkrWDAFyrXr1rAryx
	XF15tF4YkF18A37anT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bx8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aV
	CY1x0267AKxVWxJr0_GcWln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l
	57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaV
	Av8VWrMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_tr0E3s1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aV
	CY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0zR9iSdUUUUU=

Implement kvm check vmid and update vmid, the vmid should be checked before
vcpu enter guest.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 arch/loongarch/kvm/vmid.c | 65 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 arch/loongarch/kvm/vmid.c

diff --git a/arch/loongarch/kvm/vmid.c b/arch/loongarch/kvm/vmid.c
new file mode 100644
index 000000000000..7d9688c24184
--- /dev/null
+++ b/arch/loongarch/kvm/vmid.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020-2023 Loongson Technology Corporation Limited
+ */
+
+#include <linux/kvm_host.h>
+#include <asm/kvm_host.h>
+#include "trace.h"
+
+static void _kvm_update_vpid(struct kvm_vcpu *vcpu, int cpu)
+{
+	struct kvm_context *context;
+	unsigned long vpid;
+
+	context = per_cpu_ptr(vcpu->kvm->arch.vmcs, cpu);
+	vpid = context->vpid_cache + 1;
+	if (!(vpid & vpid_mask)) {
+		/* finish round of 64 bit loop */
+		if (unlikely(!vpid))
+			vpid = vpid_mask + 1;
+
+		/* vpid 0 reserved for root */
+		++vpid;
+
+		/* start new vpid cycle */
+		kvm_flush_tlb_all();
+	}
+
+	context->vpid_cache = vpid;
+	vcpu->arch.vpid = vpid;
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
+	ver = vcpu->arch.vpid & ~vpid_mask;
+	old = context->vpid_cache  & ~vpid_mask;
+	if (migrated || (ver != old)) {
+		_kvm_update_vpid(vcpu, cpu);
+		trace_kvm_vpid_change(vcpu, vcpu->arch.vpid);
+	}
+
+	/* Restore GSTAT(0x50).vpid */
+	vpid = (vcpu->arch.vpid & vpid_mask)
+		<< CSR_GSTAT_GID_SHIFT;
+	change_csr_gstat(vpid_mask << CSR_GSTAT_GID_SHIFT, vpid);
+}
-- 
2.31.1

