Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EF18C19
	for <loongarch@lists.linux.dev>; Thu, 31 Aug 2023 08:30:34 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8BxuOilT_BkKV4dAA--.24390S3;
	Thu, 31 Aug 2023 16:30:29 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax3c6gT_BkOPVnAA--.55892S10;
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
Subject: [PATCH v20 08/30] LoongArch: KVM: Implement vcpu handle exit interface
Date: Thu, 31 Aug 2023 16:29:58 +0800
Message-Id: <20230831083020.2187109-9-zhaotianrui@loongson.cn>
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
X-CM-TRANSID:AQAAf8Ax3c6gT_BkOPVnAA--.55892S10
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Implement vcpu handle exit interface, getting the exit code by ESTAT
register and using kvm exception vector to handle it.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 arch/loongarch/kvm/vcpu.c | 41 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 83f2988ea6..ca4e8d074e 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -103,6 +103,47 @@ static int kvm_pre_enter_guest(struct kvm_vcpu *vcpu)
 	return ret;
 }
 
+/*
+ * Return 1 for resume guest and "<= 0" for resume host.
+ */
+static int _kvm_handle_exit(struct kvm_run *run, struct kvm_vcpu *vcpu)
+{
+	unsigned long exst = vcpu->arch.host_estat;
+	u32 intr = exst & 0x1fff; /* ignore NMI */
+	u32 exccode = (exst & CSR_ESTAT_EXC) >> CSR_ESTAT_EXC_SHIFT;
+	int ret = RESUME_GUEST;
+
+	vcpu->mode = OUTSIDE_GUEST_MODE;
+
+	/* Set a default exit reason */
+	run->exit_reason = KVM_EXIT_UNKNOWN;
+
+	guest_timing_exit_irqoff();
+	guest_state_exit_irqoff();
+	local_irq_enable();
+
+	trace_kvm_exit(vcpu, exccode);
+	if (exccode) {
+		ret = _kvm_handle_fault(vcpu, exccode);
+	} else {
+		WARN(!intr, "vm exiting with suspicious irq\n");
+		++vcpu->stat.int_exits;
+	}
+
+	if (ret == RESUME_GUEST)
+		ret = kvm_pre_enter_guest(vcpu);
+
+	if (ret != RESUME_GUEST) {
+		local_irq_disable();
+		return ret;
+	}
+
+	guest_timing_enter_irqoff();
+	guest_state_enter_irqoff();
+	trace_kvm_reenter(vcpu);
+	return RESUME_GUEST;
+}
+
 int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 {
 	unsigned long timer_hz;
-- 
2.27.0

