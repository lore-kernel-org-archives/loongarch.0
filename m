Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0FF79DC
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 08:33:50 +0000 (UTC)
X-UUID: 945de7dcea5f491fa0c7b85e294a5a7f-20230719
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:d1643b96-a21f-4a4b-a76a-72ceb643f1eb,IP:25,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:5
X-CID-INFO: VERSION:1.1.28,REQID:d1643b96-a21f-4a4b-a76a-72ceb643f1eb,IP:25,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-META: VersionHash:176cd25,CLOUDID:c9f5d58e-7caa-48c2-8dbb-206f0389473c,B
	ulkID:230719161451G039KJPT,BulkQuantity:1,Recheck:0,SF:38|24|17|19|44|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-UUID: 945de7dcea5f491fa0c7b85e294a5a7f-20230719
X-User: lienze@kylinos.cn
Received: from ubuntu.. [(39.156.73.12)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1086783333; Wed, 19 Jul 2023 16:28:19 +0800
From: Enze Li <lienze@kylinos.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	glider@google.com,
	elver@google.com,
	akpm@linux-foundation.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Cc: zhangqing@loongson.cn,
	yangtiezhu@loongson.cn,
	dvyukov@google.com,
	Enze Li <lienze@kylinos.cn>
Subject: [PATCH 3/4] KFENCE: Deferring the assignment of the local variable addr
Date: Wed, 19 Jul 2023 16:27:31 +0800
Message-Id: <20230719082732.2189747-4-lienze@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719082732.2189747-1-lienze@kylinos.cn>
References: <20230719082732.2189747-1-lienze@kylinos.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LoongArch architecture is different from other architectures.
It needs to update __kfence_pool during arch_kfence_init_pool.

This patch modifies the assignment location of the local variable addr
in the kfence_init_pool function to support the case of updating
__kfence_pool in arch_kfence_init_pool.

Signed-off-by: Enze Li <lienze@kylinos.cn>
---
 mm/kfence/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/kfence/core.c b/mm/kfence/core.c
index dad3c0eb70a0..e124ffff489f 100644
--- a/mm/kfence/core.c
+++ b/mm/kfence/core.c
@@ -566,13 +566,14 @@ static void rcu_guarded_free(struct rcu_head *h)
  */
 static unsigned long kfence_init_pool(void)
 {
-	unsigned long addr = (unsigned long)__kfence_pool;
+	unsigned long addr;
 	struct page *pages;
 	int i;
 
 	if (!arch_kfence_init_pool())
-		return addr;
+		return (unsigned long)__kfence_pool;
 
+	addr = (unsigned long)__kfence_pool;
 	pages = virt_to_page(__kfence_pool);
 
 	/*
-- 
2.34.1

