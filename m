Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330661FC2
	for <loongarch@lists.linux.dev>; Sat,  9 Sep 2023 11:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20A6C433C8;
	Sat,  9 Sep 2023 11:55:10 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>
Cc: loongarch@lists.linux.dev,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 2/2] LoongArch: Don't inline kasan_mem_to_shadow()/kasan_shadow_to_mem()
Date: Sat,  9 Sep 2023 19:54:49 +0800
Message-Id: <20230909115450.1903218-2-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230909115450.1903218-1-chenhuacai@loongson.cn>
References: <20230909115450.1903218-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As Linus suggested, kasan_mem_to_shadow()/kasan_shadow_to_mem() are not
performance-critical and too big to inline. This is simply wrong so just
define them out-of-line.

If they really need to be inlined in future, such as the objtool / SMAP
issue for X86, we should mark them __always_inline.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/kasan.h | 59 +++---------------------------
 arch/loongarch/mm/kasan_init.c     | 51 ++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 53 deletions(-)

diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/include/asm/kasan.h
index a12ecab37da7..cd6084f4e153 100644
--- a/arch/loongarch/include/asm/kasan.h
+++ b/arch/loongarch/include/asm/kasan.h
@@ -60,63 +60,16 @@
 extern bool kasan_early_stage;
 extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
 
-#define kasan_arch_is_ready kasan_arch_is_ready
-static __always_inline bool kasan_arch_is_ready(void)
-{
-	return !kasan_early_stage;
-}
-
 #define kasan_mem_to_shadow kasan_mem_to_shadow
-static inline void *kasan_mem_to_shadow(const void *addr)
-{
-	if (!kasan_arch_is_ready()) {
-		return (void *)(kasan_early_shadow_page);
-	} else {
-		unsigned long maddr = (unsigned long)addr;
-		unsigned long xrange = (maddr >> XRANGE_SHIFT) & 0xffff;
-		unsigned long offset = 0;
-
-		maddr &= XRANGE_SHADOW_MASK;
-		switch (xrange) {
-		case XKPRANGE_CC_SEG:
-			offset = XKPRANGE_CC_SHADOW_OFFSET;
-			break;
-		case XKPRANGE_UC_SEG:
-			offset = XKPRANGE_UC_SHADOW_OFFSET;
-			break;
-		case XKVRANGE_VC_SEG:
-			offset = XKVRANGE_VC_SHADOW_OFFSET;
-			break;
-		default:
-			WARN_ON(1);
-			return NULL;
-		}
-
-		return (void *)((maddr >> KASAN_SHADOW_SCALE_SHIFT) + offset);
-	}
-}
+void *kasan_mem_to_shadow(const void *addr);
 
 #define kasan_shadow_to_mem kasan_shadow_to_mem
-static inline const void *kasan_shadow_to_mem(const void *shadow_addr)
+const void *kasan_shadow_to_mem(const void *shadow_addr);
+
+#define kasan_arch_is_ready kasan_arch_is_ready
+static __always_inline bool kasan_arch_is_ready(void)
 {
-	unsigned long addr = (unsigned long)shadow_addr;
-
-	if (unlikely(addr > KASAN_SHADOW_END) ||
-		unlikely(addr < KASAN_SHADOW_START)) {
-		WARN_ON(1);
-		return NULL;
-	}
-
-	if (addr >= XKVRANGE_VC_SHADOW_OFFSET)
-		return (void *)(((addr - XKVRANGE_VC_SHADOW_OFFSET) << KASAN_SHADOW_SCALE_SHIFT) + XKVRANGE_VC_START);
-	else if (addr >= XKPRANGE_UC_SHADOW_OFFSET)
-		return (void *)(((addr - XKPRANGE_UC_SHADOW_OFFSET) << KASAN_SHADOW_SCALE_SHIFT) + XKPRANGE_UC_START);
-	else if (addr >= XKPRANGE_CC_SHADOW_OFFSET)
-		return (void *)(((addr - XKPRANGE_CC_SHADOW_OFFSET) << KASAN_SHADOW_SCALE_SHIFT) + XKPRANGE_CC_START);
-	else {
-		WARN_ON(1);
-		return NULL;
-	}
+	return !kasan_early_stage;
 }
 
 #define addr_has_metadata addr_has_metadata
diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_init.c
index da68bc1a4643..cc3e81fe0186 100644
--- a/arch/loongarch/mm/kasan_init.c
+++ b/arch/loongarch/mm/kasan_init.c
@@ -35,6 +35,57 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 
 bool kasan_early_stage = true;
 
+void *kasan_mem_to_shadow(const void *addr)
+{
+	if (!kasan_arch_is_ready()) {
+		return (void *)(kasan_early_shadow_page);
+	} else {
+		unsigned long maddr = (unsigned long)addr;
+		unsigned long xrange = (maddr >> XRANGE_SHIFT) & 0xffff;
+		unsigned long offset = 0;
+
+		maddr &= XRANGE_SHADOW_MASK;
+		switch (xrange) {
+		case XKPRANGE_CC_SEG:
+			offset = XKPRANGE_CC_SHADOW_OFFSET;
+			break;
+		case XKPRANGE_UC_SEG:
+			offset = XKPRANGE_UC_SHADOW_OFFSET;
+			break;
+		case XKVRANGE_VC_SEG:
+			offset = XKVRANGE_VC_SHADOW_OFFSET;
+			break;
+		default:
+			WARN_ON(1);
+			return NULL;
+		}
+
+		return (void *)((maddr >> KASAN_SHADOW_SCALE_SHIFT) + offset);
+	}
+}
+
+const void *kasan_shadow_to_mem(const void *shadow_addr)
+{
+	unsigned long addr = (unsigned long)shadow_addr;
+
+	if (unlikely(addr > KASAN_SHADOW_END) ||
+		unlikely(addr < KASAN_SHADOW_START)) {
+		WARN_ON(1);
+		return NULL;
+	}
+
+	if (addr >= XKVRANGE_VC_SHADOW_OFFSET)
+		return (void *)(((addr - XKVRANGE_VC_SHADOW_OFFSET) << KASAN_SHADOW_SCALE_SHIFT) + XKVRANGE_VC_START);
+	else if (addr >= XKPRANGE_UC_SHADOW_OFFSET)
+		return (void *)(((addr - XKPRANGE_UC_SHADOW_OFFSET) << KASAN_SHADOW_SCALE_SHIFT) + XKPRANGE_UC_START);
+	else if (addr >= XKPRANGE_CC_SHADOW_OFFSET)
+		return (void *)(((addr - XKPRANGE_CC_SHADOW_OFFSET) << KASAN_SHADOW_SCALE_SHIFT) + XKPRANGE_CC_START);
+	else {
+		WARN_ON(1);
+		return NULL;
+	}
+}
+
 /*
  * Alloc memory for shadow memory page table.
  */
-- 
2.39.3

