Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD2715B0F8
	for <loongarch@lists.linux.dev>; Wed, 28 Aug 2024 05:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724824206; cv=none; b=jkFxGyz5ju+X/biNUxOsCPpXJ9HpivJNEamPY1Spea3NQx0uu4Sh9Bde+QHbbn0lblLnTtJdwAqSJPuk/r0sRl0CffFVYjMNjbvKiJa5o1sQcCcm6l2yn3i0VneBv6HWqP/p6FQV+Ah83RvUlKwzEBZ1Ug5HstJPktDNtja4UvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724824206; c=relaxed/simple;
	bh=hr+5sO+DwZ7b30hixHrcXcBJzkXJVKP+oyQ8pDF00F0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ry6iF35+IoLvPOU/T0uo0hQMbp3Gu0PtMDO1dtie9CxMkk7d3ab7yDMxlQsVK+wzPtSMk/qFoZRhQ68UmWxBw/FWqBB/8VajTqbyCI7tvikd4lE7q1OJakzjhenF3kHrPw25OOjlAL8w+WNLg15pjTUubWzSTDnUg7z/msN2f7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=IaT32BmI; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="IaT32BmI"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7141285db14so5444699b3a.1
        for <loongarch@lists.linux.dev>; Tue, 27 Aug 2024 22:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824204; x=1725429004; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPn63wqFJg/NhDtyE6TA0coeolvG0b692sVkrxs6h6w=;
        b=IaT32BmIPZXjTIgfdVh0K+HBsiPRrz2W6DEj3u1OGtYU4l+2pHMKnwjiw1n3GeGqHO
         k3AmusuR7ZPKp9Aaeup2PcDAehxdphnaicrDVjxLba9znmBYiTGjmpdN22OvDO8kY3mB
         c32VxOCKZipaf/pecYD7dvAICLg5s4IloqGwaZ3pstKiDnvZL2mitmFmuXSriaPjluKG
         VsMi4ng3DDcR3QoutQskQSPW/gOehVHwunxlsJjIJxPcC/1A1ormW2ML1ihIc/0eVfQy
         5gwIrQh8oawvQmrsSfTK4T5cZwj2YEBh/Nep6BdAyO7DIZEB82BEwnUXXnxZ9X09uTOb
         yqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824204; x=1725429004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPn63wqFJg/NhDtyE6TA0coeolvG0b692sVkrxs6h6w=;
        b=VCZNq+W5gvYd03JTR7jBQdNGmjOCcYaCTCRMxgURYavPXGCmnl7Yiu52F16ldsB71h
         3c+xVmXt4E8ySUNuexOXUGfWOrxtRlmRTrQ9BFhQqP9mpGUhfeWnRZhTLFJx9m50BSdQ
         xdbVaXrfkiCWBfRRc+jaGjaxjDUnU82DP1iIVkAcSyNXYr3YqM65JXcv/Lb5t/Uckb2R
         NYkr8bGbLk+VOPRN7Eq0BsPDno/l+1BQ64++sMBeMKFuD2LRQo1Giy0dhpzSx60B5ow2
         d/BgxKPU+WoyDzLQVFfHfh27EUm8+zZ1Ub+cxEP2EHxpCld4BGiWG8yU8WBzz3AVwO6c
         1EeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUySkWMIlRJE/q9VEyx+qsQDUiQFASCtCd2ngU/oMBjvJ3nysWoL3/FzNu8WIGHBVvaNqT+b1S8FIA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOErX538LlRuaUGdNKjikmdNWL6AFpdlsmVn/2Cq1AlJD2ZMAp
	HZSoFjx+u4nmMzxZ+Pu3e0+6og11rpXFmU23GqvbfVOrW4atn9QyxAyOe71JGnk=
X-Google-Smtp-Source: AGHT+IExz2l4cJy30WX6CK7UJnnTV99XpNodRNjqDrqaX9iShx7VT4aEy+MVWDHksfv413xg6BHqWQ==
X-Received: by 2002:a05:6a20:c6c1:b0:1c3:b61c:57cb with SMTP id adf61e73a8af0-1cc8b63e7admr19641639637.53.1724824203730;
        Tue, 27 Aug 2024 22:50:03 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:50:02 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:17 -0700
Subject: [PATCH 11/16] mips: mm: Support MAP_BELOW_HINT
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-patches-below_hint_mmap-v1-11-46ff2eb9022d@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=hr+5sO+DwZ7b30hixHrcXcBJzkXJVKP+oyQ8pDF00F0=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XQkfk1qWxrKnZbieZ1K/6LSwKGjL0hcztOaE2KQe3
 3vFh3FJRykLgxgHg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABMReMjwm1XqYMYTd7kZ029e
 Ywn89Unq1bGI6TwyXnVzFq65HWqvWsnIcHriXK9fRsZbv646duvxv8pFDmYGX/naxDT1E9+JfDu
 ykAsA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add support for MAP_BELOW_HINT to mmap by restricting high_limit to addr
when the flag is enabled.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/mips/mm/mmap.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
index 7e11d7b58761..1595fda284cd 100644
--- a/arch/mips/mm/mmap.c
+++ b/arch/mips/mm/mmap.c
@@ -79,6 +79,13 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 		info.low_limit = PAGE_SIZE;
 		info.high_limit = mm->mmap_base;
+		if (flags & MAP_BELOW_HINT)
+			/*
+			 * Subtract (STACK_TOP - mm->mmap_base) to get random
+			 * offset defined in mmap_base() in mm/util.c
+			 */
+			info.high_limit = MIN(info.high_limit,
+					      (addr + len) - (STACK_TOP - mm->mmap_base));
 		addr = vm_unmapped_area(&info);
 
 		if (!(addr & ~PAGE_MASK))
@@ -94,6 +101,8 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 
 	info.low_limit = mm->mmap_base;
 	info.high_limit = TASK_SIZE;
+	if (flags & MAP_BELOW_HINT)
+		info.high_limit = MIN(info.high_limit, addr + len);
 	return vm_unmapped_area(&info);
 }
 

-- 
2.45.0

