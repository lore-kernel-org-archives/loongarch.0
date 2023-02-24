Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1994917C7
	for <loongarch@lists.linux.dev>; Fri, 24 Feb 2023 03:32:21 +0000 (UTC)
X-UUID: 8c2ad22cf0fa4ca2a04de56038de492e-20230224
X-CPASD-INFO: 5b8c439f5a3b46eb8356621ec6dd3374@frJyg2FlZ5ZhgXWug3mwnFhkaWJWgXO
	fg2eSlF9TjIaMbFJkYl1SgIFqVmprYmBZUHt1bFZgYGJdUXh3lHKPVGFeYIJUdJOAd5xYlGJj
X-CLOUD-ID: 5b8c439f5a3b46eb8356621ec6dd3374
X-CPASD-SUMMARY: SIP:-1,APTIP:-2.0,KEY:0.0,FROMBLOCK:1,OB:1.0,URL:-5,TVAL:197.
	0,ESV:0.0,ECOM:-5.0,ML:14.0,FD:0.0,CUTS:75.0,IP:-2.0,MAL:-5.0,PHF:-5.0,PHC:-5
	.0,SPF:4.0,EDMS:-5,IPLABEL:4992.0,FROMTO:0,AD:0,FFOB:1.0,CFOB:1.0,SPC:0,SIG:-
	5,AUF:7,DUF:16886,ACD:242,DCD:242,SL:0,EISP:0,AG:0,CFC:0.328,CFSR:0.088,UAT:0
	,RAF:0,IMG:-5.0,DFA:0,DTA:0,IBL:-2.0,ADI:-5,SBL:0,REDM:0,REIP:0,ESB:0,ATTNUM:
	0,EAF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: 8c2ad22cf0fa4ca2a04de56038de492e-20230224
X-CPASD-BLOCK: 14
X-CPASD-STAGE: 1
X-UUID: 8c2ad22cf0fa4ca2a04de56038de492e-20230224
X-User: lienze@kylinos.cn
Received: from localhost.localdomain [(210.12.40.82)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1346359212; Fri, 24 Feb 2023 11:27:14 +0800
From: Enze Li <lienze@kylinos.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: loongarch@lists.linux.dev,
	enze.li@gmx.com
Subject: [PATCH] LoongArch: use EXCCODE_INT_START instead of hard coded value
Date: Fri, 24 Feb 2023 11:30:17 +0800
Message-Id: <20230224033017.15653-1-lienze@kylinos.cn>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The for loop in per_cpu_trap_init function use a hard coded length while
setting default exception handler.  Use the proper define instead of
hard coded value.

Signed-off-by: Enze Li <lienze@kylinos.cn>
---
 arch/loongarch/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index de8ebe20b666..7d5784eccf19 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -755,7 +755,7 @@ void per_cpu_trap_init(int cpu)
 
 	/* Initialise exception handlers */
 	if (cpu == 0)
-		for (i = 0; i < 64; i++)
+		for (i = 0; i < EXCCODE_INT_START; i++)
 			set_handler(i * VECSIZE, handle_reserved, VECSIZE);
 
 	tlb_init(cpu);

base-commit: 804f6d04b1adae9602edbd6410c0ba3a556964fe
-- 
2.39.2

