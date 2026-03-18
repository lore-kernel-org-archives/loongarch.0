Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FA737AA6F
	for <loongarch@lists.linux.dev>; Wed, 18 Mar 2026 11:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832141; cv=none; b=brNd4R21v3YO2R/ppLie0Y54I20sXLMbQW86NuNUajXbusfqIUJ7j3JTTnVFG4eqKYqtIoWExE+GgbKtbDimLyilD5llrz3E88qWSk0ZijHNtkSU5ihLv2hRHZH7i7GbasJar8FoaMDFKyBI29C32b4ehesdMyUYtcZKaPSRXXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832141; c=relaxed/simple;
	bh=Sg+FPLUmwDhB8zAf3K2hm7oMai6uSGhDNOeJKiECIao=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=XS/SAgff7oSBCIoBF8yd7yX+buRxN2kHTfkrYDUWLMNLflax/D9sjQJK60ENMD8biZ7lwGfl67ZPNiTVPVJv9obELvpLwt4suKByezfT5cfyfiQL+ZyO5Rdfn0gSHd/8zz2XyIAh7fsQrb0UWVX/uF3wuHZ1ka280/I4EnzkInU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d81a024022ba11f1a21c59e7364eecb8-20260318
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:e4a61af1-c273-4b6a-aa28-fd672e785170,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:89c9d04,CLOUDID:564890a783ef0e9feb79c896791cd2bf,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d81a024022ba11f1a21c59e7364eecb8-20260318
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1176601763; Wed, 18 Mar 2026 19:08:51 +0800
From: Li Jun <lijun01@kylinos.cn>
To: chenhuacai@kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lijun01@kylinos.cn
Subject: [PATCH] Loongarch: env: fix missing NULL checks for kstrdup
Date: Wed, 18 Mar 2026 19:08:48 +0800
Message-Id: <20260318110848.2779003-1-lijun01@kylinos.cn>
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

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 arch/loongarch/kernel/env.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
index 841206fde3ab..8d331e4f1c9a 100644
--- a/arch/loongarch/kernel/env.c
+++ b/arch/loongarch/kernel/env.c
@@ -49,6 +49,8 @@ static int __init init_cpu_fullname(void)
 	ret = of_property_read_string(root, "model", &model);
 	if (ret == 0) {
 		cpuname = kstrdup(model, GFP_KERNEL);
+		if (!cpuname)
+			return -ENOMEM;
 		loongson_sysconf.cpuname = strsep(&cpuname, " ");
 	}
 	of_node_put(root);
-- 
2.25.1

