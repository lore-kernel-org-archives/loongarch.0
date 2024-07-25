Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6BBB1C6A4
	for <loongarch@lists.linux.dev>; Thu, 25 Jul 2024 03:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721878459; cv=none; b=D+lwoBRTBgVqGNm1fAskzSgJV8OSCLPRL/eVu6ijIVWi2M3jVTdP8nt43kTQBomkKorxEyEapf0+lhxjNM1Rc8FMQFVnZGR+EqZ0TDReOFowhaOhfQabiBeVV8BeYkd98ESvSZQ21dQmv7ZWetigyyxWEFPJnpQR4ORLryxy95I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721878459; c=relaxed/simple;
	bh=3JiK5bvfiVwsBCbg5kudqDXogJePvcqJ6U9YebVM7RU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g/vAC+fW5aCm/27RgzZ18O5QRYHdiofibgerMhPaddXn46eh3Nd382oNDzJGM1AxZA/jF1b62WB2+PRL7lxK5wWg/NAiGcZzJfRfK2etY0JwDtbd/Uu4l35wroFNlfuBqx6fEuwQU1Yf9ChYrLxYsGFyYQf5yCDmw76H0ZnVTpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.10.34])
	by gateway (Coremail) with SMTP id _____8CxOuqxx6Fm8lUBAA--.5162S3;
	Thu, 25 Jul 2024 11:34:09 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.10.34])
	by front1 (Coremail) with SMTP id qMiowMBxicWsx6FmppEAAA--.37S5;
	Thu, 25 Jul 2024 11:34:09 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v5 3/3] LoongArch: KVM: Add vm migration support for LBT registers
Date: Thu, 25 Jul 2024 11:34:04 +0800
Message-Id: <20240725033404.2675204-4-maobibo@loongson.cn>
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
X-CM-TRANSID:qMiowMBxicWsx6FmppEAAA--.37S5
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXr1rAFW3uw1DZF1Dury5KFX_yoWrAr17pr
	1DArs3Gr18Krn3C3yxKF1q9r17Xr4IkrWkZFySqa18Kr90vryFyw4ktr9xGFy3Jr48u3yf
	C3Wvyw4jkF1xJ3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

Every vcpu has separate LBT registers. And there are four scr registers,
one flags and ftop register for LBT extension. When VM migrates, VMM
needs to get LBT registers for every vcpu.

Here macro KVM_REG_LOONGARCH_LBT is added for new vcpu lbt register type,
the following macro is added to get/put LBT registers.
  KVM_REG_LOONGARCH_LBT_SCR0
  KVM_REG_LOONGARCH_LBT_SCR1
  KVM_REG_LOONGARCH_LBT_SCR2
  KVM_REG_LOONGARCH_LBT_SCR3
  KVM_REG_LOONGARCH_LBT_EFLAGS
  KVM_REG_LOONGARCH_LBT_FTOP

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/include/uapi/asm/kvm.h |  9 +++++
 arch/loongarch/kvm/vcpu.c             | 56 +++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/loongarch/include/uapi/asm/kvm.h b/arch/loongarch/include/uapi/asm/kvm.h
