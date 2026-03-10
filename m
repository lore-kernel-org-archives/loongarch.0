Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB33C33B97D
	for <loongarch@lists.linux.dev>; Tue, 10 Mar 2026 06:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773125722; cv=none; b=MQrztRQU0D77axp+C4qZzow4W0wG3Xeozt5DQ4fRbCLlz7N1X29pw1xuIschDp4hRUqEhPyhpcUinsoIbCGOMvV63mKM+pkcwtwk17UBONaExVUvbG0MZQfNMFQZkTvhEO+ILfTWLscJL4Lkl3MUk7oDMMsQ62tma+Oiwk3AHzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773125722; c=relaxed/simple;
	bh=EuKoDaksu2ZCRMxDcQ2IwiN6jcANmJmOk8OnRkZSGR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e572yExG4RjTopVqPdd8T6kD8ZgB5KRK1uOERZsEbFGMvb1XhDlqpZknJU4YmgOa9rHqZzOQ1nPjj3tJWF32acsN4byIiX9BRCWs0j2qjWUZa2FKs3qjNOZCCWD+ljTUHQSL5YVsmNrDriITiOjW44uWFA9dT6Gh+FazjELda+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx_8NXwK9pg2sZAA--.9670S3;
	Tue, 10 Mar 2026 14:55:19 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxKMFPwK9prulRAA--.11822S4;
	Tue, 10 Mar 2026 14:55:15 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] LoongArch: Check return values for set_memory_{rw,rox}
Date: Tue, 10 Mar 2026 14:55:09 +0800
Message-ID: <20260310065510.8189-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260310065510.8189-1-yangtiezhu@loongson.cn>
References: <20260310065510.8189-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxKMFPwK9prulRAA--.11822S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Aw4rAFyxJw4rArW3ZFyUXFc_yoW8GFyUpr
	17ur98Cr4Y93WxXFWxJFnrZr1fAa92kw1xWasxCa1fur43tw1DZr10gF42qFy0ya1xK340
	9F40yFWY93WUJ3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUco7KUUUUU

set_memory_rw() and set_memory_rox() may failed, it should check the
return values and return immediately in larch_insn_text_copy().

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/inst.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
index 7545ae3c796e..77da3b886dcb 100644
--- a/arch/loongarch/kernel/inst.c
+++ b/arch/loongarch/kernel/inst.c
@@ -258,6 +258,7 @@ static int text_copy_cb(void *data)
 int larch_insn_text_copy(void *dst, void *src, size_t len)
 {
 	int ret = 0;
+	int err = 0;
 	size_t start, end;
 	struct insn_copy copy = {
 		.dst = dst,
@@ -275,9 +276,19 @@ int larch_insn_text_copy(void *dst, void *src, size_t len)
 	start = round_down((size_t)dst, PAGE_SIZE);
 	end   = round_up((size_t)dst + len, PAGE_SIZE);
 
-	set_memory_rw(start, (end - start) / PAGE_SIZE);
+	err = set_memory_rw(start, (end - start) / PAGE_SIZE);
+	if (err) {
+		pr_info("%s: set_memory_rw failed\n", __func__);
+		return err;
+	}
+
 	ret = stop_machine_cpuslocked(text_copy_cb, &copy, cpu_online_mask);
-	set_memory_rox(start, (end - start) / PAGE_SIZE);
+
+	err = set_memory_rox(start, (end - start) / PAGE_SIZE);
+	if (err) {
+		pr_info("%s: set_memory_rox failed\n", __func__);
+		return err;
+	}
 
 	return ret;
 }
-- 
2.42.0

