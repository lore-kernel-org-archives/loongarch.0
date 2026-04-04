Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C17823C512
	for <loongarch@lists.linux.dev>; Sat,  4 Apr 2026 07:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775287057; cv=none; b=k233bzfn9nmfoU/lI/8CWXovKaZYVb7KP4Xydm2QO98BNTXkHdtTV8lMkEzRVHxXIiKGOUemzonAUjnS7Bk+QXLwx97vSyiy+ZlnKjkhwCXA1LebvVbhyJsTe0zspeoLNQTR9jf78ob1wMW73nKoQ+th4mudgPJ8X8ANW/Xot0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775287057; c=relaxed/simple;
	bh=gRo1lRle8QYwvb7+ytargpCfHq76BR2Kzkumqys+pZE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tNXsMTl5dSNfm/FSFOv3bENo2liLvgp1Aq2aH+wyG6l0JLUNruuNfKGrfqSvexKSE2gW110jV2F2nxNVAVdWJH3fFClZdFvYvvd8KOUjhwZn6Dp4dyvLQO/1C3rASqto7aaeue/WJ8zpHMIAQuOwcnmxka9uUVyYoLdNJJfLlxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Lsn5HqLe; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Lsn5HqLe"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c6e2355739dso1043316a12.2
        for <loongarch@lists.linux.dev>; Sat, 04 Apr 2026 00:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1775287054; x=1775891854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxHSxQTiSROLSCEz/HR/Hur/9my7UlNa+rqcrvgfgaw=;
        b=Lsn5HqLeA4NUP0U8D73g95nmF75HghsF8O2YwLMq2PJad1KN9mSkZ4VEymxRwIXSe7
         vE7QX+QEmFxWgwK0Rs+xLkhRZq/QT/5XRmYg7wzJXkQDpOqFqjmBSqUAoKuIduOOz/mg
         nc4SBONPgsVEBjYZfXR7Eexlvbs6iKylGk5Cw0SNax4egtl7RgB+d1EJ8B/NECV8yUGC
         FeZ9nGOL5grstuu2fiaq7afQG61OpoACD6LuDXhvaeIC1HRfU6x43I0yrWJ8fWAjYYNs
         4QiLXlNZs9uYFm5pRJiLGnfKCEaE/ZqLAl5AqCXLGIL7DXNbr9EkFOcpYKqdZdKdcpZk
         hmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775287054; x=1775891854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxHSxQTiSROLSCEz/HR/Hur/9my7UlNa+rqcrvgfgaw=;
        b=PRAbH15BXHnyr/B4FcWnC28R7nwLbmenp+m0yScgUAQP8peLD28QD3HMLvMVqFYo+s
         KyJDN0ItspGsprOjVV7B3mQlEhtvF+xlWsJS2O/aQORgTWDd4PcgREjyGhF929dgc8Mc
         Cnl8jcpoL/hT6echbNoxUrsJIcbpWstmEqJbXo8pl12KQgtRCt2MWNMrQqwGicHBYCcD
         B5nl2ioR6IBjqkpJpxCnbXt2jsNvhtYE3vv6PEkIzCqdJ/7PFzOpEYuIn7nh9scCSE8f
         c0ZjlnCXgD6HzV7FoDFwkHSKTO2xcUrPkaYQp03bGfRXZL7xDvFj9dXjSU1+zaLTF7bN
         ConA==
X-Forwarded-Encrypted: i=1; AJvYcCWFdrkYG20a9dYJUbMqpr1rxvcJSVLtY+9biOCkYXq7tPmK1zJAc8lF2mBCuHvfYR1KxN0T4D5sTIo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRrDGBgFn9z7EZCFdLT6QezH511FtOgYOCFxTm6ocq9pzTi6ee
	aMQ+h8s/3bfqo0OV9Xt93H52eJASe12+V+FnO7Ks6O8vNjnBZ/ykBn7agdw1DmADCjQ=
X-Gm-Gg: AeBDievE5fqxev9JK/uc85BiryrhyUz8WdZdEDpt0UcP/zAsy6j4Fmwei5YjAT9aOIV
	dRDyLDXAzhxkAOcWegk/yO8DNDINV8uCdzY9imuzc8lke/+hu3tC8OYb0uAu2Vc0YrwzsTLoZRc
	JZKMFezoVwLZyhEs1E+rCYI1Tp9F7HOf0xVwuhFYPZgGdGLoJ5VUO86WoA9E0Ob/ruAhJof1QiC
	+V/93IiEwbBDz8b0akc7jL38xEQbs0Ft9Lo0rv/XNoRh2lfzdElo3/I2aI54HwCQUseKYJovLgH
	MN8IqajxEXIODliWPH4OG/S7cRmAEkMFubQS6jUg1NqSnviv2zXgoqw3dN2s6n7QDiMhEQdXxnE
	k606FtvvHqmQMVG2rACa6HgOAsFl/sKkx+m5NOZvJ6H5xZND2mt8T19S6YDpa3+oBn3mBDSCluH
	92AzDpGYLX6XzHShGh8lKXeVySr2YDQXz5yEQiSI4Wo24P82rgV3r+Wg==
X-Received: by 2002:a17:903:2808:b0:2b2:539b:d29a with SMTP id d9443c01a7336-2b28178ad30mr37104585ad.23.1775287054199;
        Sat, 04 Apr 2026 00:17:34 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274979525sm94675115ad.45.2026.04.04.00.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 00:17:33 -0700 (PDT)
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
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
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
	Yuquan Wang <wangyuquan1236@phytium.com.cn>,
	Petr Tesarik <ptesarik@suse.com>,
	Austin Kim <austin.kim@lge.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Alex Shi <alexs@kernel.org>,
	Chengkaitao <chengkaitao@kylinos.cn>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 0/5] mm/sparse-vmemmap: provide generic vmemmap_set_pmd() and vmemmap_check_pmd()
Date: Sat,  4 Apr 2026 15:17:04 +0800
Message-Id: <20260404071720.3577290-1-songmuchun@bytedance.com>
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

