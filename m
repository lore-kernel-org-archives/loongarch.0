Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7483B15B13A
	for <loongarch@lists.linux.dev>; Fri, 16 Aug 2024 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723802127; cv=none; b=UnH81XN3Qke8FcX7ua3ZBHjsMqgh9sHWk1O+ugkXcvLzBJnTKLP3n6Ls3VATsDY0ktBj9jnIieUhtRcM7LxUWbGh8nOwIszoIoCHt5XRLaypxprLh996egaFxyS/nRhmZ3lUvUEfZcYsMW8WdqLOd6diFFTO700dvzegMoAFxyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723802127; c=relaxed/simple;
	bh=CC1JIfHvIBAl36w46sBXVBsGIZ5We62PJWHtJs+O8t8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qQUnGe2GWimLG48IxXtaQPpxVkRZ4g/VB0sNAFNgURotGXqwDtE6lM21RTi/10OesFFxQChuFez/mKHKtxO1hfGdLRPESjtHr+LrzFuoAQYdvQPyn5mr+/ZFbBb6In1mxtQezo2uiw61QcDsopviCjEy4XoyDX5B4cqb6XQm19M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=nnZFzdYV; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="nnZFzdYV"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7ab5fc975dso194105066b.1
        for <loongarch@lists.linux.dev>; Fri, 16 Aug 2024 02:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723802123; x=1724406923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RoIvLUfwtlErHQHB2ji6smKiDqBoIASWBt1x369LS4I=;
        b=nnZFzdYVCWfQlvBDZjHdtplbjgbeOtlERmY70m9Bzh3AxOditaGU8hs65GFiyHSXEM
         KgLiHS/bMIT1R15YXyWpM0x5B27tyQ6kEJjR9n1lOz9YHOrea4L/z0xJiFEEZU9TzUAr
         zfkHDE07Vk3BgjjFIkYMBvhzmOcMmgTgK+gBxqL5gTiQ0y4BzkV1KGM8rkZQE/283NG0
         jPKqhLzGltjopFb9rs4r4EkFhMyEFYdJwTbz/C3HwV9MaEXVuFSqbnbHpqUkxOwG1emc
         h+gKNxx9HFJeG2kamy9y3khb6PtiWJJOCKZG04Zq4nxYdIxgqChKg17/72/nx0E+vJgE
         PQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723802123; x=1724406923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoIvLUfwtlErHQHB2ji6smKiDqBoIASWBt1x369LS4I=;
        b=E7KDoVq8P34AoBPQJosYuqCLypV8QZpwVniIfmGghlqflTN7+1Jp91ooGcP4ONbly1
         +k+BroQ4w/IuaHJBeOslOggDNC/S9F7+jV3eHMsKRNLR7mjxmQeBoAOXf4H5l0TG8MF0
         uOoQ6LRdsB6eJYBA9lN/aDDI5/npZvkJjoEBjDKETUh/iWjrwiR6UQ2jyP0BsNqqWLzF
         hnPPnUqFAnEH/0a7vqh3yEIK/JeObwtsI0jscZJsEeJi7QcZ91Vnu2o827kLHkGrbJIK
         3fU0o8ob0OxGuxmyez9iQ3ryYdBVNxY6dwR4TzKGU4F7w5Y0H/DiDvN/wLi3kMLzivZ1
         aWgg==
X-Forwarded-Encrypted: i=1; AJvYcCW30ihrbv4i464sKlnmzM9QusyOInd+fYZRa48SwvC4IFAc3WvvDGtXU++JSPQgr17Rs9AbzApg1gs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEzuLuRh8frBWE6ZcsY2rdgTTTDNTtMNlQntDyk1rDdOQ/Hr/Y
	Bfx2K+3NIV4Ti+7/zq6jV+n1UCMdrTFQf6dgSSSl6PUy32QQisXb+327KymxQDI=
