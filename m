Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F601370AC2
	for <loongarch@lists.linux.dev>; Tue,  9 Jun 2026 07:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990047; cv=none; b=V9+nJQsvtegP+IV/j/1NyqCBv1oBJVQWL4L8htxwhRDTIrDd1Mpq20JgxnIUWI2rx4W8Beki1Um2AOn6b7aEFDsYp2KTOes3e22PdagzTDSPDK2UjksyzgmYYcNato0n/CBY+6dWRSLgQrOHDAxl2TPPHGPmmWHOCEgXECfxUOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990047; c=relaxed/simple;
	bh=3eZApqoQMDeL53I7z0ZtU/79GeXilWZ+Xkm5gCR3nkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=beMR+elvCnxutrgcn+m9Had5gzf1tiC5UQsFKZNYWGjWJ6+pNIzMxgq8rbxAoDD7sVhU6S52cDyVBQAobEz/4U7a1ff1TIvPhVVWV/gCtg3UBFru0tL1sCtiOuq9ljXYeUGIFDrX9RBoFfMUHE6wzRv7bwwhAO4idiy0W4C3eAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8CxX+pawCdqRSkSAA--.47574S3;
	Tue, 09 Jun 2026 15:27:22 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJDxquBUwCdq7oqgAA--.42025S4;
	Tue, 09 Jun 2026 15:27:21 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 2/2] KVM: LoongArch: selftests: Add FPU test case
Date: Tue,  9 Jun 2026 15:27:15 +0800
Message-Id: <20260609072715.1005923-3-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20260609072715.1005923-1-maobibo@loongson.cn>
References: <20260609072715.1005923-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxquBUwCdq7oqgAA--.42025S4
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Add FPU test case and verify FPU register get and set APIs, the
FPU width supports 64/128/256 bits.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../kvm/include/loongarch/processor.h         |   8 +
 .../selftests/kvm/loongarch/fpu_test.c        | 145 ++++++++++++++++++
 3 files changed, 154 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/loongarch/fpu_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 9118a5a51b89..7d11592b3759 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -224,6 +224,7 @@ TEST_GEN_PROGS_riscv += rseq_test
 TEST_GEN_PROGS_riscv += steal_time
 
 TEST_GEN_PROGS_loongarch = loongarch/pmu_test
+TEST_GEN_PROGS_loongarch += loongarch/fpu_test
 TEST_GEN_PROGS_loongarch += arch_timer
 TEST_GEN_PROGS_loongarch += coalesced_io_test
 TEST_GEN_PROGS_loongarch += demand_paging_test
diff --git a/tools/testing/selftests/kvm/include/loongarch/processor.h b/tools/testing/selftests/kvm/include/loongarch/processor.h
index 2324e311180f..981ae7078354 100644
--- a/tools/testing/selftests/kvm/include/loongarch/processor.h
+++ b/tools/testing/selftests/kvm/include/loongarch/processor.h
@@ -82,6 +82,14 @@
 #define  PLV_MASK			0x3
 #define LOONGARCH_CSR_PRMD		0x1
 #define LOONGARCH_CSR_EUEN		0x2
+#define  CSR_EUEN_LBTEN_SHIFT		3
+#define  CSR_EUEN_LBTEN			BIT_ULL(CSR_EUEN_LBTEN_SHIFT)
+#define  CSR_EUEN_LASXEN_SHIFT		2
+#define  CSR_EUEN_LASXEN		BIT_ULL(CSR_EUEN_LASXEN_SHIFT)
+#define  CSR_EUEN_LSXEN_SHIFT		1
+#define  CSR_EUEN_LSXEN			BIT_ULL(CSR_EUEN_LSXEN_SHIFT)
+#define  CSR_EUEN_FPEN_SHIFT		0
+#define  CSR_EUEN_FPEN			BIT_ULL(CSR_EUEN_FPEN_SHIFT)
 #define LOONGARCH_CSR_ECFG		0x4
 #define  ECFGB_PMU			10
 #define  ECFGF_PMU			(BIT_ULL(ECFGB_PMU))
