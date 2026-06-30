Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54503438AF
	for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 08:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782807271; cv=none; b=d4nwEtIAT2yADRHd8hFpezErLNdkqP1KRhZdPXk7ip6UwKWFTq2Rae1Cw2Z8vkba3QgSVP+SnvbwUQWgcZeGJEnWMOVBUV6LuFs0V3y3iEjjQE/WBzPGXosFSAFrxJZleeVHXHtqt+b9GavVr6qdf57EpQv0xbpZgGdRcEQl6eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782807271; c=relaxed/simple;
	bh=gTuWJ7ZJ0lbCIKJ8ZsOONdoLF6hx2seOgK42oPgK7dM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dIMtwPwN1JGf9ye88Z6jXkB/nokyGmLdKWjWE57EpOxWP3Xx+yX4sG5COCRXM0bvGHFWz3aUZYfY14i6wi7MOmY0jUMrGKpfnkF+I4JluDyz1+GW13kPddf1cyJNfCMYU+NLf4oRbeqASMnjaAePqT/7xgwlpzV8PknW9VUGfSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.155])
	by gateway (Coremail) with SMTP id _____8BxdnjgekNqB5EZAA--.40624S3;
	Tue, 30 Jun 2026 16:14:25 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.155])
	by front1 (Coremail) with SMTP id qMiowJCxecHUekNq5dW4AA--.3288S2;
	Tue, 30 Jun 2026 16:14:24 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Increase TASK_STRUCT_OFFSET up to 2040 for 32BIT
Date: Tue, 30 Jun 2026 16:14:05 +0800
Message-ID: <20260630081405.2832303-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxecHUekNq5dW4AA--.3288S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XrW7CF47WryDKr4UKrWUKFX_yoWfXFX_u3
	WIqw4kur18JFZ7Kw1qvw1rZw1qga18tFsY9Fyv9rnxA3s8tFn8Ww4vgwn5Zw1Yk39IkFs5
	ua1vqFy3Aw1jkosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOeOJUUUUU=

THREAD_INFO_IN_TASK increase the size of task_struct, which casuses a
build error for the 32BIT kernel if RANDSTRUCT is enabled. So increase
TASK_STRUCT_OFFSET as big as possible (2040), but can still be aligned
and be fit in the addi.w instruction.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/asmmacro.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/asmmacro.h b/arch/loongarch/include/asm/asmmacro.h
index a648be5f723f..b7423d1ac568 100644
--- a/arch/loongarch/include/asm/asmmacro.h
+++ b/arch/loongarch/include/asm/asmmacro.h
@@ -14,7 +14,7 @@
 #ifdef CONFIG_64BIT
 #define TASK_STRUCT_OFFSET 0
 #else
-#define TASK_STRUCT_OFFSET 2000
+#define TASK_STRUCT_OFFSET 2040
 #endif
 
 	.macro	cpu_save_nonscratch thread
-- 
2.52.0

