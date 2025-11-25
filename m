Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D36528DF07
	for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 06:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764052529; cv=none; b=jkq801cirgBDPtgvJhAyWHj4ZTZ6At5vrNzA8W8IgczElYRv+xiJVt9gJcGQjDwQUQJEjk2QwuPCpdQsIqCbyAcKbSUuOxoWW+tSAwkeY1oZud5ZaDMDtJ8OBtOdG/c+MFVWFF3lA79cifiPxYN6ft4PQA8ZucvBj5NbgzqO5qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764052529; c=relaxed/simple;
	bh=FK+sTe+yY9WPp8HqcCMalmIk11dYXmPaQhcbZ5fVymA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P99sbZVDTq08MwwiT6TnBGVkmRCm9ZLEF5OkaRRmqYeIHkOU9DsDbBPj0V4XhgDNNjJiso6dSGbmVzfSDC8m4KJ5qf3Tp0d/rZ1wRRupH6zZfShhtjAwzX5rBrpEyNKNbV/N5/ceohybwny5qYA9UqLSguPKaSRbvII1wNgDsjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cx5tArTiVpE8knAA--.20241S3;
	Tue, 25 Nov 2025 14:35:23 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxE+QqTiVp4mw+AQ--.42151S2;
	Tue, 25 Nov 2025 14:35:23 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] LoongArch: Use unsigned long for _end and _text
Date: Tue, 25 Nov 2025 14:35:07 +0800
Message-ID: <20251125063507.32177-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxE+QqTiVp4mw+AQ--.42151S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFy5tFW8Jr43Jr18XF45twc_yoW8Gr4kpr
	y2yanFqFWrWFs7JayDX345ury5G3Z7W3ySgFsrK34ruF13ZF15Wa48u3ZFqF40qayfKF4S
	vry5t3sIva1UCagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8wNVDUUUUU==

It is better to use unsigned long rather than long for _end and _text
to calculate the kernel length.

Cc: stable@vger.kernel.org # v6.3+
Fixes: e5f02b51fa0c ("LoongArch: Add support for kernel address space layout randomization (KASLR)")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/relocate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/relocate.c
index b5e2312a2fca..76abbb8d2931 100644
--- a/arch/loongarch/kernel/relocate.c
+++ b/arch/loongarch/kernel/relocate.c
@@ -183,7 +183,7 @@ static inline void __init *determine_relocation_address(void)
 	if (kaslr_disabled())
 		return destination;
 
-	kernel_length = (long)_end - (long)_text;
+	kernel_length = (unsigned long)_end - (unsigned long)_text;
 
 	random_offset = get_random_boot() << 16;
 	random_offset &= (CONFIG_RANDOMIZE_BASE_MAX_OFFSET - 1);
@@ -232,7 +232,7 @@ unsigned long __init relocate_kernel(void)
 	early_memunmap(cmdline, COMMAND_LINE_SIZE);
 
 	if (random_offset) {
-		kernel_length = (long)(_end) - (long)(_text);
+		kernel_length = (unsigned long)(_end) - (unsigned long)(_text);
 
 		/* Copy the kernel to it's new location */
 		memcpy(location_new, _text, kernel_length);
-- 
2.42.0

