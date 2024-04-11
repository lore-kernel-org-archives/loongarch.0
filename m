Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21E760877
	for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 02:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712804310; cv=none; b=RfjPQtqqsSmmBdIO3ISIhYYEMJyGWZhSASTXTDLebw0WRciY/vmSoxNM+4bFvBA2NgOge24uf6RGipujsGh5VAfl6lBbbZBSOfa4rNJn+jbWY0b28463SwSLvB3tXPw0YUEnct8u0PD6KXZ/9d+zeOp0dqY0UyQPRa+f7d4NMrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712804310; c=relaxed/simple;
	bh=H+6KligDtfbXeCMGh0nniJKBGuen+8IuMp1hIkTuS6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LcZVO6DXqXYKPkRgHQKmJWT7x5FOqucVhUE9OiSBgGq6/+qhsdwtA8fUClfSZrE7CCEbKXZzLLJJ6r4LdERlUlMVkcToJNahUHw6hVy1FNDP6sHdKrdvOGgi3e9GCAqW5rXvJ7j/WUqpeiINdRI5akzItLZEr1iqffdirp+Pfj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.80])
	by gateway (Coremail) with SMTP id _____8DxebrQURdmw5wlAA--.4993S3;
	Thu, 11 Apr 2024 10:58:24 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.80])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxLBPLURdmz8l3AA--.34105S2;
	Thu, 11 Apr 2024 10:58:20 +0800 (CST)
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
Subject: [PATCH v3 0/6] Add Loongson-2k0500 and Loongson-2k2000 clock support
Date: Thu, 11 Apr 2024 10:58:05 +0800
Message-ID: <cover.1712731524.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxLBPLURdmz8l3AA--.34105S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Wry7Aw1UAFy7Xr1rWFWxGrX_yoW8Ww15pa
	nxuay3Gr1DKF18Zrs0qrW0yrn5u3yrJasrJw45t34UurWDC3WDta1Ska1YvrZrZryayF9F
	vF95Kr4UCFWUCrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

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

----
V3:
- Remove the dts-related patches and update dts at once after all relevant
  drivers are complete.
patch(1/6):
 - Drop unsuitable comments.

Link to V2:
https://lore.kernel.org/all/cover.1711504700.git.zhoubinbin@loongson.cn/

V2:
patch(1/8):
 - Drop LOONGSON2_CLK_END, for it is not a binding.
patch(1/8)(3/8)(5/8):
 - Add Acked-by tag from Conor, Thanks.

Link to V1:
https://lore.kernel.org/all/cover.1710926402.git.zhoubinbin@loongson.cn/

Binbin Zhou (6):
  dt-bindings: clock: Add Loongson-2K expand clock index
  clk: clk-loongson2: Refactor driver for adding new platforms
  dt-bindings: clock: loongson2: Add Loongson-2K0500 compatible
  clk: clk-loongson2: Add Loongson-2K0500 clock support
  dt-bindings: clock: loongson2: Add Loongson-2K2000 compatible
  clk: clk-loongson2: Add Loongson-2K2000 clock support

 .../bindings/clock/loongson,ls2k-clk.yaml     |   4 +-
 drivers/clk/clk-loongson2.c                   | 549 ++++++++++--------
 include/dt-bindings/clock/loongson,ls2k-clk.h |  54 +-
 3 files changed, 329 insertions(+), 278 deletions(-)

-- 
2.43.0

