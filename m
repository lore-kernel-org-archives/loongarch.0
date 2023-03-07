Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7472A20EE
	for <loongarch@lists.linux.dev>; Tue,  7 Mar 2023 07:39:03 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cxf80W6gZkrUIJAA--.11784S3;
	Tue, 07 Mar 2023 15:39:02 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxbL4V6gZkqsBNAA--.4136S2;
	Tue, 07 Mar 2023 15:39:01 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH] tools/arch/loongarch: Use __SIZEOF_LONG__ to define __BITS_PER_LONG
Date: Tue,  7 Mar 2023 15:39:01 +0800
Message-Id: <1678174741-19219-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8DxbL4V6gZkqsBNAA--.4136S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvdXoWrtrW5Aw4xCFW3uw43uF1Dtrb_yoWDCrc_Zr
	47Jw1UCr4xWF97X3y8ZrsYqr1jgay8GFnY9FnxZr13uF4Yyw48Gws7Gas2yF4q9rs0van3
	XFWktr9Yk3yUtjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	b7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r
	4UYxBIdaVFxhVjvjDU0xZFpf9x07jOF4_UUUUU=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Although __SIZEOF_POINTER__ is equal with _SIZEOF_LONG__ on LoongArch,
it is better to use __SIZEOF_LONG__ to define __BITS_PER_LONG to keep
consistent between arch/loongarch/include/uapi/asm/bitsperlong.h and
tools/arch/loongarch/include/uapi/asm/bitsperlong.h.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/arch/loongarch/include/uapi/asm/bitsperlong.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/arch/loongarch/include/uapi/asm/bitsperlong.h b/tools/arch/loongarch/include/uapi/asm/bitsperlong.h
index d4e32b3..00b4ba1 100644
--- a/tools/arch/loongarch/include/uapi/asm/bitsperlong.h
+++ b/tools/arch/loongarch/include/uapi/asm/bitsperlong.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_LOONGARCH_BITSPERLONG_H
 #define __ASM_LOONGARCH_BITSPERLONG_H
 
-#define __BITS_PER_LONG (__SIZEOF_POINTER__ * 8)
+#define __BITS_PER_LONG (__SIZEOF_LONG__ * 8)
 
 #include <asm-generic/bitsperlong.h>
 
-- 
2.1.0

