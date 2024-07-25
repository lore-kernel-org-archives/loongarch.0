Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7380E1C694
	for <loongarch@lists.linux.dev>; Thu, 25 Jul 2024 03:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721878458; cv=none; b=snD301el00G+HdWqZoMhyXXsIoiRr6T7yKd/UEC2u0hCcsmUlv2P7uWy8jNgBk67EgkqGzW5m7gTP7k0GcfZJmjSGCWijg2lDz9Yvhl53SWkiCLPbzgVMV6Tfw2ou/EmMEeIH3ab5padL3a4+XAKQbj5EmsBTnrERN+TGVc8gEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721878458; c=relaxed/simple;
	bh=P9d8SEtqxkv3075KChKYEkYNQ3xHB2CcWIGM3hw0DdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZJebJkX8Ek6T3ZCK2FGAsBRAFf8Yebdz+wOOj34DWeIw11iOqQNAtHWFT54MJc/wCh80eVDVLPlnmdcDShSXODhPf2u0OGjEvYoGM7SYYre12CgQ66/GI0XFOuBRjn9+FlpFoydvg16VBjJchbi+8B7R4r5uvTLJ9+ObMf+IQhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.10.34])
	by gateway (Coremail) with SMTP id _____8Bx6emxx6Fm7VUBAA--.5139S3;
	Thu, 25 Jul 2024 11:34:09 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.10.34])
	by front1 (Coremail) with SMTP id qMiowMBxicWsx6FmppEAAA--.37S4;
	Thu, 25 Jul 2024 11:34:09 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v5 2/3] LoongArch: KVM: Add LBT feature detection function
Date: Thu, 25 Jul 2024 11:34:03 +0800
Message-Id: <20240725033404.2675204-3-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240725033404.2675204-1-maobibo@loongson.cn>
References: <20240725033404.2675204-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxicWsx6FmppEAAA--.37S4
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxuF45uw43Kry8GF1rAw1kJFc_yoWrXFWUpr
	1UArs8GrWrKr1fCas5ta1q9w1a9F4xCr4xWFy29rWYyrn09ryUJryvkFZrGFy5J3y8W34I
	93Z7Aa1Yva17AwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8l38UUUUUU==

Two kinds of LBT feature detection are added here, one is VCPU
feature, the other is VM feature. VCPU feature dection can only
work with VCPU thread itself, and requires VCPU thread is created
already. So LBT feature detection for VM is added also, it can
be done even if VM is not created, and also can be done by any
thread besides VCPU threads.

Loongson Binary Translation (LBT) feature is defined in register
cpucfg2. Here LBT capability detection for VCPU is added.

Here ioctl command KVM_HAS_DEVICE_ATTR is added for VM, and macro
KVM_LOONGARCH_VM_FEAT_CTRL is added to check supported feature. And
three sub-features relative with LBT are added as following:
 KVM_LOONGARCH_VM_FEAT_X86BT
 KVM_LOONGARCH_VM_FEAT_ARMBT
 KVM_LOONGARCH_VM_FEAT_MIPSBT

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/include/uapi/asm/kvm.h |  8 +++++
 arch/loongarch/kvm/vcpu.c             |  6 ++++
 arch/loongarch/kvm/vm.c               | 52 ++++++++++++++++++++++++++-
 3 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/uapi/asm/kvm.h b/arch/loongarch/include/uapi/asm/kvm.h
index ddc5cab0ffd0..49bafac8b22d 100644
--- a/arch/loongarch/include/uapi/asm/kvm.h
+++ b/arch/loongarch/include/uapi/asm/kvm.h
@@ -82,6 +82,14 @@ struct kvm_fpu {
 #define KVM_IOC_CSRID(REG)		LOONGARCH_REG_64(KVM_REG_LOONGARCH_CSR, REG)
 #define KVM_IOC_CPUCFG(REG)		LOONGARCH_REG_64(KVM_REG_LOONGARCH_CPUCFG, REG)
 
+/* Device Control API on vm fd */
+#define KVM_LOONGARCH_VM_FEAT_CTRL	0
+#define  KVM_LOONGARCH_VM_FEAT_LSX	0
+#define  KVM_LOONGARCH_VM_FEAT_LASX	1
+#define  KVM_LOONGARCH_VM_FEAT_X86BT	2
+#define  KVM_LOONGARCH_VM_FEAT_ARMBT	3
+#define  KVM_LOONGARCH_VM_FEAT_MIPSBT	4
+
 /* Device Control API on vcpu fd */
 #define KVM_LOONGARCH_VCPU_CPUCFG	0
 #define KVM_LOONGARCH_VCPU_PVTIME_CTRL	1
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 9c5d2d286607..aeb5f76a86c1 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -498,6 +498,12 @@ static int _kvm_get_cpucfg_mask(int id, u64 *v)
 			*v |= CPUCFG2_LSX;
 		if (cpu_has_lasx)
 			*v |= CPUCFG2_LASX;
+		if (cpu_has_lbt_x86)
+			*v |= CPUCFG2_X86BT;
+		if (cpu_has_lbt_arm)
+			*v |= CPUCFG2_ARMBT;
+		if (cpu_has_lbt_mips)
+			*v |= CPUCFG2_MIPSBT;
 
 		return 0;
 	case LOONGARCH_CPUCFG3:
diff --git a/arch/loongarch/kvm/vm.c b/arch/loongarch/kvm/vm.c
index 6b2e4f66ad26..f9604bc2b3ea 100644
--- a/arch/loongarch/kvm/vm.c
+++ b/arch/loongarch/kvm/vm.c
@@ -99,7 +99,57 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	return r;
 }
 
+static int kvm_vm_feature_has_attr(struct kvm *kvm, struct kvm_device_attr *attr)
+{
+	switch (attr->attr) {
+	case KVM_LOONGARCH_VM_FEAT_LSX:
+		if (cpu_has_lsx)
+			return 0;
+		return -ENXIO;
+	case KVM_LOONGARCH_VM_FEAT_LASX:
+		if (cpu_has_lasx)
+			return 0;
+		return -ENXIO;
+	case KVM_LOONGARCH_VM_FEAT_X86BT:
+		if (cpu_has_lbt_x86)
+			return 0;
+		return -ENXIO;
+	case KVM_LOONGARCH_VM_FEAT_ARMBT:
+		if (cpu_has_lbt_arm)
+			return 0;
+		return -ENXIO;
+	case KVM_LOONGARCH_VM_FEAT_MIPSBT:
+		if (cpu_has_lbt_mips)
+			return 0;
+		return -ENXIO;
+	default:
+		return -ENXIO;
+	}
+}
+
+static int kvm_vm_has_attr(struct kvm *kvm, struct kvm_device_attr *attr)
+{
+	switch (attr->group) {
+	case KVM_LOONGARCH_VM_FEAT_CTRL:
+		return kvm_vm_feature_has_attr(kvm, attr);
+	default:
+		return -ENXIO;
+	}
+}
+
 int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 {
-	return -ENOIOCTLCMD;
+	struct kvm *kvm = filp->private_data;
+	void __user *argp = (void __user *)arg;
+	struct kvm_device_attr attr;
+
+	switch (ioctl) {
+	case KVM_HAS_DEVICE_ATTR:
+		if (copy_from_user(&attr, argp, sizeof(attr)))
+			return -EFAULT;
+
+		return kvm_vm_has_attr(kvm, &attr);
+	default:
+		return -EINVAL;
+	}
 }
-- 
2.39.3

