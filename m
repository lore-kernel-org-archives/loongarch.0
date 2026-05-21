Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1922826ED46
	for <loongarch@lists.linux.dev>; Thu, 21 May 2026 06:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779345236; cv=none; b=u1Rp2jhlTgjNNu4MpgI/1uMYt25u48MImmRcsS+Q0ZOeaAYJThtg0siQFLcUEsfru38sJYd1jh1TIXz0B+mVvvOGbDWWcmbULHn+7EmVAtbFet/mrMyWdIdGT2ZScn0cWfy+De4NFvmyCtkRCpn3IydYKBUQfQGLirNPYF4N3/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779345236; c=relaxed/simple;
	bh=52k9hWVIoG0lg2BOay7c/oJnbtIbRhlwpKhfltLrghs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mPxHT/LjexgBdWJRGXhKOJCU/QjvxrAxUS1iJ7k7PEsntBFhYrhQPGpDplMe6NfUrSiC/54tRhYDR0Q2DrbbOOyWN/QUcNbuE3+GC0EKXiYnLPfm8KJLcx/dS26Mz8LTd4fYqg0DFLF0OawAyJhFmRLkf4Gzug4qhg310dNESAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KvwYXsGa; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KvwYXsGa"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779345223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MppCV6/Zn4Jf3ikj5oSLg+V1TZEWQlhrDiHV9yvOb2M=;
	b=KvwYXsGaEn8NctG7qb04BM79LlAxX1Zdeqp2YbwoKZJHrn4bfm51yUWlAJKMJ6/Fm6foG8
	BKWcE/4ygBJpUAssXJXoV4T+LcrQRsBqn2yDFCK1EGmmDVZskt8hdUy6Pc8XUymDLpkE3o
	1eck3Vc/2IgPjvSbT6VgmgCb0A2hmrg=
From: George Guo <dongtai.guo@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev
Cc: WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>,
	Kexin Liu <liukexin@kylinos.cn>
Subject: [PATCH 1/1] LoongArch: Add missing linux/mm.h include in asm/io.h
Date: Thu, 21 May 2026 14:33:10 +0800
Message-Id: <20260521063310.52926-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

When CONFIG_KFENCE is enabled, the virt_to_phys() and phys_to_virt()
macros in arch/loongarch/include/asm/io.h expand to use offset_in_page()
and page_address(), both of which are declared in <linux/mm.h>.

Without this include, any translation unit that includes <asm/io.h> and
expands these macros with CONFIG_KFENCE=y will fail to build:

  asm/io.h: error: implicit declaration of function 'offset_in_page'
  asm/io.h: error: implicit declaration of function 'page_address'

Add the missing include to fix these build errors.

Fixes: 0ca84aeaee15 ("LoongArch: Make {virt, phys, page, pfn} translation work with KFENCE")
Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/include/asm/io.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/include/asm/io.h b/arch/loongarch/include/asm/io.h
index 0130185e0349..7ff4aa72a34a 100644
--- a/arch/loongarch/include/asm/io.h
+++ b/arch/loongarch/include/asm/io.h
@@ -13,6 +13,7 @@
 #include <asm/page.h>
 #include <asm/pgtable-bits.h>
 #include <asm/string.h>
+#include <linux/mm.h>
 
 extern void __init __iomem *early_ioremap(phys_addr_t phys_addr, unsigned long size);
 extern void __init early_iounmap(void __iomem *addr, unsigned long size);
-- 
2.25.1

