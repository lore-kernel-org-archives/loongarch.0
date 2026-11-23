Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427113;
	b=s06oKZBEErsJrgGChyrByHA60It0lnr5QvJ8PsX1nTuAlXnPZ8G0ZM5Fhhx2ZrDLWHQI
	 nDzpj3dGXqu2m+Yx1+EQDq0OQ5xkevMcM/eijyDUdcld3/fIiprnzqt80m1qRxp0yjBmA
	 euarkrQXuGCikA+nuVVnyxFDYIwAA9SzMnCZQ+DoWDS+MKuzTDMYYxKMASPOGQcf8DU4H
	 4zvttoyDzIUNWoBwRT+rAiHZ84pngdKXoZ2+AaSgKbKK2lADMbsIa1392zZyA6Ea84Ezl
	 Hp85iEQX5QtRzDVL6me0Ms8EHR6dNdtxb7VhK1uvkSxDXGf0nevk8qfd2FPb5xUKR/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427113;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-CM-SenderInfo:X-Coremail-Antispam;
	bh=ONZ2Pi3DDopXG0xYWUBmOUSmtcR9WWHPUzQ4snNHHKk=;
	b=XJpjM1z/d0ksQs3s7YS+L3uHBA/maYkVKECdjpf5gc/25Tveod7FA8/Dp/I3dVlueeo0
	 VtI7B4aW7tyKO96z6Ug9eQOegEhYyjgtHBWyuNoJsC0tAo0EuC6U9J93gTdq6b8rVppV8
	 3lw7c/www9JNTPXa4ipvALLn2zeRKH2jPcpZedyS61/nDFRiIdszznVwFLIVUas6mLQzO
	 ryzH52TVaoZi9CoYNv61ePhIvdbdotdUWRKOe0EofVataZKBVVy+R4jFLiOXXjBMmrGvc
	 kmLaaXnPtHjS9fewuCeMxgDPFdGbh8jOLYFAkHGOAHq0rJJkP8Rd+PE4YX5CTME24rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B27606A321
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 09:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B27606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.66])
	by gateway (Coremail) with SMTP id _____8CxfdAlCwRr1jAiAA--.4141S3;
	Mon, 23 Nov 2026 17:45:09 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.66])
	by front1 (Coremail) with SMTP id qMiowJDxTs8jCwRrW9o2AA--.44054S2;
	Mon, 23 Nov 2026 17:45:08 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Mark Brown <broonie@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Bingxiong Li <libingxiong@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 0/5] spi: loongson: SPI-IO driver for Loongson-2K0300
Date: Mon, 23 Nov 2026 17:44:45 +0800
Message-ID: <cover.1795425389.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxTs8jCwRrW9o2AA--.44054S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEACGsDrv8IbgABsV
X-Coremail-Antispam: 1Uk129KBj93XoW7uFykAr1DJryrWFy8Kw1fZrc_yoW8JF4kpa
	9xu393Cr48tFWayrnxAFy0kFWrZ34fZF9rGay7A342q3sYqa4UZFy5KFy5Aan7AFn3JFyI
	vFy8KrWUKayUW3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UE-erUUUUU=

Hi all:

This series adds a new SPI controller driver for the Loongson-2K0300
SPI-IO blocks (SPI2 / SPI3). On the Loongson-2K0300 these blocks reside
in the chip IO address space (0x1610,c000 – 0x1610,ffff) and only
support IO-space access; a separate QSPI controller handles the main
SPI pins on the same SoC, so this driver uses the dedicated
compatible "loongson,ls2k0300-spi-io".

Test results
  SPI NOR flash on SPI2, spi-max-frequency = 28000000:
  DMA:
    read:  ~3.1 MB/s
    write: ~401 kB/s
  Intterupt:
    read:  ~750 KB/s
    write: ~300 kB/s

Thanks.
Binbin

Binbin Zhou (5):
  spi: dt-bindings: loongson,ls2k-spi: Document loongson,ls2k0300-spi
    compatible
  spi: dt-bindings: loongson,ls2k-spi: Document loongson,ls2k0300-spi-io
    compatible
  spi: loongson-io: Add SPI-IO interrupt-driven driver
  spi: loongson-io: Add DMA support to SPI-IO driver
  MAINTAINERS: Add myself as Loongson SPI maintainer

 .../bindings/spi/loongson,ls2k-spi.yaml       |   45 +
 MAINTAINERS                                   |    2 +
 drivers/spi/Kconfig                           |   16 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-loongson-io.c                 | 1114 +++++++++++++++++
 5 files changed, 1178 insertions(+)
 create mode 100644 drivers/spi/spi-loongson-io.c


base-commit: e09d1526e19ef8b1008ee81149232db6c2bdee32
-- 
2.52.0

