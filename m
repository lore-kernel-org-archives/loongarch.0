Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B87A311C15
	for <loongarch@lists.linux.dev>; Tue, 23 Dec 2025 08:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766477568; cv=none; b=O1BGfKjb36SQTDrm6NN1E33gMMw9eFVe6dtn+eBlwcmoz61k3vbDyJIeagDusEs5JctJ3emJ8vD5uX+RfxPnXQmSbaavkdOQ3MjL6uxw4h91u8jNJX2Rlo6W+CVqXq79PBXgiBfkQl4waG/8hihQMq5+APh+9/Io6MSdecDDSw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766477568; c=relaxed/simple;
	bh=uPLUSZt5bqT5HDBfC8mUHeHe8Uxjq0CRrOKJn/Guk58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N7S1Zsf0Wu+wwZfTYfx2tUXcbV2Y1vvtBLX8cDY0HcH7e/shXNqDX6dLA+8V9RodOEg2S2GuT0RC8t1EycqKz9oY9PrFJ4Hk7WnqVLxkLNfs860Fk+U0sa+r8jdgFlmz2HV2DaIyWfHJQKEnC41UGWsv+NrTvuezvdkffeUWzaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.54])
	by gateway (Coremail) with SMTP id _____8CxacL6TkppelACAA--.7064S3;
	Tue, 23 Dec 2025 16:12:42 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.54])
	by front1 (Coremail) with SMTP id qMiowJCxecH0TkppccMDAA--.402S2;
	Tue, 23 Dec 2025 16:12:41 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Select HAVE_CMPXCHG_LOCAL in Kconfig
Date: Tue, 23 Dec 2025 16:12:28 +0800
Message-ID: <20251223081228.3367509-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxecH0TkppccMDAA--.402S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GFy8Kry8trW3Gw1UXF4rXrc_yoWfWrb_Wa
	n3A3W8GF1rAFWj9a4qvF4FgF43ua1DuFs0krW29F4xu3W7X343J3y8Xwn5Zr1Ig3y5WFs5
	ZrWkXr9xCr12yosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8HSoJUUUUU==

LoongArch has already implemented cmpxchg_local(), this_cpu_cmpxchg()
and similar functions, so select HAVE_CMPXCHG_LOCAL in Kconfig to avoid
incurring the overhead of local_irq_save()/local_irq_restore() for page
state helpers in mm/vmstat.c.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 730f34214519..ae9d954aa052 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -130,6 +130,7 @@ config LOONGARCH
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select HAVE_ARCH_USERFAULTFD_MINOR if USERFAULTFD
 	select HAVE_ASM_MODVERSIONS
+	select HAVE_CMPXCHG_LOCAL
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_DEBUG_KMEMLEAK
-- 
2.47.3

