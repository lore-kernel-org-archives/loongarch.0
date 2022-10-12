Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41200191
	for <loongarch@lists.linux.dev>; Wed, 12 Oct 2022 01:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56EFC433C1;
	Wed, 12 Oct 2022 01:58:43 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Flush TLB earlier at initialization
Date: Wed, 12 Oct 2022 09:57:07 +0800
Message-Id: <20221012015707.2139728-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move local_flush_tlb_all() earlier (just after setup_ptwalker() and
before page allocation). This can avoid stale TLB entries misguiding
the later page allocation. Without this patch the second kernel of
kexec/kdump fails to boot SMP.

BTW, move output_pgtable_bits_defines() into tlb_init() since it has
nothing to do with tlb handler setup.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/mm/tlb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
index 9818ce11546b..da3681f131c8 100644
--- a/arch/loongarch/mm/tlb.c
+++ b/arch/loongarch/mm/tlb.c
@@ -258,7 +258,7 @@ extern long exception_handlers[VECSIZE * 128 / sizeof(long)];
 void setup_tlb_handler(int cpu)
 {
 	setup_ptwalker();
-	output_pgtable_bits_defines();
+	local_flush_tlb_all();
 
 	/* The tlb handlers are generated only once */
 	if (cpu == 0) {
@@ -301,6 +301,7 @@ void tlb_init(int cpu)
 	write_csr_pagesize(PS_DEFAULT_SIZE);
 	write_csr_stlbpgsize(PS_DEFAULT_SIZE);
 	write_csr_tlbrefill_pagesize(PS_DEFAULT_SIZE);
+
 	setup_tlb_handler(cpu);
-	local_flush_tlb_all();
+	output_pgtable_bits_defines();
 }
-- 
2.31.1

