Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169B615D0
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 02:56:53 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8Axqtl0+OpjPVcAAA--.935S3;
	Tue, 14 Feb 2023 10:56:52 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axeb1w+OpjmZwyAA--.28802S7;
	Tue, 14 Feb 2023 10:56:51 +0800 (CST)
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
Subject: [PATCH v1 05/24] LoongArch: KVM: Implement vcpu ENABLE_CAP, CHECK_EXTENSION ioctl interface
Date: Tue, 14 Feb 2023 10:56:29 +0800
Message-Id: <20230214025648.1898508-6-zhaotianrui@loongson.cn>
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
X-CM-TRANSID:AQAAf8Axeb1w+OpjmZwyAA--.28802S7
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7WF17ArW5CryDGr1kGryxGrg_yoW8WFykpF
	47A34Fqr4rJ3yIgwn3tws3ur1aqr4kKr4xZFZrX3y5AF12kry5KF4F9rZrJFW5Ja1rWF1I
	q3WFqF1Y9Fs8Z37anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b48Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
	kF7I0E14v26r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l
	57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaV
	Av8VWrMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRR5l1PUUUUU==

Implement loongarch vcpu KVM_ENABLE_CAP, KVM_CHECK_EXTENSION ioctl
interface.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 arch/loongarch/kvm/vcpu.c | 46 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index a18864284..dd803f26d 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -415,6 +415,29 @@ int kvm_arch_vcpu_ioctl_set_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
 	return 0;
 }
 
+static int kvm_vcpu_ioctl_enable_cap(struct kvm_vcpu *vcpu,
+				     struct kvm_enable_cap *cap)
+{
+	int r = 0;
+
+	if (!kvm_vm_ioctl_check_extension(vcpu->kvm, cap->cap))
+		return -EINVAL;
+	if (cap->flags)
+		return -EINVAL;
+	if (cap->args[0])
+		return -EINVAL;
+
+	switch (cap->cap) {
+	case KVM_CAP_LOONGARCH_FPU:
+		break;
+	default:
+		r = -EINVAL;
+		break;
+	}
+
+	return r;
+}
+
 long kvm_arch_vcpu_ioctl(struct file *filp,
 			 unsigned int ioctl, unsigned long arg)
 {
@@ -438,6 +461,29 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
 			r = _kvm_get_reg(vcpu, &reg);
 		break;
 	}
+	case KVM_ENABLE_CAP: {
+		struct kvm_enable_cap cap;
+
+		r = -EFAULT;
+		if (copy_from_user(&cap, argp, sizeof(cap)))
+			break;
+		r = kvm_vcpu_ioctl_enable_cap(vcpu, &cap);
+		break;
+	}
+	case KVM_CHECK_EXTENSION: {
+		unsigned int ext;
+
+		if (copy_from_user(&ext, argp, sizeof(ext)))
+			return -EFAULT;
+		switch (ext) {
+		case KVM_CAP_LOONGARCH_FPU:
+			r = !!cpu_has_fpu;
+			break;
+		default:
+			break;
+		}
+		break;
+	}
 	case KVM_GET_CSRS: {
 		r = kvm_csr_io(vcpu, argp, _kvm_getcsr);
 		break;
-- 
2.31.1

