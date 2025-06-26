Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219A12ED152;
	Thu, 26 Jun 2025 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951960; cv=none; b=AXf+JMRgJGME0oLdCTtyH+8LohiqNuy/xVt7NX1VCB38woOKqgMgip99CmMnPu2cUQ9YzjrnJKdsPwjraZ2V/f3dSe1H8/j68DOhqMViEs+qyDcoCygFASpW+JiruFp0E3syZW3W/7TnTVcr8BRaZKNp159Iu07MVsXiH75KGJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951960; c=relaxed/simple;
	bh=HNUbUpTuj2kTdby5SxEvjf70Sdazkxj0CBQjBAN+2gA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=awJxfMjyfefQbek7lHP1nTq2Jv3zQeqXlUvzibNR5I4NP55OJ/IFZO6B994aYWdmFue5jIs2sDoXfL5w53Yb9xzyx2+HSMwOw7ydUEfwUvrFCcKGaqOSYAB9O0cFpWSoDu30s39PLp00Ym8xHsY8ULyRcHe9ZaNUbi1AuhkWxnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Si932Htg; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Si932Htg"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so1088987e87.0;
        Thu, 26 Jun 2025 08:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951957; x=1751556757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIODlzXqnC6bR1NnIlD5Ra9HGYOoS6BNr32H/5XQfhE=;
        b=Si932HtgRY7SylYm65X0HqhFCIY2pCm9yRXD8Hpagm1Mlr4lOp2HhoiRLDfVcCzuBn
         xjapIj6WuiKK3JGC2ybqsONXe8G/tizho1ZegImo1XKdu6Q+/gNG3aKiLipbfNM8vQ/h
         pvGa1heZlo27Wz0vhqtNLVY6kcf9cFmwYzwPJjgj4c+xJaJXcbxe4i9GUKtPbLJbWvrB
         zX7p+i+duxvckri9joMqd08Ys20EGj8CzraL6RANCmQIHtWn037LubLtfbuo1TARE4WP
         bXovUuFKUjSS9OtlvF+b/LQmsaYg5LmMD63rYIcThWSXXQvdBR7VmyA4pkaLMsm28Cl0
         Y2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951957; x=1751556757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIODlzXqnC6bR1NnIlD5Ra9HGYOoS6BNr32H/5XQfhE=;
        b=Ey0JP6SrqxNJd2Y7puJBAaChM11Md3mr0mI79q91ZnUIoPwBZMWW4nLnkS1DYoXWRU
         2StAPvRqlwE/RR3MMXES5Lujdn/X7xZCoZSgXhaZ7qvMItvwfBXHe9QhaYca3kOOc5jk
         Q+ugjvNvOVvaqE6Zm7t7tILb0Ti4m1ATTJRwOQU99gVZ+ZkiMzZ48Nbc3TcD1pGELkI/
         YPO8cVXqj4mVi4TYMUEgYwQEdvkkdhZ6pIr3gdWuu72ysnB8YnOgn6/0xjnyovuzr/iT
         kD6NWjBbQZl3DN5Jixcqg3CybsYyjMqFYJvS8qmwgEdkwJgguLOkm2s2hAHqgluLppD/
         EUMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMV1S5y4OZFfNT6GgxNcLm/naplaSzNvTi2L5Tik8+ygWZHf0S4PV+TnJpphYUGuKKiQkYqgaLJhZ6@lists.linux.dev, AJvYcCWXLUyp3L8Ch3Nk2oyA1jAvFcZxsWABG6BdKp0dxoC3sWhlHtEZiBBDHTgjBvQMehR/lajc@lists.linux.dev
X-Gm-Message-State: AOJu0YwqIwRcpZt8OTBgoXG/CLUjcANvItC8HAHTVk6NWas+r6g2o5qz
	UYVmHfMuHSbX7pnMYBlEdoGauTjVBssCuN0BIea86IRoCGjC0v6TcVGw
