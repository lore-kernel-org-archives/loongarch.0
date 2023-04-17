Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDF94C8F
	for <loongarch@lists.linux.dev>; Mon, 17 Apr 2023 10:01:42 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8BxIk6bGD1kYeYdAA--.46135S3;
	Mon, 17 Apr 2023 17:59:55 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx57yWGD1kua0qAA--.48254S17;
	Mon, 17 Apr 2023 17:59:54 +0800 (CST)
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
Subject: [PATCH v7 15/30] LoongArch: KVM: Implement vcpu status description
Date: Mon, 17 Apr 2023 17:59:35 +0800
Message-Id: <20230417095950.875228-16-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230417095950.875228-1-zhaotianrui@loongson.cn>
References: <20230417095950.875228-1-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bx57yWGD1kua0qAA--.48254S17
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJrWfXw17tr1kuFyfAF47urg_yoW8Gr1UpF
	nrC3WFgr4rWwnxWw1fJ39xXw47XrZ5WF1fWr9Fq34akFnrKrn5XFW0kFWDGFyvy3sYyr1S
	qayrtwnrua90yw7anT9S1TB71UUUU8UqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bcAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26F4UJVW0owA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7
	CjxVAFwI0_GcCE3s1ln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF
	6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8V
	WrMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVW8ZVWr
	XwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_tr0E3s1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4UJVW0owCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I
	0E14v26F4UJVW0obIYCTnIWIevJa73UjIFyTuYvjxU75l1DUUUU

Implement loongarch vcpu status description such as idle exits counter,
signal exits counter, cpucfg exits counter, etc.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 arch/loongarch/kvm/vcpu.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index bac4ce2ec1eb..735fa3b0ab43 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -13,6 +13,23 @@
 #define CREATE_TRACE_POINTS
 #include "trace.h"
 
+const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
+	KVM_GENERIC_VCPU_STATS(),
+	STATS_DESC_COUNTER(VCPU, idle_exits),
+	STATS_DESC_COUNTER(VCPU, signal_exits),
+	STATS_DESC_COUNTER(VCPU, int_exits),
+	STATS_DESC_COUNTER(VCPU, cpucfg_exits),
+};
+
+const struct kvm_stats_header kvm_vcpu_stats_header = {
+	.name_size = KVM_STATS_NAME_SIZE,
+	.num_desc = ARRAY_SIZE(kvm_vcpu_stats_desc),
+	.id_offset = sizeof(struct kvm_stats_header),
+	.desc_offset = sizeof(struct kvm_stats_header) + KVM_STATS_NAME_SIZE,
+	.data_offset = sizeof(struct kvm_stats_header) + KVM_STATS_NAME_SIZE +
+		       sizeof(kvm_vcpu_stats_desc),
+};
+
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
 {
 	return !!(vcpu->arch.irq_pending) &&
-- 
2.31.1

