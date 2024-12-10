Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7471D90C9
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 02:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798505; cv=none; b=oNq5s7u23IPsGsyYY23iaTOOHKRQtVjShDFdPGth7Mc3PoPvI1etyyySuHY43Tr9GKRkU18bKoadP2ewnc4bkZHacJydtKGGv3jH6aHbK1b/Rqm8JrGA2gJ8r4C/hoqQ4VwwTwZ7+Knt0YuIFetgkN5d5Q3hzz922xN7vhP30n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798505; c=relaxed/simple;
	bh=YQNhhHXT9hyTrt6apZYYX7TOornK2CckVq9q4j85xZI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uFL1tcOP8iAIB4VJP7seGNl8N2wW+SwAiBoc07UoP8WbiFC43ZV/qDdH2vc/S5nEwWQNV8ht8yLBld+AGCThXJyscI+UKPWX5KY7UPSa+H0Kd2cTX0H/xhx3R5EKmcp9LpOCt850BT3FD2pvrGqpHJca3F/IOHUx2VeJzqv3bOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Nwdvyhp; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Nwdvyhp"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef114d8346so4531041a91.0
        for <loongarch@lists.linux.dev>; Mon, 09 Dec 2024 18:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798502; x=1734403302; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7OiWBktXHvnpSQLcvIs2hf981HtU8PP2N6UjUFZYaM8=;
        b=3Nwdvyhpe5oXb75unM3U2mECUHmxd+5UH3pCjzRAl75AnxVlk6bA+oeZCQmUHZoYpK
         55Ur+fLeOxZ7YqSP/qxDqxEtaSt+PL6ILZ+uMippU4ehDWyyXdmajQBexNcdQK/9J5e3
         cxtEG5mFdaqZ32pQxC2V5AcfaWyHpjkOb5GVNQnif/FB3g4TWxOzBNNQrKzXasHHlsli
         C0x7NCft229GHRB7OZB3R+zHYYSssUHi+Mzz899DEURR1jZts+YlIvvU19MASjC+WUfV
         vvs9w/dtxrwMR/wyQV43s/yItxRocconMbjBAy/acUEt9R54XjQoUUCic64mVDgvShb3
         1Ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798502; x=1734403302;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7OiWBktXHvnpSQLcvIs2hf981HtU8PP2N6UjUFZYaM8=;
        b=svAZI7Q+Il7Ekka6monlGSuZRzN/mB7wPM3V2wI3YE0j4bM87BJkPD3GWV7+VTGgKG
         mc6B8E3B6O8rcSLGCwiYeYzgJdS4AT5FS5whYrOlJ9YKgUn8n2a8bIINIrI6QxrILejd
         aQ2XmVSTRnJulNEexQk10ZMyE2LxJU15iLn1PQs1tDtswnBNgFFFsNkUMnU88FuuZnX4
         TYOZhbvNOWgj4InhA4p7/tTEh+Wbj2R/EtkAMLY+PvHUx3h86Xjz9PXRF3nJpvnRjXDY
         O++fvKu6u4AQA7eyFVQrmDVtE2W4MRAnwV2T75EjB1o1V/WpqtOrL4EcVYzl1RBPeAMT
         UlJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw+wIeOn+k7tYdX8puDWvCvpd2odVAd4605WBKS2weTqKrIJQKUg4+AMr7DMIU0mllH0RZQz3duJY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9zBUjGOBtTYSUJGeLPKNR1/seSp0o4HHO70XJQgm05VL31G1h
	AZwWBrASE2kXiooRCTC8ulwasHM/mafNZTMNbmCbGNT3KHb5PWVhW4iWt5vHfgkiRc6NfFxABsj
	MqiSc4XR1M9o4BKU0HGA60Q==
X-Google-Smtp-Source: AGHT+IHGYo+0xZ93dmqZHCUo2fH2lASnlYW3/982jLUqUj3uy5rS3NmT8SEwDvEmCBiRAIKAMZxd1Te/85r8WkWevA==
X-Received: from pjbqi10.prod.google.com ([2002:a17:90b:274a:b0:2ea:3a1b:f493])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a91:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-2efcf127449mr4419672a91.10.1733798501710;
 Mon, 09 Dec 2024 18:41:41 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:12 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-11-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 10/17] mm: s390: Introduce arch_mmap_hint()
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

Introduce s390 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/s390/include/asm/pgtable.h |  1 +
 arch/s390/mm/mmap.c             | 32 ++++++++++++++++----------------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 48268095b0a3..eaecb558ab9b 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1997,6 +1997,7 @@ extern void s390_reset_cmma(struct mm_struct *mm);
 /* s390 has a private copy of get unmapped area to deal with cache synonyms */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #define pmd_pgtable(pmd) \
 	((pgtable_t)__va(pmd_val(pmd) & -sizeof(pte_t)*PTRS_PER_PTE))
diff --git a/arch/s390/mm/mmap.c b/arch/s390/mm/mmap.c
index 33f3504be90b..3f82401b77cd 100644
--- a/arch/s390/mm/mmap.c
+++ b/arch/s390/mm/mmap.c
@@ -83,12 +83,21 @@ static int get_align_mask(struct file *filp, unsigned long flags)
 	return 0;
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	if (len > TASK_SIZE - mmap_min_addr)
+		return 0;
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 				     unsigned long len, unsigned long pgoff,
 				     unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 
 	if (len > TASK_SIZE - mmap_min_addr)
@@ -97,13 +106,9 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (flags & MAP_FIXED)
 		goto check_asce_limit;
 
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr && addr >= mmap_min_addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			goto check_asce_limit;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		goto check_asce_limit;
 
 	info.length = len;
 	info.low_limit = mm->mmap_base;
@@ -123,7 +128,6 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long ad
 					     unsigned long len, unsigned long pgoff,
 					     unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
 	struct vm_unmapped_area_info info = {};
 
@@ -135,13 +139,9 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long ad
 		goto check_asce_limit;
 
 	/* requesting a specific address */
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr && addr >= mmap_min_addr &&
-				(!vma || addr + len <= vm_start_gap(vma)))
-			goto check_asce_limit;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		goto check_asce_limit;
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog

