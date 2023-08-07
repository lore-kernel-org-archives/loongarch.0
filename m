Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F581FD3
	for <loongarch@lists.linux.dev>; Mon,  7 Aug 2023 06:51:41 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8AxEvB7lNBk8NwRAA--.39121S3;
	Mon, 07 Aug 2023 14:51:39 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxJ8x5lNBkwspMAA--.23544S5;
	Mon, 07 Aug 2023 14:51:39 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: Shuah Khan <shuah@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Peter Xu <peterx@redhat.com>,
	Vipin Sharma <vipinsh@google.com>,
	maobibo@loongson.cn,
	zhaotianrui@loongson.cn
Subject: [PATCH v2 3/4] KVM: selftests: Add ucall test support for LoongArch
Date: Mon,  7 Aug 2023 14:51:36 +0800
Message-Id: <20230807065137.3408970-4-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230807065137.3408970-1-zhaotianrui@loongson.cn>
References: <20230807065137.3408970-1-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxJ8x5lNBkwspMAA--.23544S5
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Add ucall test support for LoongArch. A ucall is a "hypercall to
userspace".

Based-on: <20230803022138.2736430-1-zhaotianrui@loongson.cn>
Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 .../selftests/kvm/lib/loongarch/ucall.c       | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/lib/loongarch/ucall.c

diff --git a/tools/testing/selftests/kvm/lib/loongarch/ucall.c b/tools/testing/selftests/kvm/lib/loongarch/ucall.c
new file mode 100644
index 000000000000..72868ddec313
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/loongarch/ucall.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ucall support. A ucall is a "hypercall to userspace".
+ *
+ */
+#include "kvm_util.h"
+
+/*
+ * ucall_exit_mmio_addr holds per-VM values (global data is duplicated by each
+ * VM), it must not be accessed from host code.
+ */
+static vm_vaddr_t *ucall_exit_mmio_addr;
+
+void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
+{
+	vm_vaddr_t mmio_gva = vm_vaddr_unused_gap(vm, vm->page_size, KVM_UTIL_MIN_VADDR);
+
+	virt_map(vm, mmio_gva, mmio_gpa, 1);
+
+	vm->ucall_mmio_addr = mmio_gpa;
+
+	write_guest_global(vm, ucall_exit_mmio_addr, (vm_vaddr_t *)mmio_gva);
+}
+
+void ucall_arch_do_ucall(vm_vaddr_t uc)
+{
+	WRITE_ONCE(*ucall_exit_mmio_addr, uc);
+}
+
+void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
+{
+	struct kvm_run *run = vcpu->run;
+
+	if (run->exit_reason == KVM_EXIT_MMIO &&
+	    run->mmio.phys_addr == vcpu->vm->ucall_mmio_addr) {
+		TEST_ASSERT(run->mmio.is_write && run->mmio.len == sizeof(uint64_t),
+			    "Unexpected ucall exit mmio address access");
+
+		return (void *)(*((uint64_t *)run->mmio.data));
+	}
+
+	return NULL;
+}
-- 
2.39.1

