Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8308C379
	for <loongarch@lists.linux.dev>; Tue,  5 Sep 2023 06:50:18 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.176])
	by gateway (Coremail) with SMTP id _____8AxqOinz_Zk7WQfAA--.27186S3;
	Tue, 05 Sep 2023 14:50:15 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.180.13.176])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxjiOWz_ZkwHtsAA--.24493S2;
	Tue, 05 Sep 2023 14:50:13 +0800 (CST)
From: Hongchen Zhang <zhanghongchen@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	"Mike Rapoport IBM)" <rppt@kernel.org>,
	Feiyang Chen <chenfeiyang@loongson.cn>,
	Hongchen Zhang <zhanghongchen@loongson.cn>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	"Matthew Wilcox Oracle)" <willy@infradead.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH] LoongArch: add p?d_leaf() definitions
Date: Tue,  5 Sep 2023 14:49:55 +0800
Message-Id: <20230905064955.16316-1-zhanghongchen@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxjiOWz_ZkwHtsAA--.24493S2
X-CM-SenderInfo: x2kd0w5krqwupkhqwqxorr0wxvrqhubq/1tbiAQAFB2T2qrUBGQASsE
X-Coremail-Antispam: 1Uk129KBj9xXoWrZr48Zw45XF17CF4xCFWfWFX_yoWkGwc_Z3
	WxZan5Cryvqa1Iq3WDJr93Jw17K3WrCFn5Zr9Ikr4UAFyUKa15Gw4UG343ZryY93y5uFs5
	CFWktryrAF45tosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOiSdUUUUU=

When I do LTP test, LTP test case ksm06 caused panic at
	break_ksm_pmd_entry
	  -> pmd_leaf (Huge page table but False)
	  -> pte_present (panic)

The reason is pmd_leaf is not defined, So like
commit 501b81046701 ("mips: mm: add p?d_leaf() definitions")
add p?d_leaf() definition for LoongArch.

Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
---
 arch/loongarch/include/asm/pgtable.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 370c6568ceb8..ea54653b7aab 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -243,6 +243,9 @@ static inline void pmd_clear(pmd_t *pmdp)
 
 #define pmd_phys(pmd)		PHYSADDR(pmd_val(pmd))
 
+#define pmd_leaf(pmd)		((pmd_val(pmd) & _PAGE_HUGE) != 0)
+#define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)
+
 #ifndef CONFIG_TRANSPARENT_HUGEPAGE
 #define pmd_page(pmd)		(pfn_to_page(pmd_phys(pmd) >> PAGE_SHIFT))
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE  */
-- 
2.33.0

