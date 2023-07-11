Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEEF125AF
	for <loongarch@lists.linux.dev>; Tue, 11 Jul 2023 07:11:05 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.108])
	by gateway (Coremail) with SMTP id _____8Cx2eqCAK1kU2oDAA--.4591S3;
	Tue, 11 Jul 2023 15:10:58 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.108])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxF81_AK1k308oAA--.46365S3;
	Tue, 11 Jul 2023 15:10:58 +0800 (CST)
From: Feiyang Chen <chenfeiyang@loongson.cn>
To: chenhuacai@kernel.org
Cc: Feiyang Chen <chenfeiyang@loongson.cn>,
	dvyukov@google.com,
	andreyknvl@gmail.com,
	corbet@lwn.net,
	loongarch@lists.linux.dev,
	kasan-dev@googlegroups.com,
	loongson-kernel@lists.loongnix.cn,
	chris.chenfeiyang@gmail.com
Subject: [PATCH v2 1/2] LoongArch: Provide kaslr_offset() to get kernel offset
Date: Tue, 11 Jul 2023 15:10:42 +0800
Message-Id: <20230711071043.4119353-2-chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230711071043.4119353-1-chenfeiyang@loongson.cn>
References: <20230711071043.4119353-1-chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxF81_AK1k308oAA--.46365S3
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKryxXrW3CrWkWw1kKrWUJrc_yoWfJFX_Zw
	13Xw4Uu3sYqF4xJ3sFvF93J34jga1ftF98uFn2vw47AF90vr1rWw4rK3Z5Ar4Y9wsxuF1Y
	vFWUt3y3CryUKosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb3kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	XVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x07jz2NtUUUUU=

Provide kaslr_offset() to get the kernel offset when KASLR is enabled.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 arch/loongarch/include/asm/setup.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/include/asm/setup.h
index 2dca0d1dd90a..a0bc159ce8bd 100644
--- a/arch/loongarch/include/asm/setup.h
+++ b/arch/loongarch/include/asm/setup.h
@@ -7,6 +7,7 @@
 #define _LOONGARCH_SETUP_H
 
 #include <linux/types.h>
+#include <asm/sections.h>
 #include <uapi/asm/setup.h>
 
 #define VECSIZE 0x200
@@ -37,4 +38,9 @@ extern unsigned long __init relocate_kernel(void);
 
 #endif
 
+static inline unsigned long kaslr_offset(void)
+{
+	return (unsigned long)&_text - VMLINUX_LOAD_ADDRESS;
+}
+
 #endif /* __SETUP_H */
-- 
2.39.3

