Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D12156F28
	for <loongarch@lists.linux.dev>; Fri, 30 May 2025 07:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748588957; cv=none; b=pGfsVqzJ/+rcV1SueBs79A19aLsvn3INxNcxg5gUV8w97R9WmrbnqSVBMbu0Fg8tkQAIDYyudPezr7s/jL9wKhuaWkz5SguwdJZn7jQP0A5VpDDK4QXUKbbR0tjBp93KujkG8156gwC4ybvQ0aaooG+2D5L8R/NzRXYknaXmpXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748588957; c=relaxed/simple;
	bh=B4dKAOSmkc9xbJe8pb7Ueueiq95OG0c68G73Q5oFsUQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=SZwyUl6hkCZ667rEre09maTBABraQroutQV35Kh0HnUGXeYuc/5Jhc/KowlOXoK91+y0vSEK2lA2C3I8wlqyUETcsYMsLB65pp+jb3zyOhmczpRtQC84U4EW4ONqbCox1T83plAzbTxvYH8NTb7PbM85GCE2QeXyuuIb15xwxAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f9402a843d2411f0b29709d653e92f7d-20250530
X-CTIC-Tags:
	HR_CTE_8B, HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE
	HR_FROM_DIGIT_LEN, HR_FROM_NAME, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI
	AMN_C_BU
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:4541a28d-208f-4a46-af6b-d8c5a0d09fe0,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-35
X-CID-INFO: VERSION:1.1.45,REQID:4541a28d-208f-4a46-af6b-d8c5a0d09fe0,IP:0,URL
	:0,TC:0,Content:0,EDM:-30,RT:0,SF:-5,FILE:0,BULK:0,RULE:EDM_GN8D19FE,ACTIO
	N:release,TS:-35
X-CID-META: VersionHash:6493067,CLOUDID:e65950db28b20a51ea520a0ab03589e0,BulkI
	D:250530150907SVYWGRC8,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102,TC:n
	il,Content:0|50,EDM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: f9402a843d2411f0b29709d653e92f7d-20250530
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1226179327; Fri, 30 May 2025 15:09:05 +0800
From: Li Jun <lijun01@kylinos.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	lijun01@kylinos.cn,
	loongarch@lists.linux.dev
Subject: [PATCH] loongarch: kgdb: remove unnecessary init variable
Date: Fri, 30 May 2025 15:09:02 +0800
Message-Id: <20250530070902.410248-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

the get_step_address(regs, &addr) should assign a value
to 'error' before it is read.so the var don't need init
to 0.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 arch/loongarch/kernel/kgdb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/kgdb.c b/arch/loongarch/kernel/kgdb.c
index 7be5b4c0c900..df3c7a5565e9 100644
--- a/arch/loongarch/kernel/kgdb.c
+++ b/arch/loongarch/kernel/kgdb.c
@@ -379,7 +379,7 @@ static int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
 
 static int do_single_step(struct pt_regs *regs)
 {
-	int error = 0;
+	int error;
 	unsigned long addr = 0; /* Determine where the target instruction will send us to */
 
 	error = get_step_address(regs, &addr);
-- 
2.25.1

