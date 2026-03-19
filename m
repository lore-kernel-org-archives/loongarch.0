Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C798399011
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 05:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773899900; cv=none; b=pamkvN+xnwVrpwPLdUG3sDwD3/CIlseQ+SApw2FhuYZ16PrzH/xyVjHPkeBty+TwY5A6/F+SEB+lHWdaaq2VkRj1DbcdsgaMCvBemalmfzvt4VYcW5lwc6WEwjusAbsA2/u9tDDsC8KkT6lgXgWTLv/pdtRcGyUupQ+qpZ0eAhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773899900; c=relaxed/simple;
	bh=chqpIEeO9giAalpM5qpeZ96z69Yj3pWsLbOzd4I38pc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=rxYrnY3kokz9nv7d+Gz/ub/RRRVD0tLteYDf5Ju5luW83xmggeXb5pmjSXyOa3LiPraCBD7PfLnNzimtCgcSIqei4JOT82wYbvlgo6VIe7WLDp75knejd8gNmT9wMkrIst6ifwDlwZRMEJfv1hiCLGk3jxYTc+laNAhDQdafnbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9ba07d64235811f1a21c59e7364eecb8-20260319
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:02e35328-799f-4286-bdaf-a4ad7cc8024c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:7f257c5a75804d8fa4d269a7dfa215cc,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9ba07d64235811f1a21c59e7364eecb8-20260319
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 327897219; Thu, 19 Mar 2026 13:58:10 +0800
From: Li Jun <lijun01@kylinos.cn>
To: chenhuacai@kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lijun01@kylinos.cn
Subject: [PATCH v3] Loongarch: env: fix missing NULL checks for kstrdup
Date: Thu, 19 Mar 2026 13:58:01 +0800
Message-Id: <20260319055801.4187615-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1.Replacing `of_find_node_by_path("/")` with `of_root` avoids multiple
calls to `of_node_put()`.
2.Fixes potential kernel oops during early boot when memory
allocation fails while parsing CPU model from device tree.

--Replacing `of_find_node_by_path("/")` with `of_root`,
Fix missing NULL checks.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 arch/loongarch/kernel/env.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
index 841206fde3ab..2afc9b09f139 100644
--- a/arch/loongarch/kernel/env.c
+++ b/arch/loongarch/kernel/env.c
@@ -15,6 +15,7 @@
 #include <asm/loongson.h>
 #include <asm/setup.h>
 #include <asm/time.h>
+#include <linux/of.h>
 
 u64 efi_system_table;
 struct loongson_system_configuration loongson_sysconf;
@@ -42,16 +43,15 @@ static int __init init_cpu_fullname(void)
 	int cpu, ret;
 	char *cpuname;
 	const char *model;
-	struct device_node *root;
 
 	/* Parsing cpuname from DTS model property */
-	root = of_find_node_by_path("/");
-	ret = of_property_read_string(root, "model", &model);
+	ret = of_property_read_string(of_root, "model", &model);
 	if (ret == 0) {
 		cpuname = kstrdup(model, GFP_KERNEL);
+		if (!cpuname)
+			return -ENOMEM;
 		loongson_sysconf.cpuname = strsep(&cpuname, " ");
 	}
-	of_node_put(root);
 
 	if (loongson_sysconf.cpuname && !strncmp(loongson_sysconf.cpuname, "Loongson", 8)) {
 		for (cpu = 0; cpu < NR_CPUS; cpu++)
-- 
2.34.1

