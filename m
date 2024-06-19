Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C1578C68
	for <loongarch@lists.linux.dev>; Wed, 19 Jun 2024 08:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718784593; cv=none; b=V6oOG7akx8chr3RaSBcjymLe2ckQvMwHvYGMHP+hAtBCrb7bZCi3Sr+YnSREhvdknPIdrAFaTYeQQAwnlQbuylRViB16h58V0qkkR2HJYsdXuzskA8kF1hqjmaaZunzfVTQtW6sD1YZMewER2Hhf9lyJl6O+14Mt+rQcE9BWPlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718784593; c=relaxed/simple;
	bh=Dj4caGZD85XgIzLrQI5RAXgZ3XwkUwK6rN5stW+Ojfw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UvY9w6/4Hrt8ilwMZAvRVG6ELK74FJPjdllAX+VFPICE6xAPdWSwvTOE5vG0zjaenp1AvrVegF0yiK6L7hl/aqZ4zXtXHoctj0AHlT8nB1lmKF1Rz3s+TJbFDXhkSRtLlUOb8NHWIFo3a594YaoKwLSudR2ejdjMo3rxPn2JyvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Dx2OlHknJm+S4IAA--.20385S3;
	Wed, 19 Jun 2024 16:09:43 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxjsdEknJmFeMoAA--.32907S8;
	Wed, 19 Jun 2024 16:09:43 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Sean Christopherson <seanjc@google.com>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] LoongArch: KVM: Mark page accessed and dirty with page ref added
Date: Wed, 19 Jun 2024 16:09:40 +0800
Message-Id: <20240619080940.2690756-7-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240619080940.2690756-1-maobibo@loongson.cn>
References: <20240619080940.2690756-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxjsdEknJmFeMoAA--.32907S8
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Function kvm_map_page_fast() is fast path of secondary mmu page fault
flow, pfn is parsed from secondary mmu page table walker. However
the corresponding page reference is not added, it is dangerious to
access page out of mmu_lock.

Here page ref is added inside mmu_lock, function kvm_set_pfn_accessed()
and kvm_set_pfn_dirty() is called with page ref added, so that the
page will not be freed by others.

Also kvm_set_pfn_accessed() is removed here since it is called in
the following function kvm_release_pfn_clean().

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/mmu.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 3b862f3a72cb..5a820a81fd97 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -557,6 +557,7 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_memory_slot *slot;
+	struct page *page;
 
 	spin_lock(&kvm->mmu_lock);
 
@@ -599,19 +600,22 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 	if (changed) {
 		kvm_set_pte(ptep, new);
 		pfn = kvm_pte_pfn(new);
+		page = kvm_pfn_to_refcounted_page(pfn);
+		if (page)
+			get_page(page);
 	}
 	spin_unlock(&kvm->mmu_lock);
 
-	/*
-	 * Fixme: pfn may be freed after mmu_lock
-	 * kvm_try_get_pfn(pfn)/kvm_release_pfn pair to prevent this?
-	 */
-	if (kvm_pte_young(changed))
-		kvm_set_pfn_accessed(pfn);
+	if (changed) {
+		if (kvm_pte_young(changed))
+			kvm_set_pfn_accessed(pfn);
 
-	if (kvm_pte_dirty(changed)) {
-		mark_page_dirty(kvm, gfn);
-		kvm_set_pfn_dirty(pfn);
+		if (kvm_pte_dirty(changed)) {
+			mark_page_dirty(kvm, gfn);
+			kvm_set_pfn_dirty(pfn);
+		}
+		if (page)
+			put_page(page);
 	}
 	return ret;
 out:
@@ -920,7 +924,6 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 		kvm_set_pfn_dirty(pfn);
 	}
 
-	kvm_set_pfn_accessed(pfn);
 	kvm_release_pfn_clean(pfn);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
-- 
2.39.3

