Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A83C107B9
	for <loongarch@lists.linux.dev>; Tue, 26 Sep 2023 12:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACDDAC433C7;
	Tue, 26 Sep 2023 12:10:49 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org,
	Chong Qiao <qiaochong@loongson.cn>
Subject: [PATCH] LoongArch: numa: Fix high_memory calculation
Date: Tue, 26 Sep 2023 20:10:31 +0800
Message-Id: <20230926121031.1901760-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

high_memory is the virtual address of the 'highest physical address' in
the system. But __va(get_num_physpages() << PAGE_SHIFT) is not what we
want because there may be holes in the physical address space. On the
other hand, max_low_pfn is calculated from memblock_end_of_DRAM(), which
is exactly corresponding to the highest physical address, so use it for
high_memory calculation.

Cc: <stable@vger.kernel.org>
Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
index c7d33c489e04..6e65ff12d5c7 100644
--- a/arch/loongarch/kernel/numa.c
+++ b/arch/loongarch/kernel/numa.c
@@ -436,7 +436,7 @@ void __init paging_init(void)
 
 void __init mem_init(void)
 {
-	high_memory = (void *) __va(get_num_physpages() << PAGE_SHIFT);
+	high_memory = (void *) __va(max_low_pfn << PAGE_SHIFT);
 	memblock_free_all();
 }
 
-- 
2.39.3

