Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48568362
	for <loongarch@lists.linux.dev>; Wed, 12 Apr 2023 02:57:16 +0000 (UTC)
X-UUID: e5a5ec4fb6e44989b78edb6a082d616c-20230412
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:d3b35364-88ad-4cfa-ab01-9e29b3350cee,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-INFO: VERSION:1.1.22,REQID:d3b35364-88ad-4cfa-ab01-9e29b3350cee,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:8bd706a1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:230412105206DARUS60N,BulkQuantity:0,Recheck:0,SF:38|24|17|19|44|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: e5a5ec4fb6e44989b78edb6a082d616c-20230412
X-User: lienze@kylinos.cn
Received: from localhost.localdomain [(210.12.40.82)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1460695367; Wed, 12 Apr 2023 10:52:03 +0800
From: Enze Li <lienze@kylinos.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: loongarch@lists.linux.dev,
	enze.li@gmx.com,
	lienze@kylinos.cn
Subject: [PATCH] LoongArch: Use VALEN instead of hard code in comments
Date: Wed, 12 Apr 2023 10:55:25 +0800
Message-Id: <20230412025525.116668-1-lienze@kylinos.cn>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refer to the online documentation[1] for Loongson, use the accurate
VALEN in comments to avoid misleading others.

[1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#page-global-directory-base-address-for-lower-half-address-space

Signed-off-by: Enze Li <lienze@kylinos.cn>
---
 arch/loongarch/include/asm/loongarch.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 65b7dcdea16d..a182a1579148 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -423,9 +423,9 @@ static __always_inline void iocsr_write64(u64 val, u32 reg)
 #define  CSR_ASID_ASID_WIDTH		10
 #define  CSR_ASID_ASID			(_ULCAST_(0x3ff) << CSR_ASID_ASID_SHIFT)
 
-#define LOONGARCH_CSR_PGDL		0x19	/* Page table base address when VA[47] = 0 */
+#define LOONGARCH_CSR_PGDL		0x19	/* Page table base address when VA[VALEN-1] = 0 */
 
-#define LOONGARCH_CSR_PGDH		0x1a	/* Page table base address when VA[47] = 1 */
+#define LOONGARCH_CSR_PGDH		0x1a	/* Page table base address when VA[VALEN-1] = 1 */
 
 #define LOONGARCH_CSR_PGD		0x1b	/* Page table base */
 

base-commit: fc89d7fb499b0162e081f434d45e8d1b47e82ece
-- 
2.39.2

