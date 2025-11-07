Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649041D31B9
	for <loongarch@lists.linux.dev>; Fri,  7 Nov 2025 06:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762495309; cv=none; b=qi5i0mOTHZY5SuUEPh3tztB7Yel2vTLct6vQ07jiW88au963xutpulxLOusQa1uFMHh09ZXPR7YSg9YTnffS9F79VQUmHSJZ2gXu6TC6zZix6YYhDubQUdG4w1nK+gi1NR+xaK9YfqyycwMFFz3nbHn8PFXSjQaqqfusHgWK9+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762495309; c=relaxed/simple;
	bh=BfTLJ8kFtXJeKZdKEmFicxlZaENNC9dVFN7w58zgIAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ieCjJgkBZINSDB5kx+ryRDxrZcYD9jZJLBd4zwnFm53ceZ+mImfUBNWqmpBi8Hu+OM8T4UNFEcYc/HHFXlwZ/npvtvKww45rFrsxTK63MNPz+OHopQdbR7PcfhIq4jUpDrBfrgN+2C7axRFQS9f7ZHh33cUpc5KMh1Vr4UkSBGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8Axz79Giw1plCYgAA--.2080S3;
	Fri, 07 Nov 2025 14:01:42 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by front1 (Coremail) with SMTP id qMiowJBxzsFCiw1pSJIqAQ--.32958S2;
	Fri, 07 Nov 2025 14:01:40 +0800 (CST)
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
Subject: [PATCH v2 0/5] Watchdog: Add Loongson-2K0300 watchdog support
Date: Fri,  7 Nov 2025 14:01:26 +0800
Message-ID: <cover.1762482089.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxzsFCiw1pSJIqAQ--.32958S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgESCGkMOJMGSAADsa
X-Coremail-Antispam: 1Uk129KBj9xXoW7JFyxJw4DKFW8Xr4kWr43XFc_yoWktFb_Ca
	s29a4xGr1DWF13Ga40qw17urWrXrWjq3W8CF18KrWfZ34Iyr15KrZ7CrWjg3W7Za90yFn8
	Ww4kuFsY9r97WosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70PfDUUUU

Hi all:

This patch set adds support for the Loongson-2K0300 watchdog driver.
It's similar to the Loongson-1, except for some different register offsets.
Therefore, I've merged it with the Loongson-1 watchdog driver.

In addition, I've simply fixed some minor issues with the previous driver.

Thanks.

-------
V2:

- Remove file and function renaming patch;
Patch 4:
  - Update commit message.

Link to V1:
https://lore.kernel.org/all/20251029020847.1946295-1-zhoubinbin@loongson.cn/
https://lore.kernel.org/all/20251029020913.1946321-1-zhoubinbin@loongson.cn/

Binbin Zhou (5):
  watchdog: loongson1: Add missing MODULE_PARM_DESC
  watchdog: loongson1: Simplify ls1x_wdt_probe code
  watchdog: loongson1: Drop CONFIG_OF
  dt-bindings: watchdog: loongson,ls1x-wdt: Add ls2k0300-wdt compatible
  watchdog: loongson1: Add Loongson-2k0300 watchdog support

 .../bindings/watchdog/loongson,ls1x-wdt.yaml  |  3 +-
 drivers/watchdog/Kconfig                      |  4 +-
 drivers/watchdog/loongson1_wdt.c              | 89 ++++++++++++++-----
 3 files changed, 69 insertions(+), 27 deletions(-)


base-commit: c64c2a50cdd487e2270c875c1770cd55705d75ff
-- 
2.47.3

