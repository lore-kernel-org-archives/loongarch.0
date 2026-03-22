Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B73367F58
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 15:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774192853; cv=none; b=nVbUU4rdvcU5FJWznHaNrlOwMS7Q+64thglyR89elQAJChkAgbWhGOvEP5FbL84TjdvaSgVpEXY+gA+ffQmmeqq5bHo/01hVXkQ4A+Dc2bJbtN1Zr/K2PpljkLh56JxfQ38hqTg0MaWJiFkD/y1G7VFnHoR8Y4DD160AZ3bLaOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774192853; c=relaxed/simple;
	bh=Pl/kyTY93KfYPXj8ZDJfn1oFFZXVs6wAzLptKrLJRoA=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=kUu7mJL74J++XHbDjywBPmF3/Ym86JRvANtFIYZVh+ozjGDpX0OUlD7kL7ysSxRvW+XuZX5MF1IQEO1JsfzUST58xB3s4X+upS3sFw5DBDOUXyPG7TrK638xxmKfilrWpk70rPNA5cVXc4//516v8OjmdyCqnBlDpmoK4BJNiCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=nWltr8B7; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="nWltr8B7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774192837; bh=rMmegBW1amz+M/3CmjvRObPa3qIIxBCigPF0d3EAryg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nWltr8B7XoE0WZqFxcsuvo0wFqMOrhU0oDXN/WTj6kO6bfC3rD6cRraB8D8oIytV/
	 n3/pEyuRY7PC7kARl2BJq3DB6PiAEj81VhV3vMs5qAXtsA0Tt/GeH9WVjr+/FbXaN7
	 +7bdeG6PMsTeAFHTmD8MtlQIITOxxf7yJASFfwBA=
Received: from MYJGMC.lan ([122.195.139.226])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 51F9320C; Sun, 22 Mar 2026 23:20:31 +0800
X-QQ-mid: xmsmtpt1774192835t55bo2o5j
Message-ID: <tencent_2BD9BD0B9BD4A0698E57C1340E402ED5AC07@qq.com>
X-QQ-XMAILINFO: MT62wbyzuzqmtmPpOXYlCg9isr72tHrr/c9q4ki1AuqPeHI+jK0bb8FJSQXkmx
	 X9sS6Eu4Axy1vlfbzz2CYy4Yw/71E53U3sqpfRS+3+FIRXC5KysBvLS0e+hHBfmI80VPsHeNByVt
	 ItzZQMSZ5pAu+qBZFJ1+bDvz51t5Odr7R04gdPuJP+jaNYCiIPaK5qOSPnx4NfGgCtTuF6M7/0hK
	 yuRPiHOWtk6BXzmr6AtLJarfFkKacz04wuKFASRy7tpcwEzQTjCExnnbkISlnn/XqFobXx2t5HqR
	 jlTNFOVblRumZVdoCCgF+nWQ9Zxa21rZ8oV+z0pqqh31ejqzvHJU0HdSybwrRAMwobKlzubBzN+M
	 dpb5VREfTCIp4ieqWreu0rwwII6puq8+hSyKaWNuI4xZINS/gSPG0fFmFZO8ukdio0myEkoFV9L9
	 /NOZC+6BZRB1ky26Rm+mPx66yfT2B8S9AHlq+PG7aNPk7h88XskNTEJGlE0t1JIKnBtgXhazbPAh
	 Y83jlmumeI7gP+teQpFMxH9Ev3EqFuUy+2xGb2jlu0AG9bddRMQRlAZjI6eMzN+Ti9pEjs8McqJO
	 7M5OFHANhh07CRBsrF7Ap/oku+yRNaaxlzX8LXzwU3wKDhoaAcVPFm+s5zQn2i6DfBrIerjbMOhW
	 u9SIflEWb+mDB5CflnR3+4V6PrYAeEj42Ksi7f1pmdeeMGkX+bd74wnV8Z6die9athLZjxKx/gl5
	 zZ+OAHe26xuowccMrReuySosnwfbkmbfS1p4IC9zHTvx/E7iDTpcjk6Mo+90RpqVoqCb/lipWMKv
	 BkLNjpHk/yohsJunYI5VusnNuiq45wwCNN4w9KrexhaF6vdgWyzt77EuuZSmxHOBFRmjB4spNe4o
	 1ZnNeIESkUMlkc/tvU2Zgn5KniwHjFxcOs7/wGA7QkHc42D6IXIoQn6/ycS1GIjpbnV3iZ+GE6Ou
	 95kKSfAY+eCGDsO8kUgFxFDZJdsQWVQFw4D74RCyRaLFvANdvw+94MOD3NQ3ScNmiYljU5OOuJwf
	 nH4GLzqRSLd79YtpU7XHBG//o3R+Wq3HLEAW9g6VjBEhBQsalq0tkWZ+h4Su5koD0QOH/NBkeoId
	 S1TwoT82Levem3gFZdZ7b5zlbm6RGE6Ucm6vvjL5v9F5TqlPpfAyKFZpP1RA==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
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
Subject: [PATCH v3 2/2] clk: loongson2: Add ls2k1000 compatible
Date: Sun, 22 Mar 2026 23:20:30 +0800
X-OQ-MSGID: <20260322152030.60257-3-wjjsn@qq.com>
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

Update the clock controller in DTS and driver:

- DTS: compatible changed from "loongson,ls2k-clk" to
    "loongson,ls2k1000-clk"
- Driver: add { .compatible = "loongson,ls2k1000-clk" } 
	to of_device_id table while retaining the legacy 
	"loongson,ls2k-clk" for backward compatibility.

Signed-off-by: wjjsn <wjjsn@qq.com>
---
 arch/loongarch/boot/dts/loongson-2k1000.dtsi | 2 +-
 drivers/clk/clk-loongson2.c                  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
index ab6a55937e9e..6dff7eacf3f3 100644
--- a/arch/loongarch/boot/dts/loongson-2k1000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
@@ -156,7 +156,7 @@ pctrl: pinctrl@1fe00420 {
 		};
 
 		clk: clock-controller@1fe00480 {
-			compatible = "loongson,ls2k-clk";
+			compatible = "loongson,ls2k1000-clk";
 			reg = <0x0 0x1fe00480 0x0 0x58>;
 			#clock-cells = <1>;
 			clocks = <&ref_100m>;
diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
index 9c4c6c99db3e..ac075e970699 100644
--- a/drivers/clk/clk-loongson2.c
+++ b/drivers/clk/clk-loongson2.c
@@ -440,8 +440,9 @@ static int loongson2_clk_probe(struct platform_device *pdev)
 static const struct of_device_id loongson2_clk_match_table[] = {
 	{ .compatible = "loongson,ls2k0300-clk", .data = &ls2k0300_clks },
 	{ .compatible = "loongson,ls2k0500-clk", .data = &ls2k0500_clks },
-	{ .compatible = "loongson,ls2k-clk", .data = &ls2k1000_clks },
+	{ .compatible = "loongson,ls2k1000-clk", .data = &ls2k1000_clks },
 	{ .compatible = "loongson,ls2k2000-clk", .data = &ls2k2000_clks },
+	{ .compatible = "loongson,ls2k-clk", .data = &ls2k1000_clks },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, loongson2_clk_match_table);
-- 
2.43.0

