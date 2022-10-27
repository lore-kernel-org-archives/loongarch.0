Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89FE7B
	for <loongarch@lists.linux.dev>; Thu, 27 Oct 2022 12:47:36 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.32])
	by gateway (Coremail) with SMTP id _____8AxzNjlfVpjAuICAA--.11072S3;
	Thu, 27 Oct 2022 20:47:33 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.32])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxV1fkfVpjFdwFAA--.2819S2;
	Thu, 27 Oct 2022 20:47:33 +0800 (CST)
From: Jianmin Lv <lvjianmin@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH V2] LoongArch: Fix memsection size
Date: Thu, 27 Oct 2022 20:47:32 +0800
Message-Id: <20221027124732.20837-1-lvjianmin@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxV1fkfVpjFdwFAA--.2819S2
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7ZrWxXFy8ArWDuw15uF1xZrb_yoW8Gr1xpF
	929r95Krs8Wa1xur48t345Cry5Kan5u342qF98Z34UAr43Wrs2yr4qywsrZF97Jw48ArWI
	qFsxXws3ZF98A3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r
	4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=

On LoongArch, the physical address (0 - 0xfff_ffff) is always memory, which
is in the low half of the memsection (0 - 0x1fff_ffff) with 512M size, and
the high half will be a hole which is not memory but I/O registers (of cpu
and chipset).

This situation may cause some issues. For example, during S3, these I/O registers
will be saved and restored as valid memory pages (pfn_valid() of common version
returns true for the whole memsection) which will cause exception, especially
on resume.

To avoid exceptions, we can use 256M memsection size, or use the way as ARM64 to
walk through all memory memblock to check if a mem pfn is valid which maybe
lower performance. For simplicity, this patch just use the former way.

Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>

diff --git a/arch/loongarch/include/asm/sparsemem.h b/arch/loongarch/include/asm/sparsemem.h
index 3d18cdf1b069..05903b40a625 100644
--- a/arch/loongarch/include/asm/sparsemem.h
+++ b/arch/loongarch/include/asm/sparsemem.h
@@ -8,7 +8,7 @@
  * SECTION_SIZE_BITS		2^N: how big each section will be
  * MAX_PHYSMEM_BITS		2^N: how much memory we can have in that space
  */
-#define SECTION_SIZE_BITS	29 /* 2^29 = Largest Huge Page Size */
+#define SECTION_SIZE_BITS	28
 #define MAX_PHYSMEM_BITS	48
 
 #endif /* CONFIG_SPARSEMEM */
-- 
2.31.1

