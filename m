Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25282ECD26;
	Thu, 26 Jun 2025 15:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750952003; cv=none; b=Phlv/EUuC96Rov/pBADSwqBKc3vEq8jicps/UspnaDUbCqLNhDPNhcbgMxKMfgesnVkjUOsew67TTeazZT4btaSoZfoMM+2ZkhgZ9LoXAVvLXSBKCtYdHcyLb+6JxbwOBK802fVdluMw85BkLOupqDuL8u5PxTDq68A3MFLxWW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750952003; c=relaxed/simple;
	bh=wcoCib0y3tKBYGMr83R+bqMPu+MeV/ei1S9/t1XfqVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hqN6lWdJ6mQonBmorjJSW+u2B9N+6BR7UmUREAJArZKrlr1NWG+5UZy50CjnqpNKZaEXdl1QllBjsZ4terb3ZN+7iZNmSX7a0Db+bLCFf4wTH/im6uAECGq/0Yv+Bg/5QEe35LHqvm6HtxRnjCj6e7TqykWgcvYh6SulK+BzWaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4Y7rjoO; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4Y7rjoO"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3105ef2a071so15455101fa.1;
        Thu, 26 Jun 2025 08:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750952000; x=1751556800; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pDrLO6USAZl/TGsifgnkWPVKgGBnMCumXxL7y5KwTQ=;
        b=b4Y7rjoOeziO86g7yM109waWm3yt8E+YxCyWJCqKE9C91OtgOObzWhXornOlhQVqea
         Xgz1o74y0XOymRHs/34Ssb9/3iQ78pgWBjy0R0S5UYNgXk4oUuu2i1gY0WIL2kLR0T40
         Ii09Uwtr3vN8OVYJVhJhk8JXX2iPrdXvH44/uYmW6nKsDZwmmwTg/QGdGByMTTfv1Hfz
         eJt640eYnrInzcR/vx18mPKEGww41+ZR9097ACOz4UNy6+LnGfezi9Tm5scoo0liP3wf
         5DAwBjFfey/BLk9YAeKvJnBp6rDYZdpQAC9H4mjWijCN2NHmRIeeyMuTFX+0cH4EVy+A
         g1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750952000; x=1751556800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+pDrLO6USAZl/TGsifgnkWPVKgGBnMCumXxL7y5KwTQ=;
        b=DBf5flNe93jTEJk2vNWk2Qf7WHGdM5becmC+EHCii7KI6RS3X/q3tni04JIO3XR8ZI
         gy6VdVZBW7UQNuSpd/EVWFGrV12QyP/oLZgVn7Gt/7Edg1p7mOyCvl6/aRxhwDBm8Ogp
         qMFs6C8w5YkiXq6pJT4ypWPZdWRo2ciHVIzv9Z86RtJVq+hz73dmSVEHqg67OtQd990d
         ycUU5frfxNyMR4GktSzqm/6RwZRPjyYWzG2NvQ8FE4SFh8J1V9tPv5rSvCxd/uQzSDeh
         faJq9z6ki3ecq+Gts6XHqmOgS4oV/YIG2+U7GwMtR6FL/Uid6MESDIsRCnncbC/6E+qg
         Jh0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQRIDlWFflgYuZstrFNB81KuLw0wqqfzJHocIR0iLGFjkNWBNmQgCMyeXVNtoP07oRonmj@lists.linux.dev, AJvYcCXVc51oH6Ex94EjfEem+Fbbe/E64ebySlHsixwfgYZQdU5ILoeibbpeio4Z3S6vlugdozdfjMnmb9o+@lists.linux.dev
X-Gm-Message-State: AOJu0YwII8CR4VvkPqxzBVLNha4oK00HuWlkcqQ2F1CxQHj+MChjAqtd
	3+5utMB/s6rCGEKFALoceIu4HrikJsbXNJHg3WCnzLTF7lF5IS3W52W0
X-Gm-Gg: ASbGnctvmRfFEoVKURT7AaoYOLzWw0BbPWv8xkqsjmSpwAT6/LZL7eruo+Zc/9O2lwb
	gDwn7zWp4vMVITMdLhfiAXMyhQ31OURxNThHoqbPVYPMwP94rasDJeow17kgQH4/jh8lARCo0qI
	blNzTKFY0L8SOwr+8huuCbtNckxoxxaEC02mS+7axRGSWMwRj/Rkb+BiXLa19uxAXqGMNm/DXmX
	aOk1mYs204sglbnBXKJQo6tjlLk5yREslIm49lZv4MnifFOCjx1N0Zii9vdZuIpkKJXDSjHLsJh
	p7BajJlCLOMySuYrZjuB017QSRwQreu4YB3ady+0j2sUsQkM3MAAlpyEJ5n53YsNdAesy3S7su3
	s5eIq9Wqd6o55lW6dHlJqqgAgUEyHGQ==
