Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDEBB8F51
	for <loongarch@lists.linux.dev>; Thu, 31 Aug 2023 08:30:35 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8BxJvGmT_BkOV4dAA--.60449S3;
	Thu, 31 Aug 2023 16:30:30 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax3c6gT_BkOPVnAA--.55892S12;
	Thu, 31 Aug 2023 16:30:29 +0800 (CST)
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
Subject: [PATCH v20 10/30] LoongArch: KVM: Implement vcpu ENABLE_CAP ioctl interface
Date: Thu, 31 Aug 2023 16:30:00 +0800
Message-Id: <20230831083020.2187109-11-zhaotianrui@loongson.cn>
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
X-CM-TRANSID:AQAAf8Ax3c6gT_BkOPVnAA--.55892S12
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Implement LoongArch vcpu KVM_ENABLE_CAP ioctl interface.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 arch/loongarch/kvm/vcpu.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index f17422a942..be0c17a433 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -187,6 +187,16 @@ int kvm_arch_vcpu_ioctl_set_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
 	return 0;
 }
 
+static int kvm_vcpu_ioctl_enable_cap(struct kvm_vcpu *vcpu,
+				     struct kvm_enable_cap *cap)
+{
+	/*
+	 * FPU is enable by default, do not support any other caps,
+	 * and later we will support such as LSX cap.
+	 */
+	return -EINVAL;
+}
+
 long kvm_arch_vcpu_ioctl(struct file *filp,
 			 unsigned int ioctl, unsigned long arg)
 {
@@ -210,6 +220,15 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
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
 	default:
 		r = -ENOIOCTLCMD;
 		break;
-- 
2.27.0

