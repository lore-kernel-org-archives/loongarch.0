Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F471A724E
	for <loongarch@lists.linux.dev>; Mon, 14 Oct 2024 03:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728878341; cv=none; b=uEe26HcYK03bSl6lPUUUDq/ciamnZvi4FnuoAiofI9rani4U9BMFNfqWQ6F3L82rDi1SAdGHdvtoRUBcIQ7+V1toAfjX9L4KUmdQxAOeyGWveu18pMAGlA/fRorYxOsjNwZZX1c30ORiF1ss6aObGchb4Yo6b+RA1IDzgrp3v4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728878341; c=relaxed/simple;
	bh=t2KrUGZIDFgaKdCUSV0kybkLwE+kNnGsx3HNHyOYu5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=afLCBKj/YmUl3tnBCI3garWaC14AMu94kNCvwyFxqG6o1xSsmdJviYqjsykQRPKSkPSz/jvlzmwicd2VfoYa37eWTE4fxoOsvm0JSFvr5alUn67et6+38Yuk8SdbXfvN7Ob1JvP3VHyDJ82IlxDqHk5NnoNu9wp2jTjLl6DnFMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxQYgBlwxnhgIaAA--.37778S3;
	Mon, 14 Oct 2024 11:58:57 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMBxXuT_lgxnc6EoAA--.1717S4;
	Mon, 14 Oct 2024 11:58:57 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Barry Song <baohua@kernel.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: [PATCH v2 2/3] LoongArch: Add barrier between set_pte and memory access
Date: Mon, 14 Oct 2024 11:58:54 +0800
Message-Id: <20241014035855.1119220-3-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20241014035855.1119220-1-maobibo@loongson.cn>
References: <20241014035855.1119220-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxXuT_lgxnc6EoAA--.1717S4
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

It is possible to return a spurious fault if memory is accessed
right after the pte is set. For user address space, pte is set
in kernel space and memory is accessed in user space, there is
long time for synchronization, no barrier needed. However for
kernel address space, it is possible that memory is accessed
right after the pte is set.

Here flush_cache_vmap/flush_cache_vmap_early is used for
synchronization.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/include/asm/cacheflush.h | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/cacheflush.h b/arch/loongarch/include/asm/cacheflush.h
index f8754d08a31a..53be231319ef 100644
--- a/arch/loongarch/include/asm/cacheflush.h
+++ b/arch/loongarch/include/asm/cacheflush.h
@@ -42,12 +42,24 @@ void local_flush_icache_range(unsigned long start, unsigned long end);
 #define flush_cache_dup_mm(mm)				do { } while (0)
 #define flush_cache_range(vma, start, end)		do { } while (0)
 #define flush_cache_page(vma, vmaddr, pfn)		do { } while (0)
-#define flush_cache_vmap(start, end)			do { } while (0)
 #define flush_cache_vunmap(start, end)			do { } while (0)
 #define flush_icache_user_page(vma, page, addr, len)	do { } while (0)
 #define flush_dcache_mmap_lock(mapping)			do { } while (0)
 #define flush_dcache_mmap_unlock(mapping)		do { } while (0)
 
+/*
+ * It is possible for a kernel virtual mapping access to return a spurious
+ * fault if it's accessed right after the pte is set. The page fault handler
+ * does not expect this type of fault. flush_cache_vmap is not exactly the
+ * right place to put this, but it seems to work well enough.
+ */
+static inline void flush_cache_vmap(unsigned long start, unsigned long end)
+{
+	smp_mb();
+}
+#define flush_cache_vmap flush_cache_vmap
+#define flush_cache_vmap_early	flush_cache_vmap
+
 #define cache_op(op, addr)						\
 	__asm__ __volatile__(						\
 	"	cacop	%0, %1					\n"	\
-- 
2.39.3

