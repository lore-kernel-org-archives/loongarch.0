Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA3338888F
	for <loongarch@lists.linux.dev>; Mon, 31 Aug 2026 05:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788155021; cv=none; b=VjfoVYRB4UdDJ0Xn7mdCzSDbnYg4rI+g+GtK+n7TLbQ/8/XKm3Teyjn8GlgbTUW67fTF305kKNh3Tkmc8DdESi6HMiVkL71kdkzVFsDf5UeA4YZzctyiW+39yN3uhH2uA8SyQgPzZQ1w8W9T7bytvNPoAcJ71vA+eL6lOMdRBH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788155021; c=relaxed/simple;
	bh=GGK9AC8Tv1PQeecS48AIrQ55e9LqtRQAIQ7FmY+hs+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HoK7d6Zx4oFTiGSnr+H0NdvR0RQf5cpMGsrhhbmWyxxtq79d8EaxNU6NYGw+J4vsUsASEqiwAbPGt+GndIkHxxdV9kTs59y0Zafw8xL0CSS4unnk4lunx29U/OYSavHDnZJv5wo4Fq6yXnp/3ps9PP4FI0DuXlxqXiyI5O7fKSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CnW75J3D; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CnW75J3D"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3F871692;
	Sun, 30 Aug 2026 22:43:34 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E96B63F85F;
	Sun, 30 Aug 2026 22:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788155018; bh=GGK9AC8Tv1PQeecS48AIrQ55e9LqtRQAIQ7FmY+hs+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CnW75J3DRkRMOvrNTUSCnYFQNOIbOUOnmVJQMtfF42eAuoH7YKNUi6ESpSwqTyfrG
	 vG0N5mSEM+8VmDd50f9PcBmxjBOkfiS4wh7Lhpjo2rW0nQBSjOK1m4mUYkK3mw+zi4
	 N5OIrqAwr66EWBpqjhoDF/YwciJOKv9ClphMWYs0=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: samuel.holland@sifive.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] mm: Make ptval_to_str() generally available
Date: Mon, 31 Aug 2026 11:13:23 +0530
Message-ID: <20260831054331.625505-2-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831054331.625505-1-anshuman.khandual@arm.com>
References: <20260831054331.625505-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move ptval_to_str() inside a header thus making the helper more generally
available for new users which are being added later. While here, also move
another related string size macro PTVAL_STR_MAX inside the header as well.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Changes in V1:

- Moved ptval_to_str() and adjcent declarations inside <include/linux/pgtable.h>
- Fixed type s/ptrval_to_str/ptval_to_str in [PATCH 1/8]

 include/linux/pgtable.h | 14 ++++++++++++++
 mm/memory.c             | 15 +--------------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 8c093c119e5a..e3c8ab96941c 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -2313,6 +2313,20 @@ static inline const char *pgtable_level_to_str(enum pgtable_level level)
 	}
 }
 
+void ptval_bytes_to_hex_str(char *buf, size_t buf_size, const void *entry, size_t entry_size);
+
+#define ptval_to_str(buf, val)								\
+	do {										\
+		auto __val = (val);							\
+											\
+		ptval_bytes_to_hex_str((buf), sizeof(buf), &__val, sizeof(__val));	\
+	} while (0)
+
+#if defined(__SIZEOF_INT128__)
+#define PTVAL_STR_MAX	(32 + 1) /* Max 128-bit value in hex + NUL */
+#else
+#define PTVAL_STR_MAX	(16 + 1) /* Max 64-bit value in hex + NUL */
+#endif
 #endif /* !__ASSEMBLER__ */
 
 #if !defined(MAX_POSSIBLE_PHYSMEM_BITS) && !defined(CONFIG_64BIT)
diff --git a/mm/memory.c b/mm/memory.c
index 8b0c2c735d3d..aa6b2fc770fc 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -519,7 +519,7 @@ static bool is_bad_page_map_ratelimited(void)
 	return false;
 }
 
-static void ptval_bytes_to_hex_str(char *buf, size_t buf_size, const void *entry, size_t entry_size)
+void ptval_bytes_to_hex_str(char *buf, size_t buf_size, const void *entry, size_t entry_size)
 {
 	if (WARN_ON_ONCE(buf_size < entry_size * 2 + 1)) {
 		snprintf(buf, buf_size, "overflow");
@@ -546,19 +546,6 @@ static void ptval_bytes_to_hex_str(char *buf, size_t buf_size, const void *entry
 	}
 }
 
-#define ptval_to_str(buf, val)								\
-	do {										\
-		auto __val = (val);							\
-											\
-		ptval_bytes_to_hex_str((buf), sizeof(buf), &__val, sizeof(__val));	\
-	} while (0)
-
-#if defined(__SIZEOF_INT128__)
-#define PTVAL_STR_MAX	(32 + 1) /* Max 128-bit value in hex + NUL */
-#else
-#define PTVAL_STR_MAX	(16 + 1) /* Max 64-bit value in hex + NUL */
-#endif
-
 static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long addr)
 {
 	char pgd_str[PTVAL_STR_MAX];
-- 
2.43.0

