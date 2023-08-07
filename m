Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED08817AA9
	for <loongarch@lists.linux.dev>; Mon,  7 Aug 2023 23:05:57 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d05a63946e0so5095611276.1
        for <loongarch@lists.linux.dev>; Mon, 07 Aug 2023 16:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449557; x=1692054357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/qh+9u1BcCIl2V5thva5G2rletbRXaxfcBgzJGGgXU=;
        b=pCbA+UxrLZ96Iu/LappjpSZmLEozYOYmdO5RTxaM7BlCH20e3MEhp3Bn4lGiK7HrnF
         zI5vTymTyexPs2fEWKMf3YOixGPBtUiqT1+gX7fLWBa+Q9gs2M2cYtqmojJG+cqpxy8a
         yiuXYP2euWfRpeTnK/Ph7t69G3h70UOk68zLodvepBaU3Ub4ZFK2KFzJhB7TlCbjRGdX
         ie8hnx40ZzCuPRz3xDX8QGC9rAdvd3I0ubBMPCct9yJ64tgNkqrnZ4vxqqMZLVPIiaaP
         rYqmFrrQlxG0A3en5YH5Vcd7HyjhL8swCun/14090vxoeSz0eujRX7UW9eNuwqOQts53
         n0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449557; x=1692054357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/qh+9u1BcCIl2V5thva5G2rletbRXaxfcBgzJGGgXU=;
        b=eXwobDiAlMDvXwfRkwJptdk68ulCDn9D30Cns93mvJomkCWJLkOvfMntUCT9MwnWGg
         s8vsU3zx+nE8MOu0ZMD3uVMewvlqftx4t5PYV/UqEFzYoz4DisWLi17tna9nTZXDUfaW
         O556YlVSxFyXGfSLuqlbjvzSbCdYNhZPg3BXQZm+ke8MWbitgdjprGBduTXy6g0CCuxF
         9TXHI9FBz9w1hsalzZRrLNUbMxCWuZ95TIgTTR0j96813dXOP4oBVU4VRY0py2L5IOBy
         +bEc0Lyop0CsA0OjBo3ADHU0XcsYiB/fEN6+d1WB8SkrKSpHhJNW294flPFGhYUisfAK
         rQfg==
X-Gm-Message-State: AOJu0YxsbqTyjCyx3c8HAVrr64Vt8x8+TvZNfltGTtCRzqx334jER0dZ
	ksu+Z+GumbKZxfd9fwpsHSA=
X-Google-Smtp-Source: AGHT+IGb7qTBQz9qcaNa56xxCbdxPZmnKDiha96eaUPQlL4XzY5YUB1UJSqCKxKHPrzOS/VVDboJfg==
X-Received: by 2002:a05:6902:4c4:b0:d0f:65db:dc0e with SMTP id v4-20020a05690204c400b00d0f65dbdc0emr10052463ybs.39.1691449556886;
        Mon, 07 Aug 2023 16:05:56 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:05:56 -0700 (PDT)
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
	Guo Ren <guoren@kernel.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v9 19/31] csky: Convert __pte_free_tlb() to use ptdescs
Date: Mon,  7 Aug 2023 16:05:01 -0700
Message-Id: <20230807230513.102486-20-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Acked-by: Guo Ren <guoren@kernel.org>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/csky/include/asm/pgalloc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index 7d57e5da0914..9c84c9012e53 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,8 +63,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page(tlb, pte);			\
+	pagetable_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
 } while (0)
 
 extern void pagetable_init(void);
-- 
2.40.1

