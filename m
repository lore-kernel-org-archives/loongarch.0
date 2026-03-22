Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C444366550
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 15:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774192840; cv=none; b=iFINKEFGTakoTDQHqc9jZUpHHhn05LJN9yR9DDkB9q3wr/ns99707XP15BJcjCDN2BrlbaUN2kUqk6dZvTXTLtrVAb20uG8hIYOONbUytuWsY+lDQ4xvgtRegezYYgbHRd/NhfD3qtjEsK1AW1ZR2LXL2FP7RgBJd0+bz3fuSLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774192840; c=relaxed/simple;
	bh=cls8doY6FMHuYzYhNkcMpXWFBl3PhyiUg7+F+EhHP4g=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=SrsT6ysaukZAL7J4fitr+JzFTXL4Ei3XIaFJ+8S1pcgpmmJWpw6Sgfs94Hrt22qiDZKUSw2RCIUy50kOv/mSkcRAhpGkZoCRCtZuNWOcU1syZnO45jJroqRX8v2jmirba7w4Wsp9goqj/5TWjMuJgW0btKmCjihQcrNRNPN9ml4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ksCpJ16N; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ksCpJ16N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774192836; bh=11RYZrnd+R+xAKxcT2ifOg/oO8QJFkt3BN/QwdD92DE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ksCpJ16N5CBr6dajlQBAaRvzR4TFd0cgtxjbQq3LI+pnlansB4qUu/j2Aqdn+CmOE
	 racKY729oGhhE7MIAy7PAqjkQbF6G+biIO7yE1zesZ30upWq1G6bzena7GpNSN6EJQ
	 oMir2K++sZC67/sS4FFB0XN/fG9Zpxj6UlkWKQFY=
Received: from MYJGMC.lan ([122.195.139.226])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 51F9320C; Sun, 22 Mar 2026 23:20:31 +0800
X-QQ-mid: xmsmtpt1774192833td37rvjuu
Message-ID: <tencent_98546566F32FCE5313A7355EF1D288011909@qq.com>
X-QQ-XMAILINFO: MIkGUgXRKijCWHCAz+tHjP4pZOK3mYejNAzjeYegGJDsVUdM5veKGxYpgp/Edm
	 wd4m16ULYsatOnr4RQ/LkWFlYwF1j4BUT9tHfOWEHbamPwBCPfvGTMFEj5R1lJ3uHkJlF2cqwT7Q
	 xkOt1GUMFJtZHZc7I9EFdUcGmPUAZtJ3BMwRD/LzKDzgltJdDTjB/ZZ7JV57ymbnBLoB0PJU7uQK
	 Oyj4sXT1hOLY8YwyVoMzHMFzWrHkbNbbMDiItoh7lnjFORcO+eVQKMaFSf5w4p0+0oJkZpyyfQBA
	 qubPJXzfzYmGtVEesqflaWZHIbQh6n8Bse4tO+VzWjqzi30SgzscWLRVu/4bCaxoJKPUgawjJ9sW
	 VoNJSf/fci5usuKkzCovPATa/1Gm2T+V//OE21jzUPtBQ44wrYfJuOa1ocoWnEkKh5hZZhJ0re1c
	 /GXc6qlNHMftm7s50yIbxDQ3/PaMh0ZAH5GLTnYuxY47w6ymH/ziebKqS3Ejex4pzwQDmr6kSUU0
	 G62mB8IQCVnzq8yKL5p5c3BDHh3mcLkw1prfEX5jTZOK0jCjY7qsfbliPtejHrt1b4k+TOMG6j1o
	 V9mN6rWwaKF1ASk0+lxHPUoSWnPxG1jqvYxNMl/yVL6eKeSBOjcqIpxzdT9BEv0OVgYwkUcmiVFn
	 /s/Tpy3I21p/fA2tF3L0Ioh94SrbBtFLgo5F22V3IThorLnuGzi4Qal/4VebTUDextP28P3lRTwu
	 w4K66dyywTs3vdMy04vcCfLeyfHEZnYH1DALegimRrMEFxgn7yPxUfBAcVh9yZ+Nli3tNSfEa6Wx
	 DI+agMxCk/Q3e0aG7SJormB/PgTyJM66BpTNWiRIpq8lh2+JnbdErVb+4vmEgvf9fd4Ezpv7+Fic
	 P3wm3fgVigvr/6VKwWDxiWuhVZp0RYiKgTVoE9Ehvk0y8A3x1Nwn6ubMKuMF58Lxt3HfBEVRsWI3
	 DywOrBq9hJ1H43T1jOVVAnyGscN7EW9SycTNnO/WHnNdIZLnhKvUpM1YihJzkLfITiSyaTXHbG60
	 KHZJgeqhVbDxrUyfsZqGx9f+0JiIhDLo+MhyJGpoXq1YvgukC0qVoe01V4ysV40nxUSJnzhFbcyL
	 rAlyUBMk7jMifqVWwZTc3iGTj/wWrl8s7PJ5fcLzP3ikcdAUHrTHblgG03YQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
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
Subject: [PATCH v3 1/2] dt-bindings: clock: loongson,ls2k: Add ls2k1000 compatible and deprecate legacy
Date: Sun, 22 Mar 2026 23:20:29 +0800
X-OQ-MSGID: <20260322152030.60257-2-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322152030.60257-1-wjjsn@qq.com>
References: <20260322152030.60257-1-wjjsn@qq.com>
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

