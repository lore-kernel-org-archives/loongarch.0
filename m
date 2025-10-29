Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D592E7F21
	for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 02:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761703751; cv=none; b=OgwOzKj6c5XEj5/iJWUfmCk6aBiLQ4I9uc0H9ZHG/FsjYFo5jJmxow54TKvb0YustScBdMwa91gszPdGt0pn0QD5WWWfj0drN+bW7Mr/LubiPSNZirRzvTjrKaCcU1bLaoHIDXDL2+6iSXX+66rayRGcee7UR8HpIcBUykxcaD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761703751; c=relaxed/simple;
	bh=XGXgKP4uvbIWo7QdcLdnSN2lnZ9oTH2t7HkLiSqWwXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iNEcMoY5jWvwC7N62TELhCOAvDqQPS1hdNWkZqIiQi4jsllvb2F5suYbcTpBAEwlrsxkFbwAbBIXyVItU2sxi2Hvb0W/BgpCB4ppXNcGJUypIDRKM0NjgOi8cL9eZpJA/GEPGpUZm2vZASa5WEmHFtO0b00kEzImMIxxP2axySg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8Cxbb8_dwFpRNobAA--.59517S3;
	Wed, 29 Oct 2025 10:09:03 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by front1 (Coremail) with SMTP id qMiowJDxqcA5dwFpbrAXAQ--.64967S2;
	Wed, 29 Oct 2025 10:08:58 +0800 (CST)
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
Subject: [PATCH 0/6] Watchdog: Add Loongson-2K0300 watchdog support
Date: Wed, 29 Oct 2025 10:08:44 +0800
Message-ID: <20251029020847.1946295-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxqcA5dwFpbrAXAQ--.64967S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEKCGkAWywU5QAAst
X-Coremail-Antispam: 1Uk129KBj9xXoW7JFyxJw4DKFW8Xr4kWr43XFc_yoWkuFg_ua
	4Igas7Cr1DuF13Ja4jqw1UCrWIqFWDZ3W8CF18KrWfZ34Iyry5KrWxZrW0g3W7X3WUXrn8
	Xr4kur4F9r97XosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-UUUUU

Hi all:

This patch set adds support for the Loongson-2K0300 watchdog driver.
It's similar to the Loongson-1, except for some different register offsets.
Therefore, I've merged it with the Loongson-1 watchdog driver.

In addition, I've simply fixed some minor issues with the previous driver.

Thanks.

Binbin Zhou (6):
  watchdog: loongson1: Rename the prefix from ls1x to loongson
  watchdog: loongson: Add missing MODULE_PARM_DESC
  watchdog: loongson: Simplify loongson_wdt_probe code
  watchdog: loongson: Drop CONFIG_OF
  dt-bindings: watchdog: loongson,ls1x-wdt: Add ls2k0300-wdt compatible
  watchdog: loongson: Add Loongson-2k0300 watchdog support

 .../bindings/watchdog/loongson,ls1x-wdt.yaml  |   3 +-
 drivers/watchdog/Kconfig                      |   8 +-
 drivers/watchdog/Makefile                     |   2 +-
 drivers/watchdog/loongson1_wdt.c              | 170 --------------
 drivers/watchdog/loongson_wdt.c               | 209 ++++++++++++++++++
 5 files changed, 216 insertions(+), 176 deletions(-)
 delete mode 100644 drivers/watchdog/loongson1_wdt.c
 create mode 100644 drivers/watchdog/loongson_wdt.c


base-commit: c64c2a50cdd487e2270c875c1770cd55705d75ff
-- 
2.47.3

