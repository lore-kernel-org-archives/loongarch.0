Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B03A313D67
	for <loongarch@lists.linux.dev>; Fri, 19 Sep 2025 14:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758292054; cv=none; b=YOsJO4uLoFhmfdvEsYnhcfmIgRM9phGkRvTvc0YfOT11wlgsFIqWQUtCZ6ii7oS8F6IyowlyF+DjpupYSqjBxlfWAEQqTc/nGDkk8jPceLY/ZcrL8Wwj1XrqAmnIXImOM0V7c5J7+bVFJ36n5AhxFQ5bV8VtbRd3sK4UYEQCyXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758292054; c=relaxed/simple;
	bh=HDC+FIgeNyad364xEx3KiNn1Bk4hVY6oVcX1miWEhkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t92+55w0HaiGmR58dwxcWLg7W5jMUY/4oMUvWWyeIlMLx+jEJld1j/ndVJDrIUBjR7nYqRxKFDz/suBrl/0ikDzv2Gq3r9b0PPTfm+E5KpYEpIMQ7+VgqDhX1H6w6Px0Z1zAG0o0EJ93T1J3abKXzRi+0ComEOFN7H3ZGkdlX2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=FdAyhHC/; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="FdAyhHC/"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0CD0725CEF;
	Fri, 19 Sep 2025 16:27:31 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FyU9Pw9wWud; Fri, 19 Sep 2025 16:27:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1758292050; bh=HDC+FIgeNyad364xEx3KiNn1Bk4hVY6oVcX1miWEhkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FdAyhHC//9GesHwQL5DGinQdskum5HshY8FyJTeuDqiRNDpLxhQJNHVBrrk/q4DjT
	 9NB96oP384nABNWUr8G+HZ5yWwLJt5Tx8O0wzFbZsCJvhOCkU898RXaUg/bY05+0x0
	 Gm6dzCJ9OkW2ccyDiQSud5rnWhsAhhzFDqjaii46paznZu68wA3occh2Ja2Xci3GDZ
	 kwI2D/KKXvG3dBtNwpZ6o342/AJyj/m9LHUq/3KuuJIz/LOCgzakCSvJAmGx11taV6
	 1RsJx2/RjKcCz0Soh7t0aUZXfvUx5M9FZCs89QlfvrHQQzXAlIuVdPyfiQC4g9G/9C
	 ZLz2An/qny2OA==
From: Yao Zi <ziyao@disroot.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>
Subject: [PATCH v4 1/8] dt-bindings: clock: loongson2: Add Loongson-2K0300 compatible
Date: Fri, 19 Sep 2025 14:26:42 +0000
Message-ID: <20250919142649.58859-2-ziyao@disroot.org>
In-Reply-To: <20250919142649.58859-1-ziyao@disroot.org>
References: <20250919142649.58859-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the clock controller shipped in Loongson-2K0300 SoC, which
generates various clock signals for SoC peripherals. Differing from
previous generations of SoCs, LS2K0300 requires a 120MHz external clock
input.

Signed-off-by: Yao Zi <ziyao@disroot.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>
---
 .../bindings/clock/loongson,ls2k-clk.yaml     | 18 ++++++++--
 include/dt-bindings/clock/loongson,ls2k-clk.h | 36 +++++++++++++++++++
 2 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
index 4f79cdb417ab..c07ad1f85857 100644
--- a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
@@ -16,6 +16,7 @@ description: |
 properties:
   compatible:
     enum:
+      - loongson,ls2k0300-clk
       - loongson,ls2k0500-clk
       - loongson,ls2k-clk  # This is for Loongson-2K1000
       - loongson,ls2k2000-clk
@@ -24,8 +25,7 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: 100m ref
+    maxItems: 1
 
   clock-names:
     items:
@@ -38,11 +38,23 @@ properties:
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/loongson,ls2k-clk.h
       for the full list of Loongson-2 SoC clock IDs.
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: loongson,ls2k0300-clk
+    then:
+      properties:
+        clock-names: false
+    else:
+      required:
+        - clock-names
+
 required:
   - compatible
   - reg
   - clocks
-  - clock-names
   - '#clock-cells'
 
 additionalProperties: false
diff --git a/include/dt-bindings/clock/loongson,ls2k-clk.h b/include/dt-bindings/clock/loongson,ls2k-clk.h
index 4279ba595f1e..8cbb86b2cf1e 100644
--- a/include/dt-bindings/clock/loongson,ls2k-clk.h
+++ b/include/dt-bindings/clock/loongson,ls2k-clk.h
@@ -43,4 +43,40 @@
 #define LOONGSON2_I2S_CLK	33
 #define LOONGSON2_MISC_CLK	34
 
+#define LS2K0300_CLK_STABLE		0
+#define LS2K0300_NODE_PLL		1
+#define LS2K0300_DDR_PLL		2
+#define LS2K0300_PIX_PLL		3
+#define LS2K0300_CLK_THSENS		4
+#define LS2K0300_CLK_NODE_DIV		5
+#define LS2K0300_CLK_NODE_PLL_GATE	6
+#define LS2K0300_CLK_NODE_SCALE		7
+#define LS2K0300_CLK_NODE_GATE		8
+#define LS2K0300_CLK_GMAC_DIV		9
+#define LS2K0300_CLK_GMAC_GATE		10
+#define LS2K0300_CLK_I2S_DIV		11
+#define LS2K0300_CLK_I2S_SCALE		12
+#define LS2K0300_CLK_I2S_GATE		13
+#define LS2K0300_CLK_DDR_DIV		14
+#define LS2K0300_CLK_DDR_GATE		15
+#define LS2K0300_CLK_NET_DIV		16
+#define LS2K0300_CLK_NET_GATE		17
+#define LS2K0300_CLK_DEV_DIV		18
+#define LS2K0300_CLK_DEV_GATE		19
+#define LS2K0300_CLK_PIX_DIV		20
+#define LS2K0300_CLK_PIX_PLL_GATE	21
+#define LS2K0300_CLK_PIX_SCALE		22
+#define LS2K0300_CLK_PIX_GATE		23
+#define LS2K0300_CLK_GMACBP_DIV		24
+#define LS2K0300_CLK_GMACBP_GATE	25
+#define LS2K0300_CLK_USB_SCALE		26
+#define LS2K0300_CLK_USB_GATE		27
+#define LS2K0300_CLK_APB_SCALE		28
+#define LS2K0300_CLK_APB_GATE		29
+#define LS2K0300_CLK_BOOT_SCALE		30
+#define LS2K0300_CLK_BOOT_GATE		31
+#define LS2K0300_CLK_SDIO_SCALE		32
+#define LS2K0300_CLK_SDIO_GATE		33
+#define LS2K0300_CLK_GMAC_IN		34
+
 #endif
-- 
2.50.1

