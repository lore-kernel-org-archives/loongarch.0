Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4F43D39F
	for <loongarch@lists.linux.dev>; Wed, 31 May 2023 21:31:56 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-565bd368e19so798987b3.1
        for <loongarch@lists.linux.dev>; Wed, 31 May 2023 14:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568715; x=1688160715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELrYSGf3rZcM0SKncNLanyoUH1rFlxcI1YjdtaAHWOM=;
        b=HVGvjPguQLfPfWkiro39nbW+VW4H5uAeLDGXOc+QtDych5ss5NctDwcG9I1c/6SDfz
         APKwygjUx+f7skr0RtKISqSCz+AX9pojhDKoYcMCQyYniYHupBRU0wOHCUoFqOcXQqMh
         s5WPVmf9msAVfThs98QJDhYbBO3Us7PGfZ8s6z4W61niHbKtctIY2nt8en5Qr8xNSORH
         CbV2Bk80OmBOMZ+UG2sJggDfKIMsAz+S52UtEmTBG7rQO3TOu+Ov8Sc+TVK0fDYwDx9u
         QGgal0w97o+Ln3oc2qepS23J75YM3y/Dwt4cq4bO+YUzmRNBHe7fo14HmAPdP2J5Q06p
         Rhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568715; x=1688160715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELrYSGf3rZcM0SKncNLanyoUH1rFlxcI1YjdtaAHWOM=;
        b=CWgqI03Yx4He/PYsAfcJ8Tj7rRQIb61VxWbHu9BgDn4UfH6veOrfYZ2bsKLwA6cvND
         mpaQJYC/VuV0GB6+t/UvdEK1i4Jj5TzNa4iVv2ZGcVkhIEWHtDcwavit68shEh+sB8b5
         iGVKOYyzCkaVgCCGoqm+bTKAlUp4plniwjf8SZy0DaOVQ0zITfxgcsDSwgcMza0bR2x0
         X49rM/WdrsB4fQE9O5vtk+0ZQYVMqKutf6KMowOEX2P8Oa8mHaXyI9+D3dpH7GiRnjrk
         2NUfK4w+dJQizRWWTr8+xBxUeBHCaovMPR5q+mwFHEaPyxJaybz9WJZ1z2VQdRystFCN
         KrPA==
X-Gm-Message-State: AC+VfDymmHO7kVBF9+e2f/vqHcRUXEZsP1mSTFcLf+YD+Gqx4BMa8Yge
	uNCO0Hs4KK0PjXj85s3eGWlHiA40+vvDmg==
X-Google-Smtp-Source: ACHHUZ7KZYp2khjpsM/eLpOUxorXRdnAb+nMmuGE16o93fcYthDjjOgaXk5MabZ2W/EzUmWY8vgN2A==
X-Received: by 2002:a81:6f06:0:b0:565:cef7:92d2 with SMTP id k6-20020a816f06000000b00565cef792d2mr6456173ywc.21.1685568714840;
        Wed, 31 May 2023 14:31:54 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:31:54 -0700 (PDT)
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
Subject: [PATCH v3 23/34] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Wed, 31 May 2023 14:30:21 -0700
Message-Id: <20230531213032.25338-24-vishal.moola@gmail.com>
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

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/hexagon/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index f0c47e6a7427..55988625e6fb 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -87,10 +87,10 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 		max_kernel_seg = pmdindex;
 }
 
-#define __pte_free_tlb(tlb, pte, addr)		\
-do {						\
-	pgtable_pte_page_dtor((pte));		\
-	tlb_remove_page((tlb), (pte));		\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor((page_ptdesc(pte)));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.40.1