index 49bafac8b22d..003fb766c93f 100644
--- a/arch/loongarch/include/uapi/asm/kvm.h
+++ b/arch/loongarch/include/uapi/asm/kvm.h
@@ -64,6 +64,7 @@ struct kvm_fpu {
 #define KVM_REG_LOONGARCH_KVM		(KVM_REG_LOONGARCH | 0x20000ULL)
 #define KVM_REG_LOONGARCH_FPSIMD	(KVM_REG_LOONGARCH | 0x30000ULL)
 #define KVM_REG_LOONGARCH_CPUCFG	(KVM_REG_LOONGARCH | 0x40000ULL)
+#define KVM_REG_LOONGARCH_LBT		(KVM_REG_LOONGARCH | 0x50000ULL)
 #define KVM_REG_LOONGARCH_MASK		(KVM_REG_LOONGARCH | 0x70000ULL)
 #define KVM_CSR_IDX_MASK		0x7fff
 #define KVM_CPUCFG_IDX_MASK		0x7fff
@@ -77,6 +78,14 @@ struct kvm_fpu {
 /* Debugging: Special instruction for software breakpoint */
 #define KVM_REG_LOONGARCH_DEBUG_INST	(KVM_REG_LOONGARCH_KVM | KVM_REG_SIZE_U64 | 3)
 
+/* LBT registers */
+#define KVM_REG_LOONGARCH_LBT_SCR0	(KVM_REG_LOONGARCH_LBT | KVM_REG_SIZE_U64 | 1)
+#define KVM_REG_LOONGARCH_LBT_SCR1	(KVM_REG_LOONGARCH_LBT | KVM_REG_SIZE_U64 | 2)
+#define KVM_REG_LOONGARCH_LBT_SCR2	(KVM_REG_LOONGARCH_LBT | KVM_REG_SIZE_U64 | 3)
+#define KVM_REG_LOONGARCH_LBT_SCR3	(KVM_REG_LOONGARCH_LBT | KVM_REG_SIZE_U64 | 4)
+#define KVM_REG_LOONGARCH_LBT_EFLAGS	(KVM_REG_LOONGARCH_LBT | KVM_REG_SIZE_U64 | 5)
+#define KVM_REG_LOONGARCH_LBT_FTOP	(KVM_REG_LOONGARCH_LBT | KVM_REG_SIZE_U64 | 6)
+
 #define LOONGARCH_REG_SHIFT		3
 #define LOONGARCH_REG_64(TYPE, REG)	(TYPE | KVM_REG_SIZE_U64 | (REG << LOONGARCH_REG_SHIFT))
 #define KVM_IOC_CSRID(REG)		LOONGARCH_REG_64(KVM_REG_LOONGARCH_CSR, REG)
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index aeb5f76a86c1..76719bf522b7 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -597,6 +597,34 @@ static int kvm_get_one_reg(struct kvm_vcpu *vcpu,
 			break;
 		}
 		break;
+	case KVM_REG_LOONGARCH_LBT:
+		if (!kvm_guest_has_lbt(&vcpu->arch))
+			return -ENXIO;
+
+		switch (reg->id) {
+		case KVM_REG_LOONGARCH_LBT_SCR0:
+			vcpu->arch.lbt.scr0 = v;
+			break;
+		case KVM_REG_LOONGARCH_LBT_SCR1:
+			vcpu->arch.lbt.scr1 = v;
+			break;
+		case KVM_REG_LOONGARCH_LBT_SCR2:
+			vcpu->arch.lbt.scr2 = v;
+			break;
+		case KVM_REG_LOONGARCH_LBT_SCR3:
+			vcpu->arch.lbt.scr3 = v;
+			break;
+		case KVM_REG_LOONGARCH_LBT_EFLAGS:
+			vcpu->arch.lbt.eflags = v;
+			break;
+		case KVM_REG_LOONGARCH_LBT_FTOP:
+			vcpu->arch.fpu.ftop = v;
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -663,6 +691,34 @@ static int kvm_set_one_reg(struct kvm_vcpu *vcpu,
 			break;
 		}
 		break;
+	case KVM_REG_LOONGARCH_LBT:
+		if (!kvm_guest_has_lbt(&vcpu->arch))
+			return -ENXIO;
+
+		switch (reg->id) {
+		case KVM_REG_LOONGARCH_LBT_SCR0:
+			*v = vcpu->arch.lbt.scr0;
+			break;
+		case KVM_REG_LOONGARCH_LBT_SCR1:
+			*v = vcpu->arch.lbt.scr1;
+			break;
+		case KVM_REG_LOONGARCH_LBT_SCR2:
+			*v = vcpu->arch.lbt.scr2;
+			break;
+		case KVM_REG_LOONGARCH_LBT_SCR3:
+			*v = vcpu->arch.lbt.scr3;
+			break;
+		case KVM_REG_LOONGARCH_LBT_EFLAGS:
+			*v = vcpu->arch.lbt.eflags;
+			break;
+		case KVM_REG_LOONGARCH_LBT_FTOP:
+			*v = vcpu->arch.fpu.ftop;
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
+		break;
 	default:
 		ret = -EINVAL;
 		break;
-- 
2.39.3

