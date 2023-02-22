Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495641C17
	for <loongarch@lists.linux.dev>; Wed, 22 Feb 2023 05:10:16 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8Axbdq3o_VjR3cDAA--.1579S3;
	Wed, 22 Feb 2023 13:10:15 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxWL22o_VjmHY4AA--.37752S3;
	Wed, 22 Feb 2023 13:10:14 +0800 (CST)
Subject: Re: [PATCH v10 2/4] clk: clk-loongson2: add clock controller driver
 support
From: zhuyinbo <zhuyinbo@loongson.cn>
To: Stephen Boyd <sboyd@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Jianmin Lv <lvjianmin@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh+dt@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Yang Li <yang.lee@linux.alibaba.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 liupeibao@loongson.cn, loongarch@lists.linux.dev, wanghongliang@loongson.cn
References: <20221129034157.15036-1-zhuyinbo@loongson.cn>
 <20221129034157.15036-2-zhuyinbo@loongson.cn>
 <31c690a347f858a477bbba9c838984ed.sboyd@kernel.org>
 <4b5fd886-57ce-01ef-8224-432898b7fb1c@loongson.cn>
 <8332a1cf44b01f06bdd5db9dc5d7f387.sboyd@kernel.org>
 <01ee3dc6-a868-fd2b-93aa-11e6bdfcc9df@loongson.cn>
 <9e8952c9415973dc7276185e3cdf5ae7.sboyd@kernel.org>
 <d92223a0-6d4c-33ea-1473-3d40bdd0ad9e@loongson.cn>
Message-ID: <834da7dc-bb5d-3427-43e5-938e40a2d180@loongson.cn>
Date: Wed, 22 Feb 2023 13:10:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <d92223a0-6d4c-33ea-1473-3d40bdd0ad9e@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8CxWL22o_VjmHY4AA--.37752S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Zr4UJrW7tr4kAF1fJF4xWFg_yoW8uF1Upr
	ZxCay7KF4Dtr40vr1qgw4UZas0ya1ftF17Xw4ftw1DCa4qk345ur4UXFn5CF93Jr45G3y0
	qr18tw47CFyq9rJanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bfxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY
	6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrV
	C2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE
	7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7V
	AKI48JMxAIw28IcVCjz48v1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C2
	67AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
	CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
	daVFxhVjvjDU0xZFpf9x07jYzuAUUUUU=


在 2023/2/22 上午10:02, zhuyinbo 写道:
>
> 在 2023/2/22 上午7:07, Stephen Boyd 写道:
>> Quoting zhuyinbo (2023-02-19 21:44:51)
>>> 在 2023/2/18 上午6:15, Stephen Boyd 写道:
>>>> Quoting zhuyinbo (2023-02-14 23:35:22)
>>>>> 在 2023/2/11 上午7:42, Stephen Boyd 写道:
>>>>>>> +
>>>>>>> +err:
>>>>>>> +       iounmap(loongson2_pll_base);
>>>>>>> +}
>>>>>>> +
>>>>>>> +CLK_OF_DECLARE(loongson2_clk, "loongson,ls2k-clk", 
>>>>>>> loongson2_clocks_init);
>>>>>> Any reason this can't be a platform driver?
>>> Your question is that  why I don't use the platform_driver_register to
>>> register  clk and use CLK_OF_DECLARE ?
>> Yes.
>>
>>> I was  consider other clock controllers of Loongson-2 series may be
>>> different with 2k1000 and I can add a line
>>>
>>> CLK_OF_DECLARE() for compatible other platform in the future. eg.
>>>
>>> CLK_OF_DECLARE(loongson2_clk, "loongson,ls2k-clk", 
>>> loongson2_clocks_init);
>>>
>>> +  CLK_OF_DECLARE(xxx1, xxx2,  xxx3);  // for other clock 
>>> controllers of
>>> Loongson-2 series
>>>
>>>>> For the compatible consideration of other clock controllers of
>>>>> Loongson-2 series in the future, the way of using dts can be
>>>>>
>>>>> better compatible.
>>>>>
>>>> Sorry that sentence doesn't make sense to me. The use of dts doesn't
>>>> require the use of CLK_OF_DECLARE.
>>> yes, the use of dts doesn't require the use of CLK_OF_DECLARE and can
>>> use platform_driver_register
>>>
>>> but my drvier not use platform_driver_register to register clk and use
>>> CLK_OF_DECLARE to match of_clk_init.
>> of_clk_init() is there to register clks that are needed for early init,
>> i.e. the clockevent/clocksource or the root interrupt controller
>> (irqchip). Otherwise, it isn't necessary to register clks via
>> of_clk_init().
> okay, I got it.

and,  the time driver  get clock by CCF that ask loongson2 clock driver 
use CLK_OF_DECLARE

to match of_clk_init.   because  the timer_probe  is very early and the 
timer driver was use TIMER_OF_DECLARE

to match time_probe.

