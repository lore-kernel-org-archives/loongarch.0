Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D073343F1
	for <loongarch@lists.linux.dev>; Thu, 23 Jun 2022 09:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B538FC3411B;
	Thu, 23 Jun 2022 09:13:04 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Fix EENTRY/MERRENTRY setting in setup_tlb_handler()
Date: Thu, 23 Jun 2022 17:14:12 +0800
Message-Id: <20220623091412.2479084-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

setup_tlb_handler() is expected to set per-cpu exception handlers, but
it only set the TLBRENTRY successfully because of copy & paste errors,
so fix it.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/mm/tlb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
index 6d050973241c..0cb2f2aa88aa 100644
--- a/arch/loongarch/mm/tlb.c
+++ b/arch/loongarch/mm/tlb.c
@@ -289,7 +289,8 @@ void setup_tlb_handler(int cpu)
 		pcpu_handlers[cpu] = virt_to_phys(addr);
 		memcpy((void *)addr, (void *)eentry, vec_sz);
 		local_flush_icache_range((unsigned long)addr, (unsigned long)addr + vec_sz);
-		csr_write64(pcpu_handlers[cpu], LOONGARCH_CSR_TLBRENTRY);
+		csr_write64(pcpu_handlers[cpu], LOONGARCH_CSR_EENTRY);
+		csr_write64(pcpu_handlers[cpu], LOONGARCH_CSR_MERRENTRY);
 		csr_write64(pcpu_handlers[cpu] + 80*VECSIZE, LOONGARCH_CSR_TLBRENTRY);
 	}
 #endif
-- 
2.27.0

