Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267223;
	b=GV0tLDGZoCax4z5O3SiNtbh+LWpae+a4KXiPI6aO5lWzJ9p1PVlYvCPYav/N9QdyGhUH
	 5ufbqHjEIQciWa8Nl4geVqM7dkHwg/pRR+mzu7dAnCAob76y0uRwS/0nDlZZs/BICvGg1
	 mHsPd/iwMnjrAtjFK4Js5zFgNEwrcb5+Iv75TDpVGxqI67rtEoy+r/bcm4zNWkdAYeRzb
	 hFpElhVP/ILDdjGTjUSVERFXKqZd/lSWWxZPVgd2507yZ+K9qzNygKCqdjpjX/ZMQ0JaL
	 bUbGDVDh7kh125aPgI2V6KdJyefaQbCEu5XpsSJDa1TW0y047bAgv0ypnQxHTFQroDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267223;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=d/pLCyn5nrRN5SKWeNMFsROQuE+5ueEG2459NsXjUsQ=;
	b=pPLK1OqI6wZJWyyzAIzylI2rMwJnAuXWTi0QeVE2Ne5hrbIxXBnjhi91m/HmlQXtloWo
	 jskBePJENROg69i+Uo4tPSqFfoOOI5aWY2ydeTeJfQtX0E5pz5Q/rOqfre8FJlO7+kvfk
	 Cc3Tm/x+H0hkTSk0U4HDR/YxLmCx1XKshJTDA1PhqtxjEn4pMPIW5iGuCdKHGRgxkOo1l
	 estv0XkyW/KCGhCRzJEj3awmOmaSNQ6TWT7U2T48F3SufcW7xf9tw1h0Lh5UB3ZUr/r3U
	 ygYxnqz6tU62kpZsItq2qY+gUAakMW1DtIILPfY+9elTSC2DW9qWqMByKmD3kGFJtWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinsec.com.cn;
	spf=pass smtp.mailfrom=kylinsec.com.cn;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880E0606A320
	for <loongarch@lists.linux.dev>; Sat, 21 Nov 2026 13:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 880E0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: zesmtpsz8t1795267117t73df3d34
X-QQ-Originating-IP: 7zsZ9rFdTsq82y8pmBSeqBNpQV3EcqWqJHVukzyBbMI=
Received: from yoga14s ( [113.246.119.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 21 Nov 2026 21:18:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16635128251189827061
From: Luo Qiu <luoqiu@kylinsec.com.cn>
To: Jianmin Lv <lvjianmin@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yao Zi <ziyao@disroot.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Zixing Liu <liushuyu@aosc.io>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/loongarch: laptop: Fix backlight device lifetime on unload
Date: Sat, 21 Nov 2026 21:18:20 +0800
Message-ID: <9F3855F1130E2878+20261121131820.6759-1-luoqiu@kylinsec.com.cn>
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
Feedback-ID: zesmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: McoPngcDBvM5KG3yOoQR8DNlUOOsx6JppJOOXaixIObZmtD/dhw7LM2Z
	9cHD9Q7E+TFL89UYmxsFf62JlYQDQdRbpm4c1x7NoMH+gty1Z+x7n+OT/eCp0ZaaHpfESCd
	8P43bEnQNCpCiglM2zxzjdAVfFI6eIfbv9m2dARfDVvXsJjqH5p6sEPYQpp0+ny3KBWwWfe
	KpFMpQOWG/qWrp1EkVcL1ntuNMDLJlC/Cf8uK+9t3i3N26Fv909PuX4jz0PrcBZoyQcCzd1
	nRuLAXDquW4JOxBvVWnqNcEFlQdUpHrYtlilwPQkwh9S0VH7CWfacgdhYlfYMuqwtjYuZr3
	HmJuh0HdKURUCXNPwSxW1c74YR3iNeXIk3PXFVkLq+GrrsRid9Aiw0yMaUnHOVP6WVfI8Yp
	DD5KJBSZsAEivYnPu8ohJIaFU99oEzZ/myFE4F5NKSsqSJMBEu41lhMXtu6H67d6SrS7oJR
	3A/50VcNuLoZ5PhF27EmUBKUF2wbaZVUok+ireseX4wPG3w6axeQww4bEAJh02QOzbj+86g
	a4eZ5svatdgUsFa6rNvYMJvCqkdq+mXEqyD8/hggqnl9GYsMKcSGGazZUq9aU/C6vJZjBhf
	bOR2MJbT3qNqpdA197oMs6tINICD1KZVKKtx5psSXLi03T0WcFIbsJSSXcLkMnCEnbfQ9Kb
	4h22mBO+/hKmOKjy8Nq2v/OaooHuvJbghbpRaKVk3EKi6hORQQcaCEX88s4jBNO4skX5x84
	rQONjz1GKAxrixMDeYuyI651GGo5y6A/xi9qmUF0WXpMpy8v/9wIf04wbGUD9DRb6TyS0j9
	UwwWKMMPKdKd6ixsvcCxiDzeEfXW3vSpdq9uPZCyNBMV3nSNp24A8qIfRANGUCebf4UsIkp
	ZntYuB0p38bZlEJjwj7psBIDu8f2CRhvLQPnE6Uq5TKkBx0SpT7Kj8t5oLSc16ew1zrtHL6
	w+ZNr+mjJbEbnTjh92lrY5XhClrsE+oIsMFGJwRN+nyCRQqty8OVWE+FqkNR0rIA6YQka7E
	i2ncDZyPmwIXMwlBQmI+YNUHTj7/M=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
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
Changes in v2:
- Add a NULL check around backlight_device_unregister().
- Correct the changelog to state that registration failures are checked
  and reported, rather than propagated.
 drivers/platform/loongarch/loongson-laptop.c | 21 ++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platform/loongarch/loongson-laptop.c
index 4ec56621db24..65e92a250614 100644
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

