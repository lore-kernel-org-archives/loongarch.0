Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89F734BA59
	for <loongarch@lists.linux.dev>; Thu, 18 Sep 2025 06:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758177942; cv=none; b=pCel6fq056rt3kCJbhUZzxQrLkSr33S1OMCIgXDvl0AmFhqHlsw3Dz9vJBkGu/MNPwQxODIGhuhA4xSwxAEJHqVvb3Q1FlnCFKsgN5xpB5Voku+aZk9usZfhHxbgFZQhjpOOgSNa4dA4mfKDcYW8Ud11pV4ghpyWBs/0OiazmaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758177942; c=relaxed/simple;
	bh=ry07lLRBtVrK86Sj9bXvIfrR7zjnMGL6Myb0g7WPmmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TcAUMdr4oMwO86pU480KvNRFBWxsnOoR+tYTbwRh+iHP2lUL2oXoNkT+AX5/VSfsIlYDsI01sO0n3QKlhrTOEdhV4ksaFCMPlWQvTMiCELM+CPgvnwetvyPr2HCPXpxWlO4aQQTmRs8EtFv0hhJd3tzKGGjtxyLD/kxkCujTzak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Sw7azGA5; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Sw7azGA5"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758177938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CyS++uYQ5fKl8dd6aJHmYf0fVhGz10eMabTnwky447o=;
	b=Sw7azGA5vgTylUiJ2TYzPZNNnpP6T0evoE6Wp3Or/j5ERxbVvrclHnvENEvEAX+cFKTeqw
	Jldn7jGl5O92rZZmjg/vBljc/KFMpXlLCLLilRlR57eajNrBy0+o9RHWiy78A9ETxjobR3
	qHMBIRMufGGxFq5lGD30p+cHxlu9W9Y=
From: Jackie Liu <liu.yun@linux.dev>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	loongarch@lists.linux.dev,
	liu.yun@linux.dev
Subject: [PATCH 1/2] loongarch/vdso: add missing NULL check after kcalloc()
Date: Thu, 18 Sep 2025 14:44:47 +0800
Message-ID: <20250918064448.91647-1-liu.yun@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Jackie Liu <liuyun01@kylinos.cn>

The kcalloc() call in init_vdso() allocates memory for code_mapping.pages,
but its return value was not validated before use. This could cause
NULL pointer dereference if allocation fails.

Add a check for the kcalloc() result and return -ENOMEM on failure.

Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 arch/loongarch/kernel/vdso.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
index 7b888d9085a0..088f8095210b 100644
--- a/arch/loongarch/kernel/vdso.c
+++ b/arch/loongarch/kernel/vdso.c
@@ -53,6 +53,8 @@ static int __init init_vdso(void)
 	vdso_info.size = PAGE_ALIGN(vdso_end - vdso_start);
 	vdso_info.code_mapping.pages =
 		kcalloc(vdso_info.size / PAGE_SIZE, sizeof(struct page *), GFP_KERNEL);
+	if (!vdso_info.code_mapping.pages)
+		return -ENOMEM;
 
 	pfn = __phys_to_pfn(__pa_symbol(vdso_info.vdso));
 	for (i = 0; i < vdso_info.size / PAGE_SIZE; i++)
-- 
2.51.0