X-Google-Smtp-Source: AGHT+IGY311+Wdu3kb/XvX91pk/iQewvyeMEbYN3t0cf6Gst1F46Nt/0GHv4Ja5q8VZUcn9wuGuFjg==
X-Received: by 2002:a05:6512:12c2:b0:553:28f1:66ec with SMTP id 2adb3069b0e04-554fdd47009mr2940330e87.31.1750951999683;
        Thu, 26 Jun 2025 08:33:19 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:33:18 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	akpm@linux-foundation.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: arnd@arndb.de,
	rppt@kernel.org,
	geert@linux-m68k.org,
	mcgrof@kernel.org,
	guoweikang.kernel@gmail.com,
	tiwei.btw@antgroup.com,
	kevin.brodsky@arm.com,
	benjamin.berg@intel.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	snovitoll@gmail.com
Subject: [PATCH v2 11/11] kasan: replace kasan_arch_is_ready with kasan_enabled
Date: Thu, 26 Jun 2025 20:31:47 +0500
Message-Id: <20250626153147.145312-12-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626153147.145312-1-snovitoll@gmail.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace the existing kasan_arch_is_ready() calls with kasan_enabled().
Drop checks where the caller is already under kasan_enabled() condition.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 include/linux/kasan-enabled.h | 20 ++++++++++++--------
 mm/kasan/common.c             |  8 ++++----
 mm/kasan/generic.c            |  6 +++---
 mm/kasan/kasan.h              |  6 ------
 mm/kasan/shadow.c             | 15 +++------------
 5 files changed, 22 insertions(+), 33 deletions(-)

diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
index 2b1351c30c6..2436eb45cfe 100644
--- a/include/linux/kasan-enabled.h
+++ b/include/linux/kasan-enabled.h
@@ -5,32 +5,36 @@
 #include <linux/static_key.h>
 
 #ifdef CONFIG_KASAN
+
 /*
  * Global runtime flag. Starts ‘false’; switched to ‘true’ by
  * the appropriate kasan_init_*() once KASAN is fully initialized.
  */
 DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
-#endif
-
-#ifdef CONFIG_KASAN_HW_TAGS
 
 static __always_inline bool kasan_enabled(void)
 {
 	return static_branch_likely(&kasan_flag_enabled);
 }
 
-static inline bool kasan_hw_tags_enabled(void)
+#else /* !CONFIG_KASAN */
+
+static __always_inline bool kasan_enabled(void)
 {
-	return kasan_enabled();
+	return false;
 }
 
-#else /* CONFIG_KASAN_HW_TAGS */
+#endif /* CONFIG_KASAN */
+
+#ifdef CONFIG_KASAN_HW_TAGS
 
-static inline bool kasan_enabled(void)
+static inline bool kasan_hw_tags_enabled(void)
 {
-	return IS_ENABLED(CONFIG_KASAN);
+	return kasan_enabled();
 }
 
