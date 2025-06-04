Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3671A202C52
	for <loongarch@lists.linux.dev>; Wed,  4 Jun 2025 06:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749020232; cv=none; b=aIRR6ZBPfNjXQi8d34VJi2pfSEUy6J9NQY2efdUA9qpKhioWOYHbkE6wLjhLNqDWMQIKD9a3m/kdSucW2rFNG45pcq3+rC/FPpN5zsgOGyw6ubuhZhKZZeLtdqNHmaSofREhF1eYw5mmHoSidn6GMVbL07PuZySfAX7VjucIJ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749020232; c=relaxed/simple;
	bh=S17op3CcLtmbgr984yp6eQmqX9QGNkAEXzVr9EbmWLU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=Cqvo0iWo85keo0il9cj0t0neGD+0gPhppJEFEAxDvG3ryhklFTZGPDbwDKMT1ijLF7B0LfjzCk+cFZ4sct5dpgaLf2RaiYSd+fVmbolqYRMDKb5kda+E2qtAjEKJm+rhGsGBsf7DaWjHgmpl9Je43ZHeSaApWvUVYppBhjKOsdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1e493592411111f0b29709d653e92f7d-20250604
X-CTIC-Tags:
	HR_CTE_8B, HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE
	HR_FROM_DIGIT_LEN, HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN
	HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS
	HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED
	DN_TRUSTED, SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI, AMN_C_BU
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:9217b9bb-6ca1-4d19-a0a2-e12070b6fa07,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-30,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-40
X-CID-INFO: VERSION:1.1.45,REQID:9217b9bb-6ca1-4d19-a0a2-e12070b6fa07,IP:0,URL
	:0,TC:0,Content:-5,EDM:-30,RT:0,SF:-5,FILE:0,BULK:0,RULE:EDM_GN8D19FE,ACTI
	ON:release,TS:-40
X-CID-META: VersionHash:6493067,CLOUDID:f68713dc9150c252bea7694da003b173,BulkI
	D:2506041457046A5TZ47X,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102,TC:n
	il,Content:0|50,EDM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-UUID: 1e493592411111f0b29709d653e92f7d-20250604
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 221114284; Wed, 04 Jun 2025 14:57:02 +0800
From: Li Jun <lijun01@kylinos.cn>
To: si.yanteng@linux.dev,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	lijun01@kylinos.cn
Subject: [PATCH v2] loongarch: kgdb: remove unnecessary init variable
Date: Wed,  4 Jun 2025 14:56:47 +0800
Message-Id: <20250604065647.113148-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compiler generates initialization instructions,
which consume additional CPU cycles. the
get_step_address(regs, &addr) should assign a value
to 'error' before it is read.so the var don't need init
to 0.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 arch/loongarch/kernel/kgdb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/kgdb.c b/arch/loongarch/kernel/kgdb.c
index 7be5b4c0c900..df85d6a0dc74 100644
--- a/arch/loongarch/kernel/kgdb.c
+++ b/arch/loongarch/kernel/kgdb.c
@@ -379,10 +379,9 @@ static int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
 
 static int do_single_step(struct pt_regs *regs)
 {
-	int error = 0;
 	unsigned long addr = 0; /* Determine where the target instruction will send us to */
+	int error = get_step_address(regs, &addr);
 
-	error = get_step_address(regs, &addr);
 	if (error)
 		return error;
 
-- 
2.25.1

