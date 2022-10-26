Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2221E7B
	for <loongarch@lists.linux.dev>; Wed, 26 Oct 2022 07:56:39 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.32])
	by gateway (Coremail) with SMTP id _____8Dxfbc26Fhjgo4CAA--.5007S3;
	Wed, 26 Oct 2022 15:56:38 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.32])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_eE26FhjnjMFAA--.19364S2;
	Wed, 26 Oct 2022 15:56:38 +0800 (CST)
From: Jianmin Lv <lvjianmin@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH] LoongArch: Fix memsection size
Date: Wed, 26 Oct 2022 15:56:38 +0800
Message-Id: <20221026075638.9396-1-lvjianmin@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx_eE26FhjnjMFAA--.19364S2
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Ar17Cr48uFy5JFyxZrWrXwb_yoW8Xw18pF
	nF9r1kKrs8WF4fCr4Iy3s8uFy5K395u34UtF98Z34DCw43WF1vyr4jywsrZF9rXw48AFWI
	qFZxXw4kZayUA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJV
	W8JbIYCTnIWIevJa73UjIFyTuYvjxUrNtxDUUUU

On LoongArch, the physical address space ranging from 0 to 0xfffffff is
always memory, which is in the low half of the memsection range from 0 to
0x1fffffff with 512M memsection size, and the high half will be a hole with
invalid memory pages.

This situation may cause some issues. For example, the range of 0x10000000
to 0x1fffffff is io registers, which will be considered as valid memory range
since which is in the memsection of range of 0 to 0x1fffffff. During S3
sleep and resume, these io registers will be saved and restored as valid memory
page (pfn_valid() of common version considers that all pages in a memsection
are valid), which will cause exception, especially when restoring during resume.

We can use 256M size for memsection of LoongArch, or use the way as ARM64 to
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

