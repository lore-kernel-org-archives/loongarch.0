Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34DE241673
	for <loongarch@lists.linux.dev>; Wed, 24 Sep 2025 06:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758695405; cv=none; b=PLxGjihcA2964v44YChUYdfViGLmZSuG0G2dk3ftl5gXMLCos0Yb63sromyCWJsnNdwgQ9fWzsA6H8l+Zbkj1OSeWDLDFQ7wt/++U5E+8DQQ6YsRwc6YHBoHEeJGW5AwywScqJK7fa8fmSJi9zy20h1eKN6JXZmvRSgEjOYufWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758695405; c=relaxed/simple;
	bh=A8V04nPGggppkrusDyTpPflznnAPzzPNBzIvJQIzjJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kvOHy3jlW0qp6Qfkb7NkhLMAy0ktPrtiF3UwT5zZkvAqS3Z8TqJtOGaaXHBVNN3kKw/s+yixJ+lDQBaONumthCYhjg0vi0ZbyeLJ5P52vfGfKPbXDFit3rI80OPtH/Qmg6JPBIyOsCaQvrjSkKZrAvHYrgwEaOmivkUje4oPs1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.198])
	by gateway (Coremail) with SMTP id _____8Bx2tHfj9Nol_YNAA--.30396S3;
	Wed, 24 Sep 2025 14:29:51 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.198])
	by front1 (Coremail) with SMTP id qMiowJAxVOTbj9NogKyqAA--.21497S2;
	Wed, 24 Sep 2025 14:29:48 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Haowei Zheng <zhenghaowei@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v5 0/3] uart: Introduce uart driver for the Loongson family
Date: Wed, 24 Sep 2025 14:29:35 +0800
Message-ID: <cover.1758676290.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxVOTbj9NogKyqAA--.21497S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEPCGjTiCgAoAAAs8
X-Coremail-Antispam: 1Uk129KBj93XoW7KF1xtFy3tw1ruF1UZFWrJFc_yoW8uw47pF
	sIya90kFsY9F1xAwn3AryruF4rZr95JF9FgFsrKwn5GFZYv3WUXr4ftFn0yF1rZrZ5tr42
	qFy8CrWUKayUZ3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0FALUUUUU=

Hi all:

For various reasons, I will be taking over from Haowei and continuing to
push forward with this patch set. Thanks to Haowei for his efforts so
far.

This patchset introduce a generic UART framework driver for Loongson family.
It can be found on Loongson3 series cpus, Loongson-2K series cpus and Loongson 
LS7A bridge chips.

Thanks.

------
V5:
Patch-1:
 - Since the Loongson UART is NS8250A-compatible, simply add ls2k* compatible
   to 8250.yaml.

Sorry for the DTS{i} check error that appeared in the V3 patchset. I've fixed
this issue. Thanks to Krzysztof.

Link to V4:
https://lore.kernel.org/all/cover.1757318368.git.zhoubinbin@loongson.cn/

V4:
Patch-1:
  - Rename binding name from loongson,uart.yaml to
    loongson,ls2k0500-uart.yaml;
  - Drop ls7a compatible;
  - According to the manual, ls3a and ls2k uart are the same, so merge their
    compatible.

Patch-2:
  - Format code;
  - Add the LOONGSON_UART_DLF macro definition to avoid magic numbers;
  - Simplify the code, merge flags and quirks, and remove struct
    loongson_uart_config;
  - Use DEFINE_SIMPLE_DEV_PM_OPS;
  - Drop loongson,ls7a-uart compatible.

Patch-3:
  - Add ls2k* compatible string, and ns16550a as the fallback
    compatible.

Link to V3:
https://lore.kernel.org/all/20240826024705.55474-1-zhenghaowei@loongson.cn/

Binbin Zhou (3):
  dt-bindings: serial: 8250: Add Loongson uart compatible
  serial: 8250: Add Loongson uart driver support
  LoongArch: dts: Add uart new compatible string

 .../devicetree/bindings/serial/8250.yaml      |  14 ++
 arch/loongarch/boot/dts/loongson-2k0500.dtsi  |   2 +-
 arch/loongarch/boot/dts/loongson-2k1000.dtsi  |   2 +-
 arch/loongarch/boot/dts/loongson-2k2000.dtsi  |   2 +-
 drivers/tty/serial/8250/8250_loongson.c       | 202 ++++++++++++++++++
 drivers/tty/serial/8250/8250_port.c           |   8 +
 drivers/tty/serial/8250/Kconfig               |  10 +
 drivers/tty/serial/8250/Makefile              |   1 +
 include/uapi/linux/serial_core.h              |   1 +
 9 files changed, 239 insertions(+), 3 deletions(-)
 create mode 100644 drivers/tty/serial/8250/8250_loongson.c


base-commit: f4abab350840d58d69814c6993736f03ac27df83
-- 
2.47.3

