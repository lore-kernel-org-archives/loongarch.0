Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66EF22542
	for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 20:58:42 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-763e177ba7cso163241785a.2
        for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 13:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467521; x=1690059521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUnc1suNAj/KzreaB6s7vAsOWiJZx3FNBLzDbQjj/SU=;
        b=mxSRrVtskejfc/X16Q74dptO75kex0U1BDLuwz97pVRe94MsJ1tXF/mDBi2+KIRPRR
         7frc0Ipdbv1qDfHMpCRO5VQbJ/DKNN2DmrrOctIElaXq4X1eS2wG1MgKx+EEIDm5IE/n
         dhPljY31cmgrHKk6DhfJfpvGe6V9T4MqXnsXF7ZHxbxJIsBPM+C004kDxiRMae/4a+6A
         l/JL+zpf4vx2gyi8iDyTm65oAYm1ZOIjSFK4K+nSdgPKFtV6K4nHQ1K38iP6GDgp4k/p
         RVulC8Jyfz61VS4MiwEinectlQ9R+QOPA/9MgDEtR4kVqNBk2wlMydoonlFLN2E5gAjW
         A4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467521; x=1690059521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUnc1suNAj/KzreaB6s7vAsOWiJZx3FNBLzDbQjj/SU=;
        b=FENNPd//+omMEPANPIrB32dZMoDQmQV4gl0nNjYA11aI440VqkodhWQOxs9eGdGQ2W
         Ly0Iwfe7eSFm60imqtaTeJjV2NYrZkQfd0Kzxk91fT5EPcQyEklrFcj/8gnHq/Cph18q
         yrlv1YYpCfEJ9K9BP31eOkeOf0r8OuB+CtGG7bXWtmF5ta8l4cxpSWSVZxa6xpnBJGVD
         xOlaPfsjQFbGRP+38DEYUqy2rsAUQoDTKXTrJKHcg2cJGQTGHqD+xucmz8ttamimTMaD
         MrJ8UiBcoiuBw0kvtr13BQ8r8HyBa3+dSOccArK3RzuNTaIxPDxLEFTdpRq/9lJy4YOc
         yPDw==
X-Gm-Message-State: AC+VfDxhaeuIJsRqnqUD8vYL9wd7z68JeLiYq8pg2VIyv4aTwhj0V0Tf
	rAbFCgJYXHQ16sta3JbUevo=
X-Google-Smtp-Source: ACHHUZ6uwsaC+f+4ISzpiwzmvKryO8fCbzH23CcTApoIn0lsQ518YuGTPwW7f524cMEve6g2SlrGNw==
X-Received: by 2002:a05:620a:c82:b0:75e:6837:19f8 with SMTP id q2-20020a05620a0c8200b0075e683719f8mr19290818qki.54.1687467521509;
        Thu, 22 Jun 2023 13:58:41 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:41 -0700 (PDT)
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
Subject: [PATCH v5 22/33] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:34 -0700
Message-Id: <20230622205745.79707-23-vishal.moola@gmail.com>
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

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
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

