Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8622A1D7
	for <loongarch@lists.linux.dev>; Tue, 31 Dec 2024 07:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735631649; cv=none; b=gUrZsBcjlniQkg2SNjVCfqA/em4KJxXJFzVa9lz8iUVoyclDx6znoUwKEt2a/6coPqtnz/rSGtYmQPpUP7hcCj1yC4hj7NzEanEZ2tT5i5AZcCPII9BOh0fBPc6iWPOTSS2/U72qQiN0GGeRL9AaNDgvm0CJ4MVl+dZJkh9YUwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735631649; c=relaxed/simple;
	bh=b/pFC+Vx168E8dTmVUIHcsYU88BX3EgWB+w74JWFF14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QAJoXOn5nrhtEK1H9gBwcIj6FlwqwjsMXoZMDtg67dF7C79qvKq4y6gm6NO6ePZHj3XoG5EKh9ss0E7XxJ6srdcSxLttCaPBtYXECj3+oodFTFAwGOqKyBRvIBuANvpQEeKoU+Nz0KQ/1+GjLIAdJDSDGUwNVO9dgHp/4MVMTbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.63])
	by gateway (Coremail) with SMTP id _____8Dx2uEco3NnT1JcAA--.53484S3;
	Tue, 31 Dec 2024 15:54:04 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
	by front1 (Coremail) with SMTP id qMiowMAxvsUYo3Nnth8PAA--.8118S2;
	Tue, 31 Dec 2024 15:54:04 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Refactor bug_handler() implementation
Date: Tue, 31 Dec 2024 15:53:53 +0800
Message-ID: <20241231075353.1458674-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxvsUYo3Nnth8PAA--.8118S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZFy8WFy7Aw13XryrGry5KFX_yoWkXrX_Wr
	13Cw18WrW8AayF93WqqFs7XryDuay8tFnak3Z2qrZxtF93Wr1rGr4jvwn0yrnYqFW5Gr45
	XrWkX3Zaka4aqosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==

1. Early return for user mode triggered exception with all types.
2. Give a chance to call fixup_exception() for default types (like
   S390).

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/traps.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index c57b4134f3e8..2ec3106c0da3 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -597,17 +597,24 @@ int is_valid_bugaddr(unsigned long addr)
 
 static void bug_handler(struct pt_regs *regs)
 {
+	if (user_mode(regs)) {
+		force_sig(SIGTRAP);
+		return;
+	}
+
 	switch (report_bug(regs->csr_era, regs)) {
 	case BUG_TRAP_TYPE_BUG:
-	case BUG_TRAP_TYPE_NONE:
-		die_if_kernel("Oops - BUG", regs);
-		force_sig(SIGTRAP);
+		die("Oops - BUG", regs);
 		break;
 
 	case BUG_TRAP_TYPE_WARN:
 		/* Skip the BUG instruction and continue */
 		regs->csr_era += LOONGARCH_INSN_SIZE;
 		break;
+
+	default:
+		if (!fixup_exception(regs))
+			die("Oops - BUG", regs);
 	}
 }
 
-- 
2.43.5

