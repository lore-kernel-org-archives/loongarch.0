Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E36C8D5
	for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 21:04:55 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1a68c02553aso1505324fac.0
        for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 14:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603894; x=1689195894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljdqluisjsw1T2S09X4eHyFy2qx+wqxffRAjzd8Lr/M=;
        b=kXhs64xMe2DVLtVyKP8s5V9ZG7303479O9N/ToVEDXv1Gbm2sbmI/fCFK4uGChjd81
         H6kVjd8TOmWAnbLRs4zxfvez/oEYXs2XwY0nLHoNXXHUhU8y7b7V442KEyA9t5B9q0Uq
         4QLgvZ36Wl/+n0Pso7S7rQM028p+NfGQr9Yw1FiqoIIWOMPYwEq7/a7S5+qCahfgFwfk
         /tBZy6zuFg7ypVrVCmXYQ0dxFeVbbzBl8iAc+EUXGUcIwns5danLCJs4qv8DZQXG/O2x
         E2z06iVumBlee2giB3swtpcGSjTtcpgqJNat/RjdgRm72hK9QqxESqcl6ywJsUBEizO2
         9nAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603894; x=1689195894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljdqluisjsw1T2S09X4eHyFy2qx+wqxffRAjzd8Lr/M=;
        b=bTM2BiuYPvTcm2zWXg+rjozkRdl4M1kDv13XLcesFwDx+9IAGsku4wu3pW8Mvg7ZBE
         BYZY8BmDOWEe/KMcnFU/aZhkdmczo9D0QaBsN2xXuo+fXc3hr0XUwiXvmciNwpzpSqws
         IESsEc1/HrboUENXPGCy2gXGud/akJCPIkdkkk/fmHlc8LWpx6C/gZTuCEz3DNK+c46c
         Y5AjCUR10y7SpgIIZk/DTgjmHvNAdjJvhPnfhYGb7laV8Zy3pYjYlzwKsc0BwBffAJcv
         aCMIk0/bOo9U4ZXQhG+tne9/EOhRMaYtysQDBU0HaFT4mIdf0hS8Ll+2mj5ViHfCDMKN
         pyRg==
X-Gm-Message-State: AC+VfDynnynraC1B7vYrbkEQVEa8u/A/6zOhUKf9mkUe56COIG7JdTLc
	mS1Jkh44bdKr/TDWpklOmbI=
X-Google-Smtp-Source: ACHHUZ6qMtsAIJRXZ8Ey4kYlwwJ6x1NqBtbJDNBqsW5hbZHAQ7e3oNYyd6EZmRmybOQvyHBLsoezFA==
X-Received: by 2002:a05:6871:3d1:b0:1a6:5818:f224 with SMTP id a17-20020a05687103d100b001a65818f224mr4571226oag.40.1686603894310;
        Mon, 12 Jun 2023 14:04:54 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:04:54 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v4 04/34] pgtable: Create struct ptdesc
Date: Mon, 12 Jun 2023 14:03:53 -0700
Message-Id: <20230612210423.18611-5-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
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
 include/linux/pgtable.h | 51 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index c5a51481bbb9..330de96ebfd6 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -975,6 +975,57 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
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

