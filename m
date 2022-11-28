Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC7B7E
	for <loongarch@lists.linux.dev>; Mon, 28 Nov 2022 01:30:24 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.110])
	by gateway (Coremail) with SMTP id _____8Dx9vDLDoRjx4cBAA--.3744S3;
	Mon, 28 Nov 2022 09:28:43 +0800 (CST)
Received: from [0.0.0.0] (unknown [112.20.109.110])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxNlfJDoRj58QcAA--.55015S3;
	Mon, 28 Nov 2022 09:28:42 +0800 (CST)
Message-ID: <b79a7f9e-d45d-aad9-8a34-4db609ce2c74@loongson.cn>
Date: Mon, 28 Nov 2022 09:28:41 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V3 2/5] i2c: gpio: Add support on ACPI-based system
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
 devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
 WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jianmin Lv <lvjianmin@loongson.cn>
References: <cover.1669359515.git.zhoubinbin@loongson.cn>
 <e0ed6dfa3dbf60b58ef4eaeb40ea46d2577a2834.1669359515.git.zhoubinbin@loongson.cn>
 <Y4CXrDh61D/f8V2A@smile.fi.intel.com>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <Y4CXrDh61D/f8V2A@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxNlfJDoRj58QcAA--.55015S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7XF15JF4xWFy8Cr1xtF43Jrb_yoWxCFb_uF
	yUZa1kAw1vvF18Aa1Ykr12gF48XF4DGF1UGF4ktwn3Kr1rJF93ZF95Zr92krn3Zry7GrsI
	yryjvFy8KrW29jkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	W7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAa
	w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2
	jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
	AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
	1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIY
	CTnIWIevJa73UjIFyTuYvjxU2MKZDUUUU


在 2022/11/25 18:23, Andy Shevchenko 写道:
> On Fri, Nov 25, 2022 at 04:54:12PM +0800, Binbin Zhou wrote:
>> Add support for the ACPI-based device registration, so that the driver
>> can be also enabled through ACPI table.
> ...
>
>> +/* get i2c-gpio props from DT or ACPI table */
> Get
>
> ...
>
>> -	if (np) {
>> -		of_i2c_gpio_get_props(np, pdata);
>> +	if (np || has_acpi_companion(dev)) {
>> +		i2c_gpio_get_props(dev, pdata);
> 	if (dev_fwnode() {
> 		i2c_gpio_get_props(dev, pdata);
>
> ...
>
>> +	{"LOON0005", 0}, /*LoongArch*/
> ", 0" part is redundant. Also missing spaces in the comment.
>
Hi Andy:

Thanks for your review. I will fix them in the V4 patchset.

Binbin

