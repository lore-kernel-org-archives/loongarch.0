Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8011A76BB
	for <loongarch@lists.linux.dev>; Tue,  9 Dec 2025 06:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765261118; cv=none; b=a5fX6Y7Npu3lFhxphOb40dE7dPH/JyKovqlmVWRQEKswLQQLS7aJozfsBKcYAfuCft39jJgx/weSeCFS+pad4dpxdE2TUfduBO8YSHYo+rq0IgoH1exUbtiiDgZB72RfLwAXUj1oHho17GgmWBaqGX62VCp/Bv5d5Tf/uESpNEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765261118; c=relaxed/simple;
	bh=ZxV5Lnn6lnKBzOlW162o0eRy0u7f3XrMiH+oBkZlenw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PoQrJkm4fBLm9RcpCqWq6FoZNjM53q5DAWGhxiAG3TOy8oj8FcUwbDejnsMIlHv2ejmXA4eTw+9eOc/sdKXDC4tcrVHkkoL4itt8zmS3l2eT5kfEJHjr1F9GkOdDOB21g+KW1sNSy7Q6AKisG3h1x0A5+aDrDGO0jusI6vz4dfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxL9MxvzdpYo4sAA--.29198S3;
	Tue, 09 Dec 2025 14:18:26 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxQ+QwvzdpLlNHAQ--.62929S2;
	Tue, 09 Dec 2025 14:18:25 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] LoongArch: Remove unnecessary checks in bt_address()
Date: Tue,  9 Dec 2025 14:18:09 +0800
Message-ID: <20251209061809.15994-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxQ+QwvzdpLlNHAQ--.62929S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CrW5JFy8Kr1rJrykuFWDKFX_yoW8Wry3pF
	Z7Gr4UXFWIgrWUGayDJryYgr1jyF9xJ3WIgFsrGFnYk3WDZw17Zr15uw1UK3WDtry8ua18
	ZrW5ArWYyayjk3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1QVy3UUUUU==

According to the following function definitions, __kernel_text_address()
already checks __module_text_address(), so it should remove the check of
__module_text_address() in bt_address() at least.

int __kernel_text_address(unsigned long addr)
{
	if (kernel_text_address(addr))
		return 1;
	...
	return 0;
}

int kernel_text_address(unsigned long addr)
{
	bool no_rcu;
	int ret = 1;
	...
	if (is_module_text_address(addr))
		goto out;
	...
	return ret;
}

bool is_module_text_address(unsigned long addr)
{
	guard(rcu)();
	return __module_text_address(addr) != NULL;
}

Furthermore, since it returns ra at the end of bt_address() and check it
with __kernel_text_address() after calling bt_address(), so it can remove
the check of __kernel_text_address() in bt_address() too.

Just remove unnecessary checks, no functional changes intended.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/unwind_orc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/unwind_orc.c
index 0d5fa64a2225..3919dbd04c21 100644
--- a/arch/loongarch/kernel/unwind_orc.c
+++ b/arch/loongarch/kernel/unwind_orc.c
@@ -360,12 +360,6 @@ static inline unsigned long bt_address(unsigned long ra)
 {
 	extern unsigned long eentry;
 
-	if (__kernel_text_address(ra))
-		return ra;
-
-	if (__module_text_address(ra))
-		return ra;
-
 	if (ra >= eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) {
 		unsigned long func;
 		unsigned long type = (ra - eentry) / VECSIZE;
-- 
2.42.0

