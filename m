Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350464C60B
	for <loongarch@lists.linux.dev>; Tue, 26 Mar 2024 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711443683; cv=none; b=CO/Nnfp4ZCl4Q6XQoroDjtJ1dsqIzbq1wIYZUAiWJQch4H7PzLTVKnXJiySwWlQ8slmACoox0CDbFwbbV0KpntVUNiwQBeM5Gq+o5/wz+evbCPNucRLBBzqWk81IgV+4u/D4lGVSaFL6pNeMV3W22+doUgUgXTEeT5yiLRYp/54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711443683; c=relaxed/simple;
	bh=NJwrtuEfUMChW79+WHibj4DuhjOZYYaooKfB0VtC0sA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vEeTb/GrekdUxA5h7W6q6FdWpLB+xWrkB9ANxM9yVOZknjSlbi3wliDUYRfZ12xbeQrRmkX7nKXZiYgieOF1KhskvcDgERuWMB8tInSJbGTlKaEIbpNPxIEbgTa2RitkOgQ6+9jxB+nDNQQNrv0K9YQsSZALLPDZWA3+PS15DaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.198])
	by gateway (Coremail) with SMTP id _____8CxF+jejgJmeU4eAA--.51156S3;
	Tue, 26 Mar 2024 17:01:18 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.198])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxVMzajgJmV7JoAA--.13451S2;
	Tue, 26 Mar 2024 17:01:16 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 0/8] Add Loongson-2k0500 and Loongson-2k2000 clock support
Date: Tue, 26 Mar 2024 17:00:59 +0800
Message-ID: <cover.1710926402.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxVMzajgJmV7JoAA--.13451S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Wry7Aw1UAFy7Xr1rWFWxGrX_yoW8XF43pa
	9xuay3tr1DCFy7ZryYqrWUArnY9rW5JF9rZa15Ka4UCrWDZ3Wjq3WxtFyYqFZrZr43A342
	qr95Gr47CF45CagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

Hi all:

As we know, the Loongson-2K family of SoCs (ls2k0500/ls2k1000/ls2k2000)
have a similar clock structure, and I support them to be configured with
different parameters (e.g., register offsets, etc.).

To make it easier to add support for different SoCs, I refactored the
original driver to make the whole driver as understandable as possible.

Briefly, I have divided all clocks into three categories according to
their properties and their parent clocks: Independent PLLs, clocks based
on frequency scales, and clock dividers.

Thanks.

Binbin Zhou (8):
  dt-bindings: clock: add Loongson-2K expand clock index
  clk: clk-loongson2: Refactor driver for adding new platforms
  dt-bindings: clock: loongson2: add Loongson-2K0500 compatible
  clk: clk-loongson2: Add Loongson-2K0500 clock support
  dt-bindings: clock: loongson2: add Loongson-2K2000 compatible
  clk: clk-loongson2: Add Loongson-2K2000 clock support
  LoongArch: dts: Add clock support to Loongson-2K0500
  LoongArch: dts: Add clock support to Loongson-2K2000

 .../bindings/clock/loongson,ls2k-clk.yaml     |   4 +-
 .../boot/dts/loongson-2k0500-ref.dts          |   4 +
 arch/loongarch/boot/dts/loongson-2k0500.dtsi  |  57 +-
 .../boot/dts/loongson-2k2000-ref.dts          |   4 +
 arch/loongarch/boot/dts/loongson-2k2000.dtsi  |  19 +-
 drivers/clk/clk-loongson2.c                   | 549 ++++++++++--------
 include/dt-bindings/clock/loongson,ls2k-clk.h |  58 +-
 7 files changed, 410 insertions(+), 285 deletions(-)

-- 
2.43.0

