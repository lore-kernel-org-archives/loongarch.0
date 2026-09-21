Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A4147206E
	for <loongarch@lists.linux.dev>; Mon, 21 Sep 2026 14:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000349; cv=none; b=jws+onJYxoKwlxV17g+J11BxHZXXFXvKQBcodLq8rFNUREdtIwU3uAPohT87mujh/aRgnWDhmXASzEZnH3ryb3XhAFmGAHXARciUbRLzRaWy01h9mvmxLaMYPMpNsECkHt24tNhSJXfF9JQMuJDotYI2jbciKm8jNpxcH8PaPzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000349; c=relaxed/simple;
	bh=Hp1aaN6m9SLOJ9Ba77XKxslIFjByDCCJrJMUB87/J7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rxxxXaLy/Q7zvfuZCUNV4Cj85hdptulckxxdtTsfJp8oCmNQgOzg0OowQJ1dBvvLoU6G8g/IwEifB8an+MWCDF7sCrBOxzdI7VmfZSUXBA+/J1oo0+SZCAr1FUC5rMp9jHlPlXEWufC05h6jzIqKGDH/ORlrFkgRq0iSJfZmwX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DxzLvmU8; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DxzLvmU8"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-482f6351831so1553159f8f.1
        for <loongarch@lists.linux.dev>; Mon, 21 Sep 2026 07:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790000345; x=1790605145; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X9iJStx8k76O9mNNIa9n25MiOt6w1A7vHpXQesRkijU=;
        b=DxzLvmU83+8PrSR2GBA0ZsXNRXggKAOOlFpkvPxo1rvAbs6RsuPh1r3iFDJCNPrhZS
         2oH3V8lAyNj1LqZBB48/KXCsqol2791BW36V61NQUE6GcmQhvYXlLcz+4aZ/xjwSVENv
         Z7Np3mMl1YzRURQbjzUOBkpFKI3UgMoyjmHgfmpEuIyDXwJXHzQEi0NJfh1rRxHnZOJW
         tyLbtCdCc9fwGwqC/O9/WANWP0pI9ZmyNkXQW5jjgal/bgXlNdiFKeB71W5X1QpswyQ+
         4ANBxbej5eDT9rFer7i8/2BIFiHO5/ZOOULU45W56Tv4CyeHiEODEVflz2SwsG48TgXK
         J1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790000345; x=1790605145;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9iJStx8k76O9mNNIa9n25MiOt6w1A7vHpXQesRkijU=;
        b=nIbnp+sIFaOGkOrBOux6BMnBqy2bV0aWjvJI7CZtpP+Zt1GpsdJOya1ttqwaeaQxcK
         qEfyN58covFi4JoqIKkCUZAJk/bKYit5GgxGe7OuSr4VTNUU1KVEdr8G3oxu10qVkXq4
         D4/uMcH+C7/l3D23rOfOddRgAq3q0Mmg3kwoVr1GO3L+rGcLaSney7UCLPdmnjZ1CYUK
         +sYbJ+18GYzk0q+/+PCbN1GAKDNbMBBGA4rHZ18XGf9w7/x9pkzpB7VSdCk8CUsF4ZXV
         xjz3CTRULx/ihEznJ3DF/CnfA+WDT0uFJnYdhRSii4BM0qFRjrv1qYoTsf7bK+kQH7Qf
         Mtbw==
X-Forwarded-Encrypted: i=1; AKwUvBzLXJqCcIwiODK6xyXi99kUL3EAMQOxiNz9JcqWVS1Ej+ORAcL4MUdAhYj75PoBHB62AJkohbuORUk=@lists.linux.dev
X-Gm-Message-State: AFuF++nfkpsT5VKJFjTZ/0g3Y62cy26KgZg7mEZLJQ+YG2ZRHlbTDt6O
	Xev9BmQKhoAVoIFZf4iQFwYQvoNSudeaX9c3WSNdB1qnfcXJ/NJTp3H0dhN8EInzz+M=
X-Gm-Gg: AYBFou2gNry5GOHp8E8D9SwWEQjpglcjPctE3u0y/gs+FM5y0B+0cEPZwkOYUGHZLE/
	XPmmvw7EFs4qwdqrAEWsw7YJhD3/PqCJ1GcIiZfC/ZoeTYhDQZiIGt1Ge2MT83u70AMZqOTH3i2
	iQO9V1QoSx8MfpvaD0/ZWw6Z6jb1p5GlwYE98tgo8wlXkbdKT08W/dtknUhq2byAFuciPcXQLE5
	qpDY88ZVLtL5dfFuwI2NvUgVne9IlukUpJHurf+56uez3GDxWYRU4ZNn7sZOQUyyVLH2+v8Ss2i
	bF/hF66W58X1o7cAOiMMrdsaTTqTIIIpWfcY/vrGO2N7e+PKJS4x9eBe1M+iOrttcmzpqkTscBs
	DXKMCQymd3aUX0p08K4QXA3ZyrjJ1TFj73PmggbdFWc6iEA9Vmby/1uBGwUYCz0OHpSXCr+L+on
	vpRS08HAtrN6CB0wAuiCDSSmPd6Tq18P65YfQYVkKfkLiICAdkTAIs7JhpQdOg4BJ45n+luQ2je
	EmpZQf2KwyyehQa4wGaV1vbO+/FqnkXBqu9uLqhSYkh6ZYui43JzKOqTXD7Hg==
X-Received: by 2002:a05:6000:310c:b0:485:ae8d:1e07 with SMTP id ffacd0b85a97d-4871e37dee2mr15597411f8f.56.1790000345490;
        Mon, 21 Sep 2026 07:19:05 -0700 (PDT)
Received: from localhost (p200300f65f19a904d4f76eed31f2ef79.dip0.t-ipconnect.de. [2003:f6:5f19:a904:d4f7:6eed:31f2:ef79])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48724422790sm22134362f8f.5.2026.09.21.07.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:19:04 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Raag Jadav <raag.jadav@intel.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Alexey Gladkov <legion@kernel.org>,
	Hasan Basbunar <basbunarhasan@gmail.com>,
	Hugh Dickins <hughd@google.com>,
	Armin Wolf <W_Armin@gmx.de>
Cc: WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v1 1/3] Move struct cpu_feature to <linux/cpufeature.h>
Date: Mon, 21 Sep 2026 16:18:49 +0200
Message-ID:  <ef103a4b9e1cd7477fa52ee347c4ec301354fba9.1789988540.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1789988540.git.u.kleine-koenig@baylibre.com>
References: <cover.1789988540.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3330; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Hp1aaN6m9SLOJ9Ba77XKxslIFjByDCCJrJMUB87/J7I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqsTzLZ9D4hpytjwv31lXxPvfXsBlJnDYJz+Jiq Ckg1/ZdTzmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCarE8ywAKCRCPgPtYfRL+ Tr7BB/9RxyUkC8S2GB8h2AOL5R1cm+BhY9DSagwLwPGj7JLlQCNJn+1BpMEj/D6VFQC+nz70qG2 yPyA2QQ1bUxHWk/yXqQHc2aLOAwfVbWII5ziFW40g/6GvU6wvz8WcEyRDE31WY34MEQ7U7jcb6C lV32wGb66HTpO1a/WqGnaIiLw+93l6IkcuGzKf3aCqRjjMDVAl2id/bwVPjVAI4krEK2MsAhXb1 WpGCfUDDGDfmsMF3khnktkeHgFidAC6iBymdXOg9yODHQcbhPhE2c31y8H93SOIWisLa86oVmgb aT/QWYPEJ2u+WdNcbeKYiBJxYkR/MuOmC2K6dh+rQ1fbEPw8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

struct cpu_feature used to be defined in <linux/mod_devicetable.h>. It's
much better located in <linux/cpufeature.h>. The only downside is that
modpost and devicetable-offsets.h need the definition and thus
<linux/cpufeature.h> must be included explicitly there.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 arch/loongarch/kvm/main.c         |  2 +-
 include/linux/cpufeature.h        | 12 +++++++++++-
 include/linux/mod_devicetable.h   | 13 -------------
 scripts/mod/devicetable-offsets.c |  1 +
 scripts/mod/file2alias.c          |  1 +
 5 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
index 236523d2449d..d082dae61971 100644
--- a/arch/loongarch/kvm/main.c
+++ b/arch/loongarch/kvm/main.c
@@ -5,7 +5,7 @@
 
 #include <linux/err.h>
 #include <linux/module.h>
-#include <linux/mod_devicetable.h>
+#include <linux/cpufeature.h>
 #include <linux/kvm_host.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
diff --git a/include/linux/cpufeature.h b/include/linux/cpufeature.h
index 6aff540ee9e5..93c1da38aaf6 100644
--- a/include/linux/cpufeature.h
+++ b/include/linux/cpufeature.h
@@ -6,10 +6,20 @@
 #ifndef __LINUX_CPUFEATURE_H
 #define __LINUX_CPUFEATURE_H
 
+#include <linux/types.h>
+
+/*
+ * Generic table type for matching CPU features.
+ * @feature:	the bit number of the feature (0 - 65535)
+ */
+
+struct cpu_feature {
+	__u16	feature;
+};
+
 #ifdef CONFIG_GENERIC_CPU_AUTOPROBE
 
 #include <linux/init.h>
-#include <linux/mod_devicetable.h>
 #include <asm/cpufeature.h>
 
 /*
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index a397213bedac..9ce2429b455f 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -8,10 +8,6 @@
 #ifndef LINUX_MOD_DEVICETABLE_H
 #define LINUX_MOD_DEVICETABLE_H
 
-#ifdef __KERNEL__
-#include <linux/types.h>
-#endif
-
 #include "device-id/acpi.h"
 #include "device-id/amba.h"
 #include "device-id/ap.h"
@@ -69,13 +65,4 @@
 #include "device-id/x86_cpu.h"
 #include "device-id/zorro.h"
 
-/*
- * Generic table type for matching CPU features.
- * @feature:	the bit number of the feature (0 - 65535)
- */
-
-struct cpu_feature {
-	__u16	feature;
-};
-
 #endif /* LINUX_MOD_DEVICETABLE_H */
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index b4178c42d08f..b57dbbef8777 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #define COMPILE_OFFSETS
+#include <linux/cpufeature.h>
 #include <linux/kbuild.h>
 #include <linux/mod_devicetable.h>
 
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 8d36c74dec2d..88bff3207277 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -121,6 +121,7 @@ typedef struct {
 /* Big exception to the "don't include kernel headers into userspace, which
  * even potentially has different endianness and word sizes, since
  * we handle those differences explicitly below */
+#include "../../include/linux/cpufeature.h"
 #include "../../include/linux/mod_devicetable.h"
 
 struct devtable {
-- 
2.56.0.rc1

