Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3927E156C6F
	for <loongarch@lists.linux.dev>; Wed, 28 Aug 2024 05:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724824179; cv=none; b=WjfXe3d/CCQII5QqZPs2emm3Bmt+/HXgu1aTLBoWNOdq/cZONyTSlTi5jINqq9jQZgdin9qvd5Bk2uwBZOiKkKLv1Kufuh0hvqLEvkFlMadbZFeYjuyuGBKTGHNeDtI6OwJiTHekjfCmYJWfgj0j+KsF/Z3sTM6AdjyidWWHu6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724824179; c=relaxed/simple;
	bh=deEFSUhsRdIX0bdzxWoQYKSiKJBAsZhcTOjbVXT5+ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JDEAEycctjtQlRfa80VZR7aGmQeazUIYDOULHhKjCxiWO1WdKupIFCF8WGbSFiBUCdWgjfQN3Yeo2MrmX3tnG6fs4sjl/R0ryec+OeqyCckRfBFTknzePHexD27ZmbWpNje2NbwPtNyGsb1SGJ5q9I3SAPASljOvt5mf18y7pwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=f+PW08UT; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="f+PW08UT"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20223b5c1c0so57717015ad.2
        for <loongarch@lists.linux.dev>; Tue, 27 Aug 2024 22:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824177; x=1725428977; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGbwsGUaSgh3SYkS7pHaMfmAZns1s9a6v7xPbD2XVAI=;
        b=f+PW08UTRqKPidbGimHy/IYRinbcrpkLXLPX/7rXlieOBRJrjm6Tic3fSg5DoQoDZG
         c24ZU68W1ieqHwtNWNpALw/rWTN+uvD6LxbROjpHHDrITsMCkSiNp1bY2W5iKoif2EI7
         Owb2491UCgMCvwJcvPcKfbU44PMtG8PuOKoMTJEdERFR12XB+Up16kKmu10HOs0QHQLw
         5yJ/d3pBCKT4UFRMCYQlxdy2ZUK/lybGSthban8S+B/HsxRqXxtzsYxEFgtFA0rZ6AVC
         O8cTwPSdFBk4L1b7F7CuSCneS5aHQzQSHzgXBkyXZg96jecK66eFJ0i1h6a8H/rCCPCy
         QkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824177; x=1725428977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGbwsGUaSgh3SYkS7pHaMfmAZns1s9a6v7xPbD2XVAI=;
        b=E9b8oX/QGSPjnSl9C1D/HIV78pw76CYMpzDl9OwwTHvjWe1KvgZGNC58f66oxnGzbr
         MxaKYal08bgRLFPHxJLrR+C/nAMzeCpMWJNLW1r6oB/OxezsXHHvBMr7uv7jMXMsTtuR
         u3tZrx3+q5vI8E5dYL09npl+X/6lquw1RYMnDAi085NSTfXL5e7ScP9Tm7bNTKD1Knup
         b5VdhNh/9t6Bgy45zlmYJOCbH3xWC5NOlGaiuSWeJAvyx5iUDlgRVFdDt8IcxL4QQlVb
         lnVGDmcNQ4RmIUNn4QcguZ5RmYeCBngGzLSo+GC2YdacENqs0dN0Wi9t6z+4q1ZzncCt
         0njg==
X-Forwarded-Encrypted: i=1; AJvYcCXSORVIe4e4nhvh+VwcJE8AWNblzye341mSQ1Dba0xQOfmwhn0CDDHTuiEJRRxDWuQ2b2fWo/Foc6U=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRWYFBWjxD8uSw0a/7fT18P47HMyzuf5bCmemXyT2O0Y7D+iKG
	0FzfuCfBucltqOcOtjRY/zpMDwD+ljwUIHSrbGBelY6rdOmjz5dcEe9KDnx9344=
X-Google-Smtp-Source: AGHT+IETeUynSugovs7+A+AN20czg30Ola2aofBrInbwTCbD60I4EWjQ5oF17Pp044tfVMlW9N70GQ==
X-Received: by 2002:a17:902:f946:b0:1fb:6ea1:6a with SMTP id d9443c01a7336-204f9bf6b4fmr8673095ad.42.1724824176426;
        Tue, 27 Aug 2024 22:49:36 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:35 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:09 -0700
