Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531AF30F7F7
	for <loongarch@lists.linux.dev>; Mon,  1 Jun 2026 08:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303737; cv=none; b=kUR/E7mUe4iWDUNkgfS+t6QMi7XtR8f+1jaYsZMz3uGeN4MzGKmzry69JjZ5NYvE2dksUiXuDbKUxkRuu2kYirzDDYBnw9hMyNTXKNd/eBAb+EpDs0A5aykctyTN0Ms1gG8sRGp1gw/MwW1cy4/fGnxCmnDvfb8PWgsm6UevBe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303737; c=relaxed/simple;
	bh=NvoQjpNT2HpM83YM+zIhjI24n2QTBJI+D98AX5XJkNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N8+paI6zEiqmKILeCfHNP3aeipyTB6r4wpp/qtq4d1//as3X7pfoJ71qj6yP+GaISkg2FoV07ubF2UIoZ1mL2wklgn9joArHO2LqromYkaZUC1tn6JCY/9sYCFIhwrWqZwqPgdzxAMw8XTrZl16kSgO5mbVBTPv46/fhEcDwYpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=izuywd9g; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="izuywd9g"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-842319576d5so539511b3a.1
        for <loongarch@lists.linux.dev>; Mon, 01 Jun 2026 01:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780303735; x=1780908535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1haIEjJUB66z54EoqIjtLZBJBg9TY7RS+jT0B9dn0/g=;
        b=izuywd9g6xuydOca2ltJPd39fbNQKjsM00fRPLKGEi8g3jbiw0b58b7I5AWwWT4ezF
         kCcP4rBGGcpES56nOxR+gruW+4H27XgIEeG4KqtvtAYJ6o+rn63Gn/nfJcxtKc8208i2
         JdM0AzFJGfdfbivfskRw51uadKfVnlCrf1FSCaGXeNKxkIJpQsNuXobXpFXXZxxsBb+l
         q67jteDkKeOuevZ5dUCqlsQDly2St9eVRwu6n6ol9YO6D3bqZtWe/RJhzGrO5h4edFuK
         T6bLuZNtEdmFixo0mFHWe5MTn2k92vgDznyAoOBdsnp7XsoNpe9+wawyqBvteV5Z7g/D
         kheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303735; x=1780908535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1haIEjJUB66z54EoqIjtLZBJBg9TY7RS+jT0B9dn0/g=;
        b=PHL/MIkVePE1ob86RUHHYVdNSLlA13rf9jVqDeGh8RRmhV14HGejuMMj/nx+yIET9t
         OFR+P907kN+0zLhwRAA8e8PX/beLupqIHZxiB/Qw2xGkyI2hys6DKNBG4Ep33zsJiTad
         bIyIEo0degmGA/ACgO21sufHVUoo25J0FP4G3X16ea6rm3NmLOBV4sjy55RFt5IA4ot0
         Wh5RDGdYNKtWTX7EUs3F2WrdCCXRK4Lp9G0YI59LHU+iO0i92r6wJqgo9/UwHVUbKVB4
         7ZDjrnFeuOMJt9/d4C/jVj8Pg+2S9wmE8T2Vjs2NpcstjOxZLVO1WeFCjToJCFzmWxS6
         lAiA==
X-Forwarded-Encrypted: i=1; AFNElJ+5yBF1qsa+ZoZb1ZeRBkPzqv01MtbFd9m8Z9h2BKHCOHstCuCbvN33RAA9a3CmhlJ6cI2UhUk2yjY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwemjvcBTQMw1SslyCIfc2/1t5Jznunfhpq6QqkFmEcGfczq8Zf
	LREXQB9Ukowb+Di6KkuZKvnyBPAK6qFzt7nAE/C0fi4HvipCPdcHn8/f8rIM6pvLUyg=
X-Gm-Gg: Acq92OGisr6VXXLLowQwnDIf4WuaBdNiVT1eiKasX3amO8yOAGWVp9w3HjysIb9sLG9
	NHC1+YXApsqFdWbOVIhXo78uZZObkzcL6dIn0dZOCi8paKQMdKSl7GW10wbthYjzwIR1ACY43d7
	vO7OgsGp2i246JtkrWZti4RUdCYRU/9uspNkfC2DgZL/2XfDauz1gWCvY1N4emPJenVOnyKqcBC
	tSaPhgLucORxHGwkz46Jqd1fxV0UiFxITWUkTdDuSyRS2DKuqSu+eFkDuwZu8S04kSc3V75rakm
	EJRxXQ12xfUJI4zI301imhaoWHMmPd7Z7Y716tXztnKlcYKD2itdgwvYpDZzV12amXUsS96xGpV
	y2/vIk+rGDhHDsb7fOKZ0p2YiY0qF1DOv/15Gszgw4EqBJIfQkFrKd6toXcOePwI91I2L3Tc7TF
	ugS9c2EPIcOYFijmbATkfqEFokGyeX+ZEGBo3OqbHmsXo41jasb3sEAQ==
X-Received: by 2002:a05:6a00:1822:b0:81e:f1c3:89df with SMTP id d2e1a72fcca58-8422575fc22mr8798151b3a.50.1780303734571;
        Mon, 01 Jun 2026 01:48:54 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6316230b3a.12.2026.06.01.01.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:48:53 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	WANG Xuerui <kernel@xen0n.name>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v3 0/5] mm/sparse-vmemmap: Provide generic vmemmap_set_pmd() and vmemmap_check_pmd()
Date: Mon,  1 Jun 2026 16:48:39 +0800
Message-ID: <20260601084845.3792171-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The weak vmemmap_set_pmd() and vmemmap_check_pmd() hooks are
currently no-ops in the generic code, which leaves architectures that
need PMD-level handling to open-code the same logic locally.

This series provides generic implementations for both helpers in
mm/sparse-vmemmap.c. vmemmap_set_pmd() installs a huge PMD with
PAGE_KERNEL protection, and vmemmap_check_pmd() verifies a present
leaf PMD before reusing the existing vmemmap_verify() helper.

With those generic helpers in place, patches 2-5 remove the now
redundant arch-specific implementations from arm64, riscv, loongarch,
and sparc.

v2 -> v3:
- Replace BUG_ON() with WARN_ON_ONCE() in patch 1
- Add Will Deacon's Acked-by to patch 2

Muchun Song (5):
  mm/sparse-vmemmap: provide generic vmemmap_set_pmd() and
    vmemmap_check_pmd()
  arm64/mm: drop vmemmap_pmd helpers and use generic code
  riscv/mm: drop vmemmap_pmd helpers and use generic code
  loongarch/mm: drop vmemmap_check_pmd helper and use generic code
  sparc/mm: drop vmemmap_check_pmd helper and use generic code

 arch/arm64/mm/mmu.c      | 14 --------------
 arch/loongarch/mm/init.c | 11 -----------
 arch/riscv/mm/init.c     | 13 -------------
 arch/sparc/mm/init_64.c  | 11 -----------
 mm/sparse-vmemmap.c      |  7 ++++++-
 5 files changed, 6 insertions(+), 50 deletions(-)


base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
-- 
2.54.0