diff --git a/tools/testing/selftests/kvm/loongarch/fpu_test.c b/tools/testing/selftests/kvm/loongarch/fpu_test.c
new file mode 100644
index 000000000000..5bccce9db5d0
--- /dev/null
+++ b/tools/testing/selftests/kvm/loongarch/fpu_test.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <stdio.h>
+#include <string.h>
+#include "kvm_util.h"
+#include "processor.h"
+#include "loongarch/processor.h"
+
+struct kvm_fpureg __aligned(64) vector = {{1, 2, 3, 4 }};
+
+static void guest_code(void)
+{
+	unsigned long val;
+	struct kvm_fpureg *fp = &vector;
+
+	val = csr_read(LOONGARCH_CSR_EUEN);
+	val |= CSR_EUEN_FPEN | CSR_EUEN_LSXEN | CSR_EUEN_LASXEN;
+	csr_write(val, LOONGARCH_CSR_EUEN);
+
+	__asm__ __volatile__("fld.d $f0, %0, 0\n" : : "r"(fp) : "$f0");
+	GUEST_SYNC(0);
+
+	__asm__ __volatile__("vld $vr0, %0, 0\n" : : "r"(fp) : "$vr0");
+	GUEST_SYNC(1);
+
+	__asm__ __volatile__("xvld $xr0, %0, 0\n" : : "r"(fp) : "$xr0");
+	GUEST_SYNC(2);
+
+	__asm__ __volatile__("fst.d $f0, %0, 0\n" : : "r"(fp) : "memory");
+	GUEST_SYNC(3);
+
+	__asm__ __volatile__("vst $vr0, %0, 0\n" : : "r"(fp) : "memory");
+	GUEST_SYNC(4);
+
+	__asm__ __volatile__("xvst $xr0, %0, 0\n" : : "r"(fp) : "memory");
+	GUEST_SYNC(5);
+
+	GUEST_DONE();
+}
+
+static void run_vcpu(struct kvm_vcpu *vcpu)
+{
+	struct ucall uc;
+	int cont;
+
+	cont = 1;
+	while (cont) {
+		vcpu_run(vcpu);
+
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_PRINTF:
+			printf("%s", (const char *)uc.buffer);
+			break;
+		case UCALL_DONE:
+			printf("FPU test PASSED\n");
+			fallthrough;
+		case UCALL_SYNC:
+			cont = 0;
+			break;
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+		default:
+			TEST_ASSERT(false, "Unexpected exit: %s",
+				exit_reason_str(vcpu->run->exit_reason));
+		}
+	}
+}
+
+static bool __vm_has_feature(struct kvm_vm *vm, int feature)
+{
+	int ret;
+
+	ret = __kvm_has_device_attr(vm->fd, KVM_LOONGARCH_VM_FEAT_CTRL, feature);
+	return !ret;
+}
+
+
+int main(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct kvm_fpu fpu;
+	struct kvm_fpureg *fp = &vector;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	__TEST_REQUIRE(__vm_has_feature(vm, KVM_LOONGARCH_VM_FEAT_LSX),
+			"LSX not available, skipping test\n");
+	__TEST_REQUIRE(__vm_has_feature(vm, KVM_LOONGARCH_VM_FEAT_LASX),
+			"LASX not available, skipping test\n");
+
+	run_vcpu(vcpu);
+	vcpu_fpu_get(vcpu, &fpu);
+	TEST_ASSERT(!memcmp(fpu.fpr, fp, 8), "Wanted 0x%llx from f0, got 0x%llx",
+			fp->val64[0], fpu.fpr[0].val64[0]);
+
+	run_vcpu(vcpu);
+	vcpu_fpu_get(vcpu, &fpu);
+	TEST_ASSERT(!memcmp(fpu.fpr, fp, 16), "Wanted 0x%llx %llx from vr0, got 0x%llx %llx",
+			fp->val64[0], fp->val64[1],
+			fpu.fpr[0].val64[0], fpu.fpr[0].val64[1]);
+
+	run_vcpu(vcpu);
+	vcpu_fpu_get(vcpu, &fpu);
+	TEST_ASSERT(!memcmp(fpu.fpr, fp, 32),
+			"Wanted 0x%llx %llx %llx %llx from xr0, got 0x%llx %llx %llx %llx",
+			fp->val64[0], fp->val64[1], fp->val64[2], fp->val64[3],
+			fpu.fpr[0].val64[0], fpu.fpr[0].val64[1],
+			fpu.fpr[0].val64[2], fpu.fpr[0].val64[3]);
+
+	fpu.fpr[0].val64[0] += random();
+	vcpu_fpu_set(vcpu, &fpu);
+	run_vcpu(vcpu);
+	vcpu_fpu_get(vcpu, &fpu);
+	sync_global_from_guest(vm, *fp);
+	TEST_ASSERT(!memcmp(fpu.fpr, fp, 8), "Wanted 0x%llx from f0, got 0x%llx",
+			fp->val64[0], fpu.fpr[0].val64[0]);
+
+	fpu.fpr[0].val64[0] += random();
+	fpu.fpr[0].val64[1] += random();
+	vcpu_fpu_set(vcpu, &fpu);
+	run_vcpu(vcpu);
+	vcpu_fpu_get(vcpu, &fpu);
+	sync_global_from_guest(vm, *fp);
+	TEST_ASSERT(!memcmp(fpu.fpr, fp, 16), "Wanted 0x%llx %llx from vr0, got 0x%llx %llx",
+			fp->val64[0], fp->val64[1],
+			fpu.fpr[0].val64[0], fpu.fpr[0].val64[1]);
+
+	fpu.fpr[0].val64[0] += random();
+	fpu.fpr[0].val64[1] += random();
+	fpu.fpr[0].val64[2] += random();
+	fpu.fpr[0].val64[3] += random();
+	vcpu_fpu_set(vcpu, &fpu);
+	run_vcpu(vcpu);
+	vcpu_fpu_get(vcpu, &fpu);
+	sync_global_from_guest(vm, *fp);
+	TEST_ASSERT(!memcmp(fpu.fpr, fp, 32),
+			"Wanted 0x%llx %llx %llx %llx from xr0, got 0x%llx %llx %llx %llx",
+			fp->val64[0], fp->val64[1], fp->val64[2], fp->val64[3],
+			fpu.fpr[0].val64[0], fpu.fpr[0].val64[1],
+			fpu.fpr[0].val64[2], fpu.fpr[0].val64[3]);
+
+	run_vcpu(vcpu);
+	kvm_vm_free(vm);
+	return 0;
+}
-- 
2.39.3

