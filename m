Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33891357739
	for <loongarch@lists.linux.dev>; Sun, 17 May 2026 09:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779009910; cv=none; b=BdYv+BKI6jcp/V2foozIpvPxPGuy0SEPpRhtXnFwDhTQaj4w/ZO5RPgwhNdEYgJv+lORWp7XvKLps0sJcqemzgawUapmYO0JwrLSZXbS70clyGLshYUQn1Cd5keYPr9OXCP7YwO59iuzxLFVC3Cd/OsZeWeHbE2lI6itiJDPfxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779009910; c=relaxed/simple;
	bh=7y2WJ62VHjFjcC0W10A0Ibwi3RZr+dSmPhL4fXoUHjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e5VADQQG88kMxRgYqlRqjJ3BQq6YUwdzMCgPswuceIrUZcQQ+Yq9Q4rVp4wvAcaKGzieIjNM0HmZQPvMkUvCVGka/NXYb33fo29IzANQ272Uhb/r68SQKrAuuUyf3zaSHU84aSZe1mWjfIKCHS8RYu9/BQYbRM12k4pZ7+B47SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8DxBOlwiQlqiIUKAA--.25447S3;
	Sun, 17 May 2026 17:25:04 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJAxlsBXiQlqD0KFAA--.49892S2;
	Sun, 17 May 2026 17:24:43 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org
Subject: [PATCH] LoongArch: Remove unused code to avoid build warning
Date: Sun, 17 May 2026 17:24:32 +0800
Message-ID: <20260517092432.1025008-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxlsBXiQlqD0KFAA--.49892S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWrtryDZr47WrWxXryUJFW8AFc_yoW8JF1kpr
	W8Zwn5Kr4UWr17Zws7tr9Y9rnxJ3Z7KF42qFsIkF9xWF17Xr109r1ft3ZFqFy5J3yrGFWI
	vr4ktr13Wa1jkacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UMpBfUUUUU=

After commit feee6b2989165631b1 ("mm/memory_hotplug: shrink zones when
offlining memory"), __remove_pages() doesn't need the "zone" parameter
so the "page" variable is also unused. Remove the unused code to avoid
such build warning:

arch/loongarch/mm/init.c: In function 'arch_remove_memory':
arch/loongarch/mm/init.c:134:22: warning: variable 'page' set but not used [-Wunused-but-set-variable=]
  134 |         struct page *page = pfn_to_page(start_pfn);

Cc: <stable@vger.kernel.org>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/mm/init.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index 3f9ab54114c5..031b39eb081c 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -123,11 +123,7 @@ void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
-	struct page *page = pfn_to_page(start_pfn);
 
-	/* With altmap the first mapped page is offset from @start */
-	if (altmap)
-		page += vmem_altmap_offset(altmap);
 	__remove_pages(start_pfn, nr_pages, altmap);
 }
 #endif
-- 
2.52.0

