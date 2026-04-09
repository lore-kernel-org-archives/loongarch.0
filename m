Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6512F84F
	for <loongarch@lists.linux.dev>; Thu,  9 Apr 2026 04:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775708649; cv=none; b=rnQbDQxPGJc4O667anRVemb2Z2GPJs5vPHECBa0/4kkm6TlaXEYEFHdmk6gru8/MCKxTiK+yQOlmQEXATScHOvT6Ua00C2SFT3jmqfOPakin8EGLPm9gj30Gd44y5mLAGY++zFP/EmibLFaJlVT2VY212+bkEZJyZmHy4GwqeaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775708649; c=relaxed/simple;
	bh=O2TBl9/F9QCWB8dL1Px8FJ7KdpEqPDnn1M/OBUajS+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E9u9JBC/TOST+YgrflxErkmn60TLYqet7gas1NYRbrEW+xAWsBWNkN/bXquM4fay0zu60xgavBkhHnRvsOESaaJDD83/wQkOrarM85+WYmiQ4Ro/pI3diIU77e1Zdi8D+0/sSXjcie1ZFQX8KgthV6jlKBN1eBsoLvo/x3AZzz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ea5df9d033cb11f1aa26b74ffac11d73-20260409
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD
	CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD
	ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:6da24446-4f0d-4cdc-91a2-e09537b56fcf,IP:10,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:30
X-CID-INFO: VERSION:1.3.12,REQID:6da24446-4f0d-4cdc-91a2-e09537b56fcf,IP:10,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:30
X-CID-META: VersionHash:e7bac3a,CLOUDID:d9b80d344fb65b2905451076bad620ec,BulkI
	D:260409122354851ED758,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102|127|
	898,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:n
	il,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ea5df9d033cb11f1aa26b74ffac11d73-20260409
X-User: cuitao@kylinos.cn
Received: from ctao-book.. [(183.242.174.22)] by mailgw.kylinos.cn
	(envelope-from <cuitao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1690909396; Thu, 09 Apr 2026 12:23:52 +0800
From: cuitao <cuitao@kylinos.cn>
To: zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org,
	loongarch@lists.linux.dev
Cc: kernel@xen0n.name,
	cuitao <cuitao@kylinos.cn>
Subject: [PATCH] LoongArch/KVM: Use CSR_CRMD_PLV instead of CSR_PRMD_PPLV in kvm_arch_vcpu_in_kernel
Date: Thu,  9 Apr 2026 12:22:55 +0800
Message-ID: <20260409042255.31338-1-cuitao@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function reads LOONGARCH_CSR_CRMD but uses CSR_PRMD_PPLV to
extract the privilege level. While both masks have the same value
(0x3), CSR_CRMD_PLV is the semantically correct constant for CRMD.

Signed-off-by: cuitao <cuitao@kylinos.cn>
---
 arch/loongarch/kvm/vcpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 831f381a8fd1..ed2cfcd76f60 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -402,7 +402,7 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 	val = gcsr_read(LOONGARCH_CSR_CRMD);
 	preempt_enable();
 
-	return (val & CSR_PRMD_PPLV) == PLV_KERN;
+	return (val & CSR_CRMD_PLV) == PLV_KERN;
 }
 
 #ifdef CONFIG_GUEST_PERF_EVENTS
-- 
2.43.0

