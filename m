Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA4E30DED1
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 08:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774167613; cv=none; b=oZB0g7Fx5GA2netVhxPDb9MkzBpzUEBozbJTsmkf4vlzeiGV+VOFtC8vRTx4an8X+xYnAieMzDkdLq2BBOtdfNbJzTHTFcU9JMAW/wA7lInUyquItPWu3uT3DsoqIttohZ/pXJ8a0rN/mr+R68rVh0gLzfnxD+I6/d8kfpcqeWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774167613; c=relaxed/simple;
	bh=NvjPxYjVAmyqmOBrydDuRJN3AzL2bkMY4CelwxGpbv8=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=QqLoLiY9Ef9/97qZ1457JdqbFCnAkOjUEaXXOj9Oi2jhwEiuXx+fCwboTqDoXtPXAKc06Y9glKqBg4rRuaehGaARzYMHcwrdvBPtSiQFM/09ud0f6jTKYCSm0zuDAS0B3jTOPTmYVon/F85KHr4Eeo/KgL55H7R3zo3zyrdU068=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=y8CUrUtD; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="y8CUrUtD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774167607; bh=yeAOErC4pynrSC14YRVTCPoiJW6d/W4E1cxjodkxEy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=y8CUrUtDHMR/78oRhOxXZDEsj5+aK2oaQo4nP5Pz6pM77aBD3Rsi7GYhQvdB4kVWR
	 brfDrHszm6H/QWuxomNRxeAm2/jtX5DNk5oy3zOhFHzFRVXULB+EFbDXCfa48Ep3DU
	 9bBvesNGerRg2M9fGF7IdUYF2h3Qfhrgj8RgGj9Y=
Received: from MYJGMC.tail4697e5.ts.net ([122.195.139.226])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 500854EA; Sun, 22 Mar 2026 16:20:00 +0800
X-QQ-mid: xmsmtpt1774167604tg8ao6cr7
Message-ID: <tencent_0FA97DD3D0AFBC69288051AA7FB32817E308@qq.com>
X-QQ-XMAILINFO: Nq3b7TYD8/lYswRToQCYQZL3adfzESDtjGd43/4Jd1eU8faT5RHd6BJE0LnoxR
	 uOPRqDA+fNyzM09ovq121dYchNwcDTGGmw6I2qZHSEqFB1hfwTrrW3uoKrKSxUYwSShqhiiE4nGQ
	 Ld12Q116YwzJmgybfv5XXlz40ZejJMdWQkyZeN+2pxh5XG1JkPQYZrd4fKi66zwFsGMTo11jH7OX
	 NfP4v8qKPmVcfyMSmn07uU38CZ2lKiDDxv6uxYTqnVbQwZaOIhMLHoT0+P2l0nf18pPOHEDAYBUt
	 IF6q1Sey+jFh3IuoDO7GlyfbJrrc0TW/6NHfwsJr+RnbRGyr1IuSpQW+xEUqNf/QZJ40If+/e5EW
	 4Y4hU5nRxg0wFVMQKV/7wZHOkEQamOfnU//Vfo4ZxpFA5ZCThl0f2pswc2pWa7HlE30ll5dbO/QR
	 RIZO/jUlDgUmNJ1e3XLZ5/vqbsiGwt9Ukgvqc7zkjxN2YWJ5dGX5ys6iLXSqw57abKNWehIqCn79
	 ObcuHMNqH6Rhd60hA06YSa+lur4RGY/qCVXjvFLA5DcSB/k2kcWeIT/zWOxWDEP33cInsIwRgGP4
	 gyC68hIbQtVboSe1BUbawWJ1tsw5MKU3qedq7ycKWd6jiHVG2bbz7w05xNBUz8VFXQSiKqOBPdbO
	 wIB1/ZWTsz+6w54whn/BTrlAc9z/9k63pep8jkuuYg05ue77U9NsMnOHTEsSJ/u09YTOXoAhdpSo
	 7UQ7Izt5frPboTgudSGKInuIHx0VPLBBXHiwo4nkOSxw81vGymAD/wRtTkno/8HEe9c62I9hD4O3
	 vweW8v+NTJWPKU+v65jOWjuyGOlxtAC84ZnXmTvzWjhixwkHYRP1NGXDm3HvoaaUMXQwjAQGdPxq
	 v/a11uvbbJ/EYyFOGNgEyXaonJ0vOn7Ti78iCyNqNmLAlXYaLputZ8tUM+Bxh5FKUlqJp3worcqd
	 wq1/npN3VM/n5XhsC2ZyJZPf9BxDROA2EDkQvzPk+FlX0THkGv5pt7lTV+moH3+E/hcJqWSKEY92
	 cGh3rLEY8SAXnRxzNAo93Ht21Bli3bf5uNUH0NyVQ6WAGRm9ja0lEWjwYnFW42ZFnEtm2IJA==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
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
Subject: [PATCH v2 2/2] clk: loongson2: add support for ls2k1000 compatible
Date: Sun, 22 Mar 2026 16:19:15 +0800
X-OQ-MSGID: <20260322081915.1626723-3-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322081915.1626723-1-wjjsn@qq.com>
References: <20260322081915.1626723-1-wjjsn@qq.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add driver support for the "loongson,ls2k1000-clk" compatible
and update the Loongson-2K1000 DTS to use it while retaining
"loongson,ls2k-clk" as a fallback.

Signed-off-by: wjjsn <wjjsn@qq.com>
---
 arch/loongarch/boot/dts/loongson-2k1000.dtsi | 2 +-
 drivers/clk/clk-loongson2.c                  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
index ab6a55937e9e..61cdae438cb0 100644
--- a/arch/loongarch/boot/dts/loongson-2k1000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
@@ -156,7 +156,7 @@ pctrl: pinctrl@1fe00420 {
 		};
 
 		clk: clock-controller@1fe00480 {
-			compatible = "loongson,ls2k-clk";
+			compatible = "loongson,ls2k1000-clk", "loongson,ls2k-clk";
 			reg = <0x0 0x1fe00480 0x0 0x58>;
 			#clock-cells = <1>;
 			clocks = <&ref_100m>;
diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
index 9c4c6c99db3e..48d00578b26f 100644
--- a/drivers/clk/clk-loongson2.c
+++ b/drivers/clk/clk-loongson2.c
@@ -441,6 +441,7 @@ static const struct of_device_id loongson2_clk_match_table[] = {
 	{ .compatible = "loongson,ls2k0300-clk", .data = &ls2k0300_clks },
 	{ .compatible = "loongson,ls2k0500-clk", .data = &ls2k0500_clks },
 	{ .compatible = "loongson,ls2k-clk", .data = &ls2k1000_clks },
+	{ .compatible = "loongson,ls2k1000-clk", .data = &ls2k1000_clks },
 	{ .compatible = "loongson,ls2k2000-clk", .data = &ls2k2000_clks },
 	{ }
 };
-- 
2.43.0

