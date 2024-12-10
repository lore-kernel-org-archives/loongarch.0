Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF921AAA36
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 02:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798493; cv=none; b=rZU+/RMF4g1ZunQuM0qzh2VyHPfSRZ6WZvAbI4vy4KYEzyCVYbZP/22ovDkFkMSQDjsPIA5waoVYAlsZZ+f/QDiusGy/+ZM5m4vGJUzUrvgcfbLYjv1yEIWD5/aacLG21gAYUcAbgAnLGZbc7VbV7A1RLXTnKI9aN/t0YzLiqvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798493; c=relaxed/simple;
	bh=mhqmtP5jeiU16O3Z4a9rLDsr3FrAJMHCi8dtoMu2mVA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jHbLVGK+HP3PFD8veoM67Oyq+WdOcYOvwP7bdGCEK5m85odpF/9X06dd/FGBmXQw+9tpBsILlLfCCMC6ydY085SOE4MvL1BuqTe3g6YRM8XcGPh5jzPDRlHYxIntQx8e3wqbKDx9AyxfkrDCtbiKdsBqxSNrhZUcqqocsG1kR8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0qqzPYBM; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0qqzPYBM"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2162f80040aso22372995ad.1
        for <loongarch@lists.linux.dev>; Mon, 09 Dec 2024 18:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798489; x=1734403289; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9mddCWXY13usRicsLw6OHZIF2x4MzWSWW8AsqT4vIgs=;
        b=0qqzPYBM4UPZdNnfzNI2c/iYnioFc9H0nmgxUr+6V/t8KbJy9FpOV+2cTRd4NrIVmS
         EbTwb31/v7vBgnD9oXrSJF6TyqNQW89teL129b/iVcMfNbkpOZU3jOz9YCxLgpoWzn4B
         2jXUqlMKXcwoH3yfD+pLiD72cQpp/b+qWF7gMv3YlSyJQR5VfjwI2im+9aDcBKY1ZrQA
         hH7Q0nb0u8E+ZkrY2MouBmwOwaCZotLcKnuF/8Nes5ZxGV26A4eo/OocMLXWCrh2snEv
         NGgCxJGD2iqO/B9ampX9btgD5KWvPOLR8i+iuFZTq2zde1HrcZ3lmfIqjmCzzM8BE0Lc
         uSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798489; x=1734403289;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9mddCWXY13usRicsLw6OHZIF2x4MzWSWW8AsqT4vIgs=;
        b=u8meb7TgFIaeeYIcj4nE2HcYtn8L03uyHnGA3G0yOlDHdsvJit+YclGmvv6G12TKzF
         gY+81IOE8boBxVV9Qo7nhwO+VnQde5GRpfHkonluemUYfNSDrWAdiwE7w5RZxge1XcGF
         MUgMDPqvH+wv8jnOW6/yGXTzmhQX9xnrXzcVbQrTUMHczazQT1xcKET5n/lSu4OfoVbG
         bB7CUrx0bv45jiZ3foHQERfUTBkazwBHmegPMiZMQ/gJs21PwiOWtXysj10oOYf2gfcV
         6PpkH6mve+dV+Cr5txFzCY+rVFDE9ueImhMz161xYzM0Cdxwqhxl8+AO14kN0+r+itK4
         Hc2w==
X-Forwarded-Encrypted: i=1; AJvYcCXKY3PKEyk4QEtCQFbvS8BvphxC080d/5pWwplDmtifKqThxB+I8fFQF8rris4ieFWTsZzTjOg9uek=@lists.linux.dev
X-Gm-Message-State: AOJu0YzygO3h0tKmZoG4wl9hw9aLPltj+Hc29VZAnZQFeHgEa53oCGrk
	5NIRAhNi6iJvyq+0nxKnDmvmr4ur3MjYX6M6t57mEskOuXCLkVxZf6TOgwONkt4z4wejbXpiJvf
	OMG07WkAxkYw9dCJHxsssxg==
X-Google-Smtp-Source: AGHT+IEX/qrAQlYORBGIb8q2yh1uBiUP2mFrR7GdG/oXvBxNhJUWo6MtAF8VWexbyJx8hsdTWhCnXlVlObdK7ssA3Q==
X-Received: from plks10.prod.google.com ([2002:a17:903:2ca:b0:216:266b:5024])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2349:b0:215:a039:738 with SMTP id d9443c01a7336-21669f993a8mr45319855ad.5.1733798489149;
 Mon, 09 Dec 2024 18:41:29 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:05 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-4-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 03/17] mm: arm: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"

Introduce arm arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/arm/include/asm/pgtable.h |  1 +
 arch/arm/mm/mmap.c             | 54 +++++++++++++++++++---------------
 2 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index be91e376df79..1433b3ff4caa 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -330,6 +330,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
  */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
index 3dbb383c26d5..c415410eb64a 100644
--- a/arch/arm/mm/mmap.c
+++ b/arch/arm/mm/mmap.c
@@ -17,6 +17,31 @@
 	((((addr)+SHMLBA-1)&~(SHMLBA-1)) +	\
 	 (((pgoff)<<PAGE_SHIFT) & (SHMLBA-1)))
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	int aliasing = cache_is_vipt_aliasing();
+	int do_align = 0;
+
+	if (!addr)
+		return 0;
+
+	/*
+	 * We only need to do colour alignment if either the I or D
+	 * caches alias.
+	 */
+	if (aliasing)
+		do_align = filp || (flags & MAP_SHARED);
+
+	if (do_align)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 /*
  * We need to ensure that shared mappings are correctly aligned to
  * avoid aliasing issues with VIPT caches.  We need to ensure that
@@ -32,7 +57,6 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	int do_align = 0;
 	int aliasing = cache_is_vipt_aliasing();
 	struct vm_unmapped_area_info info = {};
@@ -57,17 +81,9 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (len > TASK_SIZE)
 		return -ENOMEM;
 
-	if (addr) {
-		if (do_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.length = len;
 	info.low_limit = mm->mmap_base;
@@ -82,7 +98,6 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 		        const unsigned long len, const unsigned long pgoff,
 		        const unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
 	unsigned long addr = addr0;
 	int do_align = 0;
@@ -108,16 +123,9 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	}
 
 	/* requesting a specific address */
-	if (addr) {
-		if (do_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-				(!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog

