Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648A1D27E
	for <loongarch@lists.linux.dev>; Fri,  7 Nov 2025 06:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762495308; cv=none; b=TsKI02h60tlSp6dwfQ+4zQxkso6hrLt49JS78kqmrebbPHYgTpgWuR/0a16kyzenn/GcLaxmryWpfyfrC6eZ8U/GDewjEDmpu7GrAVwNb5RLKuu8YNn48GXCGFoPpN2inn3hYGy/sbhTVkb/Bjxnq4nMteiobY2qq1jyDZmH93E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762495308; c=relaxed/simple;
	bh=DAlDqk1rXhpwahNwT2Cg1Y/rqXr/V8IHS9Yne0GOJjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ah2H49ZSknGYpzmrDePcUpC+khl0I+7e5ml18Y2FJ5NbUDiookG6C7xiY8tznXu3+sWAKPKaEFLucA4nVeRyMWJXhHCx4APLvEsyXxxJBQYyWxc/aTpT5BgzeCRc7T66HOwIbLrhDjtuQwHcJ6cp0wuZr+ebEJbCakSO9BE9coU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8BxmdFHiw1pmiYgAA--.4543S3;
	Fri, 07 Nov 2025 14:01:43 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by front1 (Coremail) with SMTP id qMiowJBxzsFCiw1pSJIqAQ--.32958S3;
	Fri, 07 Nov 2025 14:01:43 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 1/5] watchdog: loongson1: Add missing MODULE_PARM_DESC
Date: Fri,  7 Nov 2025 14:01:27 +0800
Message-ID: <707bfcf1a45008ecf5c8d517430332a66d4ee758.1762482089.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762482089.git.zhoubinbin@loongson.cn>
References: <cover.1762482089.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxzsFCiw1pSJIqAQ--.32958S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgETCGkNihMACAAAst
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gr4DWw45Jw1xJryUKrWkXwc_yoWkJFc_Gr
	yxZwn3Wr1DGF12q3Wjv3WFyrW09F4Uu3Z8uF1kKFW3Aa93try5CrWvqrWUWr13ZFW8Xr13
	Ja1UXrWF93srKosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb78YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8rwIDUUUUU==

Add documentation for module_param so that they're visible with
modinfo command.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/watchdog/loongson1_wdt.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/loongson1_wdt.c b/drivers/watchdog/loongson1_wdt.c
index 0587ff44d3a1..8502263b0d6f 100644
--- a/drivers/watchdog/loongson1_wdt.c
+++ b/drivers/watchdog/loongson1_wdt.c
@@ -18,10 +18,14 @@
 #define DEFAULT_HEARTBEAT	30
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
-module_param(nowayout, bool, 0444);
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
 static unsigned int heartbeat;
-module_param(heartbeat, uint, 0444);
+module_param(heartbeat, uint, 0);
+MODULE_PARM_DESC(heartbeat, "Watchdog heartbeat in seconds. (default="
+		 __MODULE_STRING(DEFAULT_HEARTBEAT) ")");
 
 struct ls1x_wdt_drvdata {
 	void __iomem *base;
-- 
2.47.3

