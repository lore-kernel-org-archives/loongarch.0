Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99001C31
	for <loongarch@lists.linux.dev>; Thu, 30 Mar 2023 10:08:13 +0000 (UTC)
X-UUID: 95c3d5d40b12449182a0fc47d5634a4b-20230330
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:35947b3a-dbc1-498b-8dc5-b37239c5f76f,IP:-32
	768,URL:-32768,TC:-32768,Content:-32768,EDM:-32768,RT:-32768,SF:-32768,FIL
	E:-32768,BULK:-32768,RULE:Release_Ham,ACTION:release,TS:0
X-CID-INFO: VERSION:1.1.22,REQID:35947b3a-dbc1-498b-8dc5-b37239c5f76f,IP:-3276
	8,URL:-32768,TC:-32768,Content:-32768,EDM:-32768,RT:-32768,SF:-32768,FILE:
	-32768,BULK:-32768,RULE:Release_Ham,ACTION:release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:nil,BulkID:nil,BulkQuantity:0,Recheck:
	0,SF:nil,TC:nil,Content:nil,EDM:nil,IP:nil,URL:nil,File:nil,Bulk:nil,QS:ni
	l,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 95c3d5d40b12449182a0fc47d5634a4b-20230330
X-User: lienze@kylinos.cn
Received: from localhost.localdomain [(210.12.40.82)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 798352864; Thu, 30 Mar 2023 16:47:40 +0800
From: Enze Li <lienze@kylinos.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	enze.li@gmx.com,
	lienze@kylinos.cn
Subject: [PATCH] LoongArch: undefine pr_define macro when it's appropriate
Date: Thu, 30 Mar 2023 16:50:59 +0800
Message-Id: <20230330085059.761204-1-lienze@kylinos.cn>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's a macro definition that is only used within the
output_pgtable_bits_defines function.  We don't need to spread this
macro elsewhere.  Therefore, it should be undefined when appropriate.

Signed-off-by: Enze Li <lienze@kylinos.cn>
---
 arch/loongarch/mm/tlb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
index 8bad6b0cff59..99f607afaf80 100644
--- a/arch/loongarch/mm/tlb.c
+++ b/arch/loongarch/mm/tlb.c
@@ -248,6 +248,7 @@ static void output_pgtable_bits_defines(void)
 	pr_define("_PAGE_NO_EXEC_SHIFT %d\n", _PAGE_NO_EXEC_SHIFT);
 	pr_define("_PFN_SHIFT %d\n", _PFN_SHIFT);
 	pr_debug("\n");
+#undef pr_define
 }
 
 #ifdef CONFIG_NUMA

base-commit: fc89d7fb499b0162e081f434d45e8d1b47e82ece
-- 
2.34.1

