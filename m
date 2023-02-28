Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2279A38
	for <loongarch@lists.linux.dev>; Tue, 28 Feb 2023 07:01:07 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8DxAf+spv1jX2AGAA--.6581S3;
	Tue, 28 Feb 2023 15:01:00 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxc+Wppv1jPG9AAA--.15462S9;
	Tue, 28 Feb 2023 15:01:00 +0800 (CST)
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
Subject: [PATCH v3 07/29] LoongArch: KVM: Implement vcpu run interface
Date: Tue, 28 Feb 2023 15:00:34 +0800
Message-Id: <20230228070057.3687180-8-zhaotianrui@loongson.cn>
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
X-CM-TRANSID:AQAAf8Bxc+Wppv1jPG9AAA--.15462S9
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAry8CF4DKryfXFWrKr45Wrg_yoW5Gw13pF
	4xC3s0vw4rJ34xG3y3Jrs09rs0qrZYgr17Xryxt3y3tr4Utw1DursakrWjyFWfA34rZF1S
	vFn5tF1UCF1jy37anT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b4xFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
	kF7I0E14v26r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l
	57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaV
	Av8VWrMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zR9iSdUUUUU=

Implement vcpu run interface, handling mmio, iocsr reading fault
and deliver interrupt, lose fpu before vcpu enter guest.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 arch/loongarch/kvm/vcpu.c | 84 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 7af2ff64b8c7..4fcfb36a7133 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -18,6 +18,42 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
 	return 0;
 }
 
+/* Returns 1 if the guest TLB may be clobbered */
+static int _kvm_check_requests(struct kvm_vcpu *vcpu, int cpu)
+{
+	int ret = 0;
+
+	if (!kvm_request_pending(vcpu))
+		return 0;
+
+	if (kvm_check_request(KVM_REQ_TLB_FLUSH, vcpu)) {
+		/* Drop vpid for this VCPU */
+		vcpu->arch.vpid = 0;
+		/* This will clobber guest TLB contents too */
+		ret = 1;
+	}
+
+	return ret;
+}
+
+static void kvm_pre_enter_guest(struct kvm_vcpu *vcpu)
+{
+	int cpu;
+
+	/*
+	 * handle vcpu timer, interrupts, check requests and
+	 * check vmid before vcpu enter guest
+	 */
+	kvm_acquire_timer(vcpu);
+	_kvm_deliver_intr(vcpu);
+	/* make sure the vcpu mode has been written */
+	smp_store_mb(vcpu->mode, IN_GUEST_MODE);
+	cpu = smp_processor_id();
+	_kvm_check_requests(vcpu, cpu);
+	_kvm_check_vmid(vcpu, cpu);
+	vcpu->arch.host_eentry = csr_read64(LOONGARCH_CSR_EENTRY);
+}
+
 int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 {
 	unsigned long timer_hz;
@@ -87,3 +123,51 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 			context->last_vcpu = NULL;
 	}
 }
+
+int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
+{
+	int r = -EINTR;
+	struct kvm_run *run = vcpu->run;
+
+	vcpu_load(vcpu);
+
+	kvm_sigset_activate(vcpu);
+
+	if (vcpu->mmio_needed) {
+		if (!vcpu->mmio_is_write)
+			_kvm_complete_mmio_read(vcpu, run);
+		vcpu->mmio_needed = 0;
+	}
+
+	if (run->exit_reason == KVM_EXIT_LOONGARCH_IOCSR) {
+		if (!run->iocsr_io.is_write)
+			_kvm_complete_iocsr_read(vcpu, run);
+	}
+
+	/* clear exit_reason */
+	run->exit_reason = KVM_EXIT_UNKNOWN;
+	if (run->immediate_exit)
+		goto out;
+
+	lose_fpu(1);
+
+	local_irq_disable();
+	guest_timing_enter_irqoff();
+
+	kvm_pre_enter_guest(vcpu);
+	trace_kvm_enter(vcpu);
+
+	guest_state_enter_irqoff();
+	r = kvm_loongarch_ops->enter_guest(run, vcpu);
+
+	/* guest_state_exit_irqoff() already done.  */
+	trace_kvm_out(vcpu);
+	guest_timing_exit_irqoff();
+	local_irq_enable();
+
+out:
+	kvm_sigset_deactivate(vcpu);
+
+	vcpu_put(vcpu);
+	return r;
+}
-- 
2.31.1

