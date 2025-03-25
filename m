Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2153C19F12D
	for <loongarch@lists.linux.dev>; Tue, 25 Mar 2025 11:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742900937; cv=none; b=IJfNeaZSxPIrOqypjKEeMzaVtM229ELzipjqBrfKe9pFV5/Hh6nEMJW0QQ9qMwxL5t8sd7gINCGllCRsoahYjLx7Why4BoC0tycxfC25mwuJEsywDjKpWS3WU6Uo1zt+RNAW11XxKEOFEIaxr2VvEVITMEDfczgTHvcryz0HNO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742900937; c=relaxed/simple;
	bh=tbp+YQkAyBmgqVhPRHXTNuXKU6rpvJ/FDYcxbGh/DOA=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=EfAkidaPEt02wrn+QRFxtoP2t03NIScubQ2RT6u6fO+qXWk4fknhLgd2GZGo4K8F0tNQAZOyMH7ndP5mOgwPfeJEidNhv/hzQH4uzgEVGgCzO3qrd7Im0IpxZZpmLLXBO6blTJWo9iVSDRobuB5a4w+k4h3FP8318UZB95tDQcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZMRxb52Cmz5CjSR;
	Tue, 25 Mar 2025 19:08:51 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 52PB8eZJ081159;
	Tue, 25 Mar 2025 19:08:40 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid31;
	Tue, 25 Mar 2025 19:08:44 +0800 (CST)
Date: Tue, 25 Mar 2025 19:08:44 +0800 (CST)
X-Zmail-TransId: 2afa67e28ebc0a1-6c044
X-Mailer: Zmail v1.0
Message-ID: <20250325190844051uFjo0CxrlPVQEpKrtPO_0@zte.com.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <chenhuacai@kernel.org>
Cc: <kernel@xen0n.name>, <loongarch@lists.linux.dev>
Subject: =?UTF-8?B?W1BBVENIIGxvb25nYXJjaC1uZXh0XSBMb29uZ0FyY2g6IG1ha2UgeG9yX3RlbXBsYXRlLmMgaW5jbHVkZSBvbmNl?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 52PB8eZJ081159
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E28EC3.001/4ZMRxb52Cmz5CjSR

From: Ye Xingchen <ye.xingchen@zte.com.cn>

The line #include "xor_template.c" has been added twice in the file.
Modifying it to include the file once and control the logic with macros,
would likely improve code readability.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 arch/loongarch/lib/xor_simd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/lib/xor_simd.c b/arch/loongarch/lib/xor_simd.c
index 84cd24b728c4..64bb32e526b9 100644
--- a/arch/loongarch/lib/xor_simd.c
+++ b/arch/loongarch/lib/xor_simd.c
@@ -6,6 +6,9 @@
  */

 #include "xor_simd.h"
+#if defined(CONFIG_CPU_HAS_LSX) || defined(CONFIG_CPU_HAS_LASX)
+#include "xor_template.c"
+#endif

 /*
  * Process one cache line (64 bytes) per loop. This is assuming all future
@@ -45,7 +48,6 @@
 	ST(3, base, 48)

 #define XOR_FUNC_NAME(nr) __xor_lsx_##nr
-#include "xor_template.c"

 #undef LD
 #undef ST
@@ -80,7 +82,6 @@
 	ST(1, base, 32)

 #define XOR_FUNC_NAME(nr) __xor_lasx_##nr
-#include "xor_template.c"

 #undef LD
 #undef ST
-- 
2.25.1
