Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B660E33E6
	for <loongarch@lists.linux.dev>; Mon,  1 May 2023 19:28:40 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-63b5c4c76aaso2032686b3a.2
        for <loongarch@lists.linux.dev>; Mon, 01 May 2023 12:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969320; x=1685561320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0Od9Inc5y6h3dSbsHmdGR20xSLs7HxIKZ/fFcl7OHg=;
        b=BSfSX498+nRsOwkOZCv/c3TfiIzHvFrBHqOPXzZnUzdOTpraA1SFYJQ7S9OlNSy+oo
         SgKJwDZ3qC6C//XEAcYljRcEjgHnyeaNoyhEAyOx7Ys6/3k09Ik8CgCQWIiXukHyuWI8
         JqooqMgdLQ1gpcR/L/mcYK+KZEjEg+InGInQqZs8g+xQwi3fiMtnPj+o8uf54dHCG0nD
         x8PpX8tpE3nfYMsr6vBPGSrBk7IqcdW9rAQJxVfKMF33+mjDorfNig4J/P1XioZbWwxD
         uXByeI5tsaD8qrYP2W7mncKrp6aQydR1tjw1T6sz0jLjo8cvDXE3/58iahOtRXOU+sGT
         jXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969320; x=1685561320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0Od9Inc5y6h3dSbsHmdGR20xSLs7HxIKZ/fFcl7OHg=;
        b=eDEWY2CEf+no4zqaexVyIz0Up9i7vMoawmS3KAW1cBmjWYsj62LYbDo5CeLfwKEKTy
         2FOLcufwiRPe0up4DbwqvRQU4iDu0ur6235WFK2zwiWVhix1r7uzGzx0pBxmAMzMf1CL
         2upeN6Nv8PoXxRzdBYjpTbCIKVOFMApvkVXOArcOJSTVrP6MUHbwiu4E2h45q5lRjnRi
         bs32WtBB04wK4WhVqj9KKIgsoIbpLFZ/GGAZ+v67DcsmuLfjbFsBcnqohtQat3yegGhh
         IOmdQPbzKDRbBZ1rGqMNGUpUK7rwTt+nwd98fzeahThEkRAx2UDyDV4lJ10nueQRmDIB
         VT2w==
X-Gm-Message-State: AC+VfDw6HMDKbOhaHpb9HqWrzK5uFds/zxe7a3H6TP6QUJKb2jYUJu17
	jCIjKkXJnmCH5irvmR/vwP4=
X-Google-Smtp-Source: ACHHUZ5c/2Ko6MMnlJILdIHFSiqsi7woH2pp9LXJUwyBETBH//ZWHg6e+tUlm1aX3nzTckKQE2QL/Q==
X-Received: by 2002:a17:902:d2cf:b0:1aa:ffe1:de13 with SMTP id n15-20020a170902d2cf00b001aaffe1de13mr2810716plc.5.1682969320162;
        Mon, 01 May 2023 12:28:40 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:28:39 -0700 (PDT)
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
Subject: [PATCH v2 04/34] pgtable: Create struct ptdesc
Date: Mon,  1 May 2023 12:27:59 -0700
Message-Id: <20230501192829.17086-5-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
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
index 023918666dd4..5e0f51308724 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -989,6 +989,58 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
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
2.39.2

