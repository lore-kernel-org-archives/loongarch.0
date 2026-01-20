Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C803D331E
	for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 09:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901035; cv=none; b=Gl/Xf3699PdQM9GA9m97czcq93tLfrO+a8dQ/RdYu+xua8ml60FpGZ7bKIwZxAyBP+3z1Gs09p455E2xust7Pz2ZPC+dm0/8qGBV63fpm1Oim0NPIo74qUJ4X9GbTXVWN1f0ovpbmNJ9ZOTgriHTaOXRhu+MuB17j7lp6uQqZ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901035; c=relaxed/simple;
	bh=CNQuEBB8Aif3xuCUvn2xPM7tbnqDc+7YaokdyGyZIP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lqfj+TJkQmMWatT5KgkfoF34nWwUWp9hSEK2mL56uDKycdcGHNTGbS8uHL+kJ0qlAj0sJWan8QC4mYQs20JONz2vlxGKwdmKQEsTSUZJlh0rmHWb4CGawFpzBU74a8a078nCkeR/jBXZRTjMzjbLs+oPL8DVPc57fYlpwxkOSW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxHMOfSW9pV6cKAA--.34551S3;
	Tue, 20 Jan 2026 17:23:44 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxHOGSSW9pD3InAA--.14911S6;
	Tue, 20 Jan 2026 17:23:43 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] LoongArch: Guard percpu handler under !CONFIG_PREEMPT_RT
Date: Tue, 20 Jan 2026 17:23:31 +0800
Message-ID: <20260120092331.813-5-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260120092331.813-1-yangtiezhu@loongson.cn>
References: <20260120092331.813-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxHOGSSW9pD3InAA--.14911S6
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZF4xArWfWw1DWw1DKr4rZwc_yoWfWwcEgw
	s7Cw4vkrWrXF909w1aqw4rZ347Xw10gFZYkF1kAr4xA3WYyFn5JrZ3J3s8u390qrZ8WrZ8
	t3yqqr9akrnFkosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

After commit 88fd2b70120d ("LoongArch: Fix sleeping in atomic context for
PREEMPT_RT"), it should guard percpu handler under !CONFIG_PREEMPT_RT to
avoid redundant operations.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/unwind_prologue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/unwind_prologue.c b/arch/loongarch/kernel/unwind_prologue.c
index d04498d8090e..da07acad7973 100644
--- a/arch/loongarch/kernel/unwind_prologue.c
+++ b/arch/loongarch/kernel/unwind_prologue.c
@@ -61,7 +61,7 @@ static inline bool scan_handlers(unsigned long entry_offset)
 
 static inline bool fix_exception(unsigned long pc)
 {
-#ifdef CONFIG_NUMA
+#if defined(CONFIG_NUMA) && !defined(CONFIG_PREEMPT_RT)
 	int cpu;
 
 	for_each_possible_cpu(cpu) {
-- 
2.42.0

