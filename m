Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73603D38A
	for <loongarch@lists.linux.dev>; Wed, 31 May 2023 21:31:18 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-561c1436c75so801567b3.1
        for <loongarch@lists.linux.dev>; Wed, 31 May 2023 14:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568677; x=1688160677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2bE9CDG9Oxw3pEA2fSuUshC33VMwoQ2Xz6qScjQL3E=;
        b=iYqqA4KZmoroGYhynV/jiNkWzAMHN4TlFNnsupyXM0HztFgnmGpbYhflGvCI4PnTEH
         qsb+x4h+Ra/DHJZpmJ+cDpCt0WFO8DN9RsHpGbhgd8UZD1C59aXCIdDYpdL/DDlqjtME
         QAC1ynKbnXEL2BUoeiDKJEOTEmjHPJwx20Oocm0d9VYWRam4vpslVsanNLIqZtenI7il
         z8Y4AX5Qo3hIFiKRtt14OfPeMVmgXXgQiLO70vbxlL1MgUQYvu/5R1IEb6sabFTUiQkk
         WKmmoKw4Cu+qJUco9/5c4L88Blpl8Ohrj5Udd50ZlUMrgKFkg8PwQhuutxVbJdY53ahQ
         RhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568677; x=1688160677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2bE9CDG9Oxw3pEA2fSuUshC33VMwoQ2Xz6qScjQL3E=;
        b=jNKAKZYhrUZ15b6S75mRY19LcYT6fdNS5A1k5A6KLmY2roZkyhdZsR03K3DfXjgfBd
         lE4UhlPCa7d71eobxEk2BsWgxam8zCe8aag+6bwo0uAB/WguEYUb/QsdEUPcpHHPjhjv
         TUqV87NoKt+7u+4oeYKOXV4b+SFin5LJidJIiAl6/qjyBnnWDB1QBpY1PwkYHTEZPUGB
         PGOiZdk5MQDNH0mIqSgca2y3OPZqSS8Gj4FCRKJULo+Zx8u1qJdRAY8Mn55hq4LeaPUL
         V5UR/SaUMzJ/TjtTUIcDKZFo7t7VnzaDnLfck7BzzM49ZMLuEpk1Sh1jqONXOppMztA+
         KkMw==
X-Gm-Message-State: AC+VfDz3O4jQ/QAfaxzoeyE7Gnbibnr1Nq3iR3T7cpKvRgsv4jXi+/Gq
	ioM1XnYEN7e9uyDHvTDPmQw=
X-Google-Smtp-Source: ACHHUZ6pTbgk5oakG8rCTNTHmfkc+dDnZpqxrm9LdrARtP0jWcbiwYUD1VVJhesMtUI+Yz5eprOqiQ==
X-Received: by 2002:a0d:d816:0:b0:565:bb04:53fa with SMTP id a22-20020a0dd816000000b00565bb0453famr7385514ywe.10.1685568677391;
        Wed, 31 May 2023 14:31:17 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:31:17 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v3 04/34] pgtable: Create struct ptdesc
Date: Wed, 31 May 2023 14:30:02 -0700
Message-Id: <20230531213032.25338-5-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, page table information is stored within struct page. As part
of simplifying struct page, create struct ptdesc for page table
information.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/pgtable.h | 52 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index c5a51481bbb9..c997e9878969 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -975,6 +975,58 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
 #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
 #endif /* CONFIG_MMU */
 
+
+/**
+ * struct ptdesc - Memory descriptor for page tables.
+ * @__page_flags: Same as page flags. Unused for page tables.
+ * @pt_list: List of used page tables. Used for s390 and x86.
+ * @_pt_pad_1: Padding that aliases with page's compound head.
+ * @pmd_huge_pte: Protected by ptdesc->ptl, used for THPs.
+ * @_pt_s390_gaddr: Aliases with page's mapping. Used for s390 gmap only.
+ * @pt_mm: Used for x86 pgds.
+ * @pt_frag_refcount: For fragmented page table tracking. Powerpc and s390 only.
+ * @ptl: Lock for the page table.
+ *
+ * This struct overlays struct page for now. Do not modify without a good
+ * understanding of the issues.
+ */
+struct ptdesc {
+	unsigned long __page_flags;
+
+	union {
+		struct list_head pt_list;
+		struct {
+			unsigned long _pt_pad_1;
+			pgtable_t pmd_huge_pte;
+		};
+	};
+	unsigned long _pt_s390_gaddr;
+
+	union {
+		struct mm_struct *pt_mm;
+		atomic_t pt_frag_refcount;
+		unsigned long index;
+	};
+
+#if ALLOC_SPLIT_PTLOCKS
+	spinlock_t *ptl;
+#else
+	spinlock_t ptl;
+#endif
+};
+
+#define TABLE_MATCH(pg, pt)						\
+	static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
+TABLE_MATCH(flags, __page_flags);
+TABLE_MATCH(compound_head, pt_list);
+TABLE_MATCH(compound_head, _pt_pad_1);
+TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
+TABLE_MATCH(mapping, _pt_s390_gaddr);
+TABLE_MATCH(pt_mm, pt_mm);
+TABLE_MATCH(ptl, ptl);
+#undef TABLE_MATCH
+static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
+
 /*
  * No-op macros that just return the current protection value. Defined here
  * because these macros can be used even if CONFIG_MMU is not defined.
-- 
2.40.1

