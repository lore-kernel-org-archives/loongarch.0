Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629FE3EDAA7
	for <loongarch@lists.linux.dev>; Thu,  4 Jun 2026 09:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563730; cv=none; b=uqax24xM2zT0WqJjKbJQhGiX6DECAHvBFknmh7sQeWxr1VIJKhZIvQvs/WnkaHwyPqWE0ly1B7nLDDKk2fvA2d6d+1gC+S+C9bq0Gui+ECKpU1s2XYseAmRNIuAOzV8a8vGYjwLiCjyl7J0H6BNM5vHwMq3NFpRuSPZ8eyUsuEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563730; c=relaxed/simple;
	bh=KEhZ7gkyBq3RI6nhIAd6JrBnBoxlOuHlFcgxULW8Y/8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tM/N5+qrgAxGBVaCwnCy7YuGmNSTs38XF1JioKnlGxYGeNUU/c0+wxqLGMNSnm8XOvjuAUpSc+AR9Yjz6ZJ1yU2EUsyjWqtvwaZjDmC4Mn4NUz9cqHeV5o8EksbL3F9eN/GOICWpd61Kyd0LwXrtaLEJF62p2I2v+nKtYFKczTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0a61a7c85ff411f1aa26b74ffac11d73-20260604
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_UNTRUSTED
	SA_LOWREP, SA_EXISTED, SN_UNTRUSTED, SN_LOWREP, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:19dcea7f-e87f-4602-b1fa-7f86889604d8,IP:10,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:35
X-CID-INFO: VERSION:1.3.12,REQID:19dcea7f-e87f-4602-b1fa-7f86889604d8,IP:10,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:35
X-CID-META: VersionHash:e7bac3a,CLOUDID:9935500979ff3715132f2c501ade53ba,BulkI
	D:260604170200MDBRFLOQ,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102|127|
	850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:
	nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,B
	RE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0a61a7c85ff411f1aa26b74ffac11d73-20260604
X-User: wangxuewen@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <wangxuewen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1397872507; Thu, 04 Jun 2026 17:01:57 +0800
From: Xuewen Wang <wangxuewen@kylinos.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v1] LoongArch/mm: Fix nr passing in set_direct_map_valid_noflush()
Date: Thu,  4 Jun 2026 17:01:51 +0800
Message-Id: <20260604090151.3254805-1-wangxuewen@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_direct_map_valid_noflush() incorrectly passed 1 to __set_memory()
instead of nr. This caused only the first page to be updated when nr > 1.

Other architectures all pass nr correctly.

Fixes: 0c6378a71574 ("arch: introduce set_direct_map_valid_noflush()")
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 arch/loongarch/mm/pageattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
index f5e910b68229..614ccc7afccb 100644
--- a/arch/loongarch/mm/pageattr.c
+++ b/arch/loongarch/mm/pageattr.c
@@ -234,5 +234,5 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 		clear = __pgprot(_PAGE_PRESENT | _PAGE_VALID);
 	}
 
-	return __set_memory(addr, 1, set, clear);
+	return __set_memory(addr, nr, set, clear);
 }
-- 
2.25.1

