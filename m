Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5475E3ED3C4
	for <loongarch@lists.linux.dev>; Fri, 28 Aug 2026 09:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910531; cv=none; b=rABkGWzld1uZuU2v8Nth3/gOfmFyjw9YLwERtvvtmG6AU0yvYiFFarOeqgXvKvQb9FD4S0fHdg6uqOElQ2vAOJ7xythVl8nRyp1GC4+vEkU9u/4AU/stFfrSNzvTLUYkWISEjfNbGm7bD1c3jrvjhfSPKWq2JvkeLokilCBrOOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910531; c=relaxed/simple;
	bh=Zi1m5Scrgsl4AYbybyq3AVK36XhFYb/plYxSqHhsYjk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QgiqPzubnNXknY4EGDzd5KInM64epasJYKjuj3HgsEjK0ix4X5MzmZBlTrkpg/Gd8uRtU2oqk136s6VoyyeaIgHJmEwcv0LVHHh92jppQ5JWEV/gsp9mKOWEsZmkZuPSPRQlZie57iu1q/g0sg1jCJut6HdfMwCfciyxl1F7iwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QXYWBail; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QXYWBail"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=r+
	YvRMyzs1YPj/u8CckMugVq1vF4dACGElmkBuRz70o=; b=QXYWBail0FwiVi6QRV
	s0GnQ1IadRazUwWQ2QVldxzZ36yGlp92cPjqnGmwI+shkhSS/ZSAF6dqnCKza9ox
	2yhjLLF8AF70gIcn0nnRPQVVn5CqFR+0hgaSretq/YlAeUSfhuezwUcJUAvOOK2F
	ZlqGO1gl8cUS5JR7TYIuUe7dg=
Received: from zengchi (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnT2JrWZFqNew8QA--.10264S2;
	Fri, 28 Aug 2026 17:48:29 +0800 (CST)
From: Zeng Chi <zeng_chi911@163.com>
To: zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zengchi@kylinos.cn,
	stable@vger.kernel.org
Subject: [PATCH] LoongArch: KVM: Preserve memslot arch flags on KVM_MR_FLAGS_ONLY
Date: Fri, 28 Aug 2026 17:48:25 +0800
Message-Id: <20260828094825.357630-1-zeng_chi911@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnT2JrWZFqNew8QA--.10264S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF4kWFW5Xw15KF18AF15CFg_yoW8tF18pF
	Z7Cwn0kr4rGrnakFZ7J34kWa1UA397JF409Fy7t34jyr98ta4Fka48Aa1DWa15Jr4fAFWa
	qF1Yv3s8t3WDJwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jeApnUUUUU=
X-CM-SenderInfo: 52hqws5fklmiqr6rljoofrz/xtbC5w1wLGqRWW3oFQAA3E

From: Zeng Chi <zengchi@kylinos.cn>

kvm_arch_prepare_memory_region() computes new->arch.flags, i.e. whether
a memslot is KVM_MEM_HUGEPAGE_CAPABLE or KVM_MEM_HUGEPAGE_INCAPABLE, only
for KVM_MR_CREATE and KVM_MR_MOVE, and returns early for every other
change.  But the generic code allocates a zeroed memslot for every
change and never copies old->arch, so after a KVM_MR_FLAGS_ONLY update,
e.g. toggling KVM_MEM_LOG_DIRTY_PAGES for live migration, the active
memslot has arch.flags == 0.

With both flags clear, fault_supports_huge_mapping() falls through to
the alignment check on the HVA range alone, which no longer verifies
that the GPA and HVA have the same offset within a PMD.  A memslot that
was marked KVM_MEM_HUGEPAGE_INCAPABLE because of a GPA/HVA offset
mismatch can then be mapped with PMD entries on read faults, and since
kvm_map_page() aligns the gfn and the pfn independently, the guest ends
up accessing the wrong host pages, exactly the "d -> f, e -> g" case
described in the comment above the check.

Carry the arch flags over from the old memslot for KVM_MR_FLAGS_ONLY,
as the GPA, HVA and size are guaranteed to be unchanged for that case.

Fixes: 7ab6fb505b2a ("LoongArch: KVM: Optimization for memslot hugepage checking")
Cc: stable@vger.kernel.org
Signed-off-by: Zeng Chi <zengchi@kylinos.cn>
---
 arch/loongarch/kvm/mmu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index e104897aa532..4ca7c6ea8f08 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -383,6 +383,16 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm, const struct kvm_memory_slot
 	hva_t hva_start;
 	size_t size, gpa_offset, hva_offset;
 
+	/*
+	 * The generic code allocates a fresh, zeroed memslot for every change,
+	 * so the arch flags computed below must be carried over when only the
+	 * userspace flags change, e.g. when dirty logging is toggled.
+	 */
+	if (change == KVM_MR_FLAGS_ONLY) {
+		new->arch = old->arch;
+		return 0;
+	}
+
 	if ((change != KVM_MR_MOVE) && (change != KVM_MR_CREATE))
 		return 0;
 	/*
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

