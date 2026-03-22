Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21B43126BF
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774192126; cv=none; b=ShkalhQGLXY7ETXVONrL3vpyJkqqtxKmkTIwzdLCZ5LA4wE0DaiPwjjb28KD0JUQ30lN+qZhFyRaVVcxK+2e0//Jugm/lOonHAM6vRw7REtgOxaumMkdloX7rgrrbGhh2Ps/y612eXMDA+s58BAxVkr8y7g1VO2mwDY9MtZ8bv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774192126; c=relaxed/simple;
	bh=cls8doY6FMHuYzYhNkcMpXWFBl3PhyiUg7+F+EhHP4g=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=UAM+0nSsfYX6qdkbljMGne7ka+a/rfdIBk+YVqoE+CC0iRgM9wPZ1ziqAWf8O71k7erDFzud/ICin4jDLSlabBySPo0mg1Upc97Ma6C5rodSS5/eXwTrg8jUpPDxmugP7sJI3X+0NwCc7RdOEcTQihnTgRatTulbQaSDNkCEAfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=HlRPOsjy; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="HlRPOsjy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774192122; bh=11RYZrnd+R+xAKxcT2ifOg/oO8QJFkt3BN/QwdD92DE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HlRPOsjysmDSv4knhc5c1mUQgtpQ4CyruINFYDh3HNbpxLJ/WpJgkQ2Wv+S4p3zB6
	 3NZXgKdJ58JxDXpP5+EA0XXpSLKWQ0A+xZpr6fssK6zWxq0tJ0MWZ/gWlH8CS2fx3u
	 Bxbw/OImoEbsaEFA9svaC++2ytsKuo62TNbZIa84=
Received: from MYJGMC.lan ([122.195.139.226])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 2259A43D; Sun, 22 Mar 2026 23:08:37 +0800
X-QQ-mid: xmsmtpt1774192119tacdc51vz
Message-ID: <tencent_C35FFFD2C601DB54E967312ED852DDA70F09@qq.com>
X-QQ-XMAILINFO: Nr4sKL92GIu+t4q8r0kflekmSEvtS1q1Wfq3Bsg2iXi7VUvNmKIvivp4r0yrgF
	 DI2iViy5K7qxJYi3a0xC59wURCbs6d10q7NKQOq9JAJGAGvFSeNi1lfB4t5TBddn6PfIutTay7ih
	 +i5a3JvsXBvLkxa1Nb2brTxyrHjIQWwYrdyImSodXF58fhR/ciDTgOD4ZsFyQSW2Y9Mt6KqCg6xi
	 7j3SKtKEMDQ+4S4XnXLINbx+CQViYOteBZQMJEoP9JmujJXvFVUkgKHdo9uqMm2rdgt0pLgTiupn
	 8HOwJQP5mt9QAzAj216atecyV4NA/cY7XqwnSm5O20oFt2OpG8LFCZEfBy2SpySZVognKiq0hc7/
	 UE92WSF0DSdLFz/0Gfyq8TF3lG2kTHHT5VfFAUZLseK7FxcHEJTZ/gAPjSuA8xzJ1WfMK6sh0hgw
	 Ewu/5eU9nIzOrE0O0rKKkWZgM01G8a5rf0JjpHaB6lSYCNBIydM1bx1d2IXuq6sTYA1qWHfTp3oo
	 nbuIz2yTj903RPzwO0LfeSkcqj6We1qB0IvqWleQGSUfYbUxbZRnURvbBB0eKREgD7THMpWEGNZT
	 m2dPW18XBYZAucahM4EQ4VYDfiM2XKj0uvIiybo6S4OxT3Uln37siFThbZ19JBVK1zrhFcRT8sbG
	 /Qlja3hPjMTvPeAlPYgkSUrLS/h2PQtObpDFrGA8wvoCtP+Hb0C6r+xq/kEHRDA0z33+ZarNwA40
	 YKMeK5/lATHDt18p4VSxSLTL+W1BlQGNxqiMKm5jJhDkFUR3LU8r1ziy/lQE6r4cgi1q8RzITol+
	 jRis7lObX+PXk2FRZUz+BSbMuTBzXPGNy+3R2HqS39y+6cQFOuieWae6xI8TlOGkxk0O3170mw8d
	 Kdr7I5VQfZYArCSCh9t/SwrrKtE/Whgukpf+gZtya/NmADUHijVYeqclio27c/iYA8D8ozZH4jaA
	 bFFTXWggXlnSw6y0tivpgnmbGiROo5xWwX8nhSvYzcAl3QZFxuCgVF1bpTBjJoRqdNYZG2ZE9Fip
	 h6gc/23Q8ikpY9WIK0Db7Q3og3/AaBXc2V964A9mJ6voJmN89y6Q34r0VBrQUNaR4KK26HNA==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: wjjsn <wjjsn@qq.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chenhuacai@kernel.org,
	zhuyinbo@loongson.cn,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	kernel@xen0n.name,
	devicetree@vger.kernel.org,
	wjjsn <wjjsn@qq.com>
Subject: [PATCH v2 1/2] dt-bindings: clock: loongson,ls2k: Add ls2k1000 compatible and deprecate legacy
Date: Sun, 22 Mar 2026 23:08:35 +0800
X-OQ-MSGID: <20260322150836.55196-2-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322150836.55196-1-wjjsn@qq.com>
References: <20260322150836.55196-1-wjjsn@qq.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a SoC-specific compatible string "loongson,ls2k1000-clk" for
Loongson-2K1000.

Mark the legacy "loongson,ls2k-clk" compatible as deprecated using
the structured "deprecated: true" property instead of relying on
textual description.

Update the example to use the new compatible.

Signed-off-by: wjjsn <wjjsn@qq.com>
---
 .../bindings/clock/loongson,ls2k-clk.yaml         | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
index c07ad1f85857..b0ef5cd5af32 100644
--- a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
@@ -15,11 +15,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - loongson,ls2k0300-clk
-      - loongson,ls2k0500-clk
-      - loongson,ls2k-clk  # This is for Loongson-2K1000
-      - loongson,ls2k2000-clk
+    oneOf:
+      - enum:
+          - loongson,ls2k0300-clk
+          - loongson,ls2k0500-clk
+          - loongson,ls2k1000-clk
+          - loongson,ls2k2000-clk
+      - const: loongson,ls2k-clk
+        deprecated: true
 
   reg:
     maxItems: 1
@@ -69,7 +72,7 @@ examples:
     };
 
     clk: clock-controller@1fe00480 {
-        compatible = "loongson,ls2k-clk";
+        compatible = "loongson,ls2k1000-clk";
         reg = <0x1fe00480 0x58>;
         #clock-cells = <1>;
         clocks = <&ref_100m>;
-- 
2.43.0

