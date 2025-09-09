Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC38E32C326
	for <loongarch@lists.linux.dev>; Tue,  9 Sep 2025 12:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757419903; cv=none; b=GB8f0olsRDQUZIFsQqPIExu7gNDyfZraTT3fL/ycJ1Sgrtb92id7PVnHUvHxncU0Lxe5UNNhs6xSZwut+2K1ps/IWs+1YZ61pTyxpw8woTegl0gv9zHL+aN0E8ca0lEKGx34WZMlX/BuCm/u6eb1gHzJiWswr1Nc7yxAredWVM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757419903; c=relaxed/simple;
	bh=BSfoKghzggAOe5VKxkV1dMqaczces8DHHG+dxc5P3Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ipag/SBQZoGOTmrKJWYEjf4QAz7B7m5zUd4O9fU38XvNsRZl8/U6Sv2WLZFlHhk7cl7BMvIjQdqyeEd8MN6HQZvm5pWyc3WUHiVm2YletdD+dodyP1XYVDWWGYt4zzC1+VS31f8lWd2saa8s+1L1sY7rQd5zfnbJHpS8Rhs273w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.89])
	by gateway (Coremail) with SMTP id _____8BxG9J3GcBoal0IAA--.17330S3;
	Tue, 09 Sep 2025 20:11:35 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.89])
	by front1 (Coremail) with SMTP id qMiowJCxH8JzGcBoOzSKAA--.57626S2;
	Tue, 09 Sep 2025 20:11:35 +0800 (CST)
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
Subject: [PATCH v4 0/3] uart: Introduce uart driver for the Loongson family
Date: Tue,  9 Sep 2025 20:11:17 +0800
Message-ID: <cover.1757318368.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxH8JzGcBoOzSKAA--.57626S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7KF1xtFy3tw1rtFW7Gr1UXFc_yoW8ZryxpF
	sIk39Ikr4jqF17AwsxAFyrCF4rZr95JF9rWanxGwn5Gr9Yva4UXr1ftFn0yF13Zr4rXFW2
	vF1rCrWUKa4jy3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU83UUUUUUUU==

Hi all:

For various reasons, I will be taking over from Haowei and continuing to
push forward with this patch set. Thanks to Haowei for his efforts so
far.

This patchset introduce a generic UART framework driver for Loongson family.
It can be found on Loongson3 series cpus, Loongson-2K series cpus and Loongson 
LS7A bridge chips.

Thanks.

------
V4:
Patch 1:
  - Rename binding name from loongson,uart.yaml to
    loongson,ls2k0500-uart.yaml;
  - Drop ls7a compatible;
  - According to the manual, ls3a and ls2k uart are the same, so merge their
    compatible.

Patch 2:
  - Format code;
  - Add the LOONGSON_UART_DLF macro definition to avoid magic numbers;
  - Simplify the code, merge flags and quirks, and remove struct
    loongson_uart_config;
  - Use DEFINE_SIMPLE_DEV_PM_OPS;
  - Drop loongson,ls7a-uart compatible.

Patch 3:
  - Add ls2k* compatible string, and ns16550a as the fallback
    compatible.

Link to V3:
https://lore.kernel.org/all/20240826024705.55474-1-zhenghaowei@loongson.cn/

Binbin Zhou (3):
  dt-bindings: serial: Add Loongson UART controller
  serial: 8250: Add Loongson uart driver support
  LoongArch: dts: Add uart new compatible string

 .../serial/loongson,ls2k0500-uart.yaml        |  60 ++++++
 MAINTAINERS                                   |   8 +
 arch/loongarch/boot/dts/loongson-2k0500.dtsi  |   2 +-
 arch/loongarch/boot/dts/loongson-2k1000.dtsi  |   2 +-
 arch/loongarch/boot/dts/loongson-2k2000.dtsi  |   2 +-
 drivers/tty/serial/8250/8250_loongson.c       | 200 ++++++++++++++++++
 drivers/tty/serial/8250/8250_port.c           |   8 +
 drivers/tty/serial/8250/Kconfig               |  10 +
 drivers/tty/serial/8250/Makefile              |   1 +
 include/uapi/linux/serial_core.h              |   1 +
 10 files changed, 291 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/loongson,ls2k0500-uart.yaml
 create mode 100644 drivers/tty/serial/8250/8250_loongson.c


base-commit: b601e1f41edd4667062aa7cccb4e5199814979a3
-- 
2.47.3

