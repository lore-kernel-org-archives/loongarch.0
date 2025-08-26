Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7826A1B0437
	for <loongarch@lists.linux.dev>; Tue, 26 Aug 2025 01:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756171101; cv=none; b=R5l5ujwOvIJvh0H6L079RSVqm1QbBZfPwU1NKkZO8HH8NzRHfxftp1ujGiOBZTib8kaqkBsTlVphX83FSudYCebxlNxHcFviSSjAdxubmT4Z+JLIMVQIFsMOGPPnoppyyNO4IYUAAEcXgKlMwEAS2z6xo/i/fsX76k4yTXL9X+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756171101; c=relaxed/simple;
	bh=M/+s+Rg4QX0UsMFsO33OqqJGq4/0/8jfcN6CZfBXJDs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dId+KpaKMC+X5AKaxQLi+Ux3lA33W5jIwSJjKrPRwR2AwreDbMWBtU0vNJ0KnXhz+DU67jOy848BZcfQw6siu0ASzQXifvt9y2fPgFQoM97nQmhg/oM0RI5FdgToOTIsDAGC3NMehcnFrwDYd3Vyx+c69Ahr8Q6AwlKbZ88WREU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FC5NeEge; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FC5NeEge"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756171095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vujQZVf5TyhJiS/dKOstIc0xO8kGAvT4jnpNPRHbLQw=;
	b=FC5NeEgeUbXcaF0iEDx97wDIhbn/FsSyd52PpRj3x5cF3HfXw9xErOv3HbwHqxJVh/4Dus
	k422WrP7miRD28GE2SaqDb+UETa6lB/K1G/wyAJjKHjOuHhyf8OJeub+mZ8efqls3M4/SR
	PGMcy3H2YUItq8lbbwDj9se2DMKEQtc=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Baoquan He <bhe@redhat.com>,
	Yao Zi <ziyao@disroot.org>,
	kexec@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH v3 1/6] LoongArch: Add struct loongarch_image_header for kernel image
Date: Tue, 26 Aug 2025 09:17:17 +0800
Message-Id: <20250826011722.82391-2-youling.tang@linux.dev>
In-Reply-To: <20250826011722.82391-1-youling.tang@linux.dev>
References: <20250826011722.82391-1-youling.tang@linux.dev>
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
2.43.0

