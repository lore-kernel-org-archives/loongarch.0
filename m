Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DCD13B7AE
	for <loongarch@lists.linux.dev>; Fri, 20 Mar 2026 00:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773967680; cv=none; b=qN+mQZ1lZ+7rBZ32MpOsm47/QxmLou1FNwdsHN72nz2jPNdu+GY5x2UJZUM7oeKh/gnp/Txionw1GNdm86ZBJNTcNpBkTqGcqamsSXOCAYmpivrEOZs8yx+3eRigpyHUwTYX/i+tDmyiHV9Anfcw9JhzQiDMKiKP+aH//uFO1qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773967680; c=relaxed/simple;
	bh=JJP1uTI5YqyipvlNocQT85eLLiIKoV6+cf22QunQ77g=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=ZB9xrpGrF42dUNlB9nzw4p0cSOrs3BUB08jA/61eiSqV3ivZkBPLWe0PvGAINH5OJ5Xbs2fN8OHqkNR2BvaBpfiXjAWuLFjsJVYcvYsF7lVDwF3vgNDhQIkpelMr5eNCIztHuy87bzRYASzWld7sFVHiixipTqVZnEgffmnHsaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6b47a80623f611f1a21c59e7364eecb8-20260320
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:80d328d6-ada2-4d48-88e6-bf85aca3a120,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:89c9d04,CLOUDID:c779df367d5696cb3ab714bd41115998,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6b47a80623f611f1a21c59e7364eecb8-20260320
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 43189593; Fri, 20 Mar 2026 08:47:49 +0800
From: Li Jun <lijun01@kylinos.cn>
To: chenhuacai@kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lijun01@kylinos.cn
Subject: [PATCH v4] LoongArch: env: fix missing NULL checks for kstrdup
Date: Fri, 20 Mar 2026 08:47:25 +0800
Message-Id: <20260320004725.1927073-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes potential kernel oops during early boot when memory
allocation fails while parsing CPU model from device tree.
before return -ENOMEM, of_node_put(root) first.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 arch/loongarch/kernel/env.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
index 841206fde3ab..c586de80027c 100644
--- a/arch/loongarch/kernel/env.c
+++ b/arch/loongarch/kernel/env.c
@@ -49,6 +49,10 @@ static int __init init_cpu_fullname(void)
 	ret = of_property_read_string(root, "model", &model);
 	if (ret == 0) {
 		cpuname = kstrdup(model, GFP_KERNEL);
+		if (!cpuname) {
+			of_node_put(root);
+			return -ENOMEM;
+		}
 		loongson_sysconf.cpuname = strsep(&cpuname, " ");
 	}
 	of_node_put(root);
-- 
2.25.1

