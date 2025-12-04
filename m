Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7FA2FB607
	for <loongarch@lists.linux.dev>; Thu,  4 Dec 2025 02:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.248.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764816343; cv=none; b=uWBImd5dfLzu+7q9trK3Sr2py4UAQOigy88zdzBou4jK5cu2W1PAyzMaVeD5+4ooAY0eHfZZu93jupDuIeA8kCxNygkV3PN60JVYUJlPJWhu5GcEbKKrVRLlZOkX4R4n0nLCbD0/9IIl6l259joItybnv4HBrQIQfc87HBkqd9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764816343; c=relaxed/simple;
	bh=AjjkJ0JFClelZg9/WM6ve4AxRigYzThi+SxNlgx/or4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pC4VZHYGs791+YvtyhAO9fsDPx9kNTJxhbLF7j9cGe04KDMhdIPFzS2Qlx2J5N/lvn610CJ4wXz37T/BLUu259IyFvpFkA9pOnQ0NM3hfu1owXohvvRfkVFfi5L35HtwvFOb3B0YWgBDFM0qLignc/hbnMp4Anahjg6b5nNAE2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=DOHrNcoz; arc=none smtp.client-ip=159.100.248.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="DOHrNcoz"
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.113.132])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id BCEA1260DB
	for <loongarch@lists.linux.dev>; Thu,  4 Dec 2025 02:45:34 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id 5B4143E8BA;
	Thu,  4 Dec 2025 02:45:27 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 26EAA400C6;
	Thu,  4 Dec 2025 02:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1764816325; bh=AjjkJ0JFClelZg9/WM6ve4AxRigYzThi+SxNlgx/or4=;
	h=From:To:Cc:Subject:Date:From;
	b=DOHrNcozMzXqGA9TbcQaRhzY7Oyd5pG/lr76C9+ewvgKEbFbnygTAOMP67T3pOBUJ
	 DfDREIWyAB9D0yYyukQ/Ezt9ZT3H/V6DTqSMntOw6K+Sh90U0fErazpvuLkgUy26Us
	 5XFOP4zTXPq8wluJAG6ZAiApDiPoKuwAQl+sijao=
Received: from avenger-XINGYAO-Series (unknown [39.144.78.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id EF6A741270;
	Thu,  4 Dec 2025 02:45:18 +0000 (UTC)
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
Subject: [PATCH v2] LoongArch: Use __pmd()/__pte() helper for swap entry conversions
Date: Thu,  4 Dec 2025 10:45:12 +0800
Message-ID: <20251204024512.104519-1-wangyuli@aosc.io>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 26EAA400C6
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
	SPFBL_URIBL_EMAIL_FAIL(0.00)[wangyuli.aosc.io:server fail,wangyl5933.chinaunicom.cn:server fail];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,infradead.org,rivosinc.com,linux.ibm.com,loongson.cn,nvidia.com,redhat.com,gmail.com,aosc.io,lists.linux.dev,vger.kernel.org,chinaunicom.cn];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

From: WangYuli <wangyl5933@chinaunicom.cn>

The __pmd() and __pte() helper macros provide the correct initialization
syntax and abstraction for the pmd_t and pte_t types.

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

Also update __swp_entry_to_pte() to use __pte() for consistency.

[1]. https://download.01.org/0day-ci/archive/20251119/202511190316.luI90kAo-lkp@intel.com/config

Signed-off-by: WangYuli <wangyl5933@chinaunicom.cn>
Signed-off-by: WangYuli <wangyuli@aosc.io>
---
Changelog:
 *v1 -> v2: Update __swp_entry_to_pte() to use __pte() for consistency.
---
 arch/loongarch/include/asm/pgtable.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 03fb60432fde..9a7029285fd5 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -297,9 +297,9 @@ static inline pte_t mk_swap_pte(unsigned long type, unsigned long offset)
 #define __swp_offset(x)		((x).val >> 24)
 #define __swp_entry(type, offset) ((swp_entry_t) { pte_val(mk_swap_pte((type), (offset))) })
 #define __pte_to_swp_entry(pte) ((swp_entry_t) { pte_val(pte) })
-#define __swp_entry_to_pte(x)	((pte_t) { (x).val })
+#define __swp_entry_to_pte(x)	__pte((x).val)
 #define __pmd_to_swp_entry(pmd) ((swp_entry_t) { pmd_val(pmd) })
-#define __swp_entry_to_pmd(x)	((pmd_t) { (x).val | _PAGE_HUGE })
+#define __swp_entry_to_pmd(x)	__pmd((x).val | _PAGE_HUGE)
 
 static inline bool pte_swp_exclusive(pte_t pte)
 {
-- 
2.51.0

