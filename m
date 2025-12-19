Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73B31F75A6
	for <loongarch@lists.linux.dev>; Fri, 19 Dec 2025 08:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766134041; cv=none; b=tZkJcSokj5dKENTCxZAst3Kuum+cLxdnfPADqgbjJOj879FSWZMdy4shC304EGsIhYqod7La/uWMTjsE2LNcW2GfLNKu3XANymMEQEce7VqEIPSbjRWawZbluymkpkDRDTu1vTLSiDvKBaV4ZInpCLvn/mGcHAwRJBQWn2RDNBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766134041; c=relaxed/simple;
	bh=pZiE2jw2OnPSIcaXstSKCojpaOaZYJCStFqPNQeqKo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hLQ6kf0i+vUf42xMB1Nrgm0RDUF8ifoPVoV4AkVSWPNoJljfJU7+1M37M5dCOUHQGqz+iTkVbSxvpreGwLXaLw3ErrKmebQn0q199d7b7HMP7n6RnX1ETE+c3cu5SoF5uZZjFvaEEYufsBB9v+jLrM0q7KRUTwhlfJisyXcKgOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.54])
	by gateway (Coremail) with SMTP id _____8CxKMIKEUVpdccAAA--.2559S3;
	Fri, 19 Dec 2025 16:47:06 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.54])
	by front1 (Coremail) with SMTP id qMiowJBxSeADEUVpAbQBAA--.6444S2;
	Fri, 19 Dec 2025 16:47:03 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Yao Zi <me@ziyao.cc>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 0/7] LoongArch: DTS: Fix dtbs_check warnings
Date: Fri, 19 Dec 2025 16:46:47 +0800
Message-ID: <cover.1766037997.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxSeADEUVpAbQBAA--.6444S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEBCGlE6TQD8gAAsI
X-Coremail-Antispam: 1Uk129KBj93XoW7AF1UXF1UGF1UZw45KF47ZFc_yoW8KF1rpr
	ZxuwsrGr48GrWxJrs8t34UWr1rZF9rJ3ZrWanxGrn5CrsxZ34UZr1ft3Z3tFWUArZ5ta4I
	qr1rGw1agF1UCabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJUUUUU=

Hi all:

As Krzysztof pointed out in the OSS talk, LoongArch only has three DTS,
but has a bunch of warnings. The patchset attempts to fix them.

Patch-1 and patch-3 are taken from Yao[1],thanks a lot!

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
V2:
patch(1/7)(3/7):
 - Add my own Signed-off-by tag;

patch(2/7):
 - Define the value of #address-cells to 0;

patch(5/7):
 - Set `#address-cells = <0>` to liointc0 node;

patch(7/7):
 - Fix commit msg about `i2c@address`;
 - Add Reviewed-by tag form Krzysztof, thanks.

Link to V1:
https://lore.kernel.org/all/cover.1765778124.git.zhoubinbin@loongson.cn/

Thanks.
Binbin

Binbin Zhou (5):
  dt-bindings: interrupt-controller: loongson,pch-pic: Change to
    unevaluatedProperties
  LoongArch: dts: loongson-2k0500: Add default Extend I/O Interrupt
    controller address cells
  LoongArch: dts: loongson-2k1000: Add default Local I/O Interrupt
    controller address cells
  LoongArch: dts: loongson-2k2000: Add default PCH PIC controller
    address cells
  LoongArch: dts: loongson-2k1000: Fix i2c-gpio node names

Yao Zi (2):
  dt-bindings: PCI: loongson: Document msi-parent property
  LoongArch: dts: Describe PCI sideband IRQ through interrupt-extended

 .../loongson,pch-pic.yaml                     | 10 +++++-
 .../devicetree/bindings/pci/loongson.yaml     |  2 ++
 arch/loongarch/boot/dts/loongson-2k0500.dtsi  |  1 +
 arch/loongarch/boot/dts/loongson-2k1000.dtsi  | 31 ++++++++---------
 arch/loongarch/boot/dts/loongson-2k2000.dtsi  | 33 ++++++++-----------
 5 files changed, 38 insertions(+), 39 deletions(-)


base-commit: 4c2aab372d819471df4fec9e3240d80938fcc983
-- 
2.47.3

