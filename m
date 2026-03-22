Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EEE3806B2
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 08:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774166632; cv=none; b=jVfkAuS+ctr48P4ObPQMaGj8M/h1ZNPgWONaI0R/g0uBafw7jzmnoH/C5WFxVmkzk75hxWz3712eN4Su+k2HuDeWgwezacmgL97q5/0kiCBXzihDZBmlscAzAbhbEX6eZ/LAFt/W5UwxNUJO9N5yIMQPpsN9c1iUzOTdvWIzuf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774166632; c=relaxed/simple;
	bh=mkArss3ibgdtyGV/4MV84wk///1QYU6SuEInP/RiuTA=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ohIP7j/VwJ0Q7uoSMy7aL3QRX4JscKjBur0vHEaycqufhtTvUSDSlFLy+0IsdsbvHRrGIcy4l2x5tfcf/UYzyd4rPh+McqnBhgh9MXR7D8scYWf0GlUJENApbf7fdCZqlHfyxAcSG9U7VujqUQQGToUYxhWrn0gef1jhCVcQmBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=DaYXbUrW; arc=none smtp.client-ip=43.163.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="DaYXbUrW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774166626; bh=1sJ/3VH8Sb04qajifMyJsr1grXV/UFNngZi1z/XYRWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DaYXbUrWOv58rncxBXUP27qANJlc5sqhIXi7oz6B8EVgNeYJc6EAnvM2u+I7lWuWv
	 QOTD1JukJtgpmwAQIcm4Qm5CvzAky0QH7LA1xWYBl1rRWmVrK+SaeJSI7taU03d3lY
	 cLQq0sgi4iunw8j8lKcW0s07vZvccs0Equ6LLE68=
Received: from MYJGMC.tail4697e5.ts.net ([122.195.139.226])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id E78F8E1; Sun, 22 Mar 2026 16:03:39 +0800
X-QQ-mid: xmsmtpt1774166623tk4a3ra5k
Message-ID: <tencent_19D06CEA85762ACE74DF6B745A2EE0BCAA06@qq.com>
X-QQ-XMAILINFO: NnIX2CK8LSsJK+/FiL+0IOPetIgOXdNaehWxXSnYgDfassSI29UItp2PfB91WK
	 uoPnKhhmDJuOoaQinrz4SFV6+4K9bdQRj0obQWOHn2Ro9WohvRBhuScW24U7BUxFYhsqizGOPqkU
	 TJpnCLDDbwssy1env50z6cbZrhDfCQk7lXlKgU8XSJwB2wBiVo3hSIyQvZBDdR0bghLVqzqvPfg+
	 C13IemkCBiEAXGay4v+4Gzm2fANazCLEzVmwtjDCfQaQ0J+8ZNwf+bbvF3dYltJqrHD4rDcGqJVX
	 a9nvmz+8JbTFeqbWIhkMLb1hx9d1rlPF1Th4lSXrZf3StjrOSZ+/Sb1CDuCDNvbCb68ptkaPexYt
	 QOAwYTWo1LtaaBPwQ3IIB4a4B/ZcsYseMzrGTf7fi769k6O+oOaLpFhrZrnu/FEmxs1sX+IsaNdC
	 OYNBPFTc/8hGiFHv/MjTWl/6zJiXYZ3sOcxFC78AhNX40SQh8FRIDvQz6Cp0OzRIVwaxijZx3Juq
	 z8W4v2xTuJmJEFSJ6u+9SnmdbT/mbYpDz/CucY5PM/UVpl7hGuDdsBiyI/TZFi3qu8/CztOetnEx
	 AiYHfIVDlr0RJ8wMUhVnFU42BoViuCpeUOEnxoSoDjRSp8bHNz1LYoJGF+eD8q2S6ySY5GutgWD3
	 ix55TXZKNjTyJ3P2jbMnB4a6rIIfIvJeLqIg/kGBiHIexjWoaIQ/1cvi8A//tEXJbFbngtsftJTx
	 8xAFJiTMud8dHZ+otkLFwJaG7mqdX1Lt4LaGU3EJW/iuWEEIquzPy6ho2V3MMJCeNq2JaAN6yVrw
	 Te9C9dsrLGI/uDcQfIx4fDkW6IfA8Wc8NqmKHwmRI4pZHmSe7dqiMUPf4N2oW+gWNnCJ3uyEGK4o
	 6uv5Oxln0/GFTx2YJBELGXos55a8FtGbJU2Z0Wjgm+P8w8weAFoBBuduJKhT99tJh4/ElrKm3RO2
	 ayeJErpA4x1amxBIRT/LPX0bje3jqxdQQK2T6zngO35fUIInycVEgAZXkDBiftGO1h3i7qYMQJsu
	 R2nMclfDkNjeYzsG/8yaTC00adu/U=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
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
	wjjsn <2858482031@qq.com>,
	wjjsn <wjjsn@qq.com>
Subject: [PATCH 2/2] clk: loongson2: add support for ls2k1000 compatible
Date: Sun, 22 Mar 2026 16:03:27 +0800
X-OQ-MSGID: <20260322080327.1606799-3-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322080327.1606799-1-wjjsn@qq.com>
References: <20260322080327.1606799-1-wjjsn@qq.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: wjjsn <2858482031@qq.com>

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

