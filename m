Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B13B3E5EC2
	for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 09:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786958999; cv=none; b=BipL/DjZ1Op4GFb5kEEbOoAsXQb2bh6R459rQb47b3STMGacA/AEqOUD62T9D6ytzHnPUVuCaBanwYKlK7xNCrFpXeB3b17zU/UhgJWjs/CCkM3+XISyk164EOKkJsik4VkBYtQ+5aQtq1P5b32ZsFSOuyegIybhhWWBxJ4gvj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786958999; c=relaxed/simple;
	bh=TMfdYKaYwHg/s+J0APHoiFkIoCECW5esCrTED4LVNXQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=QnrozKjDWNcpGVX2Q6/bWVY+jfl73VQXn0Lp08GlfCKuWLgLn/t4tHGpbKScRwatC/F2BBSjpnenvq+Gfstj9uJ9d8y4I0McJE12JXZPiylGRIVss5sdPdHamS/Drtq2aT8SrT3auVW8fGFG8/O0gW95guk61WSTtqpaOOMwBQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.101])
	by gateway (Coremail) with SMTP id _____8DxpvBm1IJqzNUBAA--.5606S3;
	Mon, 17 Aug 2026 17:29:11 +0800 (CST)
Received: from [10.20.42.101] (unknown [10.20.42.101])
	by front1 (Coremail) with SMTP id qMiowJBxrM5l1IJqu8oHAA--.7091S3;
	Mon, 17 Aug 2026 17:29:10 +0800 (CST)
Subject: Re: [PATCH v10 0/2] i2c: ls2x: Add clock- related properties and
 parsing
To: Binbin Zhou <zhoubinbin@loongson.cn>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20260817090721.30582-1-wanghongliang@loongson.cn>
From: Hongliang Wang <wanghongliang@loongson.cn>
Message-ID: <668c5145-da87-d318-2338-738b0035a671@loongson.cn>
Date: Mon, 17 Aug 2026 17:23:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260817090721.30582-1-wanghongliang@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJBxrM5l1IJqu8oHAA--.7091S3
X-CM-SenderInfo: pzdqwxxrqjzxhdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXw1rZF1fCw4rXF1UCF47Jrc_yoWrCry8pF
	sxCay5Gr1Y9a48uwsxt3yxZF95Zws8J397Gr17Ww15ua1avr1DZF1xKr909rykZr4vkayY
	gr9IgF1DKFW5AabCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUc3kuDU
	UUU

Hi all,

Sorry for the duplicate 0/2 cover‑letter message in this thread.
Only the 09:07 UTC full V10 series (0/2, 1/2, 2/2) is the intended one,
please ignore the earlier 09:01 UTC standalone 0/2 cover‑letter.

The patches 1/2 and 2/2 are correct.

Thanks,
Hongliang Wang


On 2026/8/17 下午5:07, Hongliang Wang wrote:
> Hi all:
>
> This patch set adds clock related properties and parsing in dts and acpi.
>
> ======
> V10:
> Patch (2/2):
> - Replace '/' operator with div64_u64() to avoid __udivdi3 linker error on
>    32‑bit architectures with CONFIG_COMPILE_TEST.
>
> Link to V9:
> https://lore.kernel.org/all/20260810074927.25284-1-wanghongliang@loongson.cn/
>
> V9:
> Patch (2/2):
> - Rewrite the commit description
> - Use 64-bit arithmetic to avoid integer overflow during the clock calculation
> - Add checks to reject zero clock rates and ensure valid clock inputs
> - Modify the comment for clocks and clock-div properties
> - Add Tested-by tag from Xi Ruoyao, thanks
>
> Link to V8:
> https://lore.kernel.org/all/20260721122604.12717-1-wanghongliang@loongson.cn/
>
> V8:
> Patch (2/2):
> Fix the potential issues from Sashiko AI review:
>   - Add error checking for the pointer returned by devm_clk_get_optional_enabled();
>   - Add zero-value checking for the match data to provide default div.
>
> Link to V7:
> https://lore.kernel.org/all/20260707035104.3092-1-wanghongliang@loongson.cn/
>
> V7:
> Patch (2/2):
> Fix the potential issues from Sashiko AI review:
>   - Move the clock property parsing process to probe function to solve the issue
>     of calling `devm_clk_get_optional_enabled()` dynamically causes unbounded memory
>     leaks and unbalanced clock enable counts.
>   - Add non-zero checking to priv->div.
>
> Link to V6:
> https://lore.kernel.org/all/20260608024533.32419-1-wanghongliang@loongson.cn/
>
> V6:
> - Add Reviewed-by tag from Huacai, thanks.
> Patch (1/2):
>   - Remove CC stable.
>
> Link to V5:
> https://lore.kernel.org/all/20260604015848.18643-1-wanghongliang@loongson.cn/
>
> V5:
> Patch (1/2):
>   - Adjust the position of #include <dt-bindings/clock/loongson,ls2k-clk.h>;
>   - Add CC stable;
>   - Fix Signed-off-by.
> Patch (2/2):
>   - Replace 2K0500/2K1000/2K2000 with LS2K0500/2K1000/2K2000;
>   - Replace 7A1000/7A2000 with LS7A1000/7A2000;
>   - Replace if (clk && !IS_ERR(clk)) with if(!IS_ERR_OR_NULL(clk));
>   - Add document that clocks and clock-div are only ACPI properties in ACPI;
>   - Remove unsigned int cast in code (unsigned long)device_get_match_data(dev);
>   - Add CC stable;
>   - Fix Signed-off-by.
>
> Link to V4:
> https://lore.kernel.org/all/20260526031021.32662-1-wanghongliang@loongson.cn/
>
> V4:
> - Add Acked-by tag from Conor Dooley, thanks.
> Patch (2/2):
>   - Adjust the position of #include <linux/clk.h>;
>   - Remove struct ls2x_i2c_chip_data and use macro to describe div;
>   - Use div instead of factor in ls2x_i2c_adjust_bus_speed;
>   - Reverse the "if & else" code logic in ls2x_i2c_adjust_bus_speed;
>
> Link to V2:
> The PATCH v3 is incomplete, v4 is the replacement of v3, so the previous patch link is v2.
>
> [PATCH v2] dt-bindings: i2c: ls2x-i2c: Add clocks and clock-frequency properties
> https://lore.kernel.org/all/20260507081010.12810-1-wanghongliang@loongson.cn/
> [PATCH v2] i2c: ls2x: Add clocks property parsing and adjust bus speed
> https://lore.kernel.org/all/20260507081010.12810-2-wanghongliang@loongson.cn/
>
> V2:
> [PATCH v2] dt-bindings: i2c: ls2x-i2c: Add clocks and clock-frequency properties
> - Remove the custom properties clock-input and clock-div, use clock framework;
> [PATCH v2] i2c: ls2x: Add clocks property parsing and adjust bus speed
> - Use clock framework to obtain the i2c reference clock in dts.
>
> Link to V1:
> https://lore.kernel.org/all/20260325011852.19079-1-wanghongliang@loongson.cn/
>
> Hongliang Wang (2):
>    dt-bindings: i2c: ls2x-i2c: Add clocks and clock-frequency properties
>    i2c: ls2x: Add clocks property parsing and adjust bus speed
>
>   .../bindings/i2c/loongson,ls2x-i2c.yaml       |  3 ++
>   drivers/i2c/busses/i2c-ls2x.c                 | 44 +++++++++++++++++--
>   2 files changed, 44 insertions(+), 3 deletions(-)
>

