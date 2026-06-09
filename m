Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F81B3DDDC4
	for <loongarch@lists.linux.dev>; Tue,  9 Jun 2026 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996010; cv=none; b=RaKDRqc3/ROO9s9T/P2MvoQ5FZ4kRNZmG8dANEy8BJjA6+hAWn/0QXeeB+DPnR1WLSFVRZvd7VvcaFwmA6cNzKC077iQkejoqzVeos7rdpTCU/7rlYv4tvxLkWnPy8TEf1G8rcC1P7InB9d+gc4uuo71iZGxzWhnKVE36YVy3no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996010; c=relaxed/simple;
	bh=V3qDZUx3yOnSJqO2amTow6eQ51hs49Q0hdct+TJ+Fss=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l4LJ/DYD9iFcbeZYqYBFscjR3w2NeUH3mTD257jFGLGg7BvCPye86AsJkp4Y5cWjy6FUutBIS195z/6+dYtM8My5oKaJrALHOCT6+FhJrXvOgsRPSti7B2rFkV2uHe2D1qURdPcuv2wc27PMBe4MBdXaIeohmbl6dAEQR0b8zdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.101])
	by gateway (Coremail) with SMTP id _____8AxAuun1ydqdDESAA--.48770S3;
	Tue, 09 Jun 2026 17:06:48 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.101])
	by front1 (Coremail) with SMTP id qMiowJCxOMGk1ydqKKOgAA--.28652S2;
	Tue, 09 Jun 2026 17:06:46 +0800 (CST)
From: Hongliang Wang <wanghongliang@loongson.cn>
To: Hongliang Wang <wanghongliang@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] LoongArch: dts: i2c: Add clocks and clock-frequency properties
Date: Tue,  9 Jun 2026 17:05:40 +0800
Message-Id: <20260609090543.1462-1-wanghongliang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxOMGk1ydqKKOgAA--.28652S2
X-CM-SenderInfo: pzdqwxxrqjzxhdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUvGb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI0_JF0_Jw1l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
	UjIFyTuYvjxUzvtCDUUUU

Hi all:

This patch set adds clocks and clock-frequency properties to i2c nodes of
LS2K0500/2K1000/2K2000 dts.

Hongliang Wang (3):
  LoongArch: dts: i2c: Add clocks and clock-frequency properties to
    2K0500
  LoongArch: dts: i2c: Add clocks and clock-frequency properties to
    2K1000
  LoongArch: dts: i2c: Add clocks and clock-frequency properties to
    2K2000

 arch/loongarch/boot/dts/loongson-2k0500.dtsi | 12 ++++++++++++
 arch/loongarch/boot/dts/loongson-2k1000.dtsi |  4 ++++
 arch/loongarch/boot/dts/loongson-2k2000.dtsi |  4 ++++
 3 files changed, 20 insertions(+)

-- 
2.47.2

