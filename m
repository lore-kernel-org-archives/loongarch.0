Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAFB46C4C3;
	Tue, 21 Jul 2026 16:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651057; cv=none; b=iAb4jf1DtZYm5lJ1wbBWtKP5MwRtvxK/VEJYTZcX266xbHyMWsjrNcySbBkSl+egvvuvdtGgWSx2XMjPsxxneD28mC3+SBoMy7IsKyIJFys8iNipDSzx+KDEJ/RBdYMtVtT7hjj1y9AXN4jnelvZ9QUaHenQhXV6uWaGLout9pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651057; c=relaxed/simple;
	bh=PJM67LFXbxv7YkKJDsgxPyYzs0cOQ8iU3xfyJ6Y1q7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nYEXIz4H86vtpl3x5bwpHqyZVm+/7n2K8wmgMc9Z6V4niFFv234Uk8uwPBixJ6D/fev1sl6rUaVZhDX3agNTldseDqiT4zLbR6G2esSgGySFmg1+AZHOhyQ6bTRrZ8kUV7Hp8ZWCDHG9F93DQa8ui/sYDLKZvgiIv+hA0oBwS5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBYXLOuB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBYXLOuB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98ED1F00A3A;
	Tue, 21 Jul 2026 16:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651056;
	bh=dd8IzpXvfcf9omad/UCYPVVbU051g1TaDj1g9jolwTk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NBYXLOuBqmaFwezx93ecw7m/nA5exRaxX00iO4FbrUlWQTR/no4KZ7zvJ0UebT+pH
	 KPe5t85aTvpwk9STpAYme+9I79Pc3UW9ruWYP1EPVqRbSjrGHh+VNyyuHOobxLLdbF
	 UNPQzXpyaVX+tJ+vaqyC4EMtkXQaUrEPWevROWx6Aj2/j/RWHw2lapMfhHp4NAuRgR
	 jzq+3jCaUaD/D0ofF88IEP/ndOsQxdCoy/3A2burc0pTIFvFtc6qIQcMlDgtf6SbH9
	 8DLavmBbCBy4XbRI/chv2p1Ia1EMEDGC0Acowle0lUQAF4b9kJP2yJqL/P69RTgGd9
	 N7nVeGpkBnGVw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:28 +0300
Subject: [PATCH RFC 05/18] x86/mm/pat: use a generic helper for the large
 page size
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-5-2c1fc62306b3@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
In-Reply-To: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
To: linux-mm@kvack.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Brendan Jackman <jackmanb@google.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16-dev

__should_split_large_page() uses x86 specific page_level_size() to
calculate the size and mask of the large page.

In preparation to moving core parts of change_page_attr() to common
code, introduce generic pgtable_level_size() and pgtable_level_mask()
helpers and use them in __should_split_large_page().

No functional change intended.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c |  4 ++--
 include/linux/pgtable.h      | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 8a1782f5de3e..ee40962d4ee9 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -956,8 +956,8 @@ static int __should_split_large_page(pte_t *kpte, unsigned long address,
 		return -EINVAL;
 	}
 
-	psize = page_level_size(level);
-	pmask = page_level_mask(level);
+	psize = pgtable_level_size(level);
+	pmask = pgtable_level_mask(level);
 
 	/*
 	 * Calculate the number of pages, which fit into this large
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 4b42ac5c27d9..9eb00ad6d5d2 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -2364,6 +2364,28 @@ static inline const char *pgtable_level_to_str(enum pgtable_level level)
 	}
 }
 
+/* Size of the memory mapped by a single leaf entry at @level */
+static inline unsigned long pgtable_level_size(enum pgtable_level level)
+{
+	switch (level) {
+	case PGTABLE_LEVEL_PTE:
+		return PAGE_SIZE;
+	case PGTABLE_LEVEL_PMD:
+		return PMD_SIZE;
+	case PGTABLE_LEVEL_PUD:
+		return PUD_SIZE;
+	case PGTABLE_LEVEL_P4D:
+		return P4D_SIZE;
+	default:
+		return PGDIR_SIZE;
+	}
+}
+
+static inline unsigned long pgtable_level_mask(enum pgtable_level level)
+{
+	return ~(pgtable_level_size(level) - 1);
+}
+
 #endif /* !__ASSEMBLY__ */
 
 #if !defined(MAX_POSSIBLE_PHYSMEM_BITS) && !defined(CONFIG_64BIT)

-- 
2.53.0

