Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2299E299AB4
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 07:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756970259; cv=none; b=sNoQ7jNVegSFPLWm/w51YHPYbBViKBjmdYVlDEHfjcpdG/70UdUuS0vIjvdnbxNHeFtQVxYmtV7BGwRuf2PAeelaLdm0JASZfoe/vN2OGvutqHo6xxlzLanmx5KMAU2pTOnbSPovn8GzCgHwlIEYicb+SeaTL2tGS7E5MTUkK/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756970259; c=relaxed/simple;
	bh=18nNQkpO76odAuOhYO6DFGmsxO9+r8Zf1pzFzS+E3WA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oI7U4NXX5VocnoAgfHouiJprwk60bmTj05TtnoxWBfFc8j4KRNZBE+YVpN+A6TJ0nuxrjy9qoajbj6U+Nmok9LZAh5z9uvo4Kz51qHQwnCh6SQXHktem2XsaNNk7w/tv5mw+Pargj8Rawl7M1DA5zRYgTmF8nSnTRmZ5wSsgiU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Cx778NPbloSI8GAA--.12547S3;
	Thu, 04 Sep 2025 15:17:33 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJDx_8MNPbloS2h9AA--.2519S2;
	Thu, 04 Sep 2025 15:17:33 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Xianglai Li <lixianglai@loongson.cn>
Subject: [PATCH v2 0/2] Remove unreasonable detached state set in tick_shutdown()
Date: Thu,  4 Sep 2025 15:17:30 +0800
Message-Id: <20250904071732.3513694-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDx_8MNPbloS2h9AA--.2519S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Function clockevents_switch_state() will check whether it has already
switched to specified state, do nothing if it has.

In function tick_shutdown(), it will set detached state at first and
call clockevents_switch_state() in clockevents_exchange_device(). The
function clockevents_switch_state() will do nothing since it is already
detached state. So the tick timer device will not be shutdown when CPU
is offline.

Here remove state set before calling clockevents_exchange_device(),
its state will be set in function clockevents_switch_state() if it
succeeds to do so.

---
  v1 ... v2:
  1. Add Fixes tag in patch 1 since those commits removed shutdown calls
     made from drivers that assumed the timer core would do so.

  2. Remove clockevents shutdown call on LoongArch cpu offline
---
Bibo Mao (2):
  tick: Remove unreasonable detached state set in tick_shutdown()
  LoongArch: Remove clockevents shutdown call on offlining

 arch/loongarch/kernel/time.c | 2 --
 kernel/time/tick-common.c    | 5 -----
 2 files changed, 7 deletions(-)


base-commit: b9a10f876409bf3768178f4aded199e193ddbe33
-- 
2.39.3

