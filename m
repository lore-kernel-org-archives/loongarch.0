Received: from cmccmta1.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99A82628C
	for <loongarch@lists.linux.dev>; Sat, 13 Jul 2024 08:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720857638; cv=none; b=MNd/4u+RVRLasEqzjCEh/kGQkwVTOh7BTiuqzMMXew9KQpclKQXTIbDRK1Wy0Whj46Sylx8Pw14WMKZ9rDKezjxIQXNs4d2zXtUbGMP2OnmNR1FxIrq5eJOdJfI0idWdN7pAANr4Bx2UoCB6cNYIxUWJrOawf+pkXJpGRwZ15Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720857638; c=relaxed/simple;
	bh=hfYPjA00LDasRjY3/gpjinYkFcjZGczV5jqxpJ8QJ1w=;
	h=From:To:Cc:Subject:Date:Message-Id; b=o4c4zLGxjSq+H9IDtDB3BrUMIZqbOaqZeG0srKKjNgAYv2Q0UzsjLMUX7MEGllIaCt+yOnr2j5RDD37nRTmTiKdaZNOJXtnhCLuLmuKWcv8meqn06CshrNwjsmSatc7WJWblNl4YpU8zo5mZda9jShuCU55h0J4P41OZfQd4IVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee3669234142fc-12b07;
	Sat, 13 Jul 2024 16:00:21 +0800 (CST)
X-RM-TRANSID:2ee3669234142fc-12b07
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain.localdomain (unknown[223.108.79.100])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16692340ccff-6eea7;
	Sat, 13 Jul 2024 16:00:21 +0800 (CST)
X-RM-TRANSID:2ee16692340ccff-6eea7
From: tangbin <tangbin@cmss.chinamobile.com>
To: zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	tangbin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] LoongArch: KVM: Remove redundant assignment in kvm_map_page_fast
Date: Sat, 13 Jul 2024 11:59:37 -0400
Message-Id: <20240713155937.45261-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

In the function kvm_map_page_fast, the assignment of 'ret' is
redundant, so remove it.

Signed-off-by: tangbin <tangbin@cmss.chinamobile.com>
---
 arch/loongarch/kvm/mmu.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 2634a9e8d..d6c922a4a 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -551,7 +551,6 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
  */
 static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 {
-	int ret = 0;
 	kvm_pfn_t pfn = 0;
 	kvm_pte_t *ptep, changed, new;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
@@ -563,20 +562,16 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 
 	/* Fast path - just check GPA page table for an existing entry */
 	ptep = kvm_populate_gpa(kvm, NULL, gpa, 0);
-	if (!ptep || !kvm_pte_present(NULL, ptep)) {
-		ret = -EFAULT;
+	if (!ptep || !kvm_pte_present(NULL, ptep))
 		goto out;
-	}
 
 	/* Track access to pages marked old */
 	new = kvm_pte_mkyoung(*ptep);
 	/* call kvm_set_pfn_accessed() after unlock */
 
 	if (write && !kvm_pte_dirty(new)) {
-		if (!kvm_pte_write(new)) {
-			ret = -EFAULT;
+		if (!kvm_pte_write(new))
 			goto out;
-		}
 
 		if (kvm_pte_huge(new)) {
 			/*
@@ -584,10 +579,8 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 			 * enabled for HugePages
 			 */
 			slot = gfn_to_memslot(kvm, gfn);
-			if (kvm_slot_dirty_track_enabled(slot)) {
-				ret = -EFAULT;
+			if (kvm_slot_dirty_track_enabled(slot))
 				goto out;
-			}
 		}
 
 		/* Track dirtying of writeable pages */
@@ -615,10 +608,10 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 		if (page)
 			put_page(page);
 	}
-	return ret;
+	return 0;
 out:
 	spin_unlock(&kvm->mmu_lock);
-	return ret;
+	return -EFAULT;
 }
 
 static bool fault_supports_huge_mapping(struct kvm_memory_slot *memslot,
-- 
2.18.4



