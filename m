Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD7A15C15B
	for <loongarch@lists.linux.dev>; Wed, 28 Aug 2024 05:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724824217; cv=none; b=j+SbRnqb/60oTtG7925wHP7BeQy0iq/buD+aQttHfqnmU+FFjdubsavSimDZAcSwt540g91ok+xSw44XFJS7fNfOGvhkg1pb0Hx/sSfO3DOY3r+iOe/55XXj76bAQfc36VpBo52MfKByulrsafpLctnFuzqvGRCrBVKMChLCvhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724824217; c=relaxed/simple;
	bh=RSW/tCXIl3OqIq1wugK/BMhqzVxC+hGCJaNgaxgxyH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H4JJhN3HIBFJF0SlnOAJh6dagbicEeyZ3g+jWTi9f/kEV/tk7SpD1QY9MFuFQMEr6zTJMM79U6WAik/ahiNR7/ZwiyZL0jjipKOVTV/b81Ei63hUqqFnlPw7gA8x8rpNGc4jR/GZ/vZybB0XEH3bBvW5bITUwN+rusQCmqiz7xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Z3yf0eoI; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Z3yf0eoI"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20219a0fe4dso62945405ad.2
        for <loongarch@lists.linux.dev>; Tue, 27 Aug 2024 22:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824214; x=1725429014; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74ih38qyFApS59Oo5hAHcKEdd4ieUrnz9WHar/pXDMA=;
        b=Z3yf0eoImZ9IaHd2u7rJPijhSBqCFHMoG2EEeVlIEOcr8q/W4Wc0vRz4EwDFwgaWBx
         4DP7sPNZKfW6ZdlIe21Rakr72SOFlIqxnA1aIrQo23ZkimjrO/WCLFZ04B5kHmRdC4dA
         gCnMpsvEbdYiVM3k9oO7iDMVz2vyxuVYVKzC/seQC4b1FHUaxN04wqScJwRwSYhA+EE0
         Ch09zHmAPn3oks2JEOx4alWqBq9oavV37hFpoVfVyidhQ1If/8ymyjDWo1YNnAiVIQWE
         Lrg/UFumwQ1B1ueapxTE6cWWKW2WHQ3Tji72iqVPbIBZ7NL7yTt173rY2MPj14b/Wv5b
         gdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824214; x=1725429014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74ih38qyFApS59Oo5hAHcKEdd4ieUrnz9WHar/pXDMA=;
        b=bf2pag5+wPZOG+B8ZZs3Aa9Z3T+/5rYLRHVV2M/HWkGXOtjfn6icQA1wof8kZ4SyMY
         KL10YdQpW3zZgw+9mOmkbuTjwukAEQw8IdYaw9+ZmccLQ0f1nR/CdkpKsWHuXfEQ64wH
         dU/xfLm+yduqx48gDsM+FPU4grL2BlQOi1UGclIrN6T8gRLmUGUamrTh1Rz4UzXL/qyx
         P3yIpqi53BzgBxogNH1Cx624whCJHVl9ENyaE8fCTLEAPT8Re2g9xJwRPpmk8teBy6/f
         ZAOET6Lp14q3Mw1H6VTui7PUdNZ0cf4PC1ddDZWqskifmsWZKO+eZnBkKlewMDhBRvEM
         Vn6w==
X-Forwarded-Encrypted: i=1; AJvYcCWpCWV5MOFY5BMFPw0YD9CgrGw8gtdCFUSiZO3xdk0jPYwMsv84bRSr145figQpIeDC+WQrhQOYq5M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoXNdCs4S7DhmlN7bIKiICD/wC2Svf2BW/DPDWb29e/D3+mvOq
	upFXGQHTCetzTC+L4ZzSooqK7xIU1o5aSEptSltyVx/KYtiIE0ruzYqvpvIOUh4=
X-Google-Smtp-Source: AGHT+IHaxH8ov/UqUPxBA8x0bmmHbs3R6mKOF+WDurSlvopgHqFjxqmjotSQ0dAp9h1od2RsPmTDOA==
X-Received: by 2002:a17:902:e852:b0:200:ac2c:6785 with SMTP id d9443c01a7336-2039e44cbcdmr164066655ad.3.1724824213959;
        Tue, 27 Aug 2024 22:50:13 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:50:13 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:20 -0700
Subject: [PATCH 14/16] sh: mm: Support MAP_BELOW_HINT
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-patches-below_hint_mmap-v1-14-46ff2eb9022d@rivosinc.com>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
In-Reply-To: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Shuah Khan <shuah@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1729; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=RSW/tCXIl3OqIq1wugK/BMhqzVxC+hGCJaNgaxgxyH4=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XYlVP75VR006aZFn+70kVT1K4PGO6plPeD6ttY1Ib
 fZuvX6uo5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgInsXsrw34+bSWfTiYerug+W
 bJm2uPHhi6ei0zVPGCvcutghUP70ggcjQ8uKDy93HJCN5MpSDQ5Y9+eF9/TONIm5nufepW33SA2
 /wgMA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add support for MAP_BELOW_HINT to mmap by restricting high_limit to addr
when the flag is enabled.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/sh/mm/mmap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/sh/mm/mmap.c b/arch/sh/mm/mmap.c
index bee329d4149a..867f6598b7d0 100644
--- a/arch/sh/mm/mmap.c
+++ b/arch/sh/mm/mmap.c
@@ -91,6 +91,8 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = TASK_UNMAPPED_BASE;
 	info.high_limit = TASK_SIZE;
+	if (flags & MAP_BELOW_HINT)
+		info.high_limit = MIN(info.high_limit, addr + len);
 	info.align_mask = do_colour_align ? (PAGE_MASK & shm_align_mask) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	return vm_unmapped_area(&info);
@@ -141,6 +143,12 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = mm->mmap_base;
+	if (flags & MAP_BELOW_HINT)
+		/*
+		 * Subtract (STACK_TOP - mm->mmap_base) to get random
+		 * offset defined in mmap_base() in mm/util.c
+		 */
+		info.high_limit = MIN(info.high_limit, (addr + len) - (STACK_TOP - mm->mmap_base));
 	info.align_mask = do_colour_align ? (PAGE_MASK & shm_align_mask) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	addr = vm_unmapped_area(&info);
@@ -156,6 +164,8 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 		info.flags = 0;
 		info.low_limit = TASK_UNMAPPED_BASE;
 		info.high_limit = TASK_SIZE;
+		if (flags & MAP_BELOW_HINT)
+			info.high_limit = MIN(info.high_limit, addr + len);
 		addr = vm_unmapped_area(&info);
 	}
 

-- 
2.45.0

