Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EBD4A07
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 00:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773881616; cv=none; b=eFTRFD2nzZRh2v+nsdBfs/l15LWuF2Uty+Efc3xCzG6v7rYOMxjg95aOgmK9cSwJOK0RsVErn/2zXG6Of88TGsJh8yVfHHNQZyGHSIaDp3n5Wru/TfRUqDN4CsGR/ARcLNEujUAHS5v2jPVrNLrEx4rrH8G3fHlXOIfAHkAxKuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773881616; c=relaxed/simple;
	bh=JJP1uTI5YqyipvlNocQT85eLLiIKoV6+cf22QunQ77g=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=Aks6zaUPoPDkDDYfD+rJaPeSMpM04TOf6OkHDVuO45RAN8wev+eAsTJi8YcMl+qXjzjjX/B5D4/ZYhJRsQmJv1w3zEDnMNTmOXtiae+YOhASFPEIBYjBDwjLl95uIMg54Z1Ug9FefxBx6NKrEQrDt2OG1sjGGW5neRWKlCKJKyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0b088d52232e11f1a21c59e7364eecb8-20260319
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:769cf5a6-37ae-4ba3-9a27-5d618ae905b0,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:89c9d04,CLOUDID:b0e3ccb55806fc549742617ffb7e1e88,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0b088d52232e11f1a21c59e7364eecb8-20260319
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1000032683; Thu, 19 Mar 2026 08:53:28 +0800
From: Li Jun <lijun01@kylinos.cn>
To: chenhuacai@kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lijun01@kylinos.cn
Subject: [PATCH v2] Loongarch: env: fix missing NULL checks for kstrdup
Date: Thu, 19 Mar 2026 08:53:26 +0800
Message-Id: <20260319005326.3796676-1-lijun01@kylinos.cn>
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

