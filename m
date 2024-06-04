Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64845145FEA
	for <loongarch@lists.linux.dev>; Tue,  4 Jun 2024 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717503308; cv=none; b=lThzWcchvGOmWWsOVtHVEEJqpcTLK5xBJrWl3DBlSDGTaoKwFIiXoWAgqGPfDFzNxFURSTZ0KEYqoDvQsiFebKkwN/GIzf6495UCcrsmD4JQx9BirH4YeQ4YLzTU/z00AAOPpBKLLNv1AbRhT9V6lwemapLPPidWRL1jt+cMBgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717503308; c=relaxed/simple;
	bh=WFVQjWH0ZoiMDGK+S3K+zIY7KmR/jPZqZ71uWqigK70=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OkWJ8D2dCTzAei2kEOgVnKCngINxm/jhOsWb6JH5WYDUvnn5ec+JB3ll2oF9G4zc9tpKbLyHHWtA3jXxeFvyP82YOhbVvfG6kXvtvpk6hhKorzjZxz0jKssMszpVBbiZY2BPElWPa9VuSgz9D4rdIc3BKzRU95mQO/yHDnb/BJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8DxSupGBV9mX2EDAA--.14544S3;
	Tue, 04 Jun 2024 20:15:02 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxDMdGBV9mFzkUAA--.50896S2;
	Tue, 04 Jun 2024 20:15:02 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: KVM: Discard dirty page tracking on readonly memslot
Date: Tue,  4 Jun 2024 20:15:02 +0800
Message-Id: <20240604121502.1985410-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxDMdGBV9mFzkUAA--.50896S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

For readonly memslot such as UEFI bios or UEFI var space, guest can
not write this memory space directly. So it is not necessary to track
dirty pages for readonly memslot. Here there is such optimization
in function kvm_arch_commit_memory_region().

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/mmu.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 98883aa23ab8..ec8c43aad724 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -444,6 +444,17 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 				   enum kvm_mr_change change)
 {
 	int needs_flush;
+	u32 old_flags = old ? old->flags : 0;
+	u32 new_flags = new ? new->flags : 0;
+	bool log_dirty_pages = new_flags & KVM_MEM_LOG_DIRTY_PAGES;
+
+	/* only track memslot flags changed */
+	if (change != KVM_MR_FLAGS_ONLY)
+		return;
+
+	/* Discard dirty page tracking on readonly memslot */
+	if ((old_flags & new_flags) & KVM_MEM_READONLY)
+		return;
 
 	/*
 	 * If dirty page logging is enabled, write protect all pages in the slot
@@ -454,9 +465,7 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 	 * MOVE/DELETE:	The old mappings will already have been cleaned up by
 	 *		kvm_arch_flush_shadow_memslot()
 	 */
-	if (change == KVM_MR_FLAGS_ONLY &&
-	    (!(old->flags & KVM_MEM_LOG_DIRTY_PAGES) &&
-	     new->flags & KVM_MEM_LOG_DIRTY_PAGES)) {
+	if (!(old_flags & KVM_MEM_LOG_DIRTY_PAGES) && log_dirty_pages) {
 		spin_lock(&kvm->mmu_lock);
 		/* Write protect GPA page table entries */
 		needs_flush = kvm_mkclean_gpa_pt(kvm, new->base_gfn,

base-commit: 2ab79514109578fc4b6df90633d500cf281eb689
-- 
2.39.3

