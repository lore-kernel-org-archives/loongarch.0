Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68752248B7
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 02:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798510; cv=none; b=HcjAvpjF1wAfTg7SUn/DlPzu2/nGiTojoDJ6ep7fHUq5NA5v8ITqs00sBJZwYA3Z9hjsKgPJgD08wfqudGxJ+V0Jsjvl04ilaLXN8AJWO+t+ehNckGU9PA5dOOB6uRLuBvJJyXUQHorVADBSEUZVJmokdCPRGvO/6cBHuZ29Ko4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798510; c=relaxed/simple;
	bh=9RIOLAOXaPXefMFvMfOe6ryVti+XUuUv8cR1Zh/uMto=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lHHXq6jm2871nWwgpjifecJdIPqce5Ux2cXO6Nr9y7+cC0aMoTN5NpdfzjWBzjPgHdi61UpDbXYT0Efdo2CN4p5ADHnuQh+HN3jic1Dj4kXyE0+/+vp7TxYUMEbbMMTKpLaNCrgNhvF2IqC0bqyUAtPJro3OfuOV9HbmbquoYMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2DjNDM/n; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2DjNDM/n"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef9864e006so3146840a91.2
        for <loongarch@lists.linux.dev>; Mon, 09 Dec 2024 18:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798507; x=1734403307; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lD1y5M/92bgTaY6KXagZAGAzcvbsf/5mzkOXcooW0ho=;
        b=2DjNDM/nvqmrfVzq4d4Ovsv1hijaS9nqunBtNdB48daX134ZhjlLn9b8qfANhKU0MB
         vUr7jl0k66vndbm22jxcIHZgUwV7kttXdkYN07AZ1L21hmW8YyaMexMs7vi0jeWTNiQx
         0i7hVJO/9emWeN3cwxowMQV2ZhSDyz1sVIunGqdq0f/hsMIRQtYAS7F27bx6ke6HmzRK
         Cj+00h8irpZhSPVYlYmwkE69feEGXGixTOkj/VaWi8+yO5jfNBztDIwWEOcKt44Wzlgb
         oNISpvABqhwpMYDJQJtsUXRMkxGc5lfpFkekRW5UQyO0mKduM16C2DehyPkDx5IJnBog
         EfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798507; x=1734403307;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lD1y5M/92bgTaY6KXagZAGAzcvbsf/5mzkOXcooW0ho=;
        b=qAAS87qNiCakNgflbqr7NLlK094KlBxFoKV8gPYRry/jCzfkr3ukx3Ytcg179GWgXc
         LS5yOrXsGE1x+2x+sZl/4q+ewWPm7Vrs9yAPrAW8BA3ArDDlX8lKRNH2KDgwT/BxzfDf
         9YncsaMoBG3Imb7XxeTX34AwF1geT80Afkgamb+V1UrKpXYYw/ySAHJyLaThg4PbSYj8
         RWEXrznjdVgQHOkotPnzOnSX7Leij0RwhWjbvF1WhBTz8dqRRVsbdVLD6HNRXtPrGTIg
         D/6SQWmCfKFUa8MAlk7ccfqEfOnSH9uHanORv4ZAYi7Q8l3PW6aA++GPnl3crYaaLAwu
         gtBA==
X-Forwarded-Encrypted: i=1; AJvYcCW1lvGFSYjuQya0ARd4cBHLvjWvRR/UwjCJ/BtzWs0qNaV2UeWSSH02JoQWmAsrHopOQ+qWCLplW7s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzV4VoLsJ+JJDAvVFuA5/6PMn32GvTXVC9QxJpOsmBR5BnkjA+N
	lsBqavmQz1PGW7/IPF/KjEYmn/r/Wm2NXXiO59K/P4SsPaMliY4+r7npst5rUfxt0YBK2mgGG9i
	WOB2mArY7J/SBCZK+/TG12w==
X-Google-Smtp-Source: AGHT+IEki7Ie5yO93OnRXKQVvZe4Tx9Zhtxszko37jcevo7YJZw67tf4QTtrn4drQ39DwCB2Qw8B/AwA/g2PTJdBkw==
X-Received: from pjg15.prod.google.com ([2002:a17:90b:3f4f:b0:2e0:915d:d594])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a:b0:2ee:f80c:6892 with SMTP id 98e67ed59e1d1-2efcf136579mr4227892a91.3.1733798507341;
 Mon, 09 Dec 2024 18:41:47 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:15 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-14-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 13/17] mm: sparc64: Introduce arch_mmap_hint()
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

Introduce sparc64 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/sparc/include/asm/pgtable_64.h |  1 +
 arch/sparc/kernel/sys_sparc_64.c    | 47 +++++++++++++++++++++--------
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 2b7f358762c1..f24a4eb2777b 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -1148,6 +1148,7 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
  */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 /* We provide a special get_unmapped_area for framebuffer mmaps to try and use
  * the largest alignment possible such that larget PTEs can be used.
diff --git a/arch/sparc/kernel/sys_sparc_64.c b/arch/sparc/kernel/sys_sparc_64.c
index c5a284df7b41..a782696e98e0 100644
--- a/arch/sparc/kernel/sys_sparc_64.c
+++ b/arch/sparc/kernel/sys_sparc_64.c
@@ -98,10 +98,39 @@ static unsigned long get_align_mask(struct file *filp, unsigned long flags)
 	return 0;
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	unsigned long task_size = TASK_SIZE;
+	bool file_hugepage = false;
+	int do_color_align = 0;
+
+	if (!addr)
+		return 0;
+
+	if (filp && is_file_hugepages(filp))
+		file_hugepage = true;
+
+	if ((filp || (flags & MAP_SHARED)) && !file_hugepage)
+		do_color_align = 1;
+
+	if (test_thread_flag(TIF_32BIT))
+		task_size = STACK_TOP32;
+
+	if (unlikely(len > task_size || len >= VA_EXCLUDE_START))
+		return 0;
+
+	if (do_color_align)
+		addr = COLOR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct * vma;
 	unsigned long task_size = TASK_SIZE;
 	int do_color_align;
 	struct vm_unmapped_area_info info = {};
@@ -129,17 +158,9 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 	if ((filp || (flags & MAP_SHARED)) && !file_hugepage)
 		do_color_align = 1;
 
-	if (addr) {
-		if (do_color_align)
-			addr = COLOR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (task_size - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.length = len;
 	info.low_limit = TASK_UNMAPPED_BASE;
-- 
2.47.0.338.g60cca15819-goog

