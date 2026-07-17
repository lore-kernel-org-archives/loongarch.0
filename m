Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAD83750CF
	for <loongarch@lists.linux.dev>; Fri, 17 Jul 2026 03:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784258883; cv=none; b=lU+dfJKEDu8Kx20+o1TmaTIKHe4ztbh/q5l1DSbvZVgDbJ7rVQ5cNEwJUlFDoLB2hXOaqvGGvzoRvCzhkMQXC8Ccx8k+EOqul9N4iiWy1ZVFz1wl/prw3qZp3a1qjgQyuYqLMBq2xfzF78Dz42af+aHMDd09bpG0G3KK6BtUcWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784258883; c=relaxed/simple;
	bh=688qOdZO5qTRHmNZD++Vf0ThUov9gtw6SNx/sJTqAvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jZKn9dUSGxe0JtyH3uljcJjrqUstt+Q4c1XsF41UvinoPHK95YzeOpoAWwbzQWBUW3BCQW7pjgbp4vdvxZBbaZUnmcHaBVhwgospBagRO3j4CxdPEKGNn+RWBVH2KL4uyy5WDRv3OyHlOpdAVq1AtQ53QASQL1oe8KHiF4ltlzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 800cb096818f11f1aa26b74ffac11d73-20260717
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_TXT, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED, SA_EXISTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_GOOD
	CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD
	ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:f934ee42-9f08-4529-b43e-65feb3035b57,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.12,REQID:f934ee42-9f08-4529-b43e-65feb3035b57,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:e7bac3a,CLOUDID:5a0e7c2c1c593d0bbe50fad15e7a357f,BulkI
	D:260717112756N64A4KQO,BulkQuantity:0,Recheck:0,SF:17|19|66|78|102|127|865
	|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 800cb096818f11f1aa26b74ffac11d73-20260717
X-User: husong@kylinos.cn
Received: from ctao-book.. [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2051884231; Fri, 17 Jul 2026 11:27:55 +0800
From: Song Hu <husong@kylinos.cn>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	yangtiezhu@loongson.cn,
	jiaxun.yang@flygoat.com,
	arnd@arndb.de,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Song Hu <husong@kylinos.cn>
Subject: [PATCH] LoongArch: align range before sizing in local_flush_tlb_kernel_range
Date: Fri, 17 Jul 2026 11:27:21 +0800
Message-ID: <20260717032721.1993891-1-husong@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

local_flush_tlb_kernel_range() sizes the flush from the unaligned caller
range and aligns start/end only afterwards — the opposite order of its
sibling local_flush_tlb_range(), which aligns first.  Align start/end
first, then size, to match the sibling.

The order matters for unaligned ranges: the original size is derived from
the raw caller range, not the 2-page-aligned range the per-entry invtlb()
loop actually iterates, so it can fall one entry short, and the
tlbsize/8-vs-tlbsize/2 threshold may then pick the per-entry loop when a
full local_flush_tlb_kernel() would be cheaper.

Both strategies flush correctly; the change only makes the sizing heuristic
match the sibling and reflect the real flush count.

Signed-off-by: Song Hu <husong@kylinos.cn>
---
 arch/loongarch/mm/tlb.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
index 4b3d7120da73..a3c90841edbd 100644
--- a/arch/loongarch/mm/tlb.c
+++ b/arch/loongarch/mm/tlb.c
@@ -90,16 +90,13 @@ void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
 	unsigned long size, flags;
 
 	local_irq_save(flags);
-	size = (end - start + (PAGE_SIZE - 1)) >> PAGE_SHIFT;
-	size = (size + 1) >> 1;
+	start &= (PAGE_MASK << 1);
+	end += ((PAGE_SIZE << 1) - 1);
+	end &= (PAGE_MASK << 1);
+	size = (end - start) >> (PAGE_SHIFT + 1);
 	if (size <= (current_cpu_data.tlbsizestlbsets ?
 		     current_cpu_data.tlbsize / 8 :
 		     current_cpu_data.tlbsize / 2)) {
-
-		start &= (PAGE_MASK << 1);
-		end += ((PAGE_SIZE << 1) - 1);
-		end &= (PAGE_MASK << 1);
-
 		while (start < end) {
 			invtlb_addr(INVTLB_ADDR_GTRUE_OR_ASID, 0, start);
 			start += (PAGE_SIZE << 1);
-- 
2.43.0

