Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090983;
	b=U7Dn4kq3F4FCxwNVU/xxqxkgHr6hel80sM9i8a3VwRUqrncWRKbF5E7mxfqQULzc1YGq
	 NICXxTqEdC1+jkh2p85wGYDOXmhxrHO5F72myBUTwsSIrIlYQrGa1TmqUx2NQ2FoLOmm1
	 wiSj5rLudT5Vn/KD9bmYVCmpdzIPqmL2wyMFsladN5CEA54xBexpWrpWvYftqsXqlXE3W
	 H9NbYcYpZ1lBLR16fRStYkYPBdc/4HnvZNgx5LV6I0XCMOIA7kqTE3cE+SrzW5Ouwm9bU
	 wGoRfOw55cJwH4gSBSW6TbjXzmMNBP5SykQ6/kKV5SFiJHbKfpH9AmC6E563vpYS2ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090983;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=6W4tTNb+kgDIVSWyfMU6HSxB+Dr8oZihxHB4spQItl0=;
	b=arwEd7+etQqc+2x4RbKE7olQ0EzLexTZOcEBklUMWoKJgCpTAyuI4eIKXeyScQ5HizMD
	 R3AVd7N7MLknjMqedELPDLDu8H5iskSdma6jgyqLP6Wc+GdxS5K15Ulb91GJBdwdP3S0k
	 L+6tZG8i7+pFhkdHhLHZfJFBEpF+bFIVGdwFSIyuBJu0eOaTThYeriZBeDvxn/x2HnYJX
	 VN9MKHVxedudJ/SSb1LIiLmI/F6/JPSG1uFsRKAobAJz3J9FvfK6fyNn7qJyHpE6cSiLD
	 BHR51ajxsk5OLJ9axaqCPFQ4nKbiLi/AS2JRHe/uhiikoPcjph4WQOCxIY1yrvpRNpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinsec.com.cn;
	spf=pass smtp.mailfrom=kylinsec.com.cn;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C1F606A32F
	for <loongarch@lists.linux.dev>; Thu, 19 Nov 2026 12:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C1F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: esmtpgz14t1795090890tb815eca8
X-QQ-Originating-IP: fwc4cfVGoeIqaBRjxMZyyuwBKLkTal6gSF2+iLTfqKM=
Received: from arch ( [175.0.188.152])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Nov 2026 20:21:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14019034921868307575
From: Luo Qiu <luoqiu@kylinsec.com.cn>
To: Jianmin Lv <lvjianmin@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yao Zi <ziyao@disroot.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Zixing Liu <liushuyu@aosc.io>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/loongarch: laptop: Fix backlight device lifetime on unload
Date: Thu, 19 Nov 2026 20:19:37 +0800
Message-ID: <C3361EF435F90A22+20261119121937.2447021-1-luoqiu@kylinsec.com.cn>
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
Feedback-ID: esmtpgz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NSQm2ODd9qLZII/S/l8bWgzRXko93qEWUfhnrgep9CloUGqKKaBujEIz
	UG8uxRE5fXmCfwj+561+xp3MMqY8w/aD2L8hF4WsVeu7lE4TdAPGuzkrScOHBRdgkrvZJyw
	P35hFGSahPwrkMcnri2CcMTbFP2aiWa6rGjOnRWH3pqNAhaLhu/uYUY1SjKP5YPKKHk/4LO
	vKfZdfOlbRoeOqOFPw8byS4XvwWndIxpTW0QXWB7JUM15EJviRPvki8/+R/N/nCpTX8oZO0
	TE0DH6vJ1s8LFtmTuABunOyUg6Qu0RvHNK28OjYo7ckem2XRWGhmLHMfkY5LNKDIpOx2w9k
	9W4c7+PHESMX/Wc8I2zCSA+CVYGGqe0Ij+9QIjYAfHfL5e9JzA0R5KtJwPy6Ox5hkyzdtNn
	jQFNqIwbmwDIiLgqGbzaTiLOAK+RdQPjpAXGGEwHlEEdwi5Z6w2phsH4JESrnl2Cg9+UV1+
	cIwB0f60biNAzI/q72FmTA1hzy1Rx16PEwcqFd1skH4yShX89sjSwVO6OUz54erELWHMlPX
	mRJ5P+1jygdWtDkAEUgn7YdbszVVl+vgKV3LnqcrRX6gyQsvI+E/isGxBmGzvmFesoZ6z8n
	mEibocJReyE6nnRGdbviRhJlDsmeE2885m4fN2frhGK1N674QKCo/uX1AqCeEt9/BUdRPqL
	cHKcH8qt044QrN0zOF8mNIknKB4gUSWXP1pioNanP9599yeE0i7QnTNcE56RVpUE7jjPWQl
	k9yPFo8ZSfQBosikipHjPbgLAaQLO2k/zY5EHhN7Sipchv+OEm5y7xNljPsastSVVB/y0wV
	7wbmBvQqAEcT1Q3exHvkGk7Fpl4blejVCm/iiAIIfKgbGWgcdg/TQddql99Uigzr0PpDtrm
	8ym5SmiviqCZ8OVXno/mwnBUKIL3OBSoTloacK/kK7BVRGuI2YjrwYIKYN2HnJh2gVviiNK
	iipOw30hmFtjSFblGOnze6hbiGQpykYhB1QF2sQ5WW9XSh1ZRTdOewd0LN1F94rG5I90=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

The driver registers a platform backlight device during module init but
discards the returned pointer. Consequently, the device is never
unregistered when the module is removed, leaving its ops callbacks
pointing into freed module text. After module removal, reading the
backlight's actual_brightness attribute can call the stale callback and
crash the kernel. Registration failures are also silently ignored.

Store the returned pointer, use it for resume, and unregister it on
module exit. Propagate registration failures to avoid silently
continuing without a backlight device.

Fixes: 6246ed09111f ("LoongArch: Add ACPI-based generic laptop driver")
Signed-off-by: Luo Qiu <luoqiu@kylinsec.com.cn>
---
 drivers/platform/loongarch/loongson-laptop.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platform/loongarch/loongson-laptop.c
index 4ec56621db24..ec0742e5ed46 100644
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
+	if (backlight_dev) {
+		loongson_laptop_backlight_update(backlight_dev) ?
 		pr_warn("Loongson_backlight: resume brightness failed") :
-		pr_info("Loongson_backlight: resume brightness %d\n", bd->props.brightness);
+		pr_info("Loongson_backlight: resume brightness %d\n",
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
+	bd = backlight_device_register("loongson_laptop",
 				NULL, NULL, &backlight_laptop_ops, &props);
+	if (IS_ERR(bd))
+		return PTR_ERR(bd);
 
+	backlight_dev = bd;
 
 	return 0;
 }
@@ -622,6 +626,9 @@ static void __exit generic_acpi_laptop_exit(void)
 				generic_subdriver_exit(&generic_sub_drivers[i]);
 		}
 	}
+
+	backlight_device_unregister(backlight_dev);
+	backlight_dev = NULL;
 }
 
 module_init(generic_acpi_laptop_init);
-- 
2.56.1