X-Gm-Gg: ASbGncsWyHGj8pY28SQ1paEUf41LvJ0pFdZbnY8XoCHrL/5IaAHxeyPs7Qk757lvPZ1
	NpJZDmjRohX6JMWaqIhnJPANC7ZuCjBa5SzOQ1wkrvBQuet7p0BHX88yOXH9dDMF+uHfGxFSBP2
	heF9JU9BwNvPxTHSFRsejhOCztBbcvEASrkkqBapcem0QTYeNTYiJ7abPqmqZcRNmXQwZgbuKMU
	rgDlke4/lFkkmk6HvX6zD6ys7Rey2WteuO0W9WUqXxKBHnXey0aCQOqvL7O7fe8fOX4J2UzxC6D
	In6JMUkwxwjJI7qs+ikWqE04FbvlcUr585zYVfMbvXOT/oRISSPsacEVYMe7kpNH56nHZ/gZAMV
	7ll578+Q3HSH0PNjDtUyiLbLg+dthOA==
X-Google-Smtp-Source: AGHT+IGOOgR6U3IUglZM4Cl6ycrypcWsOKlsDtFSbRY/qbGVasvQKBWsuTTYRYjSxtgLuzO8PX+T5Q==
X-Received: by 2002:a05:6512:b8a:b0:553:a490:fee0 with SMTP id 2adb3069b0e04-554fdcf457bmr2652845e87.10.1750951956874;
        Thu, 26 Jun 2025 08:32:36 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:36 -0700 (PDT)
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
Subject: [PATCH v2 05/11] kasan/loongarch: call kasan_init_generic in kasan_init
Date: Thu, 26 Jun 2025 20:31:41 +0500
Message-Id: <20250626153147.145312-6-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626153147.145312-1-snovitoll@gmail.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call kasan_init_generic() which enables the static flag
to mark generic KASAN initialized, otherwise it's an inline stub.

Replace `kasan_arch_is_ready` with `kasan_enabled`.
Delete the flag `kasan_early_stage` in favor of the global static key
enabled via kasan_enabled().

printk banner is printed earlier right where `kasan_early_stage`
was flipped, just to keep the same flow.

Note that `init_task.kasan_depth = 0;` is called after
`kasan_init_generic()`, which is different than in other arch
`kasan_init()`. I've left this unchanged as I can't test it.
Defer to loongarch maintainers.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/loongarch/include/asm/kasan.h | 7 -------
 arch/loongarch/mm/kasan_init.c     | 7 ++-----
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/include/asm/kasan.h
index 7f52bd31b9d..b0b74871257 100644
--- a/arch/loongarch/include/asm/kasan.h
+++ b/arch/loongarch/include/asm/kasan.h
@@ -66,7 +66,6 @@
 #define XKPRANGE_WC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKPRANGE_WC_KASAN_OFFSET)
 #define XKVRANGE_VC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKVRANGE_VC_KASAN_OFFSET)
 
-extern bool kasan_early_stage;
 extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
 
 #define kasan_mem_to_shadow kasan_mem_to_shadow
@@ -75,12 +74,6 @@ void *kasan_mem_to_shadow(const void *addr);
 #define kasan_shadow_to_mem kasan_shadow_to_mem
 const void *kasan_shadow_to_mem(const void *shadow_addr);
 
-#define kasan_arch_is_ready kasan_arch_is_ready
-static __always_inline bool kasan_arch_is_ready(void)
-{
-	return !kasan_early_stage;
-}
-
 #define addr_has_metadata addr_has_metadata
 static __always_inline bool addr_has_metadata(const void *addr)
 {
diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_init.c
index d2681272d8f..cf8315f9119 100644
--- a/arch/loongarch/mm/kasan_init.c
+++ b/arch/loongarch/mm/kasan_init.c
@@ -40,11 +40,9 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 #define __pte_none(early, pte) (early ? pte_none(pte) : \
 ((pte_val(pte) & _PFN_MASK) == (unsigned long)__pa(kasan_early_shadow_page)))
 
-bool kasan_early_stage = true;
-
 void *kasan_mem_to_shadow(const void *addr)
 {
-	if (!kasan_arch_is_ready()) {
+	if (!kasan_enabled()) {
 		return (void *)(kasan_early_shadow_page);
 	} else {
 		unsigned long maddr = (unsigned long)addr;
@@ -298,7 +296,7 @@ void __init kasan_init(void)
 	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_START),
 					kasan_mem_to_shadow((void *)KFENCE_AREA_END));
 
-	kasan_early_stage = false;
+	kasan_init_generic();
 
 	/* Populate the linear mapping */
 	for_each_mem_range(i, &pa_start, &pa_end) {
@@ -329,5 +327,4 @@ void __init kasan_init(void)
 
 	/* At this point kasan is fully initialized. Enable error messages */
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized.\n");
 }
-- 
2.34.1

