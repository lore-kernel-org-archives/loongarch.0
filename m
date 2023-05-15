Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFE21381
	for <loongarch@lists.linux.dev>; Mon, 15 May 2023 02:15:39 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8AxGurKlWFkObAIAA--.14821S3;
	Mon, 15 May 2023 10:15:38 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxn7O6lWFk0KJeAA--.33838S28;
	Mon, 15 May 2023 10:15:38 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Mark Brown <broonie@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	maobibo@loongson.cn,
	Xi Ruoyao <xry111@xry111.site>,
	zhaotianrui@loongson.cn
Subject: [PATCH v10 26/30] LoongArch: KVM: Implement kvm exception vector
Date: Mon, 15 May 2023 10:15:18 +0800
Message-Id: <20230515021522.2445551-27-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230515021522.2445551-1-zhaotianrui@loongson.cn>
References: <20230515021522.2445551-1-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dxn7O6lWFk0KJeAA--.33838S28
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Kw15tF1UurWUKF17uF4UJwb_yoW8ZFWfpF
	yfA34Yyr48W342va4akw1vgF13AayxKr17WrW7G343uw4jqryrtrWkK397JF43KryrZF1x
	AFZ8tr15uF4UG37anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bzkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aV
	CY1x0267AKxVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l
	57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaV
	Av8VWrMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxG
	rwCF04k20xvE74AGY7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI
	0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_tr0E3s1lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0zRByIUUUUUU=

Implement kvm exception vector, using _kvm_fault_tables array to save
the handle function pointer and it is used when vcpu handle exit.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 arch/loongarch/kvm/exit.c | 48 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
index 10f9922a7e76..286ab5de7f26 100644
--- a/arch/loongarch/kvm/exit.c
+++ b/arch/loongarch/kvm/exit.c
@@ -657,3 +657,51 @@ static int _kvm_handle_fpu_disabled(struct kvm_vcpu *vcpu)
 	kvm_own_fpu(vcpu);
 	return RESUME_GUEST;
 }
+
+/*
+ * Loongarch KVM callback handling for not implemented guest exiting
+ */
+static int _kvm_fault_ni(struct kvm_vcpu *vcpu)
+{
+	unsigned long estat, badv;
+	unsigned int exccode, inst;
+
+	/*
+	 *  Fetch the instruction.
+	 */
+	badv = vcpu->arch.badv;
+	estat = vcpu->arch.host_estat;
+	exccode = (estat & CSR_ESTAT_EXC) >> CSR_ESTAT_EXC_SHIFT;
+	inst = vcpu->arch.badi;
+	kvm_err("Exccode: %d PC=%#lx inst=0x%08x BadVaddr=%#lx estat=%#llx\n",
+			exccode, vcpu->arch.pc, inst, badv, read_gcsr_estat());
+	kvm_arch_vcpu_dump_regs(vcpu);
+	vcpu->run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
+
+	return RESUME_HOST;
+}
+
+static exit_handle_fn _kvm_fault_tables[EXCCODE_INT_START] = {
+	[EXCCODE_TLBL]		= _kvm_handle_read_fault,
+	[EXCCODE_TLBI]		= _kvm_handle_read_fault,
+	[EXCCODE_TLBNR]		= _kvm_handle_read_fault,
+	[EXCCODE_TLBNX]		= _kvm_handle_read_fault,
+	[EXCCODE_TLBS]		= _kvm_handle_write_fault,
+	[EXCCODE_TLBM]		= _kvm_handle_write_fault,
+	[EXCCODE_FPDIS]		= _kvm_handle_fpu_disabled,
+	[EXCCODE_GSPR]		= _kvm_handle_gspr,
+};
+
+int _kvm_handle_fault(struct kvm_vcpu *vcpu, int fault)
+{
+	return _kvm_fault_tables[fault](vcpu);
+}
+
+void _kvm_init_fault(void)
+{
+	int i;
+
+	for (i = 0; i < EXCCODE_INT_START; i++)
+		if (!_kvm_fault_tables[i])
+			_kvm_fault_tables[i] = _kvm_fault_ni;
+}
-- 
2.31.1