+#else /* !CONFIG_KASAN_HW_TAGS */
+
 static inline bool kasan_hw_tags_enabled(void)
 {
 	return false;
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 525194da25f..0f3648335a6 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -257,7 +257,7 @@ static inline void poison_slab_object(struct kmem_cache *cache, void *object,
 bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
 				unsigned long ip)
 {
-	if (!kasan_arch_is_ready() || is_kfence_address(object))
+	if (!kasan_enabled() || is_kfence_address(object))
 		return false;
 	return check_slab_allocation(cache, object, ip);
 }
@@ -265,7 +265,7 @@ bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
 bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
 		       bool still_accessible)
 {
-	if (!kasan_arch_is_ready() || is_kfence_address(object))
+	if (!kasan_enabled() || is_kfence_address(object))
 		return false;
 
 	poison_slab_object(cache, object, init, still_accessible);
@@ -289,7 +289,7 @@ bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
 
 static inline bool check_page_allocation(void *ptr, unsigned long ip)
 {
-	if (!kasan_arch_is_ready())
+	if (!kasan_enabled())
 		return false;
 
 	if (ptr != page_address(virt_to_head_page(ptr))) {
@@ -518,7 +518,7 @@ bool __kasan_mempool_poison_object(void *ptr, unsigned long ip)
 		return true;
 	}
 
-	if (is_kfence_address(ptr) || !kasan_arch_is_ready())
+	if (is_kfence_address(ptr) || !kasan_enabled())
 		return true;
 
 	slab = folio_slab(folio);
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index ab9ab30caf4..af2f2077a45 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -176,7 +176,7 @@ static __always_inline bool check_region_inline(const void *addr,
 						size_t size, bool write,
 						unsigned long ret_ip)
 {
-	if (!kasan_arch_is_ready())
+	if (!kasan_enabled())
 		return true;
 
 	if (unlikely(size == 0))
@@ -204,7 +204,7 @@ bool kasan_byte_accessible(const void *addr)
 {
 	s8 shadow_byte;
 
-	if (!kasan_arch_is_ready())
+	if (!kasan_enabled())
 		return true;
 
 	shadow_byte = READ_ONCE(*(s8 *)kasan_mem_to_shadow(addr));
@@ -506,7 +506,7 @@ static void release_alloc_meta(struct kasan_alloc_meta *meta)
 
 static void release_free_meta(const void *object, struct kasan_free_meta *meta)
 {
-	if (!kasan_arch_is_ready())
+	if (!kasan_enabled())
 		return;
 
 	/* Check if free meta is valid. */
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 129178be5e6..e0ffc16495d 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -544,12 +544,6 @@ static inline void kasan_poison_last_granule(const void *address, size_t size) {
 
 #endif /* CONFIG_KASAN_GENERIC */
 
-#ifndef kasan_arch_is_ready
-static inline bool kasan_arch_is_ready(void)	{ return true; }
-#elif !defined(CONFIG_KASAN_GENERIC) || !defined(CONFIG_KASAN_OUTLINE)
-#error kasan_arch_is_ready only works in KASAN generic outline mode!
-#endif
-
 #if IS_ENABLED(CONFIG_KASAN_KUNIT_TEST)
 
 void kasan_kunit_test_suite_start(void);
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index d2c70cd2afb..9db8548ccb4 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -125,7 +125,7 @@ void kasan_poison(const void *addr, size_t size, u8 value, bool init)
 {
 	void *shadow_start, *shadow_end;
 
-	if (!kasan_arch_is_ready())
+	if (!kasan_enabled())
 		return;
 
 	/*
@@ -150,9 +150,6 @@ EXPORT_SYMBOL_GPL(kasan_poison);
 #ifdef CONFIG_KASAN_GENERIC
 void kasan_poison_last_granule(const void *addr, size_t size)
 {
-	if (!kasan_arch_is_ready())
-		return;
-
 	if (size & KASAN_GRANULE_MASK) {
 		u8 *shadow = (u8 *)kasan_mem_to_shadow(addr + size);
 		*shadow = size & KASAN_GRANULE_MASK;
@@ -390,7 +387,7 @@ int kasan_populate_vmalloc(unsigned long addr, unsigned long size)
 	unsigned long shadow_start, shadow_end;
 	int ret;
 
-	if (!kasan_arch_is_ready())
+	if (!kasan_enabled())
 		return 0;
 
 	if (!is_vmalloc_or_module_addr((void *)addr))
@@ -560,7 +557,7 @@ void kasan_release_vmalloc(unsigned long start, unsigned long end,
 	unsigned long region_start, region_end;
 	unsigned long size;
 
-	if (!kasan_arch_is_ready())
+	if (!kasan_enabled())
 		return;
 
 	region_start = ALIGN(start, KASAN_MEMORY_PER_SHADOW_PAGE);
@@ -611,9 +608,6 @@ void *__kasan_unpoison_vmalloc(const void *start, unsigned long size,
 	 * with setting memory tags, so the KASAN_VMALLOC_INIT flag is ignored.
 	 */
 
-	if (!kasan_arch_is_ready())
-		return (void *)start;
-
 	if (!is_vmalloc_or_module_addr(start))
 		return (void *)start;
 
@@ -636,9 +630,6 @@ void *__kasan_unpoison_vmalloc(const void *start, unsigned long size,
  */
 void __kasan_poison_vmalloc(const void *start, unsigned long size)
 {
-	if (!kasan_arch_is_ready())
-		return;
-
 	if (!is_vmalloc_or_module_addr(start))
 		return;
 
-- 
2.34.1

