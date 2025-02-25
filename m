Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D255E2837B
	for <loongarch@lists.linux.dev>; Tue, 25 Feb 2025 03:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740455181; cv=none; b=WPUE13BIokogOddRk2+E51dlJSBHQVr2Q0vAE0JWppjG0BhZNuoManaNvo1oQ+9qO1KppMaVCmbntKvcep0K+Hu1yeI2TJZW6e7pjYYZpPx1NeSkIrOZTfnRmuypqyopFfs99ocVoz901W07oJ7Te8AVtRmUnCuEuzu2dBDj1Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740455181; c=relaxed/simple;
	bh=Xarqt6bJuNP7uDohIoZXfOCmOa/TOsimsTJDUmQhEAk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QOw0oOM7gaL6QQNGs4ieOwX4NgzjrQB3rMP7VLvyYQM65HoL1FeWf+5G/7gPQCknfGT4bJK0n2MWWqYbbB7mH30R/sQa0RFxkUFszVh25ckQBnKoibdD9C22kwOwkClAqfBruaexvTJ5ZNrWsHxgvOaFmOnUEcHTiv1TRcbPgcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Nt4NU0RD; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Nt4NU0RD"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220c2a87378so86219345ad.1
        for <loongarch@lists.linux.dev>; Mon, 24 Feb 2025 19:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455179; x=1741059979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=28rhiB/GEX2aHidRfZsL1f1ynE4sxX3e1xrVD+t+cg0=;
        b=Nt4NU0RD/ab46izcx7fe0e8idFkx4YhgqUTcfHMOQdnX2MmoBKCMkC2DByUsAST1L6
         6CSjSIxdUsTx/+hRO3jtSePTouCtg0gClp1I45l0THzAsKtnhrR2yLZOOXfofEfTYPWo
         jYcTOpOZtDrDxKZ18NTTK6Vl58x25Zc21yqGNxvz8EjmWLgln41SBB1V+BfUscZgq7Z/
         ZB0sTBOHXn76ET7QTJPlrahucj2OVzDzoWXOMuYb7Qd0l6yAk4dBRMZLGbuHe+Li1yTR
         r2p0yhW1JsaizWHEtPwIlySXyb+jmheLrGSfpcAMb9lm4eN/lr0d5/DJ05f5Duh9UbVA
         5zIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455179; x=1741059979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28rhiB/GEX2aHidRfZsL1f1ynE4sxX3e1xrVD+t+cg0=;
        b=bjLQ1IPJSuOdWryW8YGGKvQGAK3OPmfW3qfxYYOBxL7UjsHbIylHq/dZhDfcXcH6fo
         njaFquS2SK3BXlIzEfC+Jk62FDo+hisblDqC1L+F7tiUtrt+cWhAlkPXzrgFnq3V84Wn
         16mekTPgcKXaIMTWwOfINaYgyB+BwcyrJd84Nh8J7vqAJhsQPFXBNj6spU1D8Ni7XdY9
         nSlyN1zRTQ1RZhGLCcGOA5ENdOQ6goRdJuE1A7B3FoNaoFPSaL1M6wyrLp7SvhnK0HkL
         HOP9SCDn8du4UkjxlOMPIIrsVT/aywLbxaNgpIRfUW341rnLhdh/fAe3gNTVbnQ4kgrh
         EAaA==
X-Forwarded-Encrypted: i=1; AJvYcCWKtDaokgUIj9n07CSuCATrlmij7N36Aa6y25Es8USRt7EjUVIPXthnWmk1bRhNCI3Tj0RyH4tnK/A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs0g9gh0h3XIYr7uU8kETSc8samZQCtBEDR95uJKsjn7IAqOUs
	72fwzCW2fHzLZXFJf/QFc/ZdQ8N1STeitXOC+j9JR/qH3dC03PDBPzcR2VyV9sg=
