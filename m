Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E796FD4
	for <loongarch@lists.linux.dev>; Mon,  1 May 2023 19:29:07 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1a6762fd23cso23592505ad.3
        for <loongarch@lists.linux.dev>; Mon, 01 May 2023 12:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969347; x=1685561347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apg836Gn0N7QExyyhUUGNgc2fd2r3iyoAghRwsUjc2o=;
        b=WbTJO1ayjn3HXL/iQMZCmT2+RnFSF2O5WG+VKbNfOxDU8NvbfSgz+Wjs4UVgNNQcMr
         uLj57ayYRa/f+rOhAVP0jHM/2f33b+TbcsUuT8OausfFIQuWjGI50HrH5E0KiKkIgQwa
         0uM85OALkALC3dGk5nJ/tYYANgKg4uu8cRvFIwQEiY4YzwHIJvVidPyhHtwxmNKQYA0W
         tAWz4vl42KgoRYKzs8w7tUocWedsU0Shw+kefBEmySvrYYB7bH8pThcvpYZ6Dpmw316z
         icjhKqrruYJxczjDCcNsGgrwDrViIcKW8h7/U3ESAg45ipYAB08luKD04Ylpo9b00Q6j
         cFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969347; x=1685561347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apg836Gn0N7QExyyhUUGNgc2fd2r3iyoAghRwsUjc2o=;
        b=eWM+jqleJyyrftNnDPFSoE8+3ZMFh+lke8TQkYB8eY791iW+QmPSFacfCw4yedvDPA
         fWxAswkn8aVMYNQcPGSUUgPIJ+zTwCMFO8M1pujarjUe+Wa1wkjlNT762a8TtF/qCnol
         xcC4ganT2fYVk+IUzV/E0RQFRZIHxCt7z2YN5c2IQVjg1lpug8d9Xs02VBQUqRo82UH/
         1BAJ+aWbmK1Sr4kBEiIWdcd+f3BmezWr5nOAiqhlO/Gd0HQp2HPacuDa0gLlPNKczZ/b
         b5xkXCoTEcImsOPY55q6auKfrwATOM8IfLEf/DNwUzdLGfuM3QXfA1104FAlYEhoF06u
         GrcA==
X-Gm-Message-State: AC+VfDzbvbVpctrAQzseQ+VQx35oYuap3keplInNjpi1w4CUa5JooPK+
	r98bruRM53eoVPfCt/A8MVE=
X-Google-Smtp-Source: ACHHUZ6JhHSCQpD21/kJ78iavglhPlPTqvuf+3JEce/L0R67tH5klQ2MwjR0kPXU/JMC0Y1BeGjoZA==
X-Received: by 2002:a17:902:c94b:b0:1a8:626:6d9d with SMTP id i11-20020a170902c94b00b001a806266d9dmr19271440pla.62.1682969347146;
        Mon, 01 May 2023 12:29:07 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:29:06 -0700 (PDT)
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
Subject: [PATCH v2 23/34] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Mon,  1 May 2023 12:28:18 -0700
Message-Id: <20230501192829.17086-24-vishal.moola@gmail.com>
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

