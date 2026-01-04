Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB6B29CB3A
	for <loongarch@lists.linux.dev>; Sun,  4 Jan 2026 06:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767508906; cv=none; b=p9VuAlGVEfNHRjtbjGsaD6pa6GSRrHC6OypeKsH1lvUg5/eSCgLmoCH3gf9kmQxk0WUoTSwNSCrjxiF2yAymJkDQj6i+ffJSxMVaGJfaQdpAW+BU46fCUmnFNAy46eFjzQwDxpZ31JNmM4T29U5z3Jx780JsR4vhIT9wIXEzyJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767508906; c=relaxed/simple;
	bh=LR3v+IUKl68liOTE/RU+8GZqLTOdGNu1mCmr8ME77xc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aQjdJnDv0FXMlFlVGhzDxC8TcIVCUV3IkXmGZeuQTp9TUyQoSxBIqdBvtk2J7wfQ3Dzhw3V44TCQ+1VbBwZA+CN+TBiDAWuz39qPuBQ6lMwff2ME+vmZLLgvrM8lgYgej/CUeP096XIqRsL6cAD9ylZ448xo7DqNzfM/Lln2Vxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8DxfcObC1pppVIFAA--.16954S3;
	Sun, 04 Jan 2026 14:41:32 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJCx2+CWC1ppbzUMAA--.28347S2;
	Sun, 04 Jan 2026 14:41:28 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Yao Zi <me@ziyao.cc>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 0/9] LoongArch: DTS: Fix dtbs_check warnings
Date: Sun,  4 Jan 2026 14:41:10 +0800
Message-ID: <cover.1767505859.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx2+CWC1ppbzUMAA--.28347S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEOCGlUuzUNPwADsE
X-Coremail-Antispam: 1Uk129KBj93XoWxCw18Ar4Duw45Zry8uF4DAwc_yoW5AF4fpr
	ZxuwsrGrs5JrWxArsxK34UCr15ZF98JwnrWanxAryrCanrZ34UZr4Sv3Z3XFWDArZYq342
	qr4rKa1YgF45AabCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7
	AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1RB
	T5UUUUU==

Hi all:

As Krzysztof pointed out in the OSS talk, LoongArch only has three DTS,
but has a bunch of warnings. The patchset attempts to fix them.

Patch-1 and patch-5 are taken from Yao[1],thanks a lot!

[1]: https://lore.kernel.org/all/20251209140006.54821-1-me@ziyao.cc/

Test environment and results: 

Package                   Version
------------------------- -----------
attrs                     25.4.0
dtschema                  2025.12
jsonschema                4.25.1
jsonschema-specifications 2025.9.1
pip                       25.3
pylibfdt                  1.7.2.post1
referencing               0.37.0
rfc3987                   1.3.8
rpds-py                   0.30.0
ruamel.yaml               0.18.16
ruamel.yaml.clib          0.2.15
typing_extensions         4.15.0

---------
make dtbs_check W=1

  SYNC    include/config/auto.conf
  UPD     include/config/kernel.release
  DTC [C] arch/loongarch/boot/dts/loongson-2k0500-ref.dtb
  DTC [C] arch/loongarch/boot/dts/loongson-2k1000-ref.dtb
  DTC [C] arch/loongarch/boot/dts/loongson-2k2000-ref.dtb

========
V3:
patch (2/9)(3/9):
 - New patches, document `#address-cells` property;

patch (4/9):
 - Rewrite commit title and message;
 - Remove unneeded changes, leaving only the `#address-cells`
   value set.

patch (6/9):
 - Set `#address-cells = <0>` to liointc node;

patch (8/9):
 - Set `#address-cells = <0>` to liointc and eiointc node;

Link to V2:
https://lore.kernel.org/all/cover.1766037997.git.zhoubinbin@loongson.cn/


V2:
patch(1/7)(3/7):
 - Add myself s-o-b;

patch(2/7):
 - Define the value of #address-cells to 0;

patch(5/7):
 - Set `#address-cells = <0>` to liointc0 node;

patch(7/7):
 - Fix commit msg about `i2c@address`;
 - Add Reviewed-by tag form Krzysztof, thanks.

Link to V1:
https://lore.kernel.org/all/cover.1765778124.git.zhoubinbin@loongson.cn/

Binbin Zhou (7):
  dt-bindings: interrupt-controller: loongson,eiointc: Document
    address-cells
  dt-bindings: interrupt-controller: loongson,liointc: Document
    address-cells
  dt-bindings: interrupt-controller: loongson,pch-pic: Document
    address-cells
  LoongArch: dts: loongson-2k0500: Add default interrupt controller
    address cells
  LoongArch: dts: loongson-2k1000: Add default Local I/O interrupt
    controller address cells
  LoongArch: dts: loongson-2k2000: Add default interrupt controller
    address cells
  LoongArch: dts: loongson-2k1000: Fix i2c-gpio node names

Yao Zi (2):
  dt-bindings: PCI: loongson: Document msi-parent property
  LoongArch: dts: Describe PCI sideband IRQ through interrupt-extended

 .../loongson,eiointc.yaml                     |  3 ++
 .../loongson,liointc.yaml                     |  3 ++
 .../loongson,pch-pic.yaml                     |  3 ++
 .../devicetree/bindings/pci/loongson.yaml     |  2 ++
 arch/loongarch/boot/dts/loongson-2k0500.dtsi  |  3 ++
 arch/loongarch/boot/dts/loongson-2k1000.dtsi  | 31 +++++++---------
 arch/loongarch/boot/dts/loongson-2k2000.dtsi  | 35 ++++++++-----------
 7 files changed, 42 insertions(+), 38 deletions(-)


base-commit: e8a259e82c7c3ee53e933bb238366ec2ba0bc892
-- 
2.47.3

