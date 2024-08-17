Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A71B13BACE
	for <loongarch@lists.linux.dev>; Sat, 17 Aug 2024 07:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723880474; cv=none; b=HlDP15JsBTzD1W+YrhnMAtqW1bhJn/cobhM5ytqkq7zaJ3sUZwZri8WuQx2AcJg2iRKGTdPIwUPIPyS6lvB9DmpcTlunHf/TV+tK/4F+MlsWI6mTDhkO/9TQPxQe376ccNkr37iGHkkVsEe1RNE2LH/yJv5/tq/vc5J1ZDthLpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723880474; c=relaxed/simple;
	bh=rPfPuGfh1UW1S1e0N3zz+OLUk/Jea98BE7sqKkvRG/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U7eHfpJegwZFSWupyBcQmTqJs6+u1f3QNdDmVIrGNRRC4jIJHRwRIfIGsgEJzJpJ9nyNYGmxKTrOEjuJjZXPrkG0y/jCcZH+yFI9+w/OpvKbnag+Dyi5rrZxSWHzKgMpLK4Vyt3nwHJ5oAVybY4kQH4dpddvNhjfOCZLaD2O5a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=fNu7z6GM; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="fNu7z6GM"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7a843bef98so313348266b.2
        for <loongarch@lists.linux.dev>; Sat, 17 Aug 2024 00:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723880470; x=1724485270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hBORzQsZTXM1LbW/643seFKYzIpgNc2kY1JCnCvH3JE=;
        b=fNu7z6GMOfKO+CzYqLu2TsXHp/sXEjEqqc0sAGvJfQiI5ABxYEDyJVUlZ/AZFJHX4o
         5986b8ui3pbUD2jwSqH5GfIhfapG5ldGmCndVWwym/dt85pTUAtws+Wa0uvZ0nCMzuj9
         fcAImHckbozf35k5kZWFc87QyWr44P+aaKA+6U/mWhjeIZdZzyXPMOsLSFENQ4NTerSI
         sOTJPh9wcqA4P/0hjmaEPnH3PshS1g9j7vFS5CmIpnNDoCYrqRaourQr9FR61JWOAvKM
         Wl8mzfy09KWSrHtK0wkfyYGKjrP7R2H3tZp3Jg9eGlV3OLnNo4m0u/jOeBny661IsS2F
         XVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723880470; x=1724485270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBORzQsZTXM1LbW/643seFKYzIpgNc2kY1JCnCvH3JE=;
        b=wR9h7HxJ08U2gN7uWugGwDKLj3BswX3nsWO5Ks34Z9rUMw/ACJ40tZj2z2tL80pNSU
         EFMEy37agAlj9hu5cAKttr4JPDsfX46J/Y0tsEgzTgp0dEupLxFLIn4TQFir23u+j/TS
         lH3mYzQ8QTzMxdAFZxaZ8yANP9kyO5J3WcNnR1hyG+vZ/gw7jzSmIj6xr+wODY9rClM9
         jHjARTLLSlsew8skolMyDOQMgHdC2RAVi9qCMWRSwihFTue1YWGiRWYOh/oEcAJjw+2Y
         S7dZYld/6wgCbtZwx+ZqMX7MV/1eTGJjinWv6Q5lIyMDn0ODHtUjvy/7T5E//HRqIG18
         Q7Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXu2ypRXEfOQqLtkkBfMxEAXwIjxyg1kH7MdD9OGpR/98IvsbX+u7HxGyW3ed9Wc/tVvX54G73qIZSdWCO5PYxwZgByIWmzyxsX
X-Gm-Message-State: AOJu0YwVqtoBbyNOPHRgVh1q6Rkqk/Lvgq2NCBV1xYYIhGy+cQRRLLFu
	UdBZvpp6hSOLwFp3vAjWLli+Rj9LhV+GtWP3fMSC5UcGhAMCK05qfQUMQaSVjvQ=
X-Google-Smtp-Source: AGHT+IENhmqi+DxLc2mz1SydD0A7p9AlI66nGERR3UWKR5q1emYV4OIEyUSKUHefLCRrMdx9ictRhg==
X-Received: by 2002:a17:907:e2ce:b0:a7a:a4be:2f99 with SMTP id a640c23a62f3a-a839292f4d3mr321245066b.22.1723880469146;
        Sat, 17 Aug 2024 00:41:09 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83aeb6eb4dsm66950666b.35.2024.08.17.00.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 00:41:08 -0700 (PDT)
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
Subject: [PATCH v3] of/irq: Support #msi-cells=<0> in of_msi_get_domain
Date: Sat, 17 Aug 2024 09:41:08 +0200
Message-ID: <20240817074107.31153-2-ajones@ventanamicro.com>
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
casing and the restriction. The code removal also requires changing
to of_parse_phandle_with_optional_args() in order to ensure the
legacy (but compatible) use of 'msi-parent' remains supported. This
not only simplifies the code but also resolves an issue with PCI
devices finding their MSI controllers on riscv, as the riscv,imsics
binding requires '#msi-cells=<0>'.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
v3:
 - switch to of_for_each_phandle() to further cleanup/simplify the
   code [Rob]
v2:
 - switch to of_parse_phandle_with_optional_args() to ensure the
   absence of #msi-cells means count=0

 drivers/of/irq.c | 35 ++++++++---------------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index c94203ce65bb..b74a3f5fc4e2 100644
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
@@ -718,33 +717,15 @@ struct irq_domain *of_msi_get_domain(struct device *dev,
 				     struct device_node *np,
 				     enum irq_domain_bus_token token)
 {
-	struct device_node *msi_np;
+	struct of_phandle_iterator it;
 	struct irq_domain *d;
+	int err;
 
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
-
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
+	of_for_each_phandle(&it, err, np, "msi-parent", "#msi-cells", 0) {
+		d = irq_find_matching_host(it.node, token);
+		if (d)
+			return d;
+		of_node_put(it.node);
 	}
 
 	return NULL;
-- 
2.45.2

