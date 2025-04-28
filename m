Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3681A8F94
	for <loongarch@lists.linux.dev>; Mon, 28 Apr 2025 07:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826049; cv=none; b=BneljeXwnBxODZe5Yd6Q0NDx8dlbNbCdttT37nzxCtKEWhz0dpDNGQvwlkWb7alBeG1fizYg0u2lzULnyTCCa1+1AZn5z4qtVyhHIyh0XrtDDa0ia9fR9MIAW1mbDjJoBcBzq6npOhYu2Z+SlQGwWbXROVKjb2KwfcUoM7qcjm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826049; c=relaxed/simple;
	bh=0bOL3cl7CbTN3wJxtbvcoOrllSFRUARYP/dr+7W+fl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KF1PLx9/4LV4VAbfmYxKrrW8avvRDmGbZbZb5ntCaybJS5co6WNhor8EdU0aKoQM/tN5Le67HgT97vmL8WtK8lMMOvcjzTFEp/3sRerp6cAv2Jg5c6o+W9FyLMHEwFfXsrWaCO0UgZjbuzHT2if9h+0sZFW0QOp5RqdlkusMmHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.238])
	by gateway (Coremail) with SMTP id _____8Ax3eL9MA9otjDIAA--.30531S3;
	Mon, 28 Apr 2025 15:40:45 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.238])
	by front1 (Coremail) with SMTP id qMiowMAxSsT1MA9o7vKaAA--.40441S2;
	Mon, 28 Apr 2025 15:40:45 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org
Subject: [PATCH] LoongArch: Fix MAX_REG_OFFSET calculation
Date: Mon, 28 Apr 2025 15:40:29 +0800
Message-ID: <20250428074029.4166974-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxSsT1MA9o7vKaAA--.40441S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKF4xZw1fGryfXr45tw4rXrc_yoWkCrX_u3
	W7ta18Cw1fGw4fWwn8C348Jr1jga18WFnIkF4ktFy7X345JrW5Cws7Zw17Zr4q9w47ZFs3
	uF93Kry3u342gosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU27PEDUUUU

Fix MAX_REG_OFFSET calculation, make it point to the last register
in 'struct pt_regs' and not to the marker itself, which could allow
regs_get_register() to return an invalid offset.

Cc: stable@vger.kernel.org
Fixes: 803b0fc5c3f2baa6e5 ("LoongArch: Add process management")
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/ptrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/ptrace.h b/arch/loongarch/include/asm/ptrace.h
index a5b63c84f854..e5d21e836d99 100644
--- a/arch/loongarch/include/asm/ptrace.h
+++ b/arch/loongarch/include/asm/ptrace.h
@@ -55,7 +55,7 @@ static inline void instruction_pointer_set(struct pt_regs *regs, unsigned long v
 
 /* Query offset/name of register from its name/offset */
 extern int regs_query_register_offset(const char *name);
-#define MAX_REG_OFFSET (offsetof(struct pt_regs, __last))
+#define MAX_REG_OFFSET (offsetof(struct pt_regs, __last) - sizeof(unsigned long))
 
 /**
  * regs_get_register() - get register value from its offset
-- 
2.47.1

