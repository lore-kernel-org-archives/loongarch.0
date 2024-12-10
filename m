Received: from mail-oo1-f73.google.com (mail-oo1-f73.google.com [209.85.161.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF931D433B
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 02:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798498; cv=none; b=TcWdkAXgTXrCKIxq+Is7rJnK3R1yeZVLd2G6e2A/aPZxmq0C4cySufJAoc/CAgmSUheUzAZblxwgv5RnKVc9TuWgv+HQbNmd6H8RxEJ9usv5xTK/HXfPhvfTXGEo86ro0oKpkQVbHGcx/pf6AwIHvDOFM9rR2PqBKXYK1E1boww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798498; c=relaxed/simple;
	bh=AS+vZpJpCSDy0bq9wgoCdVRRzUEUY/Kb0H8feia1C7Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NrPc+lJV+MwYBjgDpHVUKlfZ8sZTcM6CLjmGRf/0wtx4I5SOJukCRzvN0yrSkJ8AfVG4FO78ZGm9IvLoT1L4S1wmLbwxdaOWy+xySPcEaBhLoY1yypEJfbObwMmF/1cWdgLA6xpi92NphCXXOn7/rfQ/dwhI6Pbj1oqxw4TMm/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oDuAHA3K; arc=none smtp.client-ip=209.85.161.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oDuAHA3K"
Received: by mail-oo1-f73.google.com with SMTP id 006d021491bc7-5f2be8a7af9so780176eaf.2
        for <loongarch@lists.linux.dev>; Mon, 09 Dec 2024 18:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798494; x=1734403294; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=10lySyzZTVvC+S5oM1O6pINxMohBlWGSJurdKiLL+/8=;
        b=oDuAHA3Kr/OGMeNN9+mQORBXFlLkQu93wJLApbglfDFZQNRxEnzPZjCvX/h2wkk8m/
         715HsEqMnqjAr6DD3Mo9JbU0HhB7Vi5YuguYx6ZR4ReiazUtg5Wa1HbbD0F4lEFYYmUd
         5uL1tjrw3A2M9x61H/1zZx6likIF03r4lFqJcIrP3Iv5TETHOnul0b+xrs5mmAUbHuCO
         xVrGkt3d874PR/2Ca/jCV9KTvsCu19KPPjnyMkxPtApUMCoGdeEsbMaTBd97LnmH4ljc
         ZYxmGVdbZC7BK9Ev8x5lAOLe5vjxiOfCBng8Ew0kg0x0/dpA7bY1/BrC2rQ2QZI998IC
         qTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798494; x=1734403294;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10lySyzZTVvC+S5oM1O6pINxMohBlWGSJurdKiLL+/8=;
        b=A935pzr5Mb3/EISBzeqO4C5LLT69M3TpiNjI12i2s+ZIQ2D+zsZKrAT427ZT07pSbZ
         hzZIK2v/6vb15LiAo0cF+hnlBRaOpdLP1Jt/q36hjEn4t1jCE5KjXPzHCyFRIworWxPk
         GYhs8aZtI4mUP3o65RtZREuF75lt6WO8aUKiJeBUnLHi1Q9egbi4M6Ef+/sMSyRA8QjY
         M/Ia2h3EyxzR9hTNykp2NotmKijMPQBZ6BxgISDrnkFFI0H3GCVNlmQMKNfb0TaupyMG
         BLhXwZZVgEo1lyk86IAQz/el2AYo64elJfD2RUs1JSiamPMQRKmF+xHhv9dq7UE7e3nV
         ZCkg==
X-Forwarded-Encrypted: i=1; AJvYcCUFR7WRT+uUSXbnPizOvCZUKiJ4HiHHRdaZ6XkpEauTC63jPFULngfdtePk1qif8UavVu4hqJvTyOE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz//IPTQH6Y1buPJKE/1mO35IMjjmaAUjsIgAYW8tzGoyqWQI6D
	I7oYYoNWnrVJo8hPkQRYC7iL1GtQg2s2gXYFzttzcyuhjN1EOrk2IVzLJV5ysVnbasxJvUq92Hk
	ysxb4sXwj/s5nvufLv7PZIA==
X-Google-Smtp-Source: AGHT+IGrVCmYvgbRZyJY6d84f+llUxgBN0sslSfR3tN174qad1011sAwn0+s/lhjeAWOT5E3i4gR4UE5Ru9TVnP2PA==
X-Received: from oabfu21.prod.google.com ([2002:a05:6870:5d95:b0:29d:c6f7:1bb2])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:5a9c:b0:29f:f4af:dc34 with SMTP id 586e51a60fabf-29ff4b0889emr667703fac.7.1733798494636;
 Mon, 09 Dec 2024 18:41:34 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:08 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-7-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 06/17] mm: csky: Introduce arch_mmap_hint()
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

Introduce csky arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/csky/abiv1/inc/abi/pgtable-bits.h |  1 +
 arch/csky/abiv1/mmap.c                 | 38 ++++++++++++++++++--------
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/arch/csky/abiv1/inc/abi/pgtable-bits.h b/arch/csky/abiv1/inc/abi/pgtable-bits.h
index ae7a2f76dd42..c346a9fcb522 100644
--- a/arch/csky/abiv1/inc/abi/pgtable-bits.h
+++ b/arch/csky/abiv1/inc/abi/pgtable-bits.h
@@ -51,5 +51,6 @@
 					((offset) << 10)})
 
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* __ASM_CSKY_PGTABLE_BITS_H */
diff --git a/arch/csky/abiv1/mmap.c b/arch/csky/abiv1/mmap.c
index 1047865e82a9..184921a73856 100644
--- a/arch/csky/abiv1/mmap.c
+++ b/arch/csky/abiv1/mmap.c
@@ -13,6 +13,29 @@
 	((((addr)+SHMLBA-1)&~(SHMLBA-1)) +	\
 	 (((pgoff)<<PAGE_SHIFT) & (SHMLBA-1)))
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	int do_align = 0;
+
+	if (!addr)
+		return 0;
+
+	/*
+	 * We only need to do colour alignment if either the I or D
+	 * caches alias.
+	 */
+	do_align = filp || (flags & MAP_SHARED);
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
@@ -27,7 +50,6 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	int do_align = 0;
 	struct vm_unmapped_area_info info = {
 		.length = len,
@@ -55,17 +77,9 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
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
 
 	info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	return vm_unmapped_area(&info);
-- 
2.47.0.338.g60cca15819-goog

