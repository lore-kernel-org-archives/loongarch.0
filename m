Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934134;
	b=wz0YP7gCM8F2LgRkUaEyURIzBeWGsqhkhJs70kOD3xIms++GXbLimIdkBmeE39upbHxS
	 gVNBKQrQF1+PH7oMuHIJe1PZOXDgk36bkc6F5207FXIOHA6J9tgZ1eAR1IqBze4F4d8E3
	 LJZBAHnd5jCIvY/kUm/6ftSA6kPJN0oGTA101h8mxYVXw5bh2OD0WidpFU7CJLZArQETD
	 NuYnhbcAa++ZVulXjA+P0HbO1KUhEdr19AyfiEZ8PTjiPjP3hhirozg8SVNXWGV/vwzqm
	 Cs1xSVaWH3ki53IvjR/ZZ2Ar/SEsjTXqQZmrDQA3U+Qd2QsUNaxv4bHHRyt6nZMh1Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934134;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=ZZgdxyQzU7G0ALVjZOlsXrIuUfV7KVW4Ab6UQo3T3JU=;
	b=xvnh0ZHwZ8/350w6Q6wkzmVsAJz+VKl0uUF0Lwez7XcLVbhplR5Rb2IvyVQj7IWEjkbd
	 4FucflDdc51C/W9tkL9HyYuSq1y7sQRN4VeYzSqiGOohvJVbhFaNzkiX6u7ErkXLlmdeM
	 FCruf+hs2MYO1XWlUiDPekYICce2aW1eZ7ZyVAq0PGY4jozrdMKc0KObtFl/FBRGWJ58y
	 SptRE7whtXYxMigYNSzQ/EmWbt283pNaik5BC7uinkh9O6u9ap9/IGXont8y1C+Gv0pLN
	 5NqVPTzu3ynfnhwLQnIDFs59ffJ2s45CFTKizj1Mm/KOIaej7SthSbKbxO7WhKecbTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524CE606A32C
	for <loongarch@lists.linux.dev>; Fri,  6 Nov 2026 03:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 524CE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.101])
	by gateway (Coremail) with SMTP id _____8BxLNIwQ+1qFOocAA--.18251S3;
	Fri, 06 Nov 2026 11:02:08 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [127.0.0.1])
	by front1 (Coremail) with SMTP id qMiowJCxvM4tQ+1qprAyAA--.18991S2;
	Fri, 06 Nov 2026 11:02:05 +0800 (CST)
From: Hongliang Wang <wanghongliang@loongson.cn>
To: Hongliang Wang <wanghongliang@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH v11 0/2] i2c: ls2x: Add clock- related properties and parsing
Date: Fri,  6 Nov 2026 11:02:01 +0800
Message-Id: <20261106030203.15709-1-wanghongliang@loongson.cn>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxvM4tQ+1qprAyAA--.18991S2
X-CM-SenderInfo: pzdqwxxrqjzxhdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZr15try8KF1xtFW8uw1DCFX_yoWrWr17pF
	43Ca98Gr1jga48ursxt3yIvFyrZws8J39rGrnrXw15uw4avw4DZF1Ikrs09FykZrs2kayU
	W393KF1DKF98AagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJUUUUU=

Hi all:

This patch set adds clock related properties and parsing in dts and acpi.

======
V11:
For the whole series:
- Add Reviewed-by tag from Binbin Zhou, thanks. 

Link to V10:
https://lore.kernel.org/all/20260817090721.30582-1-wanghongliang@loongson.cn/

V10:
Patch (2/2):
- Replace '/' operator with div64_u64() to avoid __udivdi3 linker error on
  32-bit architectures with CONFIG_COMPILE_TEST.

Link to V9:
https://lore.kernel.org/all/20260810074927.25284-1-wanghongliang@loongson.cn/