X-Google-Smtp-Source: AGHT+IEWEn1buqzvrPyI+YLyXqKvY0yYQVZ2BQACp/XQgrDhUOxKmz7wrTINSfs3M48T6a9DY2iabw==
X-Received: by 2002:a17:907:2d10:b0:a7a:a3f7:389f with SMTP id a640c23a62f3a-a8392a49534mr149316266b.66.1723802122185;
        Fri, 16 Aug 2024 02:55:22 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383935807sm228603466b.134.2024.08.16.02.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 02:55:21 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org
Cc: maz@kernel.org,
	mark.rutland@arm.com,
	robh@kernel.org,
	saravanak@google.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] of/irq: Support #msi-cells=<0> in of_msi_get_domain
Date: Fri, 16 Aug 2024 11:55:21 +0200
Message-ID: <20240816095520.96348-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An 'msi-parent' property with a single entry and no accompanying
'#msi-cells' property is considered the legacy definition as opposed
to its definition after being expanded with commit 126b16e2ad98
("Docs: dt: add generic MSI bindings"). However, the legacy
definition is completely compatible with the current definition and,
since of_phandle_iterator_next() tolerates missing and present-but-
zero *cells properties since commit e42ee61017f5 ("of: Let
of_for_each_phandle fallback to non-negative cell_count"), there's no
need anymore to special case the legacy definition in
of_msi_get_domain().

Indeed, special casing has turned out to be harmful, because, as of
commit 7c025238b47a ("dt-bindings: irqchip: Describe the IMX MU block
as a MSI controller"), MSI controller DT bindings have started
specifying '#msi-cells' as a required property (even when the value
must be zero) as an effort to make the bindings more explicit. But,
since the special casing of 'msi-parent' only uses the existence of
'#msi-cells' for its heuristic, and not whether or not it's also
nonzero, the legacy path is not taken. Furthermore, the path to
support the new, broader definition isn't taken either since that
path has been restricted to the platform-msi bus.

But, neither the definition of 'msi-parent' nor the definition of
'#msi-cells' is platform-msi-specific (the platform-msi bus was just
the first bus that needed '#msi-cells'), so remove both the special
casing and the restriction. This not only simplifies the code but
also resolves an issue with PCI devices finding their MSI controllers
on riscv, as the riscv,imsics binding requires '#msi-cells=<0>'.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/of/irq.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index c94203ce65bb..026b52c8ee63 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -709,8 +709,7 @@ struct irq_domain *of_msi_map_get_device_domain(struct device *dev, u32 id,
  * @np: device node for @dev
  * @token: bus type for this domain
  *
- * Parse the msi-parent property (both the simple and the complex
- * versions), and returns the corresponding MSI domain.
+ * Parse the msi-parent property and returns the corresponding MSI domain.
  *
  * Returns: the MSI domain for this device (or NULL on failure).
  */
@@ -718,33 +717,19 @@ struct irq_domain *of_msi_get_domain(struct device *dev,
 				     struct device_node *np,
 				     enum irq_domain_bus_token token)
 {
-	struct device_node *msi_np;
+	struct of_phandle_args args;
 	struct irq_domain *d;
+	int index = 0;
 
-	/* Check for a single msi-parent property */
-	msi_np = of_parse_phandle(np, "msi-parent", 0);
-	if (msi_np && !of_property_read_bool(msi_np, "#msi-cells")) {
-		d = irq_find_matching_host(msi_np, token);
-		if (!d)
-			of_node_put(msi_np);
-		return d;
-	}
-
-	if (token == DOMAIN_BUS_PLATFORM_MSI) {
-		/* Check for the complex msi-parent version */
-		struct of_phandle_args args;
-		int index = 0;
+	while (!of_parse_phandle_with_args(np, "msi-parent",
+					   "#msi-cells",
+					   index, &args)) {
+		d = irq_find_matching_host(args.np, token);
+		if (d)
+			return d;
 
-		while (!of_parse_phandle_with_args(np, "msi-parent",
-						   "#msi-cells",
-						   index, &args)) {
-			d = irq_find_matching_host(args.np, token);
-			if (d)
-				return d;
-
-			of_node_put(args.np);
-			index++;
-		}
+		of_node_put(args.np);
+		index++;
 	}
 
 	return NULL;
-- 
2.45.2

