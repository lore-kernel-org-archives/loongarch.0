Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86DC1B8E0
	for <loongarch@lists.linux.dev>; Thu, 11 May 2023 08:06:24 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Ax3er_oVxkUK0HAA--.13041S3;
	Thu, 11 May 2023 16:06:23 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxqjr5oVxk7XNVAA--.21787S8;
	Thu, 11 May 2023 16:06:23 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v4 6/6] LoongArch: Remove five DIE_* definitions in kdebug.h
Date: Thu, 11 May 2023 16:06:12 +0800
Message-Id: <1683792372-29338-7-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1683792372-29338-1-git-send-email-yangtiezhu@loongson.cn>
References: <1683792372-29338-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8Cxqjr5oVxk7XNVAA--.21787S8
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvdXoWrZFWkZFy5Cw4UJF4kWF43GFg_yoW3XrgEva
	4fGw4rW3y8XFW7Zw17Xr4fG3W7Xw4xJFn5u3Z3Xr4xu3Z09w1rJrWrJa1kZr1jkrWkurs5
	XFWFkr17CrykKjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	87kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
	W8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU84xRDUUUUU==
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

