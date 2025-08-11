Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AA12DCF78
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 09:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904497; cv=none; b=Fn6YMY7kmjrCIKaqCUI9gRn0MWikAhwxV9kl76u/AjiEecvPlTa2q3AkQNwRZRohh1CXhXEPMPr3w/QTqPuY9dF6H9g1p2neDzTnK9JOT7iTH3yFfZSyGv3VuVq2K9cXuWWgU589bEwrZzJMKoyeHyc6k4H2k/12lEdt/a2gyPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904497; c=relaxed/simple;
	bh=Ttgxceiu76soJb3ApeD5lHRi9tdeAIqYYf4YfKvirpE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hzleoz4UWL/tzpv8B3z92mX/0OrYMmcydph/lbKT1mQPB3YO9kBklGWsGDVozIIN4r7L5HQ0HbEOGQNJI11rEzw0aGifIoJwyb08fzIOVd1DaNf2gMip67F/HYCtQduNLVvLJKVC8kOaozu6F+RGcVksMvalBQWzMGync1uMBZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iwHr+l1G; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iwHr+l1G"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754904494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ay2HjELoUY2f+Lvw6Jk7gXFUv5V3GMr7KyOEd8INP/s=;
	b=iwHr+l1GjqYzJBIDiU/EtR6gaj5mnbSkZb+DUuVMGbAC4ykqjZRG8giIMqL6Lo0ZDANCp4
	boHzs77PN7yMTQNGFOzHpoifU57oXWl6XL6oSC10gj/wfDkYuz6Ncgvjt2iqmRSZYeTUGk
	Pu+vYuk2JotzHaLID9kZqRqdZMOAGT4=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Baoquan He <bhe@redhat.com>,
	kexec@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH 1/6] LoongArch: Add struct loongarch_image_header for kernel image
Date: Mon, 11 Aug 2025 17:26:54 +0800
Message-Id: <20250811092659.14903-2-youling.tang@linux.dev>
In-Reply-To: <20250811092659.14903-1-youling.tang@linux.dev>
References: <20250811092659.14903-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Youling Tang <tangyouling@kylinos.cn>

Define a dedicated image header structure for LoongArch architecture to
standardize kernel loading in bootloaders (primarily for kexec_file).

This header includes critical metadata such as PE signature, entry points,
image size and load address offset, etc.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 arch/loongarch/include/asm/image.h | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 arch/loongarch/include/asm/image.h

diff --git a/arch/loongarch/include/asm/image.h b/arch/loongarch/include/asm/image.h
new file mode 100644
index 000000000000..1f090736e71d
--- /dev/null
+++ b/arch/loongarch/include/asm/image.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * LoongArch binary image header.
+ *
+ * Author: Youling Tang <tangyouling@kylinos.cn>
+ * Copyright (C) 2025 KylinSoft Corporation.
+ *
+ * Most code is derived from LoongArch port of kexec-tools
+ */
+
+#ifndef __ASM_IMAGE_H
+#define __ASM_IMAGE_H
+#ifndef __ASSEMBLY__
+
+/**
+ * struct loongarch_image_header
+ *
+ * @pe_sig: Optional PE format 'MZ' signature.
+ * @reserved_1: Reserved.
+ * @kernel_entry: Kernel image entry pointer.
+ * @image_size: An estimated size of the memory image size in LSB byte order.
+ * @text_offset: The image load offset in LSB byte order.
+ * @reserved_2: Reserved.
+ * @reserved_3: Reserved.
+ * @pe_header: Optional offset to a PE format header.
+ **/
+
+struct loongarch_image_header {
+	uint8_t pe_sig[2];
+	uint16_t reserved_1[3];
+	uint64_t kernel_entry;
+	uint64_t image_size;
+	uint64_t text_offset;
+	uint64_t reserved_2[3];
+	uint32_t reserved_3;
+	uint32_t pe_header;
+};
+
+#endif /* __ASSEMBLY__ */
+#endif /* __ASM_IMAGE_H */
-- 
2.34.1

