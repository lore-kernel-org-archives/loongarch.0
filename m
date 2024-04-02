Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE4E2BD1C
	for <loongarch@lists.linux.dev>; Tue,  2 Apr 2024 07:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712044738; cv=none; b=X1Kld4xc8NUMty67cI2GTgoGfFCrFMmmjD8e0k6Kok9vAIZPbCMEOc9FtDHPzs0UTEv6yIqWT0rSyT2wPkAZKH/ABXsSoYIpIQvZW9/aO230zxExRxHUjBfN6iArnCWhurFpYSZVdzLEMvTZWnc9pS8vzJYzx8WtPg0kbMIWJN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712044738; c=relaxed/simple;
	bh=I5hX7TtAUFIwQt49kForXRPHUNimAirKgi6NinkzXCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mmHUd9DUYabDOqEMnaWEfk0R2ez1nqWvKmQhQg85kLQRUm4K4yXyquX/EjbUYm5TmXLAUqvAZAs6y77bOh3E5to8vaV/ZxxVoteWGcVVOIPyjAWJAW49qUQP9qM9Uqk2sqjhAmkKyaqeTBFM9al+pI8znCSsFaaUaQ7ttg3lNZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.80])
	by gateway (Coremail) with SMTP id _____8Dxvuu9ugtmUT8iAA--.13019S3;
	Tue, 02 Apr 2024 15:58:53 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.80])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxSRK7ugtmzqNxAA--.12573S2;
	Tue, 02 Apr 2024 15:58:52 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 0/5] pwm: Introduce pwm driver for the Loongson family chips
Date: Tue,  2 Apr 2024 15:58:37 +0800
Message-ID: <cover.1711953223.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxSRK7ugtmzqNxAA--.12573S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZw1kAFyftFW7Cw4xurWUKFX_yoWkCFcE9F
	ySkFykJw4UGFn7Ja90vrWxJrW3ZrWUW3WFkFWqqr18Xa4avF13tFyDu34DCFW3tryUZFs8
	XrWxGr18Cr4I9osvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8xuctUUUUU==

Hi all:

This patchset introduce a generic PWM framework driver for Loongson family.
Each PWM has one pulse width output signal and one pulse input signal to be measured.
It can be found on Loongson-2K series cpus and Loongson LS7A bridge chips.

Thanks.

Binbin Zhou (5):
  dt-bindings: pwm: Add Loongson PWM controller
  pwm: Add Loongson PWM controller support
  LoongArch: dts: Add PWM support to Loongson-2K0500
  LoongArch: dts: Add PWM support to Loongson-2K1000
  LoongArch: dts: Add PWM support to Loongson-2K2000

 .../devicetree/bindings/pwm/pwm-loongson.yaml |  64 ++++
 MAINTAINERS                                   |   7 +
 arch/loongarch/boot/dts/loongson-2k0500.dtsi  |  20 ++
 .../boot/dts/loongson-2k1000-ref.dts          |  24 ++
 arch/loongarch/boot/dts/loongson-2k1000.dtsi  |  42 ++-
 arch/loongarch/boot/dts/loongson-2k2000.dtsi  |  60 ++++
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-loongson.c                    | 300 ++++++++++++++++++
 9 files changed, 527 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-loongson.yaml
 create mode 100644 drivers/pwm/pwm-loongson.c

-- 
2.43.0

