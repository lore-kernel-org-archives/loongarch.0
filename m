Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B391621A447
	for <loongarch@lists.linux.dev>; Sat,  4 Apr 2026 12:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775305280; cv=none; b=iu09gF1Ac/uN0v9ToWDE9ewg4ejrl71/d3yv0IAwIeiyueR6sIqa1b5NsKD+dzp6B/dz0ILzRsBO3r6S2yjkMr29xUwa0JSsii87JkKP9FJdlvd6IzNYM3Sz4p0d1kj7VNqiR+dneMKmROGR0xMCWLiw+G3ySXnhYIEI/SHM/as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775305280; c=relaxed/simple;
	bh=reEz+myQ6H+KBDbMQirfBVvSjeJsGQrNL/qo1D1VFUk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DmdXS0cCI+Pc8doYYoA8gfGayIjiMMJJICZc2K12nNd4/0gHDy9GE416d0VS/0rkAplfN5/S58fkKDoVWiaO6QcZ9WugB6E/J6FaXkPvNgdsQoBK275VpuPCyx8Ui8Y0SSOLWg+DcNrXR2dp6mxAGd1rUl0clKgwoYlbJWY76mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=AoczBEg8; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AoczBEg8"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82cf83bf375so1058387b3a.0
        for <loongarch@lists.linux.dev>; Sat, 04 Apr 2026 05:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1775305278; x=1775910078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XmD+wUZmRVhtkrDT5Nt1vWAFME2ljMO3CvkEWHIVAgE=;
        b=AoczBEg8s+9WBw7xUJhJExUT1C9G7qEFVqGVC0yOkq4oUfH9AecUPkQ5q+hVIDffXv
         EBU9vUUyQDUhwbfva4B2ieT6CCOBHjLjImO7pgvm2ydsOkiaXQx3jJ3mJjjsn4tUEV0B
         G/fp349jLsGmMN8YUys/OAiQrWfne7/2AMRNv/+aGhwgbksiC+hnxO/obUn3pP2MVcyK
         f+6NMnyS3xeRtBUpRDUDL0+/OSjlP35OvnlyT8PopQszsk5VWuKKjEzWgkqQYrSdPQ8T
         knKcprYpaVxTUkRucx14KfUrYA0qs1z+uAHTawYHlAIL57/qt2CU9AnUFv1zazXb67lH
         5/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775305278; x=1775910078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmD+wUZmRVhtkrDT5Nt1vWAFME2ljMO3CvkEWHIVAgE=;
        b=moMjfbLbM4MFVNBU9XJcvkBbl33AQ1i2+tRrIHnxc43YwyXHnCWCAGR4CLLvC91Bzr
         JQBpeL+BDA2vXbCRT9HDpfY9l2w7Pay8l7AmKT1HeAzNko1rxTcOeANKnb3V5af0tNll
         rkyc/n20B6L+8Mb4sTKMCUm1aeiB4if7i+pBP+wcTUMopxz/sMPufwqaj0ycYrthdlAg
         jcIXEr+6BN9KwDNUxx0YCMo1LJss8Nr7kskJxYJUN0P54ECbGGL+xf7scYAUa56kAfYQ
         d8zffOcA10TZm+3Tsi90271Xd8sphnByvHPYT8xsEqu7hhzPnKkzBChnS99slLLD/nf3
         tU7g==
X-Forwarded-Encrypted: i=1; AJvYcCXO/xyi9HlwXzGVEIBMemA908w02Dxlsi6oulOSknsJU10dnvG4uVr12pbe8H/ztlWKNSvVvTy4WFY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNAE/s8rASK83gUkk8do8fOhQBEaE4XPEsS48TMLt4SSwkgSL9
	YwtLw1DTYFK5PZ7x9fbFsx30poXhGpPJcjMVWNsxDDud79HYGL9KwhmHyRFA8GHcVkk=
X-Gm-Gg: AeBDieub/4RP+YLhEi7ZRvZAnu5kSfSF/9qsXypMrS7YLGpOatTBmyxn9LTPnGTYJ1a
	TACAM9tLygKt2KXRg777TPsSGrqa4Ep237CFC3Dz0s6ZjMaIcKenpDt07PkUuF+b93HXm7Js5oj
	wkWnEfVLyugfkEVLQYOn6JpKaZ5g++HTQ60SipW2dmm+lpnVB5eqp0QUorPJLEFgUhZlqk8MfNY
	ggvM84gqdUQ+p48CtGdx0RVUyatSqAxc6NpfQpvFb7y/KEuOko7KFTtmKlU63YWsGX/anM0Ndjw
	m5aSbLzIHh3FsreEL37RanzByahLb+bp2mqjc2wB1B+hwhjl2K/EiE7TkgyGzNsZaDw0p/6y/SE
	6YGE4saABQpucq6doz3wFL4c8A0ITEKauUJrd+/n7SNvkGK0YZRK1/6luP0TneNHw8XEr8C4ODN
	IKHp/ai/TzGEMpHbqQHOlt/Tg1uqbFYtIT0G3ED3WAfteIlE7AY6xIYQ==
X-Received: by 2002:a05:6a00:ab87:b0:82c:24a9:d5f1 with SMTP id d2e1a72fcca58-82d0db3f376mr5931662b3a.30.1775305277918;
        Sat, 04 Apr 2026 05:21:17 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cfebe5b23sm8327063b3a.59.2026.04.04.05.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 05:21:17 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>,
	WANG Xuerui <kernel@xen0n.name>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
	Petr Tesarik <ptesarik@suse.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Austin Kim <austin.kim@lge.com>,
	Chengkaitao <chengkaitao@kylinos.cn>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Alex Shi <alexs@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v2 0/5] mm/sparse-vmemmap: provide generic vmemmap_set_pmd() and vmemmap_check_pmd()
Date: Sat,  4 Apr 2026 20:20:53 +0800
Message-Id: <20260404122105.3989557-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The two weak functions vmemmap_set_pmd() and vmemmap_check_pmd() are
currently no-ops on every architecture, forcing each platform that needs
them to duplicate the same handful of lines. Provide a generic implementation:

- vmemmap_set_pmd() simply sets a huge PMD with PAGE_KERNEL protection.

- vmemmap_check_pmd() verifies that the PMD is present and leaf,
  then calls the existing vmemmap_verify() helper.

Architectures that need special handling can continue to override the
weak symbols; everyone else gets the standard version for free.

This series drops the custom implementations in arm64, riscv, loongarch,
and sparc, replacing them with the generic implementation introduced
in the first patch.

v1 -> v2:
- Fixed a tooling issue in v1 where duplicate/conflicting patches
  were incorrectly sent to the mailing list. No code changes compared
  to the intended v1.


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

-- 
2.20.1

