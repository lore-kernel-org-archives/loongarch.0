Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C4E3D4118
	for <loongarch@lists.linux.dev>; Tue, 10 Mar 2026 06:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773125725; cv=none; b=NomtCAdf2h5U40oQCtNsr2mnql0rnHtq6mP99gdrXwA3l+EPu8fgvKc8IosP+7PtwIobxr6YOB7tidMSLE3nTtbeaEqJXQlQ4Y1hbTCF0lEtexe6wLz9yDaRTUv4t6PO5asIg9uqJT+7hB+XISbLciRV43npK+g6okvL915JWWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773125725; c=relaxed/simple;
	bh=c9Q+wruj5QbEwYFLIuRfyp1BNEnlAWSjalZJTxdMi24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AS6tUkDhUWOlKh3FxOxV5txWlefVUm0HcjKIoj/KbiLBq20j5uqzO1rLETP5T6pn9mgzC6VMcFcaRGeBGtotSeV0XQLlwIO49MXWz5xD8izdfZ8nArB0ALzlH/Mz6dy5cHfaeFKFLAt/k34q7rQsNSB8dmgt6IlvA/cJK7Rd73o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx36tSwK9pfmsZAA--.15775S3;
	Tue, 10 Mar 2026 14:55:14 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxKMFPwK9prulRAA--.11822S2;
	Tue, 10 Mar 2026 14:55:11 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] LoongArch: Preparation for BPF patch
Date: Tue, 10 Mar 2026 14:55:07 +0800
Message-ID: <20260310065510.8189-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxKMFPwK9prulRAA--.11822S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gw1xCr15Zryrtw18XF4DJrc_yoW3tFb_Ca
	1furW8Gr48Ja15Aas2ga1rZayqvFW8tFsYkF97tryfW343Jr1rJFs8JF15ZFy0grZ7Jrs8
	ArW5Zrn5Zr1aqosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOdb8UUUUU=

This series is based on 7.0-rc3 and the following patch:

"[PATCH v3] LoongArch: Fix calling smp_processor_id() in preemptible code"
https://lore.kernel.org/loongarch/20260303084314.628311-1-xry111@xry111.site/

it is a preparation for the dmesg log of BPF patch:
"LoongArch: BPF: Make arch_protect_bpf_trampoline() return 0"
https://lore.kernel.org/loongarch/20260310064706.4985-1-yangtiezhu@loongson.cn/

Tiezhu Yang (3):
  LoongArch: Give more information if memory access failed
  LoongArch: Check return values for set_memory_{rw,rox}
  LoongArch: No need to flush icache if copy failed

 arch/loongarch/include/asm/uaccess.h | 14 ++++++++++++--
 arch/loongarch/kernel/inst.c         | 21 +++++++++++++++++----
 2 files changed, 29 insertions(+), 6 deletions(-)

-- 
2.42.0

