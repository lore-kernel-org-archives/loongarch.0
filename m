Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7083C0B
	for <loongarch@lists.linux.dev>; Mon, 12 Aug 2024 05:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723440640; cv=none; b=JUTCBY9FbMJIFFVMiOOxee/0c5e7vLYmaPrWK6SfmrRNSibFjdxjo3ji9ahYP3DxS6t/cQRaR6HJBZTjQqAcbCT5JAjJgUhOaCa4cccJtTXW6ht693rdw61ENpRe0qJ066cJjS18DCVvaqFgd0fbY5G/4y5f54CUEKNNr9diBbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723440640; c=relaxed/simple;
	bh=aS4E6Mr1MFa26I+g1Uu/BligimbkAX7BCzX3Jd7Vu48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=b+JgddUK0mfiV6D21f7STTmk5D7PmIA4WQ/hNuVFmibTJ0N94kZnccXGkpyEu+u/5GsYpXxp/P3XtKzO5tVkw1V4lH2XKiDzjx/TFktWblmFeOKWDC3Gtj4dAP1e45Z1Y/0ndxM14vlo4uCNl4Q1Oz5rmhFXHADH8kfTSdecqpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNOHrpfM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNOHrpfM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18F1AC4AF09;
	Mon, 12 Aug 2024 05:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723440640;
	bh=aS4E6Mr1MFa26I+g1Uu/BligimbkAX7BCzX3Jd7Vu48=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=FNOHrpfMYzTOalngxqLBeb47XlGm76Qw/mMiJV18fU0ybIRTgLNPXRweN2J1LYDdg
	 Xeu739JvESvjaqizVjxrElLQO5PKvT5I6a4sk8WT8G8OrNLLDbX9No3pOG7e0+HK7H
	 CQ52JcdZRvT1fFv4EVmwhyEjFZjWPnXgziwwKU0ygQpCcDHCBaiYUL2m9znNJN0IwU
	 Due4F4WXjjeep3CgmY3mY1vthv7UmP1K8epCK1zVd6eRQuT6J6BhVrXZCIg9tSQYiY
	 Jkgmd1ihcY1OBlyDZm5EvHUvAkdFXpkQ6cZ0efquc4RjJnzmIo4NdPHb6yLecEjQCL
	 576vj2bH+e3xQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFEEC52D7C;
	Mon, 12 Aug 2024 05:30:40 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Mon, 12 Aug 2024 13:30:37 +0800
Subject: [PATCH] loongarch/dma: remove dma-direct.h
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240812-clean-dma-direct-v1-1-cbe19c2b73f5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPyduWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDC0Mj3eSc1MQ83ZTcRN2UzKLU5BJdo9TUNOPkJINkSwtzJaC2gqLUtMw
 KsJHRsbW1AEdLvUBiAAAA
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Jianmin Lv <lvjianmin@loongson.cn>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev, 
 Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430;
 i=shankerwangmiao@gmail.com; h=from:subject:message-id;
 bh=6+YGYrlc1s/mmh+MsuZbrcYqupZV/j2oMwcFLa6zqMk=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBmuZ3+mRWGBIf0jdhKntVHYO875ENqpkMxjjRQf
 ZhfS45W8TKJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCZrmd/gAKCRCwMePKe/7Z
 bsM+D/94iBrxkvEVKmvMN7GD819XS7krOrwW37ut6PkOAnwAzn2nT/fMJtSr4I5RLe7AGifGG1a
 LTHeN2QCtj+qRfYMKDek0IjBItXliuBRfjEsPteJ9ofWAdL+l6atIxArD+9ikm3BESTekK8a7Kx
 Fajfaz+vuC6B5yMJj4DDKvRhqbPTUp82zPCRh39Bh2QCvpmi32RZvaMulZvlWcRhClrsQUCZGsA
 vfTo2P6LNFfWVrBE3jYszBlpJUwre9aFFA1+6XL0Q0KDTzFNXjFv71psjR2yPQhUmyWI4NfOBqr
 r0Ls6sYeSVlmAqlC0XNQq+mFrbl0hQysiUnXfjo/sty6oxnvM+cYBpKV1mAaj333HbYccGA5fey
 Ma7Cp5LVleTKq/YxX1pYdtDr+WlmCM0SDPRDzbnEBrCcNoiKKly3bzQRY8ZDsMlyopRGzkIn5CO
 qNJ2Q9rAMSmXtDtvF3sVMnfkSGG05RSYrtN+K0cDabLBrsW/5emxkhQ+lThlrvU4f42HboZHkkR
 lppLCZbZk5v8xoTDINzwOhrfRxHQcPXjucdxjG7Fq/AsMmfv/XS08CNPuGoqDWjU1zMOfatBcy1
 xoOmzGmjDhR1TazL0E2Sq7mJJSXEZVVp4Hg4MKFDTmk9dTzoX5oeFd6hsoBBkwmIofMDgOFnID0
 VscBwHeEtRpiREA==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/default with
 auth_id=189
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

From: Miao Wang <shankerwangmiao@gmail.com>

dma-direct.h is introduced in commit d4b6f1562a3c ("LoongArch:
Add Non-Uniform Memory Access (NUMA) support"). In commit
c78c43fe7d42 ("LoongArch: Use acpi_arch_dma_setup() and remove
ARCH_HAS_PHYS_TO_DMA"), ARCH_HAS_PHYS_TO_DMA was deselected and
the coresponding phys_to_dma and dma_to_phys functions were
removed. However, the unused dma-direct.h was left behind,
which is removed by this patch.

Fixes: c78c43fe7d42 ("LoongArch: Use acpi_arch_dma_setup() and remove ARCH_HAS_PHYS_TO_DMA")
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 arch/loongarch/include/asm/dma-direct.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/loongarch/include/asm/dma-direct.h b/arch/loongarch/include/asm/dma-direct.h
deleted file mode 100644
index 75ccd808a2af..000000000000
--- a/arch/loongarch/include/asm/dma-direct.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
- */
-#ifndef _LOONGARCH_DMA_DIRECT_H
-#define _LOONGARCH_DMA_DIRECT_H
-
-dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr);
-phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr);
-
-#endif /* _LOONGARCH_DMA_DIRECT_H */

---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240812-clean-dma-direct-2eef3cb0c987

Best regards,
-- 
Miao Wang <shankerwangmiao@gmail.com>


