Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC9580D
	for <loongarch@lists.linux.dev>; Fri, 12 May 2023 01:57:44 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxrOoSnV1kWfkHAA--.13805S3;
	Fri, 12 May 2023 09:57:38 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxXrMMnV1kocdWAA--.23198S4;
	Fri, 12 May 2023 09:57:37 +0800 (CST)
From: Qing Zhang <zhangqing@loongson.cn>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v3 2/4] kasan: Add (pmd|pud)_init for LoongArch zero_(pud|p4d)_populate process
Date: Fri, 12 May 2023 09:57:29 +0800
Message-Id: <20230512015731.23787-3-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230512015731.23787-1-zhangqing@loongson.cn>
References: <20230512015731.23787-1-zhangqing@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxXrMMnV1kocdWAA--.23198S4
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7ArW5Zry3GF4fXry5Ar1UJrb_yoW8AF47pF
	WUK3W0qw47XanrXws3Jr1vgry7Jan3K3W7Kay2kr1rJ345XrWUXFy8Jr1q9rs8AFWkZFyS
	yan3Kr9xC3WDJaDanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxV
	Aaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxY
	O2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
	JbIYCTnIWIevJa73UjIFyTuYvjxU4Xo7DUUUU

LoongArch populates pmd/pud with invalid_pmd_table/invalid_pud_table in
pagetable_init, So pmd_init/pud_init(p) is required, define them as __weak
in mm/kasan/init.c, like mm/sparse-vmemmap.c.

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---
 mm/kasan/init.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/mm/kasan/init.c b/mm/kasan/init.c
index cc64ed6858c6..a7fa223b96e4 100644
--- a/mm/kasan/init.c
+++ b/mm/kasan/init.c
@@ -139,6 +139,10 @@ static int __ref zero_pmd_populate(pud_t *pud, unsigned long addr,
 	return 0;
 }
 
+void __weak __meminit pmd_init(void *addr)
+{
+}
+
 static int __ref zero_pud_populate(p4d_t *p4d, unsigned long addr,
 				unsigned long end)
 {
@@ -166,8 +170,9 @@ static int __ref zero_pud_populate(p4d_t *p4d, unsigned long addr,
 				if (!p)
 					return -ENOMEM;
 			} else {
-				pud_populate(&init_mm, pud,
-					early_alloc(PAGE_SIZE, NUMA_NO_NODE));
+				p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
+				pmd_init(p);
+				pud_populate(&init_mm, pud, p);
 			}
 		}
 		zero_pmd_populate(pud, addr, next);
@@ -176,6 +181,10 @@ static int __ref zero_pud_populate(p4d_t *p4d, unsigned long addr,
 	return 0;
 }
 
+void __weak __meminit pud_init(void *addr)
+{
+}
+
 static int __ref zero_p4d_populate(pgd_t *pgd, unsigned long addr,
 				unsigned long end)
 {
@@ -207,8 +216,9 @@ static int __ref zero_p4d_populate(pgd_t *pgd, unsigned long addr,
 				if (!p)
 					return -ENOMEM;
 			} else {
-				p4d_populate(&init_mm, p4d,
-					early_alloc(PAGE_SIZE, NUMA_NO_NODE));
+				p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
+				pud_init(p);
+				p4d_populate(&init_mm, p4d, p);
 			}
 		}
 		zero_pud_populate(p4d, addr, next);
-- 
2.36.0

