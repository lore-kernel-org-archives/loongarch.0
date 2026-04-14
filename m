Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CECAB42AA6
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 06:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148507; cv=none; b=iY/QRiAy9TKvCfcsEousg3ZZHcfjhIPiaySgVERQ/rssyZn8Aq0UfhC0MpXtoMV7L4q/Z5JcWjmjYpla/ye/3q+pXmUiJnkHtwAgTAj7/ACIuwH7m7R1NxpSCXL5sAUkk3jS8CkBWjYunaXFl/uKTpu0zBM6/sCn7fqZVc/tpw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148507; c=relaxed/simple;
	bh=5Upy9Isyn7Z0Ptc1XbzgaDsNctpVc//8+xCHjTF6cAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U/9a3wEGbswfgzMUPK+9vuhHeFnAK0fobpgI06QUpl2j0zEuV69R0BiuW0j0BU5UmF1WEEC2GtewQPiax89OB4Tox3TWDd9RsptLcKylLQ9Hvk/fZzVOqjoX+8NGGkzYjumDI8IYfCm6a2yGQo4M+Db7xSDVM0aQq+sIMDiyKV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.8])
	by gateway (Coremail) with SMTP id _____8AxI_AY4N1pXmcAAA--.1966S3;
	Tue, 14 Apr 2026 14:35:04 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.8])
	by front1 (Coremail) with SMTP id qMiowJBxiuAT4N1p5rNsAA--.49024S2;
	Tue, 14 Apr 2026 14:35:03 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH] LoongArch: Make arch_irq_work_has_interrupt() true only if IPI HW exist
Date: Tue, 14 Apr 2026 14:34:50 +0800
Message-ID: <20260414063450.102805-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxiuAT4N1p5rNsAA--.49024S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gr1DAr4DZF4xCr4fJrW7Jrc_yoWDWrb_ua
	s7Xw48Ww4kXrW3Jw1Iqas5JasrCa1rGFn0kr1vqa17AFy5tr13X3yDZw1kZryYk3ykur4f
	Ca9FgrZ3CrnFkosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8QJ57UUUUU==

After commit 7c405fb3279b3924 ("rcu: Use an intermediate irq_work to
start process_srcu()"), Loongson-2K0300/2K0500 fail to boot. Because
IRQ_WORK need IPI but Loongson-2K0300/2K0500 don't have IPI HW.

So make arch_irq_work_has_interrupt() return true only if IPI HW exist.

Reported-by: Binbin Zhou <zhoubinbin@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/irq_work.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/irq_work.h b/arch/loongarch/include/asm/irq_work.h
index d63076e9160d..63aee0335d1a 100644
--- a/arch/loongarch/include/asm/irq_work.h
+++ b/arch/loongarch/include/asm/irq_work.h
@@ -4,7 +4,7 @@
 
 static inline bool arch_irq_work_has_interrupt(void)
 {
-	return IS_ENABLED(CONFIG_SMP);
+	return IS_ENABLED(CONFIG_SMP) && cpu_opt(LOONGARCH_CPU_CSRIPI);
 }
 
 #endif /* _ASM_LOONGARCH_IRQ_WORK_H */
-- 
2.52.0