Subject: [PATCH 03/16] mm: Add flag and len param to arch_get_mmap_base()
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-patches-below_hint_mmap-v1-3-46ff2eb9022d@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3681; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=deEFSUhsRdIX0bdzxWoQYKSiKJBAsZhcTOjbVXT5+ls=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XbEKPQVKN+QOfCnd/vQAx7Mm0aicnIfvMk/aT/p2R
 eLJrUMHOkpZGMQ4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZiI/GeGP5ySTrLnNmwQmXLz
 8w+bnE++e2VFjGTvdAadNPbzvHntw1tGhs53DbPX/utm9fCf+JHzi+Xvmwkm0w5eV/OMyrFcaSf
 ykBcA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

The flag and len param is required in arch_get_mmap_base() to implement
MAP_BELOW_HINT.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/arm64/include/asm/processor.h      | 2 +-
 arch/powerpc/include/asm/task_size_64.h | 2 +-
 arch/riscv/include/asm/processor.h      | 2 +-
 fs/hugetlbfs/inode.c                    | 2 +-
 include/linux/sched/mm.h                | 2 +-
 mm/mmap.c                               | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index f77371232d8c..a67ca119bb91 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -95,7 +95,7 @@
 #define arch_get_mmap_end(addr, len, flags) \
 		(((addr) > DEFAULT_MAP_WINDOW) ? TASK_SIZE : DEFAULT_MAP_WINDOW)
 
-#define arch_get_mmap_base(addr, base) ((addr > DEFAULT_MAP_WINDOW) ? \
+#define arch_get_mmap_base(addr, len, base, flags) ((addr > DEFAULT_MAP_WINDOW) ? \
 					base + TASK_SIZE - DEFAULT_MAP_WINDOW :\
 					base)
 #endif /* CONFIG_ARM64_FORCE_52BIT */
diff --git a/arch/powerpc/include/asm/task_size_64.h b/arch/powerpc/include/asm/task_size_64.h
index 5a709951c901..239b363841aa 100644
--- a/arch/powerpc/include/asm/task_size_64.h
+++ b/arch/powerpc/include/asm/task_size_64.h
@@ -72,7 +72,7 @@
 #define STACK_TOP_MAX TASK_SIZE_USER64
 #define STACK_TOP (is_32bit_task() ? STACK_TOP_USER32 : STACK_TOP_USER64)
 
-#define arch_get_mmap_base(addr, base) \
+#define arch_get_mmap_base(addr, len, base, flags) \
 	(((addr) > DEFAULT_MAP_WINDOW) ? (base) + TASK_SIZE - DEFAULT_MAP_WINDOW : (base))
 
 #define arch_get_mmap_end(addr, len, flags) \
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 1015f2a49917..7ff559bf46f2 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -19,7 +19,7 @@
 	STACK_TOP_MAX;						\
 })
 
-#define arch_get_mmap_base(addr, base, flags)			\
+#define arch_get_mmap_base(addr, len, base, flags)		\
 ({								\
 	base;							\
 })
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 9f6cff356796..05a52f85dba9 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -195,7 +195,7 @@ hugetlb_get_unmapped_area_topdown(struct file *file, unsigned long addr,
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
-	info.high_limit = arch_get_mmap_base(addr, current->mm->mmap_base);
+	info.high_limit = arch_get_mmap_base(addr, len, current->mm->mmap_base, flags);
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
 	addr = vm_unmapped_area(&info);
 
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 91546493c43d..265b43855d0b 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -174,7 +174,7 @@ static inline void mm_update_next_owner(struct mm_struct *mm)
 #endif
 
 #ifndef arch_get_mmap_base
-#define arch_get_mmap_base(addr, base) (base)
+#define arch_get_mmap_base(addr, len, base, flags) (base)
 #endif
 
 extern void arch_pick_mmap_layout(struct mm_struct *mm,
diff --git a/mm/mmap.c b/mm/mmap.c
index d0dfc85b209b..27a7f2be3f68 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1861,7 +1861,7 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
-	info.high_limit = arch_get_mmap_base(addr, mm->mmap_base);
+	info.high_limit = arch_get_mmap_base(addr, len, mm->mmap_base, flags);
 	addr = vm_unmapped_area(&info);
 
 	/*

-- 
2.45.0

