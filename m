Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6197B
	for <loongarch@lists.linux.dev>; Thu, 27 Oct 2022 12:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79105C433D7;
	Thu, 27 Oct 2022 12:52:41 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] platform/loongarch: laptop: Adjust resume order for loongson_hotkey_resume()
Date: Thu, 27 Oct 2022 20:50:47 +0800
Message-Id: <20221027125047.3450683-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some laptops don't support SW_LID, but still have backlight control,
move backlight resuming before SW_LID event handling so as to avoid
backlight mistake due to early return.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/platform/loongarch/loongson-laptop.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platform/loongarch/loongson-laptop.c
index f0166ad5d2c2..0e6f4efe21e5 100644
--- a/drivers/platform/loongarch/loongson-laptop.c
+++ b/drivers/platform/loongarch/loongson-laptop.c
@@ -199,6 +199,13 @@ static int loongson_hotkey_resume(struct device *dev)
 	struct key_entry ke;
 	struct backlight_device *bd;
 
+	bd = backlight_device_get_by_type(BACKLIGHT_PLATFORM);
+	if (bd) {
+		loongson_laptop_backlight_update(bd) ?
+		pr_warn("Loongson_backlight: resume brightness failed") :
+		pr_info("Loongson_backlight: resume brightness %d\n", bd->props.brightness);
+	}
+
 	/*
 	 * Only if the firmware supports SW_LID event model, we can handle the
 	 * event. This is for the consideration of development board without EC.
@@ -228,13 +235,6 @@ static int loongson_hotkey_resume(struct device *dev)
 		}
 	}
 
-	bd = backlight_device_get_by_type(BACKLIGHT_PLATFORM);
-	if (bd) {
-		loongson_laptop_backlight_update(bd) ?
-		pr_warn("Loongson_backlight: resume brightness failed") :
-		pr_info("Loongson_backlight: resume brightness %d\n", bd->props.brightness);
-	}
-
 	return 0;
 }
 
-- 
2.31.1

