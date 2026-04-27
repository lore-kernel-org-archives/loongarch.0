Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F95D367F3C
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 07:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777274396; cv=none; b=XO0fqSW8ic/wHEbirtXmn79hml9bhqLuH/njlzyckLJpTv5p3mqLnTWF/17BjOvrAZAX5dEoWe3WGPfpTkX1Ho0RNcD0lbWHxXiRveTDTIJkidaGmSXQbZh7RsyhX2k+ZxqBJpuBK4u4Zk7yf+vUELwo8e1cREGYjZxH7p6gk8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777274396; c=relaxed/simple;
	bh=96BJvE6/iPLIOCZXP5PQGTbpMwT+AKMCvO+f9la0JiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KcC5L5ST6IzEzRRvX4xJFz+Ae0/jOCD7hGq6b24Schll0NgBTG7A0stOq0SaRdpPQkjS5p9Mg6twoh3K16FixH9JJpTbquq/DVG0rhyma8qpUsCuBApbeVr2xoJ0/T0i+3/QtNUeb4R3OObNF7QDvib6y7kUtWi5w6vvqRj9Tjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.8])
	by gateway (Coremail) with SMTP id _____8CxHuqxDe9pZUMEAA--.13919S3;
	Mon, 27 Apr 2026 15:18:09 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.8])
	by front1 (Coremail) with SMTP id qMiowJCxWeCvDe9p0pJ1AA--.27085S2;
	Mon, 27 Apr 2026 15:18:08 +0800 (CST)
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
Subject: [PATCH 0/2] Add Loongson CAN-FD controller driver
Date: Mon, 27 Apr 2026 15:17:58 +0800
Message-ID: <cover.1777273055.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxWeCvDe9p0pJ1AA--.27085S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEKCGnu+qgB9wAAsi
X-Coremail-Antispam: 1Uk129KBj93XoW7KF13Gw1ktFyxWry7Ar4fJFc_yoW8WF4Upa
	1Fk3sxur13tr47Aws3JFW5CF15CFyrJrW7Ga9xXw10v3sFya47WryakF1UAr42vr15CFyj
	qrWruF48WF15GFgCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8xuctUUUUU==

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

Binbin Zhou (2):
  can: Add Loongson CAN-FD controller support
  can: loongson_canfd: Add RXDMA support

 MAINTAINERS                                   |    7 +
 drivers/net/can/Kconfig                       |    1 +
 drivers/net/can/Makefile                      |    1 +
 drivers/net/can/loongson_canfd/Kconfig        |   16 +
 drivers/net/can/loongson_canfd/Makefile       |    6 +
 .../net/can/loongson_canfd/loongson_canfd.c   | 1298 +++++++++++++++++
 .../loongson_canfd/loongson_canfd_kframe.h    |  142 ++
 .../can/loongson_canfd/loongson_canfd_kregs.h |  315 ++++
 8 files changed, 1786 insertions(+)
 create mode 100644 drivers/net/can/loongson_canfd/Kconfig
 create mode 100644 drivers/net/can/loongson_canfd/Makefile
 create mode 100644 drivers/net/can/loongson_canfd/loongson_canfd.c
 create mode 100644 drivers/net/can/loongson_canfd/loongson_canfd_kframe.h
 create mode 100644 drivers/net/can/loongson_canfd/loongson_canfd_kregs.h


base-commit: f1359c240191e686614847905fc861cbda480b47
-- 
2.52.0

