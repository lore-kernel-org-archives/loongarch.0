Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492C331A55E
	for <loongarch@lists.linux.dev>; Fri, 17 Jul 2026 02:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784255884; cv=none; b=NCRI69jmIcHlLiS3DZe++Vi8OHXfHBxQiJp0zslc+1BhFZ7M1DqWV8etx6xo+9wpyFV3phcTu6jO8jF/R+DQ1XNcyw9fIpNMzFNIDrIrDBRE2396GG5xyFlkvTTIwUgwvshy8gOrT5nTa47E7ltEwGCnWHN9hZJizs5vXm66sdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784255884; c=relaxed/simple;
	bh=v3GfzYf6+JjVrBSoaxOkHFo7f94f1turmKkpt4OKwPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k/Pe2tBinAYYtGN4+m3PWki0NcBz1XZT0YYczuUmKh1RzK6uaoDh8WYSP+znm8ux6o0QHD/2t3ejdewa3dSxwMLAnduz8A5bs/I3kqfhQIuoivHJzSaoyxV1GrrWzRw4BbYM8Ao8VhPi9q3mfptnYd3ZTc1soNcoMoCJH8AjtmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8466d362818811f1aa26b74ffac11d73-20260717
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED, SA_EXISTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_GOOD
	CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD
	ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e894a6c8-c070-49d0-8387-ca5954fc4d4e,IP:10,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:35
X-CID-INFO: VERSION:1.3.12,REQID:e894a6c8-c070-49d0-8387-ca5954fc4d4e,IP:10,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:35
X-CID-META: VersionHash:e7bac3a,CLOUDID:c105ae29217813d9f268c0c7b2fe1311,BulkI
	D:260717103758D6VKOR0Z,BulkQuantity:0,Recheck:0,SF:17|19|66|78|102|127|865
	|898,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8466d362818811f1aa26b74ffac11d73-20260717
X-User: husong@kylinos.cn
Received: from ctao-book.. [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1434908498; Fri, 17 Jul 2026 10:37:56 +0800
From: Song Hu <husong@kylinos.cn>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	yangtiezhu@loongson.cn,
	jiaxun.yang@flygoat.com,
	arnd@arndb.de,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Song Hu <husong@kylinos.cn>
Subject: [PATCH] LoongArch: warn when per-CPU TLB vector allocation fails
Date: Fri, 17 Jul 2026 10:37:12 +0800
Message-ID: <20260717023712.1989650-1-husong@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a secondary CPU, setup_tlb_handler() allocates a NUMA-local page
for the per-CPU TLB exception vectors and silently returns if the
allocation fails.  The CPU keeps running on the shared vectors that
configure_exception_vector() installed earlier in per_cpu_trap_init(),
losing NUMA locality with nothing logged.  Warn so the fallback is
observable.

Signed-off-by: Song Hu <husong@kylinos.cn>
---
 arch/loongarch/mm/tlb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
index aaf7d685cc2a..e5220653279c 100644
--- a/arch/loongarch/mm/tlb.c
+++ b/arch/loongarch/mm/tlb.c
@@ -297,8 +297,11 @@ static void setup_tlb_handler(int cpu)
 			return;
 
 		page = alloc_pages_node(cpu_to_node(cpu), GFP_ATOMIC, get_order(vec_sz));
-		if (!page)
+		if (!page) {
+			pr_warn("CPU%d: TLB vector allocation failed; "
+				"using shared vectors\n", cpu);
 			return;
+		}
 
 		addr = page_address(page);
 		pcpu_handlers[cpu] = (unsigned long)addr;
-- 
2.43.0