X-Gm-Gg: ASbGncs8X71WT+HPVvWOjKzWTkZtL/lHoDIjBQ0tDoXGK5C+uZef/VWkfgFE8Qf9zWI
	trsQeZ1I15m94Lkrt8MoqTxasZyZIGb47CDC/LtD8INNlpvN3OQXSAm+4mE93teYcun7itgm0IY
	zXzg4YfILdepUDYV2PQmkB1Z+dgbYwkSmdH9Bq5Xb9to5tSJu/hg8ehiUnaRgOmSUk3rCLGVLLo
	xokgHP01ydBuHLHFsrZ7eQCPAl7f7NYEqvSYqo43bJwARnsLgUzmGiLeokimE6Pcel5Aj7Oj2ii
	VJfuyK/LSA7iXpm4Ii48+jxf3FAS+93yPVvyc1XsZ/UMsnXY5Xwup6E3Vb5xXf64fg==
X-Google-Smtp-Source: AGHT+IGCQV+aaAngRw7XrsDoRTV1d2A5MeKYpMO11TDMI4tHHu1SHT60kqvv/nxGByOS3x+4jf7H6Q==
X-Received: by 2002:a17:902:e744:b0:21f:89e5:2715 with SMTP id d9443c01a7336-221a0edd8cbmr248196785ad.19.1740455178926;
        Mon, 24 Feb 2025 19:46:18 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:46:18 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	kevin.brodsky@arm.com,
	riel@surriel.com,
	vishal.moola@gmail.com,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	willy@infradead.org,
	yuzhao@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 0/6] remove tlb_remove_page_ptdesc()
Date: Tue, 25 Feb 2025 11:45:50 +0800
Message-Id: <cover.1740454179.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
 - add [PATCH v2 2/6] (Peter Zijlstra)
 - remove [PATCH 4/5] and add [PATCH v2 5/6]
 - rebase onto the next-20250224

Hi all,

As suggested by Peter Zijlstra below [1], this series aims to remove
tlb_remove_page_ptdesc().

: Fundamentally tlb_remove_page() is about removing *pages* as from a PTE,
: there should not be a page-table anywhere near here *ever*.
:
: Yes, some architectures use tlb_remove_page() for page-tables too, but
: that is more or less an implementation detail that can be fixed.

After this series, all architectures use tlb_remove_table() or tlb_remove_ptdesc()
to remove the page table pages. In the future, once all architectures using
tlb_remove_table() have also converted to using struct ptdesc (eg. powerpc), it
may be possible to use only tlb_remove_ptdesc().

This series is based on next-20250224.

Comments and suggestions are welcome!

Thanks,
Qi

[1]. https://lore.kernel.org/linux-mm/20250103111457.GC22934@noisy.programming.kicks-ass.net/

Qi Zheng (6):
  mm: pgtable: make generic tlb_remove_table() use struct ptdesc
  mm: pgtable: change pt parameter of tlb_remove_ptdesc() to struct
    ptdesc *
  mm: pgtable: convert some architectures to use tlb_remove_ptdesc()
  riscv: pgtable: unconditionally use tlb_remove_ptdesc()
  x86: pgtable: convert to use tlb_remove_ptdesc()
  mm: pgtable: remove tlb_remove_page_ptdesc()

 arch/csky/include/asm/pgalloc.h      |  3 +--
 arch/hexagon/include/asm/pgalloc.h   |  3 +--
 arch/loongarch/include/asm/pgalloc.h |  3 +--
 arch/m68k/include/asm/sun3_pgalloc.h |  3 +--
 arch/mips/include/asm/pgalloc.h      |  3 +--
 arch/nios2/include/asm/pgalloc.h     |  9 ++++-----
 arch/openrisc/include/asm/pgalloc.h  |  3 +--
 arch/riscv/include/asm/pgalloc.h     | 26 ++++----------------------
 arch/sh/include/asm/pgalloc.h        |  3 +--
 arch/um/include/asm/pgalloc.h        |  9 +++------
 arch/x86/mm/pgtable.c                |  8 ++++----
 include/asm-generic/tlb.h            | 14 ++++----------
 12 files changed, 26 insertions(+), 61 deletions(-)

-- 
2.20.1

