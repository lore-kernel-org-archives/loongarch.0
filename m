Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3222E1D63D6
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 02:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798500; cv=none; b=JXNSmLV9ri9Us4nxAO/quFz3QH+bjNnUMxGiVQf9rRK9y+8li92eM2Cdi/BKRm/SzasB3peuiDhoiUnnSk/9nETwgy3ASQdveXQ/6KM3rRSrzgMjlgLusGGSgdn+XfW8rx6fWjDFCjRY4oiJwhHqKo4bT2z6bQYCt3ZOMrXFw8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798500; c=relaxed/simple;
	bh=xcbH9OWeM8vfFx05iH7xS2xrxxFnY7fI4TROJ6H3v1U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pbSuL9fcz27rRwTikMjHttuzWkUsueqgU8XscSyu3R79khLYUTFlcSxdsidbbFikJSQQ3XcseBo3SfUSAxvIKj6ZK2HdrSqByKRHr0LrmHp8pEHPz1QgM414fSCUAe/2NWY2tO4YtKxwvmwUEU7fax5sK+Z3P5gM8KsF05+CbIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KGIrM13v; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KGIrM13v"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ee36569f4cso5270594a91.2
        for <loongarch@lists.linux.dev>; Mon, 09 Dec 2024 18:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798496; x=1734403296; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S88A34UwW99gwo3FHZNSbMidEba+jodHLuTGE22Alms=;
        b=KGIrM13vwDP97PGIP3592rcplaovYeR858rf1kuWT5O1GKdwsky9DT52Msorf2r2fH
         KoCeZC8MwGcDgBmQUP0AZzOalTwADewgJck6MvtbD/+02nxwecgNb3BUwdNhW23oYKsi
         /xPgv7226YhjL3ufqLjetvVIIRTgpcr1Uwqar42WSvCz2ZdqQ7vKKwEgM6Lc1jME2Waq
         ieWVQ746al5AcReESp2wtaYJ4bHll3aNlnzjXFHyHKkA3v4s1hiCUSj6sDug8xu9x5i7
         u/iFW2EEtvsxwlmDMdT7/s217EpeHpjfU4jXSsFWuDUtLqUrbLJJFZqy/zS3kO5io0lb
         5qVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798496; x=1734403296;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S88A34UwW99gwo3FHZNSbMidEba+jodHLuTGE22Alms=;
        b=nXEBslgi6gW0exYuQndmVmAbu9Z8aCI85gjrdLpuKLettV26X5ZDYxN1D+Q0RMM9JD
         vgeJqv4cGC0X3jmdIIMCU0BPvpG2ObcOj/35mCFdFyBOhMK2OcPLdidi1g3iYdgyJ++p
         nsehTnxM6X120nOr5tlg88VCCwfs9mlp2crdnA3Hkcpiji3Tnhxtf8OD672bQvwA7i20
         TLCX04JkAbEdreZN6Kc96cGwjmTGbNdXB7rl/3/1LwYnRucPHnTsrhoaGAswNjum0vDV
         9oCGaGSiEByvhHxiCzi1GzOSpvbn2bNlq5Ali7Qqz/ITa0day0ZhYgywiZlDLO/Tyn8z
         LOqg==
X-Forwarded-Encrypted: i=1; AJvYcCXTj1G8nRhcx3jKncZWmDy6Wt3vwRwmoK9tdFh8cV5ngRF2AkQMOh/N6NM3ZCVDCGIX8koQh6XqMcg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWe8NjhVSU+2DPi9073dpFhmjTi4h/SbplwGKfvIdXm9+e7uFZ
	R7tDw83rv96LmfH0PX0AJkSO6Tp/xPv98FabLL65Q4aOWqJDikNJXml++2YZsNtPoh/fTl6dmKM
	41v0Pgj1rsatTon/CzjXjuw==
X-Google-Smtp-Source: AGHT+IGKFXSWCJqlNS2qFXMxzoG4Xb3NRDnkhhqp5lhhsQRnzkIpBXQqaaHYQ40OzOD6Dmlpa/x+DpWxNJUXLfVq7w==
X-Received: from pjvb11.prod.google.com ([2002:a17:90a:d88b:b0:2ea:7d73:294e])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1d0c:b0:2ee:ed07:d6d2 with SMTP id 98e67ed59e1d1-2ef6ab2888cmr21797074a91.37.1733798496370;
 Mon, 09 Dec 2024 18:41:36 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:09 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-8-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 07/17] mm: loongarch: Introduce arch_mmap_hint()
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

Introduce loongarch arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/loongarch/include/asm/pgtable.h |  1 +
 arch/loongarch/mm/mmap.c             | 40 ++++++++++++++++++----------
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index da346733a1da..326a6c4b7488 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -624,6 +624,7 @@ static inline long pmd_protnone(pmd_t pmd)
  */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/arch/loongarch/mm/mmap.c b/arch/loongarch/mm/mmap.c
index 914e82ff3f65..b7db43fabca1 100644
--- a/arch/loongarch/mm/mmap.c
+++ b/arch/loongarch/mm/mmap.c
@@ -17,12 +17,32 @@
 
 enum mmap_allocation_direction {UP, DOWN};
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	int do_color_align = 0;
+
+	if (!addr)
+		return 0;
+
+	if (filp || (flags & MAP_SHARED))
+		do_color_align = 1;
+
+	if (do_color_align)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+
 static unsigned long arch_get_unmapped_area_common(struct file *filp,
 	unsigned long addr0, unsigned long len, unsigned long pgoff,
 	unsigned long flags, enum mmap_allocation_direction dir)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	unsigned long addr = addr0;
 	int do_color_align;
 	struct vm_unmapped_area_info info = {};
@@ -45,23 +65,15 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		return addr;
 	}
 
+	/* requesting a specific address */
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
 	do_color_align = 0;
 	if (filp || (flags & MAP_SHARED))
 		do_color_align = 1;
 
-	/* requesting a specific address */
-	if (addr) {
-		if (do_color_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
-
 	info.length = len;
 	info.align_mask = do_color_align ? (PAGE_MASK & SHM_ALIGN_MASK) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
-- 
2.47.0.338.g60cca15819-goog

