Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8836743A7E9
	for <loongarch@lists.linux.dev>; Wed, 15 Jul 2026 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108669; cv=none; b=dchvkgON8oQy6AiHBH2+99q+Qfen9LVFa+rCXfctr9epF36fbLCavF6SAMI4wQddOmp2u/+zS+afRcsG9ETb0bVHWte9/HsjQ4Ou2jP62DTsOg+PUUIQB3BckE8YEZH/JB2kv7nbHA7fcNHzAufEY/1fMIG84TOlAVXm9nqX3iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108669; c=relaxed/simple;
	bh=du5E4z45/qCW35/KeznfOnWR4N78NCd4noqT0tDju84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fRcxBcR1nz0ctO/pUZ9FYtw9MmGJluzC4PTYjpzAfOnMWBbhP0LQS7kAnJUo8I1sfDzMBkbCAgvFoLUjsIPllrknmwR9l2Fv496U6+OS6GOHKEHfFwNg8W0HUAC+luNG2Fz+btIxMCDNqGz4CX6Gf8z4Gf8rScZhG4MLfdI/Ajs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: bde4fad6803111f1aa26b74ffac11d73-20260715
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5a2037c1-6738-4676-900e-3b5ddde8d270,IP:10,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:35
X-CID-INFO: VERSION:1.3.12,REQID:5a2037c1-6738-4676-900e-3b5ddde8d270,IP:10,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:35
X-CID-META: VersionHash:e7bac3a,CLOUDID:fc6fa331a125bfb1bdd9d4ea9932b593,BulkI
	D:260715174415TR37GZDR,BulkQuantity:0,Recheck:0,SF:17|19|66|78|102|127|865
	|898,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bde4fad6803111f1aa26b74ffac11d73-20260715
X-User: husong@kylinos.cn
Received: from ctao-book.. [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 66821565; Wed, 15 Jul 2026 17:44:15 +0800
From: Song Hu <husong@kylinos.cn>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	jiaxun.yang@flygoat.com,
	cuitao@kylinos.cn,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	cui.tao@linux.dev,
	Song Hu <husong@kylinos.cn>
Subject: [PATCH] LoongArch: mm: drop redundant flush_tlb_all() from set_pmd_at()
Date: Wed, 15 Jul 2026 17:43:59 +0800
Message-ID: <20260715094359.1452138-1-husong@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_pmd_at() unconditionally calls flush_tlb_all(), a synchronous all-CPU
IPI that flushes the entire TLB and blocks until every CPU finishes.  It
runs on every PMD installation, and is the only LoongArch setter that
flushes -- set_pte(), set_pud() and set_p4d() do a plain store.

The flush is unnecessary: set_p*_at() only writes the entry, and every
caller already invalidates.  vmemmap_set_pmd() writes a pmd_none() slot,
and the THP, rmap, migration, mremap and NUMA-hinting paths all pair the
write with pmdp_invalidate(), pmdp_huge_clear_flush() or flush_tlb_range().

Drop the call, and the now-unused <asm/tlbflush.h> include.

Fixes: 09cfefb7fa70c ("LoongArch: Add memory management")
Co-developed-by: Tao Cui <cuitao@kylinos.cn>
Signed-off-by: Tao Cui <cuitao@kylinos.cn>
Signed-off-by: Song Hu <husong@kylinos.cn>
---
 arch/loongarch/mm/pgtable.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
index 4ee188e38fed..5bff95e3f375 100644
--- a/arch/loongarch/mm/pgtable.c
+++ b/arch/loongarch/mm/pgtable.c
@@ -8,7 +8,6 @@
 #include <asm/fixmap.h>
 #include <asm/pgalloc.h>
 #include <asm/pgtable.h>
-#include <asm/tlbflush.h>
 
 struct page *dmw_virt_to_page(unsigned long kaddr)
 {
@@ -140,7 +139,6 @@ void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 		pmd_t *pmdp, pmd_t pmd)
 {
 	WRITE_ONCE(*pmdp, pmd);
-	flush_tlb_all();
 }
 
 void __init pagetable_init(void)
-- 
2.43.0

