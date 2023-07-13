Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F53100D4
	for <loongarch@lists.linux.dev>; Thu, 13 Jul 2023 09:40:29 +0000 (UTC)
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R1qJl1fsnztRTt;
	Thu, 13 Jul 2023 17:37:27 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 17:40:26 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
	<surenb@google.com>
CC: Russell King <linux@armlinux.org.uk>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
	<chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
	<gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>, Kefeng Wang
	<wangkefeng.wang@huawei.com>
Subject: [PATCH rfc -next 04/10] s390: mm: use try_vma_locked_page_fault()
Date: Thu, 13 Jul 2023 17:53:32 +0800
Message-ID: <20230713095339.189715-5-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713095339.189715-1-wangkefeng.wang@huawei.com>
References: <20230713095339.189715-1-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected

Use new try_vma_locked_page_fault() helper to simplify code.
No functional change intended.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/s390/mm/fault.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
index 40a71063949b..97e511690352 100644
--- a/arch/s390/mm/fault.c
+++ b/arch/s390/mm/fault.c
@@ -362,6 +362,7 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
 	struct task_struct *tsk;
 	struct mm_struct *mm;
 	struct vm_area_struct *vma;
+	struct vm_locked_fault vmlf;
 	enum fault_type type;
 	unsigned long address;
 	unsigned int flags;
@@ -407,31 +408,19 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
 		access = VM_WRITE;
 	if (access == VM_WRITE)
 		flags |= FAULT_FLAG_WRITE;
-#ifdef CONFIG_PER_VMA_LOCK
-	if (!(flags & FAULT_FLAG_USER))
-		goto lock_mmap;
-	vma = lock_vma_under_rcu(mm, address);
-	if (!vma)
-		goto lock_mmap;
-	if (!(vma->vm_flags & access)) {
-		vma_end_read(vma);
+
+	VM_LOCKED_FAULT_INIT(vmlf, mm, address, flags, access, regs, 0);
+	if (try_vma_locked_page_fault(&vmlf, &fault))
 		goto lock_mmap;
-	}
-	fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);
-	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
-		vma_end_read(vma);
-	if (!(fault & VM_FAULT_RETRY)) {
-		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
+	else if (!(fault | VM_FAULT_RETRY))
 		goto out;
-	}
-	count_vm_vma_lock_event(VMA_LOCK_RETRY);
+
 	/* Quick path to respond to signals */
 	if (fault_signal_pending(fault, regs)) {
 		fault = VM_FAULT_SIGNAL;
 		goto out;
 	}
 lock_mmap:
-#endif /* CONFIG_PER_VMA_LOCK */
 	mmap_read_lock(mm);
 
 	gmap = NULL;
-- 
2.27.0

