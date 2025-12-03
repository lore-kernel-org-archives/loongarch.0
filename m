Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEE42DE70A
	for <loongarch@lists.linux.dev>; Wed,  3 Dec 2025 09:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.248.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754160; cv=none; b=P21dVlM16IsZPwZ1feskz7x4INCqQOs7x/ojg6IpESPSFuyXqdg1xyXTXCr0K0g6L/LLWLsdkA6JxsG+wc8JfwSrjIabx+IVD/INywZgY07atuk5pD23oVX5kbXu4CZziXEzIROnTdGytv1oB6W2wnud/mMoTFI+gvky2wCSJKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754160; c=relaxed/simple;
	bh=2N8qCjFQaIsU0MrRGphoFMRq1zSU1DU6vHOGj82AGMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JbBrLPLvkVA/iQ+M0z8v88vnvNkQudsW0gDtqYP9pi0oq2wLMxswQfZpfhOpaQOwQ+rERWOm+o1izooECRvSOkqvMor0eZnVnwfuwkaUa0NUzJz9DItX1Ji8xCmJxyYDg8H1R7dmQgXaNhQetAg/VE4ezVilW+Q87hU+CmdLRcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=uG42TKqf; arc=none smtp.client-ip=159.100.248.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="uG42TKqf"
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.155])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 84BB8260DD
	for <loongarch@lists.linux.dev>; Wed,  3 Dec 2025 09:29:15 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id F364B20308;
	Wed,  3 Dec 2025 09:29:07 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 693E3403E3;
	Wed,  3 Dec 2025 09:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1764754145; bh=2N8qCjFQaIsU0MrRGphoFMRq1zSU1DU6vHOGj82AGMo=;
	h=From:To:Cc:Subject:Date:From;
	b=uG42TKqfIGFxs5aLLNBMMysG6YipDW530R5Tbx2g3jManEnm8r+cBNlKmVm7uUxzo
	 IaKFcB/x6tmxTDgk6RuM+uMidvqIyIQ9ne77WopHyo4lxO0YMNAXUjECW2hHJTZQbB
	 4FGkHqjF/co92ps+PtCcAMFrVd+WGZt1QKbj0CLg=
Received: from avenger-XINGYAO-Series (unknown [39.144.78.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 521B8407D7;
	Wed,  3 Dec 2025 09:28:54 +0000 (UTC)
From: WangYuli <wangyuli@aosc.io>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	willy@infradead.org,
	bjorn@rivosinc.com,
	agordeev@linux.ibm.com,
	zhangtianyang@loongson.cn,
	apopple@nvidia.com,
	thuth@redhat.com,
	linmag7@gmail.com,
	wangyuli@aosc.io,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	WangYuli <wangyl5933@chinaunicom.cn>
Subject: [PATCH] LoongArch: Use __pmd() helper for __swp_entry_to_pmd()
Date: Wed,  3 Dec 2025 17:28:49 +0800
Message-ID: <20251203092849.130284-1-wangyuli@aosc.io>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 693E3403E3
X-Rspamd-Server: nf2.mymailcheap.com
X-Spamd-Result: default: False [0.90 / 10.00];
	MID_CONTAINS_FROM(1.00)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[wangyl5933.chinaunicom.cn:server fail];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,infradead.org,rivosinc.com,linux.ibm.com,loongson.cn,nvidia.com,redhat.com,gmail.com,aosc.io,lists.linux.dev,vger.kernel.org,chinaunicom.cn];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

From: WangYuli <wangyl5933@chinaunicom.cn>

The __pmd() helper macro provides the correct initialization syntax
and abstraction for the pmd_t type.

Fix follow warning on gcc-15 under specific configs [1] :

  In file included from ./include/linux/pgtable.h:6,
                   from ./include/linux/mm.h:31,
                   from ./include/linux/pagemap.h:8,
                   from arch/loongarch/mm/init.c:14:
  ./include/linux/swapops.h: In function ‘swp_entry_to_pmd’:
  ./arch/loongarch/include/asm/pgtable.h:302:34: error: missing braces around initializer [-Werror=missing-braces]
    302 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
        |                                  ^
  ./include/linux/swapops.h:559:16: note: in expansion of macro ‘__swp_entry_to_pmd’
    559 |         return __swp_entry_to_pmd(arch_entry);
        |                ^~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

[1]. https://download.01.org/0day-ci/archive/20251119/202511190316.luI90kAo-lkp@intel.com/config

Signed-off-by: WangYuli <wangyl5933@chinaunicom.cn>
---
 arch/loongarch/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 03fb60432fde..4e09f7e8bbec 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -299,7 +299,7 @@ static inline pte_t mk_swap_pte(unsigned long type, unsigned long offset)
 #define __pte_to_swp_entry(pte) ((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 #define __pmd_to_swp_entry(pmd) ((swp_entry_t) { pmd_val(pmd) })
-#define __swp_entry_to_pmd(x)	((pmd_t) { (x).val | _PAGE_HUGE })
+#define __swp_entry_to_pmd(x)	__pmd((x).val | _PAGE_HUGE)
 
 static inline bool pte_swp_exclusive(pte_t pte)
 {
-- 
2.51.0

