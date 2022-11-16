Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B28F7C
	for <loongarch@lists.linux.dev>; Wed, 16 Nov 2022 00:53:24 +0000 (UTC)
Received: from kwepemi500023.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NBkvl45M9zqSSl;
	Wed, 16 Nov 2022 08:49:23 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemi500023.china.huawei.com
 (7.221.188.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 16 Nov
 2022 08:53:10 +0800
From: Peng Wu <wupeng58@huawei.com>
To: <zhuyinbo@loongson.cn>, <arnd@arndb.de>, <loongarch@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <liwei391@huawei.com>, Peng Wu
	<wupeng58@huawei.com>
Subject: [PATCH -next] soc: loongson: Fix an IS_ERR() vs NULL bug in loongson2_guts_probe()
Date: Wed, 16 Nov 2022 00:51:23 +0000
Message-ID: <20221116005123.81140-1-wupeng58@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500023.china.huawei.com (7.221.188.76)
X-CFilter-Loop: Reflected

The ioremap() function returns NULL on error, it doesn't return
error pointers.

Fixes: b82621ac8450 ("soc: loongson: add GUTS driver for loongson-2 platforms")
Signed-off-by: Peng Wu <wupeng58@huawei.com>
---
 drivers/soc/loongson/loongson2_guts.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/loongson/loongson2_guts.c b/drivers/soc/loongson/loongson2_guts.c
index bace4bc8e03b..52c222b1e6ef 100644
--- a/drivers/soc/loongson/loongson2_guts.c
+++ b/drivers/soc/loongson/loongson2_guts.c
@@ -108,8 +108,8 @@ static int loongson2_guts_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	guts->regs = ioremap(res->start, res->end - res->start + 1);
-	if (IS_ERR(guts->regs))
-		return PTR_ERR(guts->regs);
+	if (!guts->regs)
+		return -ENOMEM;
 
 	/* Register soc device */
 	root = of_find_node_by_path("/");
-- 
2.17.1

