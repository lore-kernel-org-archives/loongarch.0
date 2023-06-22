Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C54E206B2
	for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 20:58:03 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-bf3934ee767so1710805276.0
        for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 13:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467482; x=1690059482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g10wkISUfh+NWh/zmhT9FX+m3ZttfvdTUqPKBonJP24=;
        b=pU1rNku+EwfuvvAUFkFumH3vBy2yB8eY8b9rmQMddlJoc9QhOnRcokyjWDtIUPPy9P
         MyE7phtpnefNxvysKqFF1dCChREaY4VAw7Hj9WJFlZFrzpk6eifBId3wubz0Vyh/S2pn
         8/Y3zkVGHHKKYxzZzu8HCxLQTltPQvJHitS9QsbrsAUgPjueiuuK933isxWF/RQdLHvt
         zcy+Qct09qmvfH+KRctZzkT+vvZGDQDyiysBgsbHpUxND18HRJm9vVFEK6S0KHOtgU7u
         IRCWYGiDuX3Hydg/OjrZHIGz2lGmohOF8cCd3deLunhE1oH3PJ2GTuP2PJzlmW5OQRrp
         EAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467482; x=1690059482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g10wkISUfh+NWh/zmhT9FX+m3ZttfvdTUqPKBonJP24=;
        b=OYPoCpNuQz/dNMCuf7YM5KCHiwZfVydzxMrQ8TfDv44pyATmKwo+kZswmsT/3yhyba
         Euun90AQ3HWjKAjDFCYoJ69vdV/NctJ/UrfvSF6hwh4tUPHQ8tdL3gujJ/u+Xqv4gtQ7
         OgN6jogJo9ZuLHrRiGyQfLjgRXS7gBp/kNN/CpJjql5XBkLHSTMJJsg4DizAexJsxnpz
         liXAB77z2+K5J0EcWw22OC1UBt/wRlDaD7k5ZvtTRmBU7EAW6YjQocBy0AY44uKhIEf9
         LWJ9pTKYcBgkQu2UOzTqIG03aYaMayYJaMmkYNj+nOZBzoRdFIdvud3XqDRoQu52//wa
         12qA==
X-Gm-Message-State: AC+VfDy1Hz8kM9IM1pkVS70rZIeP1u/H1wnKzRgxMexD5TTed2yMx7BN
	G/b979sNN169c6yqnenTmQg=
X-Google-Smtp-Source: ACHHUZ77fWcfFpcqNU9K3kqcEPsqSpbWa/fmZ/3pFZFyzvd1rtc51te7WicHxIwYc2YzOzHNnZEaEA==
X-Received: by 2002:a25:2f85:0:b0:bd5:eeb4:55be with SMTP id v127-20020a252f85000000b00bd5eeb455bemr19092596ybv.0.1687467482307;
        Thu, 22 Jun 2023 13:58:02 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:02 -0700 (PDT)
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
	Hugh Dickins <hughd@google.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v5 03/33] pgtable: Create struct ptdesc
Date: Thu, 22 Jun 2023 13:57:15 -0700
Message-Id: <20230622205745.79707-4-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
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
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/pgtable.h | 68 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 5063b482e34f..d46cb709ce08 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -987,6 +987,74 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
 #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
 #endif /* CONFIG_MMU */
 
+
+/**
+ * struct ptdesc -    Memory descriptor for page tables.
+ * @__page_flags:     Same as page flags. Unused for page tables.
+ * @pt_rcu_head:      For freeing page table pages.
+ * @pt_list:          List of used page tables. Used for s390 and x86.
+ * @_pt_pad_1:        Padding that aliases with page's compound head.
+ * @pmd_huge_pte:     Protected by ptdesc->ptl, used for THPs.
+ * @_pt_s390_gaddr:   Aliases with page's mapping. Used for s390 gmap only.
+ * @pt_mm:            Used for x86 pgds.
+ * @pt_frag_refcount: For fragmented page table tracking. Powerpc and s390 only.
+ * @ptl:              Lock for the page table.
+ * @__page_type:      Same as page->page_type. Unused for page tables.
+ * @_refcount:        Same as page refcount. Used for s390 page tables.
+ * @pt_memcg_data:    Memcg data. Tracked for page tables here.
+ *
+ * This struct overlays struct page for now. Do not modify without a good
+ * understanding of the issues.
+ */
+struct ptdesc {
+	unsigned long __page_flags;
+
+	union {
+		struct rcu_head pt_rcu_head;
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
+	};
+
+	union {
+		unsigned long _pt_pad_2;
+#if ALLOC_SPLIT_PTLOCKS
+		spinlock_t *ptl;
+#else
+		spinlock_t ptl;
+#endif
+	};
+	unsigned int __page_type;
+	atomic_t _refcount;
+#ifdef CONFIG_MEMCG
+	unsigned long pt_memcg_data;
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
+TABLE_MATCH(rcu_head, pt_rcu_head);
+#ifdef CONFIG_MEMCG
+TABLE_MATCH(memcg_data, pt_memcg_data);
+#endif
+#undef TABLE_MATCH
+static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
+
 /*
  * No-op macros that just return the current protection value. Defined here
  * because these macros can be used even if CONFIG_MMU is not defined.
-- 
2.40.1

