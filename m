Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440060;
	b=LAksqgudLizAU+b2hCUdt1lpR7lDUra6clfwYnrDn6Ot4tBQ2Iq6wy1Rslugx/OsfOad
	 3XSTM43FDyN4ony0KE69dqGLqHaSV88qTQbwsSdZrKjuENJBWzVUGVzidBO5gpZX17OXG
	 sg0WbCceJ3zt4UqavMdeJRlIKDVu1a3pUkZDP4I6r4xKh0LCHo0RjkTm316TQLqge5p3V
	 TMdUvCHXHyMW6Y8kdHQe6va9rc5Fy0umvtkpoDIBs/Qkxr6bOoyVnT5KWc5xNxdDHm7JA
	 1uE2GjVV4qdJID6OE4soHBTHqSoCWv0nnhq58+Q4FvuSo1wlFLu/gogcyfd0GUdtj7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440060;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=oDb7/5u+YnPeqHf4ZzAH5ZXhy4WXYRV6NDUqhDTLi2U=;
	b=nG7JBwV+cRlTl/PWmWqpMdzU0ThVc9kGZVxM1T830mBfiZpuCKBFysM1qkD4lvKkt2DT
	 yv8BhI2h+fK/OM32P4Ca95r5LwnGFRy7X9QklRm0qEFZQd445u4SEZ6TLbNTA5lkBHGcn
	 /e2BQXNwcKtDxDlY6oivAcpVR8eBvI3FrEsMvna4YCLgU9BpgnUh08v/YRUvawKeNzt52
	 uhzUMoBfxZm+E4vmtwTeDb1AWXI8sgDeBvF6Y41TCZn/05M6rP6iEd7BAovBQ3EK0dH8d
	 52lbZhXiQhQHqWvzDDYkkHikrZaU3WWCMHo5aKnttjMsr6Hx5f8tPmlnzNfAst5nFdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinsec.com.cn;
	spf=pass smtp.mailfrom=kylinsec.com.cn;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B27606A333
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 13:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14B27606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: esmtpsz19t1795439983t8360dc36
X-QQ-Originating-IP: 8K8vIEcxTTj1hnr8PTB0ssAJXbxSDHLAKXRFev7MtWU=
Received: from yoga14s ( [113.246.116.110])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 23 Nov 2026 21:19:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8098164807800772953
From: Luo Qiu <luoqiu@kylinsec.com.cn>
To: Jianmin Lv <lvjianmin@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yao Zi <ziyao@disroot.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Zixing Liu <liushuyu@aosc.io>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] platform/loongarch: laptop: Fix backlight device lifetime on unload
Date: Mon, 23 Nov 2026 21:19:44 +0800
Message-ID: <C95EAA0918240E5D+20261123131944.77149-1-luoqiu@kylinsec.com.cn>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M5znx2hx04lbgtJ759KREz7HgKXjmpAIlpL3TPjBNk9OE0DUtH9rtcbO
	BGgK1IxppcjR8Bi3TU8zM7JXMMjAH63dwA6LEfaviV4R4Y9yjlbsLuOBLsDsNSoPcVLmC/Z
	A/o5SQe6FjrI1UEpMCZGgm+pnSzDkgFWObd0zp/IWmNFkeGtbo1yrjrXDskqqwLFwagejTA
	TiOmyHBg63138hg5nYd9vtM73YLih11y7eZLORsbp6/dt3Z/WEsc3jf1kWEvko9ia22ySlq
	V2StcJeGUgX7Rf+GQqE8RCb15taEvQPEXhFHCiUwbVLSdWfoYMsBKtNF2Ym0hiVcLjC8fYu
	ttL+GJNQ9eG2/vJmYiYCsxyU34plZ28wMg4s8wMXc5slKy5rZO3E8oWjcemxgwtBnbzHdDz
	dCoFFk8tuFObaIjsAmjI6dRR+Ser7Azpuguhb/FkKzqCBr0KGkT6ZDthO9WgKQFziZO7GlD
	jgTKMcioZ55qu3KX3KS/BT6mz/dct8TkEOdtUEQjmx2Lv8Fk+VcuplQaUEzcUNzVN9DzJvB
	Jn1KjWu3nyC4Cm/q3qGfIkvRQ1aDYY1L6HslQuZ3pTBhD+VoSa1Nyns7uvN9WsVZ/JXlBRC
	KB5lHGvnDVlrZncZxNIEdQO+km2gAbidlXiFSPXqYzWoiZQYi++6yrIbY/yYpXM4fC/whT8
	nPKj2+Z6xXd80jpQiP3vath6y0kMcnuMPDTVQuqo0FeXlgzWweJ6N/tU24u1MfPx6bfH3N3
	Bez5tUn18Gy7rxbR8+gR4lKoSXCh8PGW1ZF+WgPdy/4axXLgwnUvI13pzF1CTASSem/Bbpn
	AdXuJdf1f0QIPY/XGJ9JYeNn8GyI1nUBpA+sW1XiZoZywnZuAtjwwX0gwXMry1h/pc8XfHM
	mBObCLnSVp8EDTgqJVZkQU3k8SHuDNYrYn/tYuObXgPJ3em4ztjTKlxpbqYmZRCPq7rkVSE
	FpE9fGwnkiWegcR+h/zDbO8LbVRBARfbon5EtEGZnWfU4he2dkZpLrNdb+g+qFvSfnbNT9F
	i7oBREK1dF7Md/hKs/69iymRrEbaM=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

