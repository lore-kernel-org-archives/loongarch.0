Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125B02F5B
	for <loongarch@lists.linux.dev>; Wed, 19 Apr 2023 09:57:28 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxE4QCuz9k++EeAA--.48137S3;
	Wed, 19 Apr 2023 17:57:22 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxbb78uj9kXuguAA--.15680S8;
	Wed, 19 Apr 2023 17:57:21 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v3 6/6] LoongArch: Remove five DIE_* definitions in kdebug.h
Date: Wed, 19 Apr 2023 17:57:01 +0800
Message-Id: <1681898221-27828-7-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1681898221-27828-1-git-send-email-yangtiezhu@loongson.cn>
References: <1681898221-27828-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8Bxbb78uj9kXuguAA--.15680S8
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvdXoWrZFWkZFy5Cw4UJF4kWF43GFg_yoW3XrgEva
	4fGw4rW3y8XFW7Zw17Xr4fG3W7Xw4xJFn5u3Z3Xr4xu3Z09w1rJrWrJa1kZr1jkrWkurs5
	XFWFkr17CrykKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	17kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjxUcHUqUUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

For now, DIE_PAGE_FAULT, DIE_BREAK, DIE_SSTEPBP, DIE_UPROBE
and DIE_UPROBE_XOL are not used by any code, remove them.

Suggested-by: Youling Tang <tangyouling@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/kdebug.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/loongarch/include/asm/kdebug.h b/arch/loongarch/include/asm/kdebug.h
index d721b4b..c00ed87 100644
--- a/arch/loongarch/include/asm/kdebug.h
+++ b/arch/loongarch/include/asm/kdebug.h
@@ -13,11 +13,6 @@ enum die_val {
 	DIE_FP,
 	DIE_SIMD,
 	DIE_TRAP,
-	DIE_PAGE_FAULT,
-	DIE_BREAK,
-	DIE_SSTEPBP,
-	DIE_UPROBE,
-	DIE_UPROBE_XOL,
 };
 
 #endif /* _ASM_LOONGARCH_KDEBUG_H */
-- 
2.1.0

