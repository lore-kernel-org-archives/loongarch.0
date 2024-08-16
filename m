Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8701741D2
	for <loongarch@lists.linux.dev>; Fri, 16 Aug 2024 12:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723812603; cv=none; b=EO4jzltxlKuMEs9Upjgm79M1H/JQaTA+Jfr3Zh2oVAqqBUwb6Pnu7BcoWE7pEJYvIwPKyuqw1aBBJscXolI3g1jNJtRk5syOx3EhAMhHNpiiMVH6b2PLZ9KTUYYgWmpXWZjBam0ZrjwUBP0PMe+CTb7n6lDTE1q0k+OA4L0GPjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723812603; c=relaxed/simple;
	bh=K37drQFBcQe/KPuccp1cUx2OgiWzM+wcBntWujhb3wY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HABhj5X+N2PWqooBhHMg0eeO0E6DEBLNt8O/1yk2Pd6+6RvVJipiJw8NQa4W39v3eqVbiZo8Xhy89CMu3T9R3d/Xi2TNf7/rqQNe0xFa3zOogs/TSbsubA3fXeOmMkQ7ynen6ZO1vNNDPrZzGjWyGQDK8SmWsbZrpHBAkYGT6Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=UlVJ43rE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="UlVJ43rE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-428243f928fso19845595e9.0
        for <loongarch@lists.linux.dev>; Fri, 16 Aug 2024 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723812599; x=1724417399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ke0AjxBAncE489wmYzkh+nSMUTPo+pIzRMAmnYnwJNQ=;
        b=UlVJ43rE6vzgEN53dJ6lp/jTJM3/Vvh7BHFKmBHwXiDSaO4c2c7I9PzTHhtpJS/0Kk
         ndubhP1vXrtK23/hP8lcRSy19QJ/wKbxx4bmJUiXwM6i5mc0z2BTyiYVXGSwS+rDmIqD
         yO0JRwmksbh8eVZcym9F7DEr5ITUvYVg3feonip5yQfYwsaB7kkARhxykg2i2+1z+6qk
         d57/mR8sJM0cPvM6Lz64sxLULYONqRlyLtGncpMtOKoqF7XL8qF4w3d+GA1Hladd9WRn
         UXPSEprCn7ACtM924/YqhiCllLMn+OY4dVzyD1Pa418qUdFYWjw6BGwxreNAS1UdyTYP
         QZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723812599; x=1724417399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ke0AjxBAncE489wmYzkh+nSMUTPo+pIzRMAmnYnwJNQ=;
        b=sbYIfu0EMKU/o+MXQuJuRYDAFd5898mbFenXDYFayBWTntgW3RqP3k73LK42tcBfaH
         R6p7/bo11ohyTF1vjmRpfqyhAyShLtS0tORvVQgMUl6JsDSBelHDORDHRXzKbhPZ4xKe
         ESfML7sbPbMVplX12d3nI+IVRi/AHXRFgy/ugu/4sWZjB3AXbdcdZj9Gb5uX7wM7QhqP
         E68d2waq/Je+UmYbHl5VLoUdBlp15uleWoDnapDNzia7sP+6EZ45Ci0GaS9rDEMqC3Yp
         lhp4D4wvf0vZtRU8AqYEhhukbEYOC1cQlEmfHo6hmbzvnshA5BeAXhWwQC+Cqlt6FELt
         im4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWoGxej3BcfOAJF1onX97435qkkosRNQj2YDZdLwP4s0IOZ5WEPBCpO278CAdy+z0RQLjfmWCAUmH4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1bVTDL8u2Bt1bIFRVovf4P6Rh2EvakSwOdeUSq5G5LBStOPOJ
	d2KhK+ElO4s+lo+iaRevLFpNeMksqDX7scT9OlkhM10z/IW/Pl58jrOQlmzoVmY=
X-Google-Smtp-Source: AGHT+IGM4LtUkED1FVNx+BEXnUbZCpfDI0OMEbuSoUR17hoiKqSTIP6vlmoZg/GiQAQSJ3CnFpyexA==
X-Received: by 2002:adf:e907:0:b0:371:8e24:1191 with SMTP id ffacd0b85a97d-371946a4455mr2184543f8f.53.1723812598913;
        Fri, 16 Aug 2024 05:49:58 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898aa393sm3570531f8f.90.2024.08.16.05.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:49:58 -0700 (PDT)
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
Subject: [PATCH v2] of/irq: Support #msi-cells=<0> in of_msi_get_domain
Date: Fri, 16 Aug 2024 14:49:58 +0200
Message-ID: <20240816124957.130017-2-ajones@ventanamicro.com>
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
v2:
 - switch to of_parse_phandle_with_optional_args() to ensure the
   absence of #msi-cells means count=0

 drivers/of/irq.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index c94203ce65bb..690df4b71ab9 100644
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
+	while (!of_parse_phandle_with_optional_args(np, "msi-parent",
+						    "#msi-cells",
+						    index, &args)) {
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

