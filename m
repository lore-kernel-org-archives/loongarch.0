Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADC74B1E5E
	for <loongarch@lists.linux.dev>; Thu,  8 May 2025 03:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746673522; cv=none; b=hT6HeDUR9PRA71YB+662V2uIadoBuvNKJABo1s70Un+JoALR3Vd8193MAsv1ElLO1SIYvbYvkyyxXqtkSqo8/5cEqX1JJPh6UYMsuCpfGfScxdTQ8yb5tVx/bw9ot7dZdXbcXRmTzStRiN6nPazHVd1iSVWHvALMnB0JoJjP1Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746673522; c=relaxed/simple;
	bh=L1cDpvZc06s6NWVmwHuWIfkw38+yIiZzlrkFuSrr/0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ROs+6Bh1x8WTNP0QmWSekLXiWdsRpxFBN5BYPpmaciVjYoaZGC2M7EoUACvYpx1WoXsSuOeWCKOKtAvupFOzhIFGZr4+jTiRBNQgGiSZdPznRqATIXe+gGVb3dR6bN0V7sdb+w5YYOXTgopfaLjib0MrrUkfXCap2JVz/4Smouc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Mad7vzUS; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Mad7vzUS"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746673513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=38bEnc3/4OdLq1Z5EdhZB16fIN47NEz1fHEWwHyvETc=;
	b=Mad7vzUSGtU+PzDNl1CfFTxnfCS/qzbj25UzghKr9qSqIoC6KApZUnSmQ64eSMy0XITwRG
	MQVN1I/n5uCcuVj+txjQVKWwPnDK4yYBxjfPwu/vtKn9afWbj5moyP6G5EUBzOx+HPErzT
	EfMzAV22SIPBjaKECNEuU3A0fLQFy+g=
From: george <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: rppt@kernel.org,
	akpm@linux-foundation.org,
	dave.hansen@linux.intel.com,
	geert@linux-m68k.org,
	ptesarik@suse.com,
	guoweikang.kernel@gmail.com,
	maobibo@loongson.cn,
	loongarch@lists.linux.dev,
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH 1/1] LoongArch: mm: remove redundant pte occupancy check in __set_fixmap()
Date: Thu,  8 May 2025 11:05:06 +0800
Message-ID: <20250508030506.7076-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

This check could falsely report errors when PTEs are remapped:
arch/loongarch/mm/init.c:204: bad pte 0000000107b601c3.

The check was unnecessary because:
- Fixmap slots are designed to be reusable
- Other architectures (x86/arm64) allow PTE overwrites
- Callers are responsible for proper mapping management

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/mm/init.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index 06f11d9e4ec1..7b7e3b1aa00d 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -200,10 +200,6 @@ void __init __set_fixmap(enum fixed_addresses idx,
 	BUG_ON(idx <= FIX_HOLE || idx >= __end_of_fixed_addresses);
 
 	ptep = populate_kernel_pte(addr);
-	if (!pte_none(ptep_get(ptep))) {
-		pte_ERROR(*ptep);
-		return;
-	}
 
 	if (pgprot_val(flags))
 		set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
-- 
2.34.1

