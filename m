Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC7810EA
	for <loongarch@lists.linux.dev>; Mon, 15 Aug 2022 04:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF50C433C1;
	Mon, 15 Aug 2022 04:05:54 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: mm: avoid unnecessary page fault retires on shared memory types
Date: Mon, 15 Aug 2022 12:05:54 +0800
Message-Id: <20220815040554.1455722-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit d92725256b4f22d0 ("mm: avoid unnecessary page fault retires on
shared memory types") modifies do_page_fault() to handle the VM_FAULT_
COMPLETED case, but forget to change for LoongArch, so fix it as other
architectures does.

Fixes: d92725256b4f22d0 ("mm: avoid unnecessary page fault retires on shared memory types")
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/mm/fault.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
index 605579b19a00..1ccd53655cab 100644
--- a/arch/loongarch/mm/fault.c
+++ b/arch/loongarch/mm/fault.c
@@ -216,6 +216,10 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 		return;
 	}
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_RETRY)) {
 		flags |= FAULT_FLAG_TRIED;
 
-- 
2.31.1