The driver registers a platform backlight device during module init but
discards the returned pointer. Consequently, the device is never
unregistered when the module is removed, leaving its ops callbacks
pointing into freed module text. After module removal, reading the
backlight's actual_brightness attribute can call the stale callback and
crash the kernel. Registration failures are also silently ignored.

Store the returned pointer, use it for resume, and unregister it on
module exit. Check and report backlight registration failures.

Fixes: 6246ed09111f ("LoongArch: Add ACPI-based generic laptop driver")
Signed-off-by: Luo Qiu <luoqiu@kylinsec.com.cn>
---
Changes in v3:
- Fix continuation line indentation and argument alignment.

No functional changes.

 drivers/platform/loongarch/loongson-laptop.c | 25 +++++++++++++-------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platform/loongarch/loongson-laptop.c
index 4ec56621db24..c9170330e630 100644
--- a/drivers/platform/loongarch/loongson-laptop.c
+++ b/drivers/platform/loongarch/loongson-laptop.c
@@ -56,6 +56,7 @@ static acpi_handle hotkey_handle;
 static struct key_entry hotkey_keycode_map[GENERIC_HOTKEY_MAP_MAX];
 
 static bool bl_powered;
+static struct backlight_device *backlight_dev;
 static int loongson_laptop_backlight_update(struct backlight_device *bd);
 
 /* 2. ACPI Helpers and device model */
@@ -194,13 +195,12 @@ static int loongson_hotkey_resume(struct device *dev)
 {
 	int status = 0;
 	struct key_entry ke;
-	struct backlight_device *bd;
 
-	bd = backlight_device_get_by_type(BACKLIGHT_PLATFORM);
-	if (bd) {
-		loongson_laptop_backlight_update(bd) ?
-		pr_warn("Loongson_backlight: resume brightness failed") :
-		pr_info("Loongson_backlight: resume brightness %d\n", bd->props.brightness);
+	if (backlight_dev) {
+		loongson_laptop_backlight_update(backlight_dev) ?
+			pr_warn("Loongson_backlight: resume brightness failed") :
+			pr_info("Loongson_backlight: resume brightness %d\n",
+				backlight_dev->props.brightness);
 	}
 
 	/*
@@ -409,6 +409,7 @@ static int laptop_backlight_register(void)
 {
 	int status = 0, ret;
 	struct backlight_properties props;
+	struct backlight_device *bd;
 
 	memset(&props, 0, sizeof(props));
 
@@ -426,9 +427,12 @@ static int laptop_backlight_register(void)
 	props.power = BACKLIGHT_POWER_ON;
 	props.type = BACKLIGHT_PLATFORM;
 
-	backlight_device_register("loongson_laptop",
-				NULL, NULL, &backlight_laptop_ops, &props);
+	bd = backlight_device_register("loongson_laptop", NULL, NULL,
+				       &backlight_laptop_ops, &props);
+	if (IS_ERR(bd))
+		return PTR_ERR(bd);
 
+	backlight_dev = bd;
 
 	return 0;
 }
@@ -622,6 +626,11 @@ static void __exit generic_acpi_laptop_exit(void)
 				generic_subdriver_exit(&generic_sub_drivers[i]);
 		}
 	}
+
+	if (backlight_dev) {
+		backlight_device_unregister(backlight_dev);
+		backlight_dev = NULL;
+	}
 }
 
 module_init(generic_acpi_laptop_init);
-- 
2.56.1

