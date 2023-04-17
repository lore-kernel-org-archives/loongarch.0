Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE59A94D
	for <loongarch@lists.linux.dev>; Mon, 17 Apr 2023 20:53:16 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id v9so32540762pjk.0
        for <loongarch@lists.linux.dev>; Mon, 17 Apr 2023 13:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764796; x=1684356796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apg836Gn0N7QExyyhUUGNgc2fd2r3iyoAghRwsUjc2o=;
        b=DU+PC+Lb75+sxyzE8TFBhUq23MhtXNiuA1nw0c/GhsuV5IK3M7l/Hh4azDLq1DRa+j
         fu7HXiEzvV3T+N5Mt1is7DhkrUBl4PJsqFnRPYaX3oFVj8P6Qlk5ZLs6mljyu96mU+sv
         zpquQbUhbrKn4GUU7udC1O03s9ThOPwnMOZQlJkJdwRy8ikjPxI0naLAwtnZbb4WzEoy
         3BNpuQVnvIHEKJKSenAtt9bKOamb6q7fxWlfz+PtLFjOTztncr7nNFnGXeF7WX7UQ2CN
         r/J7luQKDmaqSpU1aG4/YKRgzEf0E8SysEU40ARw1q6PEFiJTtJVgg7dYOEMGKOTGrN2
         xyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764796; x=1684356796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apg836Gn0N7QExyyhUUGNgc2fd2r3iyoAghRwsUjc2o=;
        b=RkH92lEVo8MSQfzv0s9uWzEkmVvLW23bj4nG9cZnLFeGqbe6E1mdM9KVB/C4xTL6Tr
         NLI0hOiI3fYay+5k1m3UVpA1RK9Is8l2ehq5P2rbdXfY89iCp6HoxcKriPbsjck1PZjk
         n9yKSiWQQa/Yw1actf26TjPtWigiVuALqgWBSesb6W5Bk5hW6eWsI9gW77qOQvZZZJdc
         TNFZ8emVWe4Hy1viHY23436VXo8c6+j67LqP289z/4aa8cIj9sBKtmvIFWA4ScQUrqpt
         x6qjfx5zMSJj3C4NCPYW0ju+XOCH70g594xQoI8WxyPOkeEr51bVKa2Xn9RCgV+A982o
         MyQg==
X-Gm-Message-State: AAQBX9fPqbPILw2xNpEAlUX0WMWdl499qgN8hCkuSZQgGL9YG3D9eL/h
	nlWvHeIJ5IPi4W4gNNTuvMA=
X-Google-Smtp-Source: AKy350ZcoHXe5N321oYs87Q7Ayd5DnxwU4W2BhAi27QaGMsyV7i9NrgOQAsujiVTD54cy1B75qhHjg==
X-Received: by 2002:a17:90b:3b8c:b0:23f:9d83:ad76 with SMTP id pc12-20020a17090b3b8c00b0023f9d83ad76mr12727299pjb.23.1681764795745;
        Mon, 17 Apr 2023 13:53:15 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:53:15 -0700 (PDT)
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
Subject: [PATCH 22/33] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:37 -0700
Message-Id: <20230417205048.15870-23-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
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
index f0c47e6a7427..0f8432430e68 100644
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
+	ptdesc_pte_dtor((page_ptdesc(pte)));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.39.2