V9:
Patch (2/2):
- Rewrite the commit description
- Use 64-bit arithmetic to avoid integer overflow during the clock calculation
- Add checks to reject zero clock rates and ensure valid clock inputs
- Modify the comment for clocks and clock-div properties
- Add Tested-by tag from Xi Ruoyao, thanks

Link to V8:
https://lore.kernel.org/all/20260721122604.12717-1-wanghongliang@loongson.cn/

V8:
Patch (2/2):
Fix the potential issues from Sashiko AI review:
 - Add error checking for the pointer returned by devm_clk_get_optional_enabled();
 - Add zero-value checking for the match data to provide default div.

Link to V7:
https://lore.kernel.org/all/20260707035104.3092-1-wanghongliang@loongson.cn/

V7:
Patch (2/2):
Fix the potential issues from Sashiko AI review:
 - Move the clock property parsing process to probe function to solve the issue
   of calling `devm_clk_get_optional_enabled()` dynamically causes unbounded memory
   leaks and unbalanced clock enable counts.
 - Add non-zero checking to priv->div.

Link to V6:
https://lore.kernel.org/all/20260608024533.32419-1-wanghongliang@loongson.cn/

V6:
- Add Reviewed-by tag from Huacai, thanks. 
Patch (1/2):
 - Remove CC stable. 

Link to V5:
https://lore.kernel.org/all/20260604015848.18643-1-wanghongliang@loongson.cn/ 

V5:
Patch (1/2):
 - Adjust the position of #include <dt-bindings/clock/loongson,ls2k-clk.h>;
 - Add CC stable; 
 - Fix Signed-off-by.
Patch (2/2):
 - Replace 2K0500/2K1000/2K2000 with LS2K0500/2K1000/2K2000;
 - Replace 7A1000/7A2000 with LS7A1000/7A2000;
 - Replace if (clk && !IS_ERR(clk)) with if(!IS_ERR_OR_NULL(clk));
 - Add document that clocks and clock-div are only ACPI properties in ACPI;
 - Remove unsigned int cast in code (unsigned long)device_get_match_data(dev);
 - Add CC stable; 
 - Fix Signed-off-by.

Link to V4:
https://lore.kernel.org/all/20260526031021.32662-1-wanghongliang@loongson.cn/

V4:
- Add Acked-by tag from Conor Dooley, thanks.
Patch (2/2):
 - Adjust the position of #include <linux/clk.h>;
 - Remove struct ls2x_i2c_chip_data and use macro to describe div;
 - Use div instead of factor in ls2x_i2c_adjust_bus_speed;
 - Reverse the "if & else" code logic in ls2x_i2c_adjust_bus_speed;

Link to V2:
The PATCH v3 is incomplete, v4 is the replacement of v3, so the previous patch link is v2.

[PATCH v2] dt-bindings: i2c: ls2x-i2c: Add clocks and clock-frequency properties
https://lore.kernel.org/all/20260507081010.12810-1-wanghongliang@loongson.cn/
[PATCH v2] i2c: ls2x: Add clocks property parsing and adjust bus speed
https://lore.kernel.org/all/20260507081010.12810-2-wanghongliang@loongson.cn/

V2:
[PATCH v2] dt-bindings: i2c: ls2x-i2c: Add clocks and clock-frequency properties
- Remove the custom properties clock-input and clock-div, use clock framework;
[PATCH v2] i2c: ls2x: Add clocks property parsing and adjust bus speed
- Use clock framework to obtain the i2c reference clock in dts.

Link to V1:
https://lore.kernel.org/all/20260325011852.19079-1-wanghongliang@loongson.cn/

Hongliang Wang (2):
  dt-bindings: i2c: ls2x-i2c: Add clocks and clock-frequency properties
  i2c: ls2x: Add clocks property parsing and adjust bus speed

 .../bindings/i2c/loongson,ls2x-i2c.yaml       |  3 ++
 drivers/i2c/busses/i2c-ls2x.c                 | 44 +++++++++++++++++--
 2 files changed, 44 insertions(+), 3 deletions(-)

-- 
2.47.2

