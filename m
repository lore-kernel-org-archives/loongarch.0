Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8231F22616A
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 02:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798511; cv=none; b=H0S/zKydHsimsOy36ryQtFF0xWMUDpbGO07ruQ62ayckKcqt960CKC1m/YwurJPy+BzPcU0d9bknNhd0bGzVQvHTqOQFANwzIFHzDK/sGHbDIdkZeZCLlIb7/N0yEGXn6mIAvAoN1iXHoZmhKA76PoXGew0NBPciw9liYWpnOHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798511; c=relaxed/simple;
	bh=wKDyQX4GslZ76yIZ1mKeSISq1rhLsm9KK83vMGn6pEA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Fur/cwhOMSlD7n+vbcRPVB99OAq2WjmcJF744W/gtvtDgAgtdq+rGefi5zwiK40uc5WTFw60YDIBT9xLEETR1g0hkOH9csKaOSzt6nq6ChX8t4vaI13uZlAzsJHLbYtVJ4+bMy94yiMuTKCwiR5AEmJUp0x4lStwsvUfrQjQ0B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JAx+uQbi; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JAx+uQbi"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef79d9c692so4105025a91.0
        for <loongarch@lists.linux.dev>; Mon, 09 Dec 2024 18:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798509; x=1734403309; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8RBi4d94aA8fGJb29BjAVbVAiuWgJzs9FAFEoE/Tcq4=;
        b=JAx+uQbi8X29VhN0ag9KyhsIxkMPNUIQkABmQVs5qgtj1ODh/RvY81o5dcng9wBToX
         VJXL/8oBdwcPpeWMH4mMCUqJR96KZy/f0gJF16l9PZAZLcm+FxTQr0YGwlYYm3ZDcdeI
         ES0QGjWV1teqkwrzQlpWxiH2dnpvff9ORpIpLuopLj2Bu+aLG2CCIDp/yHwjE757UH7F
         LOr3PuTbhOykBNhSwWNCw33m6ZLO2F4cKzH2TB5S2Ct4sGiGLsArL2/nm5npZgvqnYXe
         wXlHUGzoAucnpYFnX2Uom/DSP6wBEkO0dSK6cJknyGi4ktQHbHsVqAtAIaWRfDyVv8hK
         gfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798509; x=1734403309;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8RBi4d94aA8fGJb29BjAVbVAiuWgJzs9FAFEoE/Tcq4=;
        b=X90A5r+yOZAgNyVymT7aY5vFic62MADWRgPvPEzYtcFyKHmCDPakMHbQSB6z5lg5xQ
         lHAa9xQP5X+v+yIfXq6vJmpYOoi31k3IW7MrkqNsG3E8bTmMAJdabPcwxZ2hjioC0NUq
         fHSs+NLZtI0LE79wPppvcKCxmw+z1lYPko/OcXCrWhHJUGwsDiOhEjmLKRRt6KP9btkP
         PptjVZGq8hWWEfEgwyNDuADTNG7Gzp969rdQ/fckM4rO+9dFWYfW/MF27eXE0kaYA7lO
         TSIgyCqp1XaMjjk4QbdP2TDMJp3Qrr2+fLJkcCWU0iDcMTaZoWgGaQVChrs/kQER1exa
         xG1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1+nO69Ue6tWYh1od1vfqIYd0T2tMbKCjSvKLEbtJNrLgmbeCbQC+VG0ANcbQde+pXxwut3wM/in0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDhYMf1SNmzJSglnwNSkHk5HEaVXgkCiFezJLfuH+Sj5X5godk
	xgwYkiTlDns7w/tu011hUVviUsoJ3B/eB+P3C8XZrcsTH4g1ZZDTSURJA6FczYxcU14ZtC4eL7f
	J8YGeGC4IrTOE8eRgLXnnAQ==
X-Google-Smtp-Source: AGHT+IEWnrN6kZ7CMoj0XPEY5LyEzTzu31G9SE2ukZ22eBNhBZBZVrxzEpEONDIVdXz8wv9Xu2tYcLSnTTgrFqyRgw==
X-Received: from pjbsq5.prod.google.com ([2002:a17:90b:5305:b0:2ef:9866:6155])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2544:b0:2ee:c918:cd42 with SMTP id 98e67ed59e1d1-2ef6a6c11b1mr19145935a91.22.1733798508962;
 Mon, 09 Dec 2024 18:41:48 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:16 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-15-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 14/17] mm: xtensa: Introduce arch_mmap_hint()
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

Introduce xtensa arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.

If a sufficiently sized hole doesn't exist at the hint address,
fallback to searching the entire valid VA space instead of only
the VA space above the hint address.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/xtensa/include/asm/pgtable.h |  1 +
 arch/xtensa/kernel/syscall.c      | 26 ++++++++++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/pgtable.h
index 1647a7cc3fbf..31b7da0805ec 100644
--- a/arch/xtensa/include/asm/pgtable.h
+++ b/arch/xtensa/include/asm/pgtable.h
@@ -425,5 +425,6 @@ void update_mmu_tlb_range(struct vm_area_struct *vma,
  * SHM area cache aliasing for userland.
  */
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* _XTENSA_PGTABLE_H */
diff --git a/arch/xtensa/kernel/syscall.c b/arch/xtensa/kernel/syscall.c
index dc54f854c2f5..353cce1ac9f1 100644
--- a/arch/xtensa/kernel/syscall.c
+++ b/arch/xtensa/kernel/syscall.c
@@ -54,6 +54,24 @@ asmlinkage long xtensa_fadvise64_64(int fd, int advice,
 }
 
 #ifdef CONFIG_MMU
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	if (!addr)
+		return 0;
+
+	if (len > TASK_SIZE)
+		return 0;
+
+	if (flags & MAP_SHARED)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags,
 		vm_flags_t vm_flags)
@@ -73,8 +91,12 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 
 	if (len > TASK_SIZE)
 		return -ENOMEM;
-	if (!addr)
-		addr = TASK_UNMAPPED_BASE;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	addr = TASK_UNMAPPED_BASE;
 
 	if (flags & MAP_SHARED)
 		addr = COLOUR_ALIGN(addr, pgoff);
-- 
2.47.0.338.g60cca15819-goog

