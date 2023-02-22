Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B891FB5
	for <loongarch@lists.linux.dev>; Wed, 22 Feb 2023 06:53:26 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxAf_gu_Vjtn0DAA--.1662S3;
	Wed, 22 Feb 2023 14:53:20 +0800 (CST)
Received: from bogon.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxK77Yu_VjuoY4AA--.37664S4;
	Wed, 22 Feb 2023 14:53:19 +0800 (CST)
From: Youling Tang <tangyouling@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] LoongArch: kdump: Add crashkernel=YM handling
Date: Wed, 22 Feb 2023 14:53:11 +0800
Message-Id: <1677048791-26951-3-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1677048791-26951-1-git-send-email-tangyouling@loongson.cn>
References: <1677048791-26951-1-git-send-email-tangyouling@loongson.cn>
X-CM-TRANSID:AQAAf8DxK77Yu_VjuoY4AA--.37664S4
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7WFy3tF1kXr4Uur1xXrW8WFg_yoW8ZFWrpr
	1UAF45tFW5GF93G3yrAr9rur1rA3Wxua4jgFZ0y34kAF9xXrn8tw4kW3ZrZFyUK3s3WF4j
	vrZYqF9Iga18taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

When the kernel crashkernel parameter is specified with just a size,
we are supposed to allocate a region from RAM to store the crashkernel,
"crashkernel=512M" would be recommended for kdump.

Fix this by lifting similar code from x86, importing it to LoongArch
with the LoongArch specific parameters added. We allocate the crashkernel
region from the first 4G of physical memory (SWIOTLB needs to be allocated
on low 4G). Currently LoongArch does not implement crashkernel_low and
crashkernel_high like x86.

When X is not specified, crash_base defaults to 0 (crashkernel=YM@XM).

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/loongarch/kernel/setup.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 4344502c0b31..ac2aad988fdb 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -234,11 +234,14 @@ static void __init arch_reserve_vmcore(void)
 #endif
 }
 
+/* 16M alignment for crash kernel regions */
+#define CRASH_ALIGN	SZ_16M
+#define CRASH_ADDR_MAX	SZ_4G
+
 static void __init arch_parse_crashkernel(void)
 {
 #ifdef CONFIG_KEXEC
 	int ret;
-	unsigned long long start;
 	unsigned long long total_mem;
 	unsigned long long crash_base, crash_size;
 
@@ -247,8 +250,14 @@ static void __init arch_parse_crashkernel(void)
 	if (ret < 0 || crash_size <= 0)
 		return;
 
-	start = memblock_phys_alloc_range(crash_size, 1, crash_base, crash_base + crash_size);
-	if (start != crash_base) {
+	if (crash_base <= 0) {
+		crash_base = memblock_phys_alloc_range(crash_size, CRASH_ALIGN, CRASH_ALIGN,
+				CRASH_ADDR_MAX);
+		if (!crash_base) {
+			pr_warn("crashkernel reservation failed - No suitable area found.\n");
+			return;
+		}
+	} else if (!memblock_phys_alloc_range(crash_size, 1, crash_base, crash_base + crash_size)) {
 		pr_warn("Invalid memory region reserved for crash kernel\n");
 		return;
 	}
-- 
2.37.3

