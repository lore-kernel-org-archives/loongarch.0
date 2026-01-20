Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E423D3D02
	for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 09:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901034; cv=none; b=lTnIddVKKQ4LLX9836Xt8602wa/0DxbYl5/Lu+VmvB+PBvg0+ZYh9C5tSipZtcxSl13Z8F2QIhpSkucRRj7obLB1T34rw4z9mKbORC76nZNDYZE+EmaSuZ3u3RKxXwfOIm3hHmYvtJac7QZKVTER3Rvt9GhMD7m/andHy7FSrqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901034; c=relaxed/simple;
	bh=daV5+g/aN9uFbcgilPybOF3xXtKayuRyJbqRWaUW/5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q7ibRJQYe6lKuGTPzq21sk1LhHKQMSdm8xYo+XghrQ/tZlTigS7oUyK9h7T1DXE3okNCudGx/zX8MclaOVn5RNV9TM+twLlZX+la85AqPIZURylHWJeOKB2Hzou0WBm9Ck848xwgUtUrDO2Bq9tmWJzU21G2SXymjT3GtTAJyLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cx58GeSW9pTqcKAA--.22726S3;
	Tue, 20 Jan 2026 17:23:42 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxHOGSSW9pD3InAA--.14911S3;
	Tue, 20 Jan 2026 17:23:41 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] LoongArch: Use %px to print address in unwind_next_frame()
Date: Tue, 20 Jan 2026 17:23:28 +0800
Message-ID: <20260120092331.813-2-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJCxHOGSSW9pD3InAA--.14911S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GFWkJr4rCFW5Zry8Zr45CFX_yoWfKwbEq3
	4xXw48GrZaywn5Z3Z8XF1fJa42va10yF9Y93ZrZ3yIy34YvF13JrZaqw13Aw1qgFWrCrZ8
	J397Wr9Ykw1IyosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

Currently, use %p to prevent leaking information about the kernel memory
layout when printing the pc address, but the kernel log messages are not
useful to debug problem if bt_address() returns 0. Given that the type of
"pc" variable is unsigned long, it should use %px to print the unmodified
address.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/unwind_orc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/unwind_orc.c
index 8a6e3429a860..d6b3688a1ce9 100644
--- a/arch/loongarch/kernel/unwind_orc.c
+++ b/arch/loongarch/kernel/unwind_orc.c
@@ -494,7 +494,7 @@ bool unwind_next_frame(struct unwind_state *state)
 
 	state->pc = bt_address(pc);
 	if (!state->pc) {
-		pr_err("cannot find unwind pc at %p\n", (void *)pc);
+		pr_err("cannot find unwind pc at %px\n", (void *)pc);
 		goto err;
 	}
 
-- 
2.42.0

