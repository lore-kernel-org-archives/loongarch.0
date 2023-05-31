Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0455C3D399
	for <loongarch@lists.linux.dev>; Wed, 31 May 2023 21:31:53 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-565a022ef06so765477b3.3
        for <loongarch@lists.linux.dev>; Wed, 31 May 2023 14:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568713; x=1688160713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twP3X2a+WodLh3389MnIMBhN0jbH10mGEhh4PvePsM0=;
        b=PfN/YuXqEhOYfWlhCizTVYhB0yTtEnGBcp1Rf+NGxnIYb5NMfNjpOJp7si8Gqd9u2Z
         fVUf7A/NR+jmOjDUmFOcEU9lVtXwdNmW/KajF2dl5HDRHfmf/W944R+zyeedwYfvy537
         14PZNj7A3uugHcuLzifkUVqBMDywmdqymi8GehMXhWnbSeCktA8GuayP2Gw4BIeku+KV
         EWgr5cqL7Y75WorTm+eBQ331vxvi6DIr56AVXpyFUK5xmnNLyeer0KWpXh+3ggToS823
         Egfk0bra3X4pY1o6khSRW89GKMQyeeVJx3oX9CNStxK0FHLZpfrALdAzG2hgMTcdbX0M
         +9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568713; x=1688160713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twP3X2a+WodLh3389MnIMBhN0jbH10mGEhh4PvePsM0=;
        b=G+KdsS/5AxhIiUJZaYGqBoGP8gZ8veXe02AU+/BJgm5Ghnf8TLVXeXYiaU2lozuPOL
         patYFrHfN0Uzm2qKRfZNzhuETeKZ7oPQqYDBveAP5TqahHbO72ifb66rzEsnwNlpWYTT
         Uj3ggfCuHsEydL4qizIJgnTnR1ciaP4j39wVJPP5DAFelI54qD15/n3aE8vRhjTqqUEx
         ySZ6eHLVhKhKq7Z0mOxvtTJg8WOZ5HDnCSPVzr7Kn1Q/vowiKuN3p8I2oJxiO/vAF6a+
         qHqy7/g2ACb31a0L+1gAxIEDFozU8QNPCv1mK7opHPeJLVxcSYYI0vUm2qamNeC1rVgY
         E4nA==
X-Gm-Message-State: AC+VfDxOeAIcEssW2gIlUDYnuCrF8qBnLb0p+RwU0uFGiZcNlMjdR5Pc
	ISyIFg9YpYm8SgwZ6+nY1y0=
X-Google-Smtp-Source: ACHHUZ7FD6AVojP8YF17yPS22sW4VLLKSMzYdsUMVLL7wG9gS5evh1bJZ6trRixkrytBmJNTyQ8JCA==
X-Received: by 2002:a0d:d684:0:b0:566:386b:75fc with SMTP id y126-20020a0dd684000000b00566386b75fcmr7598602ywd.18.1685568712866;
        Wed, 31 May 2023 14:31:52 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:31:52 -0700 (PDT)
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
Subject: [PATCH v3 22/34] csky: Convert __pte_free_tlb() to use ptdescs
Date: Wed, 31 May 2023 14:30:20 -0700
Message-Id: <20230531213032.25338-23-vishal.moola@gmail.com>
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

