Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B266211700
	for <loongarch@lists.linux.dev>; Thu, 31 Aug 2023 08:30:40 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8DxPOupT_BkhV4dAA--.54726S3;
	Thu, 31 Aug 2023 16:30:33 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax3c6gT_BkOPVnAA--.55892S19;
	Thu, 31 Aug 2023 16:30:33 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	loongarch@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>,
	Mark Brown <broonie@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	maobibo@loongson.cn,
	Xi Ruoyao <xry111@xry111.site>,
	zhaotianrui@loongson.cn
Subject: [PATCH v20 17/30] LoongArch: KVM: Implement virtual machine tlb operations
Date: Thu, 31 Aug 2023 16:30:07 +0800
Message-Id: <20230831083020.2187109-18-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230831083020.2187109-1-zhaotianrui@loongson.cn>
References: <20230831083020.2187109-1-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Ax3c6gT_BkOPVnAA--.55892S19
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Implement LoongArch virtual machine tlb operations such as flush tlb by
specific gpa parameter and flush all of the virt machines tlb.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 arch/loongarch/kvm/tlb.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 arch/loongarch/kvm/tlb.c

diff --git a/arch/loongarch/kvm/tlb.c b/arch/loongarch/kvm/tlb.c
new file mode 100644
index 0000000000..0bcbd80ac6
--- /dev/null
+++ b/arch/loongarch/kvm/tlb.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020-2023 Loongson Technology Corporation Limited
+ */
+
+#include <linux/kvm_host.h>
+#include <asm/tlb.h>
+#include <asm/kvm_csr.h>
+
+int kvm_flush_tlb_gpa(struct kvm_vcpu *vcpu, unsigned long gpa)
+{
+	unsigned long flags;
+
+	local_irq_save(flags);
+	gpa &= (PAGE_MASK << 1);
+	invtlb(INVTLB_GID_ADDR, read_csr_gstat() & CSR_GSTAT_GID, gpa);
+	local_irq_restore(flags);
+	return 0;
+}
+
+/**
+ * kvm_flush_tlb_all() - Flush all root TLB entries for
+ * guests.
+ *
+ * Invalidate all entries including GVA-->GPA and GPA-->HPA mappings.
+ */
+void kvm_flush_tlb_all(void)
+{
+	unsigned long flags;
+
+	local_irq_save(flags);
+	invtlb_all(INVTLB_ALLGID, 0, 0);
+	local_irq_restore(flags);
+}
-- 
2.27.0

