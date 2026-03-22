Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED38C346FAA
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 15:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774192131; cv=none; b=QPo9crEck0QzQv4c9nEQVYC3QlmUh8S70tULC255qmac0ON39VK/o83f757S/4izVlRXO0IdGxDXu2a53ZhX/B7F5HKGG/Xlk94eiHOlSdUpSGSNSmpTcK7+Dw9Ued8wktvk/icmZ628oS3VUM+b9co2LHoyaN+NfeFZ7UMuEf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774192131; c=relaxed/simple;
	bh=WXyNGeUTRwTzRCnxFJGU1m9OmF2/9dl0Fw6Vw2XNI9g=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ApXGn4TDWr9s+kj2LZM1CS4JYVQ2HjJi9Shtfzt4zHI38f9HjRrFRpaTXHeJ6WlkzDwOZk9j2ef357LqmwspeFRbTsklSAQXZ7lTy4OWEf3Rc85hG89BR+0+nX25dJthRG+2Rpb5ANNC3I3nGLfPOdzdJGOgnbiE/zd8vt9A3C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ImgjKh7u; arc=none smtp.client-ip=203.205.221.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ImgjKh7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774192124; bh=ll098vXpHSTRvv37YsMw0daMG4T8OaC6yG0B77odcbo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ImgjKh7ub4K90Zbmd9cKfcNAHflCVjGY0kbMtvzQZuNRX43TUnu96aDJ2G8ccny/M
	 1XVBj1ldcLXOyLYmHgbjYOQiYaxbEujKnrJqi7s/JA/OG4CjR3D3Phk1mn1Z7xq7JU
	 i/sOxyQbHNZ6g8VqC0gOtHPo9p+Y6xY7tBvRL6AM=
Received: from MYJGMC.lan ([122.195.139.226])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 2259A43D; Sun, 22 Mar 2026 23:08:37 +0800
X-QQ-mid: xmsmtpt1774192121tiou7imaf
Message-ID: <tencent_4169D45792346AC02855F4D98B8BD8D4B607@qq.com>
X-QQ-XMAILINFO: OA/62N3Jm+rTNIeB18a4F+tn75aVrVjmzgua0ugIuzj+4Dyw9cNhTQjBvTW6Yv
	 hdGqww0NOuHgltq1Z7vn+Qs97/1hH8Nt47hxu5BjKqiJAeogr0+LPOHsUG6vFYDsiJ9mOIX36zwm
	 l23MhU0/6O27XUUBSTjOpylfe3sCaj6n5gSp2axWcfVvfoEoADknpJWWYpwGaRjcmA9edzucA+1c
	 HbBYeEZgi+Yke+EVuT56bf3tZdF0zre8wccSynCuupUjMgjPQqdI7bxqSjslEFU24Oe1fVizL6xW
	 yaIWBnq+1YDQExt3IE2NvzjvukuOPpu32xVTv9RYuRVmaj6CaEgNB0MltQESyVMDM5sjHjGfEnFz
	 TRScjphf3cbaBzYu4sdRoUJR7TDSqnPJtqTbmF+dH6D7xpLPPDfmbLNhQ0bTLVoXagwt7Ey7cO1e
	 gWWaOKsNigmjoWCZkRULPN+kOTZlicbKYm0YCVa0oLifD1lIy3uIJu1Oe7yujE9/ZOju1wY8zXqI
	 rWKaBnHbkHmaj5XHM80MCxB0qzjp4BiTNUjKuAWzxXzZc9ufh8yzKK4rW16m5GpG9JSJuRlo0lQZ
	 xxgB1XsHulMYF3UvYLwCj+mj4ty9vAL8XhilhDzCMPJSdBDqmhXUPGa/roaaXgttJCxv/r0Gfqv1
	 DmCTMBVC/gTo8nZCHVFf2aN0dl0aotKgjxsTbb9GKRVEjUWv5nyeywseYElxnvrWbSA+oa547eca
	 zdoWq1lSwti05KEu4TABD5VnJPHB5m659eQ7Us+omhxeOUjRHhDLF0MKkXTnSwR6F8vKmLNMHvB0
	 TDRl62H9hg1y7zHrJs3PweslB7luk/ZdRs4BSrGEIzYMgqCplsNHWIL6OppBI9Zx/ENsULV9HOkk
	 vo+30ndc/WfMPmLfCx7HIP5wD/SeH95aENGEBuVvNEjNQ19rC/nzOrISMQ2rIRUFM0n1x5OLMvX2
	 fdpGOYehIYiYPZwWn5N8jlHyDFVS393ccu9k1GoNcwlvMi8mQSw1umZijxv9PG7GnH7DxDh01lAO
	 BP6HywyaKSZ16oQck1Wdtfd2ugcjiyawAkAChuoRkh+2QzFAskYM/id+5AUHcb7e5PgSfsoQ==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
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
Subject: [PATCH v2 2/2] clk: loongson2: Add ls2k1000 compatible
Date: Sun, 22 Mar 2026 23:08:36 +0800
X-OQ-MSGID: <20260322150836.55196-3-wjjsn@qq.com>
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

Update the clock controller in DTS and driver:

- DTS: compatible changed from "loongson,ls2k-clk" to
    "loongson,ls2k1000-clk"
- Driver: add { .compatible = "loongson,ls2k1000-clk" } to 
	of_device_id table while retaining the legacy 
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

