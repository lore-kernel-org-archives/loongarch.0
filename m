Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA5F1DFDE
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381930; cv=none; b=nIMQbNPWnx1mvmYU/iFMX5FZVj1Z/soF3qjnBplPicckOYB7PveHOep4J6+StxcXSwLa3pL2dyjvJoXKLVsMfOK8SdWZXqEOnHH8PZ+s+GhJTWeDsNaWOt8lGVD0NW5bOqn2HN4jMmc8oVxvI1mEgMY8RCKZ6UGBZKH9uy5JRpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381930; c=relaxed/simple;
	bh=4FCSNyaslpbdYlEyGo1NmAwQItWCARecBXGmGsPlTno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TqQTxyM+UOulTctqpZtccC9yTJu2PD5LrPZn/xBBSmpKr5nCJUAyf+mnQnCVuC4Yaz9EmrwmKp2zKSSR+/Tvx2wZNvY3GtNG7IRELMOiFYkbXB2gnWudwcCVvH8+orWJqo3i96Qy5wQ48XrOiKy6vrnWO8/LsIgN6pHe3yJ5igQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d6664814430311f1aa26b74ffac11d73-20260428
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:448fc7d8-4593-4ee3-9723-4cff25f12ea8,IP:15,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-INFO: VERSION:1.3.12,REQID:448fc7d8-4593-4ee3-9723-4cff25f12ea8,IP:15,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:5
X-CID-META: VersionHash:e7bac3a,CLOUDID:7b844c9b5b6c4e2b723870f29992b540,BulkI
	D:26042821120058RMBHE1,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102|127|
	898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d6664814430311f1aa26b74ffac11d73-20260428
X-User: cuitao@kylinos.cn
Received: from ctao-book.. [(39.156.73.13)] by mailgw.kylinos.cn
	(envelope-from <cuitao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 623717250; Tue, 28 Apr 2026 21:11:58 +0800
From: Tao Cui <cuitao@kylinos.cn>
To: zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org,
	loongarch@lists.linux.dev
Cc: kernel@xen0n.name,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH] LoongArch/KVM: Simplify _kvm_pte_init with memset64
Date: Tue, 28 Apr 2026 21:11:38 +0800
Message-ID: <20260428131138.409698-1-cuitao@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the manual 8x loop unrolling in _kvm_pte_init() with a single
memset64() call.

Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 arch/loongarch/kvm/mmu.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index e104897aa532..5a56dd5dcd4a 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -122,21 +122,7 @@ kvm_pte_t *kvm_pgd_alloc(void)
 
 static void _kvm_pte_init(void *addr, unsigned long val)
 {
-	unsigned long *p, *end;
-
-	p = (unsigned long *)addr;
-	end = p + PTRS_PER_PTE;
-	do {
-		p[0] = val;
-		p[1] = val;
-		p[2] = val;
-		p[3] = val;
-		p[4] = val;
-		p += 8;
-		p[-3] = val;
-		p[-2] = val;
-		p[-1] = val;
-	} while (p != end);
+	memset64(addr, val, PTRS_PER_PTE);
 }
 
 /*
-- 
2.43.0

