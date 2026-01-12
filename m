Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6B5346A1A
	for <loongarch@lists.linux.dev>; Mon, 12 Jan 2026 09:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209354; cv=none; b=cEkSz1Jj4qglOd6NnIHs7jgAll8b9Qm+X4f01BXNeIw5OXM3MWLD5saCFa3wkFJP35Sp+yJ1MWhO+GbGRb7jpILODZ1noeSo+/Evec5aCcfDioueH9onO+5MiLVDr1rcolAGU8zCwEs4JNYpwgQqEt8InQ3W8KAGlb5lesEcx/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209354; c=relaxed/simple;
	bh=kvEvk0hVid6AXX1qULTCy6myWHbDDqY0Oj86lkq6bjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=omL3g1PhBk4wvkkxilK4Mpq4jNxNuNcN6plwSV/R5lzZdgXfBIRWlR8ZXhAyOr5B2Nrv/U5br2zL2zaejIFJLSsa3JMQLcuXxLKUss3NZdONkkZFR30JdpuJna5LBfdXr5Rk9G421E0ijbreCB7Gn+UQwSg87K+zGSbiEXWn8zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxrsPCu2RpmNEHAA--.25597S3;
	Mon, 12 Jan 2026 17:15:46 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxGMHBu2RpMOEaAA--.41928S2;
	Mon, 12 Jan 2026 17:15:46 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "LoongArch: Remove unnecessary checks for ORC unwinder"
Date: Mon, 12 Jan 2026 17:15:31 +0800
Message-ID: <20260112091531.12735-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxGMHBu2RpMOEaAA--.41928S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kr1xWr13Xw13WF4UZr1xtFc_yoW8XFW8pF
	ZxC3WYgr4xK348W39xJryavr98Ar97t3W2gFZrKr95uF1jqw13Cw1a934UuF1Dtry8Wa10
	9Fn5trZ0kanFy3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUUUUU==

This reverts commit 4cd641a79e69270a062777f64a0dd330abb9044a.

The system can not boot normally with the latest kernel 6.19-rc5 under
different configs, commit 4cd641a79e69 ("LoongArch: Remove unnecessary
checks for ORC unwinder") is the first bad commit since 6.19-rc4, just
revert it first before finding the root cause.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/unwind_orc.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/unwind_orc.c
index 8a6e3429a860..710f82d73797 100644
--- a/arch/loongarch/kernel/unwind_orc.c
+++ b/arch/loongarch/kernel/unwind_orc.c
@@ -352,6 +352,12 @@ static inline unsigned long bt_address(unsigned long ra)
 {
 	extern unsigned long eentry;
 
+	if (__kernel_text_address(ra))
+		return ra;
+
+	if (__module_text_address(ra))
+		return ra;
+
 	if (ra >= eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) {
 		unsigned long func;
 		unsigned long type = (ra - eentry) / VECSIZE;
@@ -369,13 +375,10 @@ static inline unsigned long bt_address(unsigned long ra)
 			break;
 		}
 
-		ra = func + offset;
+		return func + offset;
 	}
 
-	if (__kernel_text_address(ra))
-		return ra;
-
-	return 0;
+	return ra;
 }
 
 bool unwind_next_frame(struct unwind_state *state)
@@ -498,6 +501,9 @@ bool unwind_next_frame(struct unwind_state *state)
 		goto err;
 	}
 
+	if (!__kernel_text_address(state->pc))
+		goto err;
+
 	return true;
 
 err:
-- 
2.42.0

