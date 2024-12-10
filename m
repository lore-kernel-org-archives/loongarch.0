Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EFC1A0734
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 02:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798509; cv=none; b=CyJtuVEl1tyVMyZUNAZU7ZUUfFhY4XfGZuL+2RAxY0/KE0RYQiYL0Q4eq/qt+KeHF9mb+Wp2V0M0Npg6D8U55GngPKT19VSPdFgMj4EuZkdJ811DTYoXctwFJqr7eUY/L7JntX++lOkfCghgnAobtfl749yHmsP3qcESRJm9BVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798509; c=relaxed/simple;
	bh=R0cSn9KJwbsX+V2mZ7ohQbGUKA5C8mxvYsyv7+LaANE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nTz4HuW4+Xgi1NSzo1682gTMUs9hZkCAALQyl8QGp7i6XqFVWBaYvvMI7K9fUoLonsvdl++ulGZ8n8+YdwPYt6HJdPJjguPHGdSyhQmiWuaxnvSVMivW7NQN3rBIl4wrVBDEpHWNycwgvWEhQXbe90W+fQdjiHbOs0llvX8x96U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A/Ue+hCy; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A/Ue+hCy"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ee31227b58so4893193a91.3
        for <loongarch@lists.linux.dev>; Mon, 09 Dec 2024 18:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798505; x=1734403305; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1BAtlrJSVyRPOsQk5wSikGaGR3zqoYCpGFeQDDyhzvw=;
        b=A/Ue+hCy2gXsRcQnOGDkhMcNabHu09Y1cyYduWWEqpj9jnOJpDsyN8yczB9auAEcjo
         xQUc8kib6+nTOrruBuWKfJ+2yqEIrgDFOdfUfNkiFKk8lbcWyW3m7+G9+Siyt9JJUErz
         y8smgCX0PIkBJ4jIjcGxifE+HCNUgU4fu6ncpotPHMCgv9SyzLUx3kVN8FAYTrY/uvpK
         o2DFJyp5lSe61CgUdIHoN/7pEcRbFVYoW8lg9IPrR1BhL3TnZ7YsvAWwNbzgYCTxxQF0
         njyhdB+pntICUtcrXQhEqfff4j87gJLUiRp/xMXbVA1Zczr2aLTnCaCYf/oFEa9z4f8N
         Zvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798505; x=1734403305;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1BAtlrJSVyRPOsQk5wSikGaGR3zqoYCpGFeQDDyhzvw=;
        b=aLATW136R8B8ZvgoZu6uo19YCDkUdvPHDBFL00lw0gt3oQwW/d1R3Ox5LZbs/qjI6c
         vfaR212HRNecKL9X1u7wvTmE30JKKlNiq41KMjWqyJD+Mxe+zlwWlsV4bYdfAo4AZZHT
         qThkF5xZq7AFSTk8mt/hAZvsxsDRw8Y9iEzScGw+024HiMBuzyOfUxvr4hUYAI/OVNlV
         bavp/RyvEYvxedc+SSjZW+jOQCYHhpod7dRuQnuYFHfO7VL0f1LMMSg3GUEMkOSP/aXi
         nvJpho38yJPbzxVkvAJ//ICoGIvn+5O1lchTQ7RHFyLgbGl1i61JYwhvOlO73i3M7KHu
         ZIjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnAMqlIoYu4sdKOBW5TA/K5ebDrD+kTjGzRfSl0vcxvlVqkK0lhxWZpm5SpIc6wcNTDGJriEz/35Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8SiMSyGtl/Nmnh4lvhPlGBlnq7PuqAblfsvSJmOeMlhGbW0lW
	jyMVoAWBmbLUARnljKgi64D+6stEUfSd0MW8ViG0uPWa1ZlzKM7fJxVvyfc5dToY1DR5j7edezL
	0xOaLhD66s7qk+AisrfdqYA==
X-Google-Smtp-Source: AGHT+IG3H2VSitmLlBO6Re0RjQMAvCNU6wOeSZb7FxqqgQkEm7xuddsNJr2NEUZE8SQmtflSqHbUwj9vfGvySeSwAw==
X-Received: from pjbnr3.prod.google.com ([2002:a17:90b:2403:b0:2ef:6fb0:55fb])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a06:b0:2ee:9a82:5a93 with SMTP id 98e67ed59e1d1-2efcf138437mr4485348a91.14.1733798505429;
 Mon, 09 Dec 2024 18:41:45 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:14 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-13-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 12/17] mm: sparc32: Introduce arch_mmap_hint()
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

Introduce sparc32 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.

If a sufficiently sized hole doesn't exist at the hint address,
fallback to searching the entire valid VA space instead of only
the VA space above the hint address.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/sparc/include/asm/pgtable_32.h |  1 +
 arch/sparc/kernel/sys_sparc_32.c    | 21 ++++++++++++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
index 62bcafe38b1f..95084c4d0b01 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -437,6 +437,7 @@ static inline int io_remap_pfn_range(struct vm_area_struct *vma,
 
 /* We provide our own get_unmapped_area to cope with VA holes for userland */
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #define pmd_pgtable(pmd)	((pgtable_t)__pmd_page(pmd))
 
diff --git a/arch/sparc/kernel/sys_sparc_32.c b/arch/sparc/kernel/sys_sparc_32.c
index fb31bc0c5b48..2d5065ee1a94 100644
--- a/arch/sparc/kernel/sys_sparc_32.c
+++ b/arch/sparc/kernel/sys_sparc_32.c
@@ -40,6 +40,19 @@ SYSCALL_DEFINE0(getpagesize)
 	return PAGE_SIZE; /* Possibly older binaries want 8192 on sun4's? */
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	if (!addr)
+		return 0;
+
+	if (len > TASK_SIZE - PAGE_SIZE)
+		return 0;
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
 {
 	struct vm_unmapped_area_info info = {};
@@ -61,11 +74,13 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 	/* See asm-sparc/uaccess.h */
 	if (len > TASK_SIZE - PAGE_SIZE)
 		return -ENOMEM;
-	if (!addr)
-		addr = TASK_UNMAPPED_BASE;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.length = len;
-	info.low_limit = addr;
+	info.low_limit = TASK_UNMAPPED_BASE;
 	info.high_limit = TASK_SIZE;
 	if (!file_hugepage) {
 		info.align_mask = (flags & MAP_SHARED) ?
-- 
2.47.0.338.g60cca15819-goog

