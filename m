Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752A73358B0
	for <loongarch@lists.linux.dev>; Tue, 21 Jul 2026 02:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784602561; cv=none; b=mYu5MDrbGELaAdaoozT9m4Jl5cxc0MAG5ilDLAw2vC9rXiSRx6WJT+FRjnxsliXNKZTFw28MHuzdZVszccM3qcLhgrBBsBVZGXCM+TyGztYohJRYGRzF510kuRNuSYBkxlxG1p8l5JTVpH9X0SkDG+jVicmjZkD3fD32Y4MgfgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784602561; c=relaxed/simple;
	bh=5Ucjw3gG/NmLiS2yn0lR2lNbe1xThyQBaO7hYoc2ZQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OXNAHviRecckkurL4Tdxzzk2komsFrKha2uOR+ivR9rBh2bHrvFaJjRFaCZw2EpqM73SDanTd9veAPv9mDIlf3F2hHwO/jjl6ZBZzpJo6Lduw9vN3L3MoKWuC3dvFzHuwgmip8Zitf9MKmks4Pn+pkQCKJt3i+vs9y+edzeplwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: af1a9f6a84af11f1aa26b74ffac11d73-20260721
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_GOOD
	CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD
	ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:1fd5b45e-cb73-4503-b2eb-98e222dc0ca7,IP:10,
	URL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:30
X-CID-INFO: VERSION:1.3.12,REQID:1fd5b45e-cb73-4503-b2eb-98e222dc0ca7,IP:10,UR
	L:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:30
X-CID-META: VersionHash:e7bac3a,CLOUDID:806a809df66dd85953166b513885721f,BulkI
	D:2607211055544XJ56OUS,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102|127|
	850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:
	nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,B
	RE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: af1a9f6a84af11f1aa26b74ffac11d73-20260721
X-User: wangxuewen@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <wangxuewen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1994862755; Tue, 21 Jul 2026 10:55:51 +0800
From: Xuewen Wang <wangxuewen@kylinos.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v1] LoongArch: pci: add NULL check for map_bus return value in loongson_gpu_fixup_dma_hang
Date: Tue, 21 Jul 2026 10:55:36 +0800
Message-Id: <20260721025536.1484464-1-wangxuewen@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The map_bus() callback can return NULL when the target device does not
exist (e.g. non-existent device hidden by FLAG_DEV_HIDDEN, or device > 0
on internal bridges). All other callers in the kernel check the return
value, but loongson_gpu_fixup_dma_hang() uses it directly, leading to a
null pointer dereference via readw(base + PCI_DEVICE_ID).

Add the missing NULL check to prevent the crash.

Fixes: 95db0c9f526d ("LoongArch: Workaround LS2K/LS7A GPU DMA hang bug")
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 arch/loongarch/pci/pci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/loongarch/pci/pci.c b/arch/loongarch/pci/pci.c
index f33c7ea1443d..3cd89b0224e3 100644
--- a/arch/loongarch/pci/pci.c
+++ b/arch/loongarch/pci/pci.c
@@ -115,6 +115,11 @@ static void loongson_gpu_fixup_dma_hang(struct pci_dev *pdev, bool on)
 	static u32 crtc_status[CRTC_NUM_MAX] = { 0 };
 
 	base = pdev->bus->ops->map_bus(pdev->bus, pdev->devfn + 1, 0);
+	if (!base) {
+		pci_dbg(pdev, "cannot map config space for devfn %02x.%d\n",
+			PCI_SLOT(pdev->devfn + 1), PCI_FUNC(pdev->devfn + 1));
+		return;
+	}
 	device = readw(base + PCI_DEVICE_ID);
 
 	regbase = ioremap(readq(base + PCI_BASE_ADDRESS_0) & ~0xffull, SZ_64K);
-- 
2.25.1

