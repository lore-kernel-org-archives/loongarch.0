Received: from mail-pz2-f5.google.com (mail-pz2-f5.google.com [74.125.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98863B0581
	for <loongarch@lists.linux.dev>; Fri, 16 Oct 2026 06:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131454; cv=none; b=azEmkALylS532da6VGo/n/9y124jBK8FljzwK4OndgbdWuANQAJiGlwclzsBiof4dmNFhZg6ouILrxxUBIN2Z0zVb//6T01YInf3ubQUTbY6qyovmJXMzRGj/CPrxVLkZ+E9FgVTbY0spT0/Gcb/a7h3TsvAJGbH8WjXm+8lYqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131454; c=relaxed/simple;
	bh=FYy5PHSg/oCo4Er7s9x4p7nGdzrZ9/PNiuFGdN0WpnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJbQSkY39wJtPhWdRxbSnZDTyFkQHu7dT7zsOfCvUZkdoTq7EX/FRhKUeGCf+7/DOF/Isvnl0TVBnvdklWGTQ88GxZLUYzR0jEjcdgAlNDZ3dywHJDXuQVKWYe3aJgLHUu0nbzDUFNEfXrBMtfhYKgbYPaP5PaW4F0yZyXPxewc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tF4xmV5m; arc=none smtp.client-ip=74.125.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tF4xmV5m"
Received: by mail-pz2-f5.google.com with SMTP id 41be03b00d2f7-cc7c286026aso1451947a12.0
        for <loongarch@lists.linux.dev>; Thu, 15 Oct 2026 23:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131453; x=1792736253; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ICQyIKowVj3RyrjMn4gMzYuhROzG3qohL1WARXEfQY=;
        b=tF4xmV5mNQj1ZfOAB1OV/7/sVsWuzhZft7O4t4pvtPNQzDQrJfpCXlheYTYb3392m3
         OB/Olcdi6z1891Q/5HuyWXLix1QGd5K/vcQaosSOcX0ImoYp+st9E/sy1sU6Qs8FDU5c
         fXPDcS182kkRFtrAkwQzhW3jCJ5u9ZaW9KLzwmRzs8QJ1MaSMeYMNVOnSf8d/5pUkvpN
         f15VBAR7HS5hkU8XKYxEtAGvQlucCLqeP8yMheE4l4b8V4moZ7BrVzzdueM1cek/q/1+
         kQyAV/j+yS5QaI1UUGlZFmdBS0X0lg3xA4BKxkzRyK++jQO7YvO0cnmOEfiVu4BtVnDp
         lNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131453; x=1792736253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ICQyIKowVj3RyrjMn4gMzYuhROzG3qohL1WARXEfQY=;
        b=lD8G2NMhIce/m1aLPYXKFieu3d3mo7Cb8WjUyXCYvjfRmqTvi8TBv0uwarJMFxW5ko
         H+nvO7dP05t2somAzUWxc1OBf9O4RUxPnzVwjbddEWK63YBNcHvSoG3qJDcNNIfpVUdO
         +dbWbYyRZIl9VNBXVTYWDgroJw+zLpy9VcRWi4uyYpMyvWHi1HUHKGTSjD5xo6GdO6YL
         QM1b1bQgistm7qB3bjkh5yRefatZ5lQZqp+YSIWrt+qhPZGE7QEKZfVfLBc2S6IiYdHl
         W+t2bFs2E4YUCD4W1ielCtglAAZPltKrQTroV+Rjp0iW0uIrkRTbWHLdP/k9PqhsBpqU
         Y/CQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNqBp9GUD6Pi3xKsW5jcFxZqDKdP8jrcTz105B+9oK0El2+zW9ioyDfTpIjax52VX/XC3lpsBBZ7Y=@lists.linux.dev
X-Gm-Message-State: AFq9FYJGTJma2bSOuTdfPQNWuc0YB494SJ2fN5snaTTGONoO5EfgcMYp
	2Hf/EXtC9O8fWU3GH5Lbr5wn446nvoCQuY/WG7UnZ1mgSLZUYLi0RlVf
X-Gm-Gg: AYBFou1kewP+MJ0qDvviNQO91vZ9+5PtDov+w9H28BPWY2o5EK2B7WsPpzuaXOtBf9x
	j9cH6Acy/d24J9yy604aBFRJrgyh8zNjnT5Uykf2i7XZBrHEN2lRlIEaYxa49bumNWLsi6PalNu
	ZiWd5Z+uevgmPoQHwFbU6dY1wd2rF5+h1OroXjwuYwcYQ5VdiPOGbGyLjtrpqSh2vYq5p88kOEc
	xpli6ym313D5gM3gBwqk9YdpKs2EYww/MpzcEEdHhwPf8cCw9m/qfYdBoUaGSKtmSwcAOgeJD2K
	qQB4wcOaNRsX0UiVV+jdICGHQMYOAerbLU8j0KQUPdhakgL4GajQGU7CsTiaG+BC58gAE6Cvpm3
	OcswolgTU1mwhycrejcpC9WILjtbud/eOL0lOWe/Z+L42cxLsyDp5YFA8C6ZH/WYpu1HG/i5HPI
	j1Z9xrm3Vz5lSukAow7bcu3diBbawWt3FlnTIpuF4rGF3/i+MffYeu8QrlMSrYX1FICXr3yo0FX
	Q8DWzLXRMc=
X-Received: by 2002:a05:6a00:1941:b0:89d:7f51:6492 with SMTP id d2e1a72fcca58-89d7f51698fmr8778955b3a.32.1792131453020;
        Thu, 15 Oct 2026 23:17:33 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:17:32 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [RESEND PATCH v8 7/8] of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
Date: Fri, 16 Oct 2026 14:15:48 +0800
Message-ID: <20261016061549.4181390-8-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
kdump can omit them from the vmcore.

The marking is guarded by CONFIG_CRASH_DUMP so non-kdump kernels do not
pay the cost of splitting memblock.memory entries at NODUMP boundaries.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/fdt.c             |  1 +
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 15 +++++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index ecc923102622..a5f223a74b7e 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1285,6 +1285,7 @@ void __init unflatten_device_tree(void)
 
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
+	fdt_mark_reserve_mem_nodump();
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..505735732c13 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+void __init fdt_mark_reserve_mem_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8c9d6395d6a3..f29a07e8fb23 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -677,6 +677,21 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 	reserved_mem_count++;
 }
 
+void __init fdt_mark_reserve_mem_nodump(void)
+{
+	struct reserved_mem *rmem;
+	int i;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		rmem = &reserved_mem[i];
+		if (rmem->size && !rmem->dumpable)
+			memblock_mark_nodump(rmem->base, rmem->size);
+	}
+}
+
 struct rmem_assigned_device {
 	struct device *dev;
 	struct reserved_mem *rmem;
-- 
2.43.0

