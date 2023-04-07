Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696B5EA4
	for <loongarch@lists.linux.dev>; Fri,  7 Apr 2023 02:00:18 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8BxYU8weS9kTacXAA--.36785S3;
	Fri, 07 Apr 2023 10:00:16 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxLL4jeS9k17sXAA--.23369S24;
	Fri, 07 Apr 2023 10:00:15 +0800 (CST)
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
	Xi Ruoyao <xry111@xry111.site>,
	zhaotianrui@loongson.cn
Subject: [PATCH v5 22/30] LoongArch: KVM: Implement handle idle exception
Date: Fri,  7 Apr 2023 09:59:55 +0800
Message-Id: <20230407020003.3651096-23-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230407020003.3651096-1-zhaotianrui@loongson.cn>
References: <20230407020003.3651096-1-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxLL4jeS9k17sXAA--.23369S24
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7JrW5uFykWr43XF4UXFyUAwb_yoWkGFb_ZF
	Z7Jas5GFWrXFs8Ka4Dtwn8Ka4Ygw4kXF15ZF47ury3Gr1qyrWUC3yDWwn5Zr4DKFWUZFW3
	K3ykZ3s7A34jqjkaLaAFLSUrUUUU0b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	27CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
	kF7I0E14v26r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l
	57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaV
	Av8VWrMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_tr0E3s1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aV
	CY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0zR9iSdUUUUU=

Implement kvm handle loongarch vcpu idle exception, using kvm_vcpu_block
to emulate it.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 arch/loongarch/kvm/exit.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
index f151cc2dd..3de08a479 100644
--- a/arch/loongarch/kvm/exit.c
+++ b/arch/loongarch/kvm/exit.c
@@ -190,3 +190,23 @@ int _kvm_complete_iocsr_read(struct kvm_vcpu *vcpu, struct kvm_run *run)
 
 	return er;
 }
+
+int _kvm_emu_idle(struct kvm_vcpu *vcpu)
+{
+	++vcpu->stat.idle_exits;
+	trace_kvm_exit_idle(vcpu, KVM_TRACE_EXIT_IDLE);
+
+	if (!kvm_arch_vcpu_runnable(vcpu)) {
+		/*
+		 * Switch to the software timer before halt-polling/blocking as
+		 * the guest's timer may be a break event for the vCPU, and the
+		 * hypervisor timer runs only when the CPU is in guest mode.
+		 * Switch before halt-polling so that KVM recognizes an expired
+		 * timer before blocking.
+		 */
+		kvm_save_timer(vcpu);
+		kvm_vcpu_block(vcpu);
+	}
+
+	return EMULATE_DONE;
+}
-- 
2.31.1

