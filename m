Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD7F1FC4
	for <loongarch@lists.linux.dev>; Mon, 18 Dec 2023 01:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.176])
	by gateway (Coremail) with SMTP id _____8BxK+n0pX9lBOYBAA--.10201S3;
	Mon, 18 Dec 2023 09:52:52 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.176])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxCHPwpX9lwF8JAA--.29587S2;
	Mon, 18 Dec 2023 09:52:50 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hongliang Wang <wanghongliang@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v5 0/7] LoongArch: Add built-in dtb support
Date: Mon, 18 Dec 2023 09:52:33 +0800
Message-Id: <cover.1702862778.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxCHPwpX9lwF8JAA--.29587S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Gr4DWw45tFykCFWDZr4fWFX_yoW7Ar13pr
	WxursxGFs5Gr4xJrs3t34Uur1rAwn5J39xWF1ayryUua9xur4jyw1ftws0qF47Cw4rJ340
	qr1rGa4xKF4UAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j83kZUUUUU=

Hi all:

This patchset introduces LoongArch's built-in dtb support.

During the upstream progress of those DT-based drivers, DT properties
are changed a lot so very different from those in existing bootloaders.
It is inevitably that some existing systems do not provide a standard,
canonical device tree to the kernel at boot time. So let's provide a
device tree table in the kernel, keyed by the dts filename, containing
the relevant DTBs.

We can use the built-in dts files as references. Each SoC has only one
built-in dts file which describes all possible device information of
that SoC, so the dts files are good examples during development.

And as a reference, our built-in dts file only enables the most basic
bootable combinations (so it is generic enough), acts as an alternative
in case the dts in the bootloader is unexpected.

In the past while, we resolved the DTC_CHK warning for the v4 patchset,
and the relevant patchset has either been received or had the
Reviewed-by tag added. 
Now, we need to rely on the following patch sets:
1. liointc
https://lore.kernel.org/all/cover.1701933946.git.zhoubinbin@loongson.cn/
Reviewed-by tag has been added.
2. pmc
https://lore.kernel.org/all/cover.1700817227.git.zhoubinbin@loongson.cn/
has been received by Daniel.

Thanks.

-----
V5:
patch(1/7):
  - Add reviewed-by tag.
patch(3/7):
  - Rewrite commit message to describe the reason for needing the
    build-in DTB.
patch(4/7):
  - Add Power-Manager node.
patch(5/7):
  - Add Power-Manager node.
  - Add spi node.
  - Add pmc node.
patch(6/7):
  - Add Power-Manager node.

Link to V4:
https://lore.kernel.org/all/cover.1692783907.git.zhoubinbin@loongson.cn/

V4:
patch(1/7):
  - Drop device_type property.
patch(2/7):
  - Rename board.yaml to loongson.yaml.
patch(4/7):
  - Keep the ranges attribute after compatible;
  - Add bootargs = "ttyS0,115200", which is needed for reference board;
patch(5/7):
  - Keep the ranges attribute after compatible;
  - Add bootargs = "ttyS0,115200", which is needed for reference board;
  - Change node name global-utilities to chipid.
patch(6/7):
  - Keep the ranges attribute after compatible;
  - Add bootargs = "ttyS0,115200", which is needed for reference board.

Link to V3:
https://lore.kernel.org/all/cover.1692618548.git.zhoubinbin@loongson.cn/

V3:
patch(1/7):
  - Add reference to the common cpu schema.
patch(2/7):
  - Add reviewed-by tag.
patch(4/7):
  - Drop bootargs;
  - Move the cpus node to dtsi, which is part of the SoC.
patch(5/7):
  - Drop bootargs;
  - Move the cpus node to dtsi, which is part of the SoC;
  - Fix gmac0/1-mdio node: compatible is always the first property;
  - Drop i2c-gpio node.
patch(6/7):
  - Drop bootargs;
  - Move the cpus node to dtsi, which is part of the SoC.
  - Changes liointc to liointc-1.0, for Loongson-2K2000 has 32 interrupt
    sources.

Link to V2:
https://lore.kernel.org/all/cover.1692088166.git.zhoubinbin@loongson.cn/

V2:
patch(1/7):
  - Drop model and clock-frequency properties;
  - Add clocks property;
  - Rewrite the description.
patch(2/7):
  - Add the proper compatibles for boards.
patch(4/7)(5/7)(6/7):
  - Format commit message head;
  - Drop undocumented compatible, such as pci_bridge compatible;
  - Distinguish the attributes, put SoC-related into DTSI and
    board-related into DTS;
  - Check DTS with 'make dtbs_check W=1'.
patch(7/7)
  - New patch;
  - Parses Molde name and CPU MHz from the DTS attribute.

Link to V1:
https://lore.kernel.org/loongarch/cover.1686882123.git.zhoubinbin@loongson.cn/

Binbin Zhou (7):
  dt-bindings: loongarch: Add CPU bindings for LoongArch
  dt-bindings: loongarch: Add Loongson SoC boards compatibles
  LoongArch: Allow device trees to be built into the kernel
  LoongArch: dts: DeviceTree for Loongson-2K0500
  LoongArch: dts: DeviceTree for Loongson-2K1000
  LoongArch: dts: DeviceTree for Loongson-2K2000
  LoongArch: Parsing CPU-related information from DTS

 .../devicetree/bindings/loongarch/cpus.yaml   |  61 +++
 .../bindings/loongarch/loongson.yaml          |  34 ++
 arch/loongarch/Kconfig                        |  18 +
 arch/loongarch/Makefile                       |  10 +-
 arch/loongarch/boot/dts/Makefile              |   7 +-
 .../boot/dts/loongson-2k0500-ref.dts          |  89 ++++
 arch/loongarch/boot/dts/loongson-2k0500.dtsi  | 274 +++++++++++
 .../boot/dts/loongson-2k1000-ref.dts          | 184 +++++++
 arch/loongarch/boot/dts/loongson-2k1000.dtsi  | 453 ++++++++++++++++++
 .../boot/dts/loongson-2k2000-ref.dts          |  73 +++
 arch/loongarch/boot/dts/loongson-2k2000.dtsi  | 311 ++++++++++++
 arch/loongarch/kernel/env.c                   |  34 +-
 arch/loongarch/kernel/setup.c                 |   9 +-
 13 files changed, 1550 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/loongarch/cpus.yaml
 create mode 100644 Documentation/devicetree/bindings/loongarch/loongson.yaml
 create mode 100644 arch/loongarch/boot/dts/loongson-2k0500-ref.dts
 create mode 100644 arch/loongarch/boot/dts/loongson-2k0500.dtsi
 create mode 100644 arch/loongarch/boot/dts/loongson-2k1000-ref.dts
 create mode 100644 arch/loongarch/boot/dts/loongson-2k1000.dtsi
 create mode 100644 arch/loongarch/boot/dts/loongson-2k2000-ref.dts
 create mode 100644 arch/loongarch/boot/dts/loongson-2k2000.dtsi

-- 
2.39.3

