Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926603812E4
	for <loongarch@lists.linux.dev>; Thu, 21 May 2026 06:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779344807; cv=none; b=K8kkmV/1VS3YzDETGd0J0Lu7C5GZwQMdxqDX72wo4M37u2RGpIyTk0/FCiy2S9TQL8mJBLBuOc3eVd6uSJ22qFT8eZ/8RpLCHyUDOamLJm16+rARXZSuzjVipl8YIDVtuhOW8PLHkQWv5a4Lw4lhuAHftx97myd8YiNvHlbJVDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779344807; c=relaxed/simple;
	bh=52k9hWVIoG0lg2BOay7c/oJnbtIbRhlwpKhfltLrghs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qsq5dOPx/TGNiIEE7KDkglwOAs17hCN72KZPbFHT30KdyRlAtfE3f62VFl38ZjEWsadgYD06YmmvtBuV5ta9k9vZEHK4ZzUMbSCXOPYHTToy1dnzXPeWPgFRQB/NkFfySHoWj77MMcMipb7rPTTfJ2TIrFjo+UKDgeD18ZKuLQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Nd65KAle; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Nd65KAle"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779344803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MppCV6/Zn4Jf3ikj5oSLg+V1TZEWQlhrDiHV9yvOb2M=;
	b=Nd65KAle9ezEInetE8EWIrD7GzXhSZC0U0UCkob2mD68DfEVE+bhF/XNiv/U3c26BMsDbY
	rDIF7Qo5IsJdAmhYxD80LKv/qz+jPcCytKpdCX4uSWfrNgTKwqVVn8uAxfEM9TMKdx/ckv
	Gou5SKZebgrTeQ3cnQWmvDqRdd85UGw=
From: George Guo <dongtai.guo@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev
Cc: WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>,
	Kexin Liu <liukexin@kylinos.cn>
Subject: [PATCH 1/8] LoongArch: Add missing linux/mm.h include in asm/io.h
Date: Thu, 21 May 2026 14:26:31 +0800
Message-Id: <20260521062631.51517-1-dongtai.guo@linux.dev>
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

