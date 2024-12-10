Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0581228362
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 02:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798518; cv=none; b=lgq3qdTHOMQCLapYQ+g7TOa2OpEBx/7m9jV4EQgQ9H8djty8odGEWu8OMNZMUcNiAs/OPq/JZpe1+Un+QnQG1RlgKleM0UUI0OJkOB3R5HM4uTwwbYU1/uzhM8A4EpdS5r67l18cOId38iEiXEXG7BQhf/Ay7VxbB0QRe9Gti04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798518; c=relaxed/simple;
	bh=LKDMn+D+kcZDM0VSXo2FMakZNGIsoIDLKWW292Vofog=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QXG7K3f6OLHJ28FsNmqZDC2nFtZScAruD6idpG7ag5CyTDpZjYBhcXmV5JMon1VFVR/IlDlBcAZXf4MaKzu+8Ku87MVNHc0rvreXVVvki+lqzrEDh4Ke/W9Qp09a1gjnXsrZD+W9/w/BqQpzm5EsqWtcPuPTC2J0bm5ae6SL81g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tJ8C1URP; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tJ8C1URP"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-725f4b412ecso1169413b3a.0
        for <loongarch@lists.linux.dev>; Mon, 09 Dec 2024 18:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798514; x=1734403314; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJfesLSvigtPKLpc5l88d8L2TdNCPAh9XHgD9Aaia2I=;
        b=tJ8C1URP7T21zGb8b+jfZY516kFP/geP51QwwIkXrXXKKujXKbxWCXNn0hBmvChr92
         vbpFtDZCQJ4s2LLS4NR93w6MuxpK4vJg3LX/n7KG5oF3hkR3TskimKBK3NKIcWOgKnPF
         JibGS/zh7wBQbLvbcA1D0dTcEv+6KiscSdnycOYlwGG/5f9BLmcnM14tIc8XDIBWMlCY
         TpMmVA3O3uYcsYBDCtN/OR+2B6HANjvcLDkElWPx6OGGsb+zWrSKLfqcv8jYW9n43jA4
         9YFeKw7RUsx5lIt6ng/z1RZQ43N93dCs7UXQ0GduP2eW+/eHxk7BLALlTZ/cf4vJMALb
         LHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798514; x=1734403314;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJfesLSvigtPKLpc5l88d8L2TdNCPAh9XHgD9Aaia2I=;
        b=IeuC9CQL045q35qVZkmm9Mf+hPCmHvIXk2gnrx8JW9xpAdI40Jzh8F3y7zAVy1r+lZ
         NgO41cQwD7DmW47+m6UzE4mhmqtSpKqXIiH6J9YKcm8ZWYg/9M7XygSWERbthdoKiFxm
         EqlbMuVXy7KhxhJ0Fcv0Kp8rZ7tKi0kSAtyrOEWwnEibfDAML0rqGt18AbG6PkleziOM
         ORMozxVwJNBeNVoxss998pL/OIdfs+ecm1suFXW8xr6T69mk/BfhM0feN7+Pwn9++mka
         hcE867a1nkK/GBJkmUVpeKPatNgP00k+2ty+mR1uWWCq0XMdhiDzTggtH8waXtwKnEcd
         1WKA==
X-Forwarded-Encrypted: i=1; AJvYcCWpV3N24KXgVkHHBN3J1zKgKLOIi80YAqEYPLybyCrXJdb5cK/jty9FFmdY8jVXbBxTETTDMOC3OJ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIu+bE182j9kqxKIl9LJZdPUDJmTq7XG00S3hanyTCI0E2ta6i
	vkVpvpI1st4rgbgbABgaCXW/iFAuur+t4sKWZQ3PKjvCAsLm3kNoSqTHFeaRdeDYmq/3Vj9swAk
	Nln4mTOR7DuoPno1qpGJS3A==
X-Google-Smtp-Source: AGHT+IH7c/kAWkG1dgCDsYvw4E2EH4mgzAeRRpKy/JiEpi/blwtzY1No/+Nej6iG3SIgIjXbM8HkPN0PZclD3pT9zw==
X-Received: from pfbf13.prod.google.com ([2002:a05:6a00:ad8d:b0:725:a760:4c72])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:14d3:b0:725:f097:ed21 with SMTP id d2e1a72fcca58-7273cb1d8c2mr3121572b3a.15.1733798514446;
 Mon, 09 Dec 2024 18:41:54 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:19 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-18-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 17/17] mm: Respect mmap hint before THP alignment
 if allocation is possible
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

Commit 249608ee4713 ("mm: respect mmap hint address when aligning for THP")
fallsback to PAGE_SIZE alignment instead of THP alignment
for anonymous mapping as long as a hint address is provided by the user
-- even if we weren't able to allocate the unmapped area at the hint
address in the end.

This was done to address the immediate regression in anonymous mappings
where the hint address were being ignored in some cases; due to commit
efa7df3e3bb5 ("mm: align larger anonymous mappings on THP boundaries").

It was later pointed out that this issue also existed for file-backed
mappings from file systems that use thp_get_unmapped_area() for their
.get_unmapped_area() file operation.

The same fix was not applied for file-backed mappings since it would
mean any mmap requests that provide a hint address would be only
PAGE_SIZE-aligned regardless of whether allocation was successful at
the hint address or not.

Instead, use arch_mmap_hint() to first attempt allocation at the hint
address and fallback to THP alignment if that fails.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 mm/huge_memory.c | 15 ++++++++-------
 mm/mmap.c        |  1 -
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 137abeda8602..f070c89dafc9 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1097,6 +1097,14 @@ static unsigned long __thp_get_unmapped_area(struct file *filp,
 	loff_t off_align = round_up(off, size);
 	unsigned long len_pad, ret, off_sub;
 
+	/*
+	 * If allocation at the address hint succeeds; respect the hint and
+	 * don't try to align to THP boundary.
+	 */
+	addr = arch_mmap_hint(filp, addr, len, off, flags);
+	if (addr)
+		return addr;
+
 	if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
 		return 0;
 
@@ -1117,13 +1125,6 @@ static unsigned long __thp_get_unmapped_area(struct file *filp,
 	if (IS_ERR_VALUE(ret))
 		return 0;
 
-	/*
-	 * Do not try to align to THP boundary if allocation at the address
-	 * hint succeeds.
-	 */
-	if (ret == addr)
-		return addr;
-
 	off_sub = (off - ret) & (size - 1);
 
 	if (test_bit(MMF_TOPDOWN, &current->mm->flags) && !off_sub)
diff --git a/mm/mmap.c b/mm/mmap.c
index 59bf7d127aa1..6bfeec80152a 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -807,7 +807,6 @@ __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
 	if (get_area) {
 		addr = get_area(file, addr, len, pgoff, flags);
 	} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !file
-		   && !addr /* no hint */
 		   && IS_ALIGNED(len, PMD_SIZE)) {
 		/* Ensures that larger anonymous mappings are THP aligned. */
 		addr = thp_get_unmapped_area_vmflags(file, addr, len,
-- 
2.47.0.338.g60cca15819-goog

