Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E47C6FD9
	for <loongarch@lists.linux.dev>; Mon,  1 May 2023 19:29:21 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1a69f686345so21088505ad.2
        for <loongarch@lists.linux.dev>; Mon, 01 May 2023 12:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969361; x=1685561361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSVYEUhM0zGHlDR1yqa5KIpwwPynV1rh1Z3AvIT239o=;
        b=YCg1YMo/xitXPr8EH+7i7/M0wYddD4PRgw+Xim9LG20m92WUdC9kOQT3fMeSkFJ8bz
         2xW9Qv874by/73QMdHiVk+wqz4B7HUYL6Uj2zbe5cOYZkoH3JAXPoFdQlYFWToTwzHn7
         dFfF9W+SZdFlY3dKNimMml0EcpIP5K8qP91gmqtjuJ3sBzpu94RZheVZlyc0ZtXP5Kh9
         Ho0HyuApLfDJnfV0KIWHGVL4xeGycAgKdLMplPIR2oWrmLtc//uxDTAq/yAuqmVSMzMJ
         fvK8MGrkhlBYA+kuhjIoxK7FCwuGLTfgfMGFdrbgTVFBoKNwWCi+6p4VuuSzDnIOEdqU
         o3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969361; x=1685561361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSVYEUhM0zGHlDR1yqa5KIpwwPynV1rh1Z3AvIT239o=;
        b=QT/8uDYoVhZbjYbh7x5FL126Lf0ZGmnJ6H8PvsoZag+APLmnn43cFIVuijcElig1UD
         lCcXzKlBPKj9gWgaFEEHULJIFSsr736WQ9gB+ozpU9JXi/sQUF8mvcXE0reGVIlCDemn
         /CQftr5QjEwZmkMiz2Xu/xmVr8ZietUVMaFd3jwoFdD4055Di+lmePah+OokapTquYXn
         D6VhO4MGmtxnalM5VsYQ0dZhVjXPiPCnkoPlmJEmDUMFJWKjHbBb0VsAY1/FtKfl/Qtm
         m2ZIDTqMnfb9x0LD+bIbzrp/t/BG/qr+0ngGL3LmLcHS6xXPv4adomwh64Ofm1RMn9yR
         V0Uw==
X-Gm-Message-State: AC+VfDwffJMctAbY7Ki53Pvr5njlg6V0lx2Nu51jCIk9ne+EFtxaOvjG
	1tM1yOCYPI3TG5gwboXd9Zo=
X-Google-Smtp-Source: ACHHUZ6yreaxJl7mf5rX62OpE7ktDECZCzzaxE5NqOb8jR7RBUIdxZHYmi631H3wh4Z5BZGAmm3BhA==
X-Received: by 2002:a17:902:c712:b0:1ab:3ba:d2c1 with SMTP id p18-20020a170902c71200b001ab03bad2c1mr1428915plp.44.1682969360924;
        Mon, 01 May 2023 12:29:20 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:29:20 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v2 32/34] sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
Date: Mon,  1 May 2023 12:28:27 -0700
Message-Id: <20230501192829.17086-33-vishal.moola@gmail.com>
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

Part of the conversions to replace pgtable pte constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sparc/mm/srmmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 13f027afc875..964938aa7b88 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -355,7 +355,8 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
 		return NULL;
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
-	if (page_ref_inc_return(page) == 2 && !pgtable_pte_page_ctor(page)) {
+	if (page_ref_inc_return(page) == 2 &&
+			!ptdesc_pte_ctor(page_ptdesc(page))) {
 		page_ref_dec(page);
 		ptep = NULL;
 	}
@@ -371,7 +372,7 @@ void pte_free(struct mm_struct *mm, pgtable_t ptep)
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
 	if (page_ref_dec_return(page) == 1)
-		pgtable_pte_page_dtor(page);
+		ptdesc_pte_dtor(page_ptdesc(page));
 	spin_unlock(&mm->page_table_lock);
 
 	srmmu_free_nocache(ptep, SRMMU_PTE_TABLE_SIZE);
-- 
2.39.2

