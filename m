Received: from mail-oo1-f74.google.com (mail-oo1-f74.google.com [209.85.161.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C541F4706
	for <loongarch@lists.linux.dev>; Wed, 11 Dec 2024 23:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733959708; cv=none; b=YRjgoY+HXRggD2LrJ3hyvJt74yclWGLjlIXi3/bJp6deVO2sEa7Aj8NNGBmuduf6+elJFfWGttbnQp92DYLQzol1nmL3F+o92fM7aUXc3+gyB4IuuDMDUWbp9BqSx0xt/xwyTtM7vOR9BwlXNQb/pHhW0mCd4PQLpCxR7V8fY/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733959708; c=relaxed/simple;
	bh=IV94/17VU942v+SUppuhN1JByKB2U0oRaUQ8yQsFAy0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bJVKoPzDd+Ox4ipxSLpYhOEkG6fWQvl3oy2kUCEm6/1cM6I/CbcWSZ69WDVY4SxOhtoLccD67JsgKcJnE5TthOLwlPuzoaHc7vzh040P29jwtF3IRkFpZOnMaP/8IL8jFN8fLKfGHEHlvXly+sWXYudZ4P7Nudu15Yk96Wzq0iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=km4BoBRb; arc=none smtp.client-ip=209.85.161.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="km4BoBRb"
Received: by mail-oo1-f74.google.com with SMTP id 006d021491bc7-5f2cb9fe719so15132eaf.1
        for <loongarch@lists.linux.dev>; Wed, 11 Dec 2024 15:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959704; x=1734564504; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z6Hm5oOLdBb7ho6/nkMyyfkvkknoYZ/+aPdlC1ktc9c=;
        b=km4BoBRbdlwMkiU8iatRlNySX90Q++xjmJJFkHlHup1+AlI26vvB8e/9VRJEU2oipP
         IMpD88H8m/Sk5VosWSQhiFyJUqZ+zogICSNoPjk0CnWtyxJL2F5fCSGRrsSmxjq8QyX1
         /8Co8+yE4QNjDyCnsVDjYWYWKnncPcFb1Y1qkSdOf8rZRx/pqIYS16RL8ttI+OJ1wxr5
         AMOGE4RR9wzIDZYfBxhSOMyFSEl38iGCEHVg9h9+HyJAtC4Iw88slp5BqmDvKJzKqQwh
         12cWUKPgjljOU5DMYEeVY1Cif9NDyPOcVIrPd/GmZyjxYjgXS4DenIPTX52VqwQ4K5/e
         UBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959704; x=1734564504;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z6Hm5oOLdBb7ho6/nkMyyfkvkknoYZ/+aPdlC1ktc9c=;
        b=ZdWrn1FiL37/B/OHNNNlknDBIGVoJCUHnWX6FAEpcvhydTuY0eV76pvcw4jWo+N/jd
         Qlr9Rg1+bxf5K7qcHI7avGyTSFF3tRXa1jaQKhaddkwiIbAkNsD0Wdvke1Iz8SvTDS9U
         F9c/Jzjyet654uaxf67cDGZZEYBqO1s7JA4nfF5PPZyShNi40qxnYoI6cJKgSqEL1LHP
         qSKEmVTzoW9hxjqRzjNynBOu1W5SBrRDKdo7Z3mzSzj9L8yJgPn5mektp/MSBQ5AzE94
         89eV+PAovudGusfSrX1dxQvB6ryWyIT6ZR4LbPu5CBD2kGZP8A0xtmN+PwUqsPH66feY
         /GkA==
X-Forwarded-Encrypted: i=1; AJvYcCXQi02tY/BT36Pxkjy9gIkPVdVhRVgkQ1srYwdg97JkyXNrGq3OiJHqXQNTOVrhK8TPSQgM5Ou7RqA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1027vo3Mc0OfBz4kw8DGmLLgHKVOfpqrBLAXm+nzUtL5C1Ydo
	hNZqAu/IrNFvKTAWgc/7l+f740fUyTi7O1d4abEJVJ+WYnwCFDiFfFa8qCTyznKhd8MMJUvTpse
	LczogTd4+mGORCo2lxuqDPQ==
X-Google-Smtp-Source: AGHT+IGQDLulfLF8RwhcJUV0HutTvJeMfbYLu8JUEjKppHvTG+7VWlPJjZzjhgEci5/4OsV71lgRhbIjtjk4C1ysLQ==
X-Received: from oabrl17.prod.google.com ([2002:a05:6871:6511:b0:296:1589:4069])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:224d:b0:29e:f61:3b62 with SMTP id 586e51a60fabf-2a38236803dmr971354fac.7.1733959704488;
 Wed, 11 Dec 2024 15:28:24 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:52 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-15-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 14/16] mm: xtensa: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
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

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/xtensa/kernel/syscall.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/arch/xtensa/kernel/syscall.c b/arch/xtensa/kernel/syscall.c
index dc54f854c2f5..6bbe10c2a633 100644
--- a/arch/xtensa/kernel/syscall.c
+++ b/arch/xtensa/kernel/syscall.c
@@ -54,12 +54,12 @@ asmlinkage long xtensa_fadvise64_64(int fd, int advice,
 }
 
 #ifdef CONFIG_MMU
-unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
-		unsigned long len, unsigned long pgoff, unsigned long flags,
-		vm_flags_t vm_flags)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct vm_area_struct *vmm;
-	struct vma_iterator vmi;
+	if (len > TASK_SIZE)
+		return -ENOMEM;
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
@@ -71,16 +71,27 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		return addr;
 	}
 
-	if (len > TASK_SIZE)
-		return -ENOMEM;
-	if (!addr)
-		addr = TASK_UNMAPPED_BASE;
-
 	if (flags & MAP_SHARED)
 		addr = COLOUR_ALIGN(addr, pgoff);
 	else
 		addr = PAGE_ALIGN(addr);
 
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
+		unsigned long len, unsigned long pgoff, unsigned long flags,
+		vm_flags_t vm_flags)
+{
+	struct vm_area_struct *vmm;
+	struct vma_iterator vmi;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	addr = TASK_UNMAPPED_BASE;
+
 	vma_iter_init(&vmi, current->mm, addr);
 	for_each_vma(vmi, vmm) {
 		/* At this point:  (addr < vmm->vm_end). */
-- 
2.47.0.338.g60cca15819-goog

