Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6838642
	for <loongarch@lists.linux.dev>; Tue, 27 Sep 2022 04:36:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [112.20.108.220])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxrmuufTJjlJgiAA--.49192S2;
	Tue, 27 Sep 2022 12:35:59 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	jiaxun.yang@flygoat.com,
	maobibo@loongson.cn,
	loongarch@lists.linux.dev,
	Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] LoongArch: Clean up loongson3_smp_ops extern
Date: Tue, 27 Sep 2022 12:34:56 +0800
Message-Id: <20220927043456.2706194-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxrmuufTJjlJgiAA--.49192S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur4rJryxJr45ArW8KryrXrb_yoW3Arb_Aa
	47tw48ury8JrW7Aw1DuF1fJF15W348JFnI9F1Svwn7J3Z8tr13X3yDAw1fZrs0ka9a9Fs5
	uF4xtryrCry5KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2kFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8XwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjoa0DUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/

loongson3_smp_ops is not used in LoongArch anymore,
let's remove it.

Fixes: f2ac457a6138 ("LoongArch: Add CPU definition headers")
Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 arch/loongarch/include/asm/loongson.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/loongarch/include/asm/loongson.h b/arch/loongarch/include/asm/loongson.h
index 6e8f6972ceb6..00db93edae1b 100644
--- a/arch/loongarch/include/asm/loongson.h
+++ b/arch/loongarch/include/asm/loongson.h
@@ -14,8 +14,6 @@
 #include <asm/addrspace.h>
 #include <asm/bootinfo.h>
 
-extern const struct plat_smp_ops loongson3_smp_ops;
-
 #define LOONGSON_REG(x) \
 	(*(volatile u32 *)((char *)TO_UNCACHE(LOONGSON_REG_BASE) + (x)))
 
-- 
2.31.1

