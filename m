Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF22368
	for <loongarch@lists.linux.dev>; Tue, 29 Aug 2023 00:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=NM2ZAIZdpAJQAO+FeaVtX/GS++k/SLz5UlFoR4kFiSU=; b=1ptDyEmzlVEdN1voi0m9PHNtfR
	ZnPQWqB7Y8yq6+P3d9MTMMv37imU6lKkiFTTI92YMr0ny4BNyvwPydYwqMm2OKDv1yhQ3mP9TQdKz
	zikgKB5Vi22yEwc8R4qEbyzHKKRsmr6s+f6WJDBK5RtX3vGLTHBvg1dDGpEL+dS6ihiLv3743kIId
	rZRNVcw4duX/PJuc1zqPHGCfIc+ip688ihGwMRvtwQLgqAgndugjdubR7678a0Bq9uwCd2ZMU6eSF
	p1Ex0GFewDOrsu//j8DnYMh8DdGbwX2Q2ELL4WyN+MjJbJ6yZhiPJIqkoxzd/8hfw6HeHwr7i5RKa
	zZk6vraQ==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qamVp-00AUqI-0f;
	Tue, 29 Aug 2023 00:23:17 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Qing Zhang <zhangqing@loongson.cn>,
	Hui Li <lihui@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: [PATCH 1/2] Loongarch: KGDB: fix implicit declaration of flush_icache_range()
Date: Mon, 28 Aug 2023 17:23:16 -0700
Message-ID: <20230829002316.28287-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add <asm/cacheflush.h> to prevent a build error:

arch/loongarch/kernel/kgdb.c: In function 'do_single_step':
arch/loongarch/kernel/kgdb.c:440:9: error: implicit declaration of function 'flush_icache_range' [-Werror=implicit-function-declaration]
  440 |         flush_icache_range(addr, addr + BREAK_INSTR_SIZE);

Fixes: 8968eb010689 ("LoongArch: Add basic KGDB & KDB support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Qing Zhang <zhangqing@loongson.cn>
Cc: Hui Li <lihui@loongson.cn>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev
---
 arch/loongarch/kernel/kgdb.c |    1 +
 1 file changed, 1 insertion(+)

diff -- a/arch/loongarch/kernel/kgdb.c b/arch/loongarch/kernel/kgdb.c
--- a/arch/loongarch/kernel/kgdb.c
+++ b/arch/loongarch/kernel/kgdb.c
@@ -13,6 +13,7 @@
 #include <linux/sched.h>
 #include <linux/smp.h>
 
+#include <asm/cacheflush.h>
 #include <asm/fpu.h>
 #include <asm/lbt.h>
 #include <asm/hw_breakpoint.h>
