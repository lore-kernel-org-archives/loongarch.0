Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2A67C
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 06:10:58 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.112.76])
	by gateway (Coremail) with SMTP id _____8DxAOnx_Itk6NsFAA--.10749S3;
	Fri, 16 Jun 2023 14:10:57 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.76])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxReTv_ItkFPEcAA--.17020S2;
	Fri, 16 Jun 2023 14:10:56 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hongliang Wang <wanghongliang@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 0/6] LoongArch: Add built-in dtb support
Date: Fri, 16 Jun 2023 14:10:37 +0800
Message-Id: <cover.1686882123.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxReTv_ItkFPEcAA--.17020S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJr45tF45Jr1kCw4rtrW3CFX_yoW8WFWfp3
	9ruF9xGFs5Gr17KrnIq345urn5ZFyxGwnFqa13JryUGw43Xr1UZ34ftFZ0vF43Aw4rJrW0
	qryrGw13KFy8AagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

Hi all:

This patchset introduces LoongArch's built-in dtb support.

As we know, the Loongson-2K family supports DT. Inevitably, some systems
do not provide a useful device tree to the kernel at boot time. Chasing
around bootloaders for these systems is a headache, so we just keep a
device tree table in the kernel, keyed by the dts filename, that
contains the relevant DTBs.

Thanks.

Binbin Zhou (6):
  dt-bindings: loongarch: Add CPU bindings for LoongArch
  dt-bindings: loongarch: Add Loongson SoC boards compatibles
  LoongArch: Allow device trees to be built into the kernel
  LoongArch: DeviceTree for Loongson-2K0500
  LoongArch: DeviceTree for Loongson-2K1000
  LoongArch: DeviceTree for Loongson-2K2000

 .../devicetree/bindings/loongarch/boards.yaml |  31 +
 .../devicetree/bindings/loongarch/cpus.yaml   |  65 ++
 arch/loongarch/Kconfig                        |  16 +
 arch/loongarch/Makefile                       |  10 +-
 arch/loongarch/boot/dts/Makefile              |   7 +-
 arch/loongarch/boot/dts/loongson_2k0500.dts   | 311 ++++++++++
 arch/loongarch/boot/dts/loongson_2k1000.dts   | 565 ++++++++++++++++++
 arch/loongarch/boot/dts/loongson_2k2000.dts   | 417 +++++++++++++
 arch/loongarch/kernel/setup.c                 |   9 +-
 9 files changed, 1425 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/loongarch/boards.yaml
 create mode 100644 Documentation/devicetree/bindings/loongarch/cpus.yaml
 create mode 100644 arch/loongarch/boot/dts/loongson_2k0500.dts
 create mode 100644 arch/loongarch/boot/dts/loongson_2k1000.dts
 create mode 100644 arch/loongarch/boot/dts/loongson_2k2000.dts

-- 
2.39.3

