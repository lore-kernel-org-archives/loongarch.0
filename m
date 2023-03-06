Received: from hust.edu.cn (unknown [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C14D300
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 03:31:37 +0000 (UTC)
Received: from localhost.localdomain ([172.16.0.254])
	(user=dzm91@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 3263VUUW023949-3263VUUZ023949
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 6 Mar 2023 11:31:34 +0800
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: loongarch@lists.linux.dev, Dongliang Mu <dzm91@hust.edu.cn>
Subject: [PATCH v3] drivers: loongson: fix memory leak in loongson2_guts_probe
Date: Mon,  6 Mar 2023 11:28:54 +0800
Message-Id: <20230306032854.254700-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: dzm91@hust.edu.cn

drivers/soc/loongson/loongson2_guts.c:150 loongson2_guts_probe()
warn: 'guts->regs' from ioremap() not released on lines: 131,135,139,143.

Fix this by modifying ioremap to devm_ioremap.

Note that, this patch is not tested due to the loongson architecture.

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
v2->v3: change res->end - res->start + 1 to resource_size(res)
v1->v2: instead of modifying error handling code, directly change
ioremap to devm_ioremap.
---
 drivers/soc/loongson/loongson2_guts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/loongson/loongson2_guts.c b/drivers/soc/loongson/loongson2_guts.c
index bace4bc8e03b..ffee5a55a985 100644
--- a/drivers/soc/loongson/loongson2_guts.c
+++ b/drivers/soc/loongson/loongson2_guts.c
@@ -107,7 +107,7 @@ static int loongson2_guts_probe(struct platform_device *pdev)
 	guts->little_endian = of_property_read_bool(np, "little-endian");
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	guts->regs = ioremap(res->start, res->end - res->start + 1);
+	guts->regs = devm_ioremap(dev, res->start, resource_size(res));
 	if (IS_ERR(guts->regs))
 		return PTR_ERR(guts->regs);
 
-- 
2.39.2

