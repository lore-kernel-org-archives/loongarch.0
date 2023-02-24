Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D569B7C
	for <loongarch@lists.linux.dev>; Fri, 24 Feb 2023 06:46:28 +0000 (UTC)
X-UUID: 5d4ef8be0cd44d91ab251a451a863f9b-20230224
X-CPASD-INFO: bafa7198a34d4df48b49dd11505f6f5f@q7GggWRkZ2iNU3awg6exbliTZGmUkFG
	Ad2pVlmSWYYaVhH5xTV5nX1V9gnNXZF5dXFV3dnBQYmBhXVJ3i3-XblBgXoZgUZB3saOggWdfaQ==
X-CLOUD-ID: bafa7198a34d4df48b49dd11505f6f5f
X-CPASD-SUMMARY: SIP:-1,APTIP:-2.0,KEY:0.0,FROMBLOCK:1,OB:0.0,URL:-5,TVAL:197.
	0,ESV:0.0,ECOM:-5.0,ML:0.0,FD:0.0,CUTS:88.0,IP:-3.0,MAL:-5.0,PHF:-5.0,PHC:-5.
	0,SPF:4.0,EDMS:-5,IPLABEL:-5.0,FROMTO:0,AD:0,FFOB:0.0,CFOB:0.0,SPC:0,SIG:-5,A
	UF:7,DUF:16915,ACD:243,DCD:243,SL:0,EISP:0,AG:0,CFC:0.289,CFSR:0.096,UAT:0,RA
	F:0,IMG:-5.0,DFA:0,DTA:0,IBL:-5,ADI:-5,SBL:0,REDM:0,REIP:0,ESB:0,ATTNUM:0,EAF
	:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: 5d4ef8be0cd44d91ab251a451a863f9b-20230224
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: 5d4ef8be0cd44d91ab251a451a863f9b-20230224
X-User: lienze@kylinos.cn
Received: from localhost.localdomain [(210.12.40.82)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1557948728; Fri, 24 Feb 2023 14:46:27 +0800
From: Enze Li <lienze@kylinos.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: loongarch@lists.linux.dev,
	enze.li@gmx.com
Subject: [PATCH] LoongArch/syscall: remove asm/unistd.h include from syscall.c
Date: Fri, 24 Feb 2023 14:49:21 +0800
Message-Id: <20230224064921.299908-1-lienze@kylinos.cn>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At first glance, this inclusion looks weird.  After digging further, I
realized that there's no need to include the "asm/unistd.h" file.  I've
tested this patch for a few weeks, and didn't see any regressions.
Therefore, removes the unnecessary inclusion.

Signed-off-by: Enze Li <lienze@kylinos.cn>
---
 arch/loongarch/kernel/syscall.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/kernel/syscall.c b/arch/loongarch/kernel/syscall.c
index 3fc4211db989..4dea411e9e0d 100644
--- a/arch/loongarch/kernel/syscall.c
+++ b/arch/loongarch/kernel/syscall.c
@@ -31,7 +31,6 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len, unsigned long,
 
 void *sys_call_table[__NR_syscalls] = {
 	[0 ... __NR_syscalls - 1] = sys_ni_syscall,
-#include <asm/unistd.h>
 };
 
 typedef long (*sys_call_fn)(unsigned long, unsigned long,

base-commit: 804f6d04b1adae9602edbd6410c0ba3a556964fe
-- 
2.39.2

