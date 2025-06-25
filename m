Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BB1285C97
	for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 09:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845181; cv=none; b=bDYpTi+SPsC06aOw09hjMXMAyxMm58v7y7dJyNGUDUmpMGs6WqzCc7qhDrFzx6ECpbFJIKp7i0kbt0PQU9fDKbJN2UOXJX6a5r2g++ZRVVPR/PZnZduHuuy2yzjMFBfOOcXm7eI1B10aGXzfNV40+DjD02HWzPEzBZlFQ/UispU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845181; c=relaxed/simple;
	bh=3eVKIFY+WsG1SEi5ffClJGhexYokOf5VRAj3sHvFmZk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W6cLjn143q2BsuCN+cn0VCNPCWPp2M56Az/YGm9cNs/KDQ9j6+q9cib4TzbxnnRFiIpLSfqFxwEmpwBe8oFUMCejSkDwoRgznplao/ETYag352CWBuk29+hpzve2Ddn7p3a5tYNKOwh26LSGqYCVLiF1D/DNfWmMDFPKv3YHSRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0s/WQCB; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0s/WQCB"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b3a3a8201so49506621fa.0
        for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 02:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845177; x=1751449977; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spnPWYrTCugBtv3C0I1/Y7oTbF6XlJIePRXoFmRkZ78=;
        b=Y0s/WQCBGIb7Z6EwYeC5PfZwkxnRpLQgJcK9NMgAQ/AAae2Itm5eh+23fvwYdjdlq0
         BrUZl4GwmLFA9w+is+1zLRwmT2F3bpTg9JFl5oLrKAbQ4QlWHFWPxIhxkAS5ELCbACQV
         JVD58DE3BTFQEEqHhvTkj0mkJm0TcbvBF8PLK51x/JUb1rrKHyF9JONIzvXjS5h1g95z
         oXpgCyUiECTWdO3WyPIRsu4bZj6EmJP9Ggng96ClZMmTmHYfxZ7+9NbbmR8f5VdqtjAp
         Id+ueL+XDn6wAWvfvjjW+AEF/p8q7wqrmfK5FrUi8WjdVeeoYnEUsNizen47tnIaujuf
         Sr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845177; x=1751449977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spnPWYrTCugBtv3C0I1/Y7oTbF6XlJIePRXoFmRkZ78=;
        b=o0ieW2AfJmWgmOvS3bwcM79zPLH9T1s3qv/gWxfqLI8KM5B31IYd2pvUFIveKRMJ2P
         BWDl2+Vpgu0ehelUqDFw2btaD+I2hvLYeyget2xi5Tn2PT+5BlZflB/2epFeoyOvawMS
         AbXGbrvhurWWobbiwrMvI4uVn0uQSNXF8gQaCKzdkcs0UenA3qzlzGm/cmfIOZ5mjlMK
         uDuHqqF5HhDIean5Jum51bwnhN4mdIVTrU8zavZ++2+MkM+go0RSmUbYGprcBjYY+wc5
         LPJDUMwyUVWOEUjHLZfIQa6aJw0ixjy1JTenLIXTvBVmtA8LfQooxEn2AN7skt5hiC4Y
         pFmA==
X-Forwarded-Encrypted: i=1; AJvYcCUaasgz6fLrmdcRmuupzOOcVtlR4wR499ut0rn6ppHqc60fBdlvIgwe1MHMQNtQxDO/R1xKQVEWCiA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxJ9/kKF0c3YcAZK9nTzqg7VkGgw1jUtxjj/iB1ooIM2JckJAD
	QQAYRtMw4gH7thJ6eua/ymdvRn+Gk80Jcl/GF7UqVS6m2DlTCwO2Lyp3
X-Gm-Gg: ASbGncuwdW8VF2Om4PLMYaK0vciyfLgDK6pkeabaGvsC9fYZ9Xll5H8kOOWmE7WgrId
	3TCdVbQak+B4BkK97EF0lFD50HLlDvAx3DQGpIj/vST0l6Z3O4A6P9QV4Pav9dYBtOaH2Avh6u7
	9JjWw1u64vyu+B3QXG6sDelo/D8JEX/2QDmUJI+9kSioBm/HpKbW6A4eyfhKIkpC24w4fIQDAHF
	HP7hkgsqENMWsgremUTC6XU62U9odh4OUSd2vQcAB68XiJaJLBW2Re8jwjvi38JWbME+FTcutO6
	MNZUcfETtVfdoeYkCnQKzM0bTjhFvnJXRoqxo2AEFNbv+r+mUVEWsU6Wucts8DPGCH2gPhFidEX
	QhcD+pmFGZH7xIU9xfdtHJmspEqn2Uw==
X-Google-Smtp-Source: AGHT+IF6eiwi1xoALYtMAE1ncL4ibtGAQqo+HifrEVfcQXGb5lhuCkRcCK0fus3Knli+XAnux0nRaA==
X-Received: by 2002:a2e:7806:0:b0:32c:a709:80ee with SMTP id 38308e7fff4ca-32cc6582a2emr4097091fa.39.1750845177105;
        Wed, 25 Jun 2025 02:52:57 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a36c0sm19311851fa.62.2025.06.25.02.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:52:56 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
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
	akpm@linux-foundation.org
Cc: guoweikang.kernel@gmail.com,
	geert@linux-m68k.org,
	rppt@kernel.org,
	tiwei.btw@antgroup.com,
	richard.weiyang@gmail.com,
	benjamin.berg@intel.com,
	kevin.brodsky@arm.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH 2/9] kasan: replace kasan_arch_is_ready with kasan_enabled
Date: Wed, 25 Jun 2025 14:52:17 +0500
Message-Id: <20250625095224.118679-3-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625095224.118679-1-snovitoll@gmail.com>
References: <20250625095224.118679-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the existing kasan_arch_is_ready() calls with kasan_enabled().
Drop checks where the caller is already under kasan_enabled() condition.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 mm/kasan/common.c  |  8 ++++----
 mm/kasan/generic.c |  6 +++---
 mm/kasan/kasan.h   |  6 ------
 mm/kasan/shadow.c  | 15 +++------------
 4 files changed, 10 insertions(+), 25 deletions(-)

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

