Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2773AFCFF
	for <loongarch@lists.linux.dev>; Mon,  8 Jun 2026 08:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908602; cv=none; b=sDssKcYjUiR3k8jvQmB5vXrcv7m3y8IECLsMT4OsOXjM6cB5Wi/fsiqM3zMg9NFVxb6dskN9TJzZf5DQxp2yDiaDu3M9Vd8MCttqOtC2RNVHsh6ujgHy8TtCVE2bpcjeEph4GvHeuRmVvNbHKh97EWwLjREJgQPDVFw/qotP6XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908602; c=relaxed/simple;
	bh=u3TcOrtG/1G4YP1UYa9yBRw8eamGsPA7cCgE0s2xbeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WI/U51BtvYgwjI5G2Mq/f9rPekbclDHfko33vUyKdBaNxSwXGE9XFkTLgnuE6/pS8Q55EiFZmc8rSTV5v/XMxY4GxjROnClCAlu0lIvHdmZGiLeB/A5IWsYDjtiTjbU9FLKoEfXhVZNLHcs0hK11uBhw+vwX205TBA/mEZVoiCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8Bxdng0giZq9b0RAA--.22738S3;
	Mon, 08 Jun 2026 16:49:56 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJDxTMIxgiZq1I+fAA--.37894S2;
	Mon, 08 Jun 2026 16:49:54 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Bingxiong Li <libingxiong@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-can@vger.kernel.org,
	jeffbai@aosc.io,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 0/2] Add Loongson CAN-FD controller driver
Date: Mon,  8 Jun 2026 16:49:45 +0800
Message-ID: <cover.1780908445.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxTMIxgiZq1I+fAA--.37894S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEMCGomWeACYgABsQ
X-Coremail-Antispam: 1Uk129KBj93XoW7KF13Gw1ktFyxWry7Ar4fJFc_yoW8AFW7pa
	1Fk3sxur1DKr47Aan3J34fCFy5Awn3Jr15Wa9rA34jvasIv3W2qrySk3W5Zr9rZrsrCFWj
	v3yUuFyxC3Z8AFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=

Hi all:

This patchset adds support for the CAN-FD controller found on Loongson
CPUs.

Patch 1 introduces the basic CAN-FD controller driver with support
for classic CAN and CAN FD, including bit timing, error handling,
NAPI-based RX, and multiple TX buffers.

Patch 2 adds optional DMA support for RX path using the Loongson APB
CMC DMA engine, which significantly reduces CPU load under high
receive throughput.

The driver has been tested on Loongson-2K3000 platforms with various
CAN/CAN FD traffic patterns.

Finally, I'd like to thank Binxiong, the original author of this driver,
for his efforts in working on the patch.

Thanks.
Binbin

-------
V2:
Patch (1/2):
 - Put all code into one file;
 - Add COMPILE_TEST Kconfig option;
 - Rewrite Kconfig description;
 - Use `regmap_test_bits()` to simplify bit field checks;
 - Drop odd FIELD_GET() usage;
 - Don't use FIELD_GET() for a single bit;
 - Use an if/else instead of the ternary operator;
 - Use the CAN TDC framework to get the SSP value;
 - Use guard(spinlock)/scoped_guard(spinlock);
 - Use netdev_debug() to be less verboss;
 - Check for memory allocation failure;
 - Add CAN_ERR_CNT flag;
 - Drop unused REG_DATA_xx_yy_W_DATA_yy definition;
 - Add more function comment;

Link to V1:
https://lore.kernel.org/all/cover.1777273055.git.zhoubinbin@loongson.cn/

Binbin Zhou (2):
  can: Add Loongson CAN-FD controller driver
  can: loongson_canfd: Add RXDMA support

 MAINTAINERS                      |    7 +
 drivers/net/can/Kconfig          |   15 +
 drivers/net/can/Makefile         |    1 +
 drivers/net/can/loongson_canfd.c | 1935 ++++++++++++++++++++++++++++++
 4 files changed, 1958 insertions(+)
 create mode 100644 drivers/net/can/loongson_canfd.c


base-commit: f1359c240191e686614847905fc861cbda480b47
-- 
2.52.0

