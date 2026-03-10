Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742B3325486
	for <loongarch@lists.linux.dev>; Tue, 10 Mar 2026 06:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773125724; cv=none; b=BlheqalhOLmRpl63NWn5K7tfxk2nlWnLfz/nDBlTiSggzXLY0Lh3kkbXg4vlwH0a7l7hmplZP5cySbChi4T94kad2GxNz/+8wNSrJ8oKL3RygIpd05XQdqEHzCYhMzUFTj5Vf7Ot9jCnPzT2oqYZNN6MpYRjTAchXD1pqVeOkKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773125724; c=relaxed/simple;
	bh=FWtkSisUeR0pG0Hk+MuSW+wyocBn7Z1zPYsGGnzKDW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p9esPam6ITpHn5QP/Z77o6WFCwGAiT3j67ByUwWWrRWKIE5ybdT1127kJCI/auMHpzy4EVTqMO87NkksjGeHtzZmDFS2uGaHuEicX3uQNoFXu0hCCJERD5tFWRDkGc9rHGbfbrEu2gGcJTPM3hwOjjoYk0nusGyGlzVFsyOQtCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cx58FXwK9ph2sZAA--.62516S3;
	Tue, 10 Mar 2026 14:55:19 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxKMFPwK9prulRAA--.11822S5;
	Tue, 10 Mar 2026 14:55:19 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] LoongArch: No need to flush icache if copy failed
Date: Tue, 10 Mar 2026 14:55:10 +0800
Message-ID: <20260310065510.8189-4-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJBxKMFPwK9prulRAA--.11822S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Wr4rAr47Zw4xur4UKF1ruFX_yoWfZwc_W3
	WSg34kGrWrAa1qv3WY93s5Xryqva1F9F4F93ZFvr4xCwn3J34UK3yYqwn8Ar9rKrWxCrZx
	Cr4UW3sxCw1jkosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5l1kUUUUU=

If copy_to_kernel_nofault() failed, no need to flush icache and just
return -EFAULT immediately.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/inst.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
index 77da3b886dcb..dd5e8864eff9 100644
--- a/arch/loongarch/kernel/inst.c
+++ b/arch/loongarch/kernel/inst.c
@@ -246,13 +246,15 @@ static int text_copy_cb(void *data)
 
 	if (smp_processor_id() == copy->cpu) {
 		ret = copy_to_kernel_nofault(copy->dst, copy->src, copy->len);
-		if (ret)
+		if (ret) {
 			pr_err("%s: operation failed\n", __func__);
+			return -EFAULT;
+		}
 	}
 
 	flush_icache_range((unsigned long)copy->dst, (unsigned long)copy->dst + copy->len);
 
-	return ret;
+	return 0;
 }
 
 int larch_insn_text_copy(void *dst, void *src, size_t len)
-- 
2.42.0

