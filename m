Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DBE45D911
	for <loongarch@lists.linux.dev>; Sat, 19 Sep 2026 10:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789812839; cv=none; b=BPfgl7n95qT3kwvtNmlkIZyoR9qwKY3xul7tKuwHsTBB4j3PcCGgAQqhZKDmJV5sUxeSd/rJuNAdU/wnPrLQqIWFf+pqZXCp+jCSx8hKvOb76jvkxQ/jW12mE/VH9G1/bY+7C+qRrat3omEAMuCniRHIGMogSAI+dJpt6Fjbbpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789812839; c=relaxed/simple;
	bh=I+CE+sjYRQ9D7SEGybEH6t6fkrM4V9KN8kvDc0ka/6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rdCd6aJzAdgL2xIF8xhdT7V2O5sZWvjA8lJYNkNaf4VYDy+A103lsp8N3Dmw75X0DsmZj2bo7qiP2/UXawjBjbmrYn0BmPIyVbq0V/bczfCGm42H0JUJBdhHBe871w5kCrK2I/iyRpLXuSijWok5ML5vJEFuFO4UxQ758Bz5VCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tCV8/ZEq; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tCV8/ZEq"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9120165C;
	Sat, 19 Sep 2026 03:13:51 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C4033F86F;
	Sat, 19 Sep 2026 03:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789812835; bh=I+CE+sjYRQ9D7SEGybEH6t6fkrM4V9KN8kvDc0ka/6Y=;
	h=From:To:Cc:Subject:Date:From;
	b=tCV8/ZEqWEXIyFG1R0G2wD3x5uG5Uogvfzm4XNcsTOBLttYZmAN+ZMu3H9FTuPFzQ
	 Bj7ymrY6ha+YT98rT0C0HnIyvVreG1WESpy0g4HKGCTQSdkVyCCC6Cmlbdy7SVefvK
	 sBI+vsfK1ilDwzBaS8gOFcnUx9DI1OJ7fCkGqBmQ=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Helge Deller <deller@gmx.de>,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arch/mm: Drop similar platform overrides for pxdp_get()
Date: Sat, 19 Sep 2026 15:43:38 +0530
Message-ID: <20260919101343.1959572-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are many platforms with similar pxpd_get() overrides like the generic
memory default helpers which use READ_ONCE() for reading page table entries
These overrides could be dropped safely letting their platforms fallback on
the defaults instead. Although it requires some code movement from platform
headers to avoid build failures.

This series based on v7.2-rc3 after the following patch.

https://lore.kernel.org/linux-mm/20260918064928.793742-1-anshuman.khandual@arm.com/

Cc: David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: “James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-mm@kvack.org
Cc: loongarch@lists.linux.dev
Cc: linux-s390@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (3):
  s390/mm: Drop all pxdp_get()
  loongarch/mm: Drop all pxdp_get()
  parisc/mm: Drop all pxdp_get()

 arch/loongarch/include/asm/pgtable.h | 20 ++--------------
 arch/loongarch/mm/init.c             | 19 +++++++++++++++
 arch/parisc/include/asm/pgtable.h    | 20 +---------------
 arch/parisc/mm/init.c                | 13 +++++++++++
 arch/s390/include/asm/pgtable.h      | 35 ++++------------------------
 5 files changed, 40 insertions(+), 67 deletions(-)

-- 
2.43.0

