Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256D3A2A
	for <loongarch@lists.linux.dev>; Thu, 30 Jun 2022 04:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3983EC34115;
	Thu, 30 Jun 2022 04:34:07 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Feiyang Chen <chenfeiyang@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V2 4/4] LoongArch: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
Date: Thu, 30 Jun 2022 12:32:37 +0800
Message-Id: <20220630043237.2059576-5-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220630043237.2059576-1-chenhuacai@loongson.cn>
References: <20220630043237.2059576-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Feiyang Chen <chenfeiyang@loongson.cn>

The feature of minimizing overhead of struct page associated with each
HugeTLB page is implemented on x86_64. However, the infrastructure of
this feature is already there, so just select ARCH_WANT_HUGETLB_PAGE_
OPTIMIZE_VMEMMAP is enough to enable this feature for LoongArch.

To avoid build error on LoongArch we should include linux/static_key.h
in page-flags.h.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 arch/loongarch/Kconfig     | 1 +
 include/linux/page-flags.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 55ab84fd70e5..8e56ca28165e 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -49,6 +49,7 @@ config LOONGARCH
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
+	select ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 	select ARCH_WANTS_NO_INSTR
 	select BUILDTIME_TABLE_SORT
 	select COMMON_CLK
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index e66f7aa3191d..28a53ac7aa3e 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 #include <linux/bug.h>
 #include <linux/mmdebug.h>
+#include <linux/static_key.h>
 #ifndef __GENERATING_BOUNDS_H
 #include <linux/mm_types.h>
 #include <generated/bounds.h>
-- 
2.27.0

