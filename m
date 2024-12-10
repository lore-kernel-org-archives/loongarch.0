Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FD61A3020
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 02:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798495; cv=none; b=nzXPFNw7yZoJfoN+fqNARa5mBecCNNEcLzGayZKjM4iWcO7VP9WnszFXazX6AD5jvUWOwwx/KaEabaij1ggehkZn9tKPbmdgX6ufF7OivT2Qy0OnMRadfR/ij/eTrNJXY7bO9sfqhO5gw21hjFxALZYCnKWeVZJ6XaHQtnKU8kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798495; c=relaxed/simple;
	bh=JvP+EsC2ed2h2HeDVKMeMFmoQFp3PpsCZOYPNBeb6GE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e8ZUB9ywdO6D+mCLOWyPyxYfi5mi1TqVK9LCwkMvwrKhReQrzg5NN/J2Wum0oHj9cTE1aT1Zf169AQJ1Xs2geTiQcJAGXuEUevl6OLyrvX077okaZf14d2pGostmsGgEi+sMVQzBRyFt4FRI+GgQulE6kYWoYNDGUgRAgfERMbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RYubzFWP; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RYubzFWP"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ee5616e986so7906630a91.2
        for <loongarch@lists.linux.dev>; Mon, 09 Dec 2024 18:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798493; x=1734403293; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=plyHizQjFILOlGH5Iba1IrDdDMxWHhXvOcpLcYrtGxg=;
        b=RYubzFWPXcjG7jJNekAdsSzJKAAcImNOw3uUtCpq/sGi/X/fMOXRGRhO03ph72xQyq
         kn5JaFHCDpZs3Wd2E59R4tapEVm71GoTLDXOKsGqEznjSmq9toBNkVYX9Ph7dxCrFddP
         nKuuYnma6vRJN97kAXbLqsWSU1MXxtnEruwMG/f/Is6ZGSZ6DM4l0DBm11dWw0Q8LPv6
         qJAj7k6atIepM/ZFCNBbKDBTgGeexEXIZBO1o+79bVJEtE944buutXoxmXFNiK1Bt1af
         LmQQnBaYV7BdiGltitduwyS4+IDTbyRl5DA/4gHcPZ7SyyeZ7EhCDFI5XAJTz11Ffe1m
         tTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798493; x=1734403293;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plyHizQjFILOlGH5Iba1IrDdDMxWHhXvOcpLcYrtGxg=;
        b=bLmhTHdYzs09ejUVJWppPjQOS+9MRxsNl/CURTgC9ZKPrIQXL4fTtquiMFtHu6RtKv
         wMDp8fvm180LsbrwwyJyuayQEH91N2r4WOpLJKXSFjJit2YCt3w9uVa+bBBlmypKa512
         dEXPbn9g92+k++JDXtq01Rtfm0uab6kGm0/BDyKNhYB6Am2aoLXR0t5pjxX6lR4ufgj2
         6/4KZL3bBqnx3MOhkMfgLH2KoywCTWZMw4+jgYeVNLKpY/71ps34vpF+oS19qfU9U4bK
         A3Iho+z4a4+3RT+TAIPrYIh6FbkFoy6SlFQ9zZY7eEIsaXJc/zq8dVtpaUOdJBsusMXg
         AyRg==
X-Forwarded-Encrypted: i=1; AJvYcCV4T03fO/lKPVYKRkqTHbbrY1ZtKDHxlbVTqoGX7e1kAx33xB6qoqVuOxew+kVkag6vAC6+5zWPKZ0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwexIjCtLLYt/9AmPp0RTq6zkCx+MvNGW6rdO6ZMqlD8KGa0SLY
	PIhtMx6otxzfoL6eYODzenINp9AUH7HFT/XQZeopE1yue6vQUOBXPa+yCvJLdy8JC4svXhdp47w
	LUQDY4/oGQ3OnVBUdSmur0g==
X-Google-Smtp-Source: AGHT+IHwTbEIW/FAeU1sg3ure6LNMbce1+qfNwJ7QwjwcLyYjZmtwQZSOt2eORyWNRKplpOxNs0RywA1YRSDvXTeEQ==
X-Received: from pjbsd7.prod.google.com ([2002:a17:90b:5147:b0:2ea:5c73:542c])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c0f:b0:2ee:ad18:b309 with SMTP id 98e67ed59e1d1-2efcf1700c3mr4344722a91.3.1733798492790;
 Mon, 09 Dec 2024 18:41:32 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:07 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-6-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 05/17] mm: arc: Use generic_mmap_hint()
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

Use generic_mmap_hint() in arch arch_get_unmapped_area().

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/arc/mm/mmap.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/arc/mm/mmap.c b/arch/arc/mm/mmap.c
index 2185afe8d59f..6b1fcea06779 100644
--- a/arch/arc/mm/mmap.c
+++ b/arch/arc/mm/mmap.c
@@ -27,7 +27,6 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 
 	/*
@@ -43,14 +42,9 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (len > TASK_SIZE)
 		return -ENOMEM;
 
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	addr = generic_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.length = len;
 	info.low_limit = mm->mmap_base;
-- 
2.47.0.338.g60cca15819-goog

