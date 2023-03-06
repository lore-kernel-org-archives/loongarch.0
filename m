Received: from hust.edu.cn (unknown [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F9717D2
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 02:55:50 +0000 (UTC)
Received: from localhost.localdomain ([172.16.0.254])
	(user=dzm91@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 3262thtC003642-3262thtF003642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 6 Mar 2023 10:55:47 +0800
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, loongarch@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] drivers: loongson: fix memory leak in loongson2_guts_probe
Date: Mon,  6 Mar 2023 10:53:07 +0800
Message-Id: <20230306025308.248987-1-dzm91@hust.edu.cn>
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
v1->v2: instead of modifying error handling code, directly change
ioremap to devm_ioremap.
 drivers/soc/loongson/loongson2_guts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/loongson/loongson2_guts.c b/drivers/soc/loongson/loongson2_guts.c
index bace4bc8e03b..a053e3fdae09 100644
--- a/drivers/soc/loongson/loongson2_guts.c
+++ b/drivers/soc/loongson/loongson2_guts.c
@@ -107,7 +107,7 @@ static int loongson2_guts_probe(struct platform_device *pdev)
 	guts->little_endian = of_property_read_bool(np, "little-endian");
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	guts->regs = ioremap(res->start, res->end - res->start + 1);
+	guts->regs = devm_ioremap(dev, res->start, res->end - res->start + 1);
 	if (IS_ERR(guts->regs))
 		return PTR_ERR(guts->regs);
 
-- 
2.39.2

