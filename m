Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411BC314D06
	for <loongarch@lists.linux.dev>; Wed, 24 Dec 2025 10:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766572543; cv=none; b=FwXP64LM1GmT+YLGagOe8WWvtgE5Vtc4ATyusfgM1r4UHPTnGz2rig5Tb8xCaLiiTUbLkH/zqfEV1S8ynMVpxPJsrtPMgoxkInhtYvBIN2AK2OcsGChZdsZ8D6oNkjs6SmeqR/A4jK3YdAZ0Iz/tb4Kq8rQZR+iqgTsieDSDL1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766572543; c=relaxed/simple;
	bh=uy/rf7zsf9Lo6r2l3tS9K6IkA0RveHzNgA4wQl5+SXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mDJqRKItProyKjN35YKcpR2t8dJAnUFvmQPrqSyBt0gH6k6zKBj0ih9lmymqa+xdbpANd76/v3P2WZfNPAgemPMJkMgvxvyFadNHNPGcrixq2mD1jn/ojjKmT2xMeKAh9onfcpQoXudzziNzMQ0r6QhppF2zjaGHCIpfrRCZMJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxOML5wUtp3LkCAA--.8574S3;
	Wed, 24 Dec 2025 18:35:37 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCx2+D0wUtpGjsEAA--.13037S3;
	Wed, 24 Dec 2025 18:35:33 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] LoongArch: Use UNWIND_HINT_END_OF_STACK for entry points
Date: Wed, 24 Dec 2025 18:35:15 +0800
Message-ID: <20251224103516.12654-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20251224103516.12654-1-yangtiezhu@loongson.cn>
References: <20251224103516.12654-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx2+D0wUtpGjsEAA--.13037S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZF4UXF13XrWrGryrJFyxWFX_yoWDKFcEya
	43Ga15W395Jay2qr1jvryfWr1Fq340yF1rC3W0qrZ2gan8A345Jw43A3WrZ3s0kr4kGrZ5
	Cw4kW3Zavr12qosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1QVy3UUUUU==

kernel_entry() and smpboot_entry() are the last frames for ORC unwinder,
so it is proper to use the annotation UNWIND_HINT_END_OF_STACK for them.

Link: https://lore.kernel.org/lkml/ots6w2ntyudj5ucs5eowncta2vmfssatpcqwzpar3ekk577hxi@j45dd4dmwx6x/
Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/head.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index aba548db2446..ce7f6c04f4ab 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -42,6 +42,7 @@ SYM_DATA(kernel_fsize, .long _kernel_fsize);
 	.align 12
 
 SYM_CODE_START(kernel_entry)			# kernel entry point
+	UNWIND_HINT_END_OF_STACK
 
 	SETUP_TWINS
 	SETUP_MODES	t0
@@ -113,6 +114,7 @@ SYM_CODE_END(kernel_entry)
  * function after setting up the stack and tp registers.
  */
 SYM_CODE_START(smpboot_entry)
+	UNWIND_HINT_END_OF_STACK
 
 	SETUP_TWINS
 	SETUP_MODES	t0
-- 
2.42.0

