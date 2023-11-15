Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43587E;
	Wed, 15 Nov 2023 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94CFEC433C8;
	Wed, 15 Nov 2023 09:07:43 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: KVM: Fix build due to API changes
Date: Wed, 15 Nov 2023 17:07:35 +0800
Message-Id: <20231115090735.2404866-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 8569992d64b8f750e34b7858eac ("KVM: Use gfn instead of hva for
mmu_notifier_retry") replaces mmu_invalidate_retry_hva() usage with
mmu_invalidate_retry_gfn() for X86, LoongArch also need similar changes
to fix build.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kvm/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 80480df5f550..9463ebecd39b 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -627,7 +627,7 @@ static bool fault_supports_huge_mapping(struct kvm_memory_slot *memslot,
  *
  * There are several ways to safely use this helper:
  *
- * - Check mmu_invalidate_retry_hva() after grabbing the mapping level, before
+ * - Check mmu_invalidate_retry_gfn() after grabbing the mapping level, before
  *   consuming it.  In this case, mmu_lock doesn't need to be held during the
  *   lookup, but it does need to be held while checking the MMU notifier.
  *
@@ -807,7 +807,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 
 	/* Check if an invalidation has taken place since we got pfn */
 	spin_lock(&kvm->mmu_lock);
-	if (mmu_invalidate_retry_hva(kvm, mmu_seq, hva)) {
+	if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn)) {
 		/*
 		 * This can happen when mappings are changed asynchronously, but
 		 * also synchronously if a COW is triggered by
-- 
2.39.3

