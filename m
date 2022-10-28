Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C9FE825
	for <loongarch@lists.linux.dev>; Fri, 28 Oct 2022 03:54:26 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.64])
	by gateway (Coremail) with SMTP id _____8BxfdpqUltjWQMDAA--.11870S3;
	Fri, 28 Oct 2022 11:54:18 +0800 (CST)
Received: from [10.180.13.64] (unknown [10.180.13.64])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxJldnUltjBiYGAA--.3575S2;
	Fri, 28 Oct 2022 11:54:16 +0800 (CST)
Subject: Re: [PATCH v4 1/2] clocksource: loongson2_hpet: add hpet driver
 support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, zhuyinbo@loongson.cn,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Jianmin Lv <lvjianmin@loongson.cn>,
 Yun Liu <liuyun@loongson.cn>, Yang Li <yang.lee@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20221026035752.32681-1-zhuyinbo@loongson.cn>
 <438f5df4-b076-4920-7bb3-095041c27eef@linaro.org>
From: Yinbo Zhu <zhuyinbo@loongson.cn>
Message-ID: <9b4c904a-9277-504e-3bec-0b11331bbea4@loongson.cn>
Date: Fri, 28 Oct 2022 11:54:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <438f5df4-b076-4920-7bb3-095041c27eef@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxJldnUltjBiYGAA--.3575S2
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7JFWruFW7CFy3Kw1kZFWUArb_yoW8Jry8pF
	W2gan8tFWkXr4ru3s7ta9Fk3Z8u3Z5Xr98Grn5t3WxArWkJ3W8WFZ29Fy3uF98ursrt3y7
	ZryFqa48ua9FyFJanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bDAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY
	6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrV
	C2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE
	7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14
	v26r126r1DMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_WwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I
	0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcV
	CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07joKZXUUUUU=



在 2022/10/26 下午10:20, Krzysztof Kozlowski 写道:
> On 25/10/2022 23:57, Yinbo Zhu wrote:
>> HPET (High Precision Event Timer) defines a new set of timers, which
>> are used by the operating system to schedule threads, interrupt the
>> kernel and interrupt the multimedia timer server. The operating
>> system can assign different timers to different applications. By
>> configuration, each timer can generate interrupt independently.
>>
>> The loongson2 HPET module includes a main count and three comparators
>> , all of which are 32 bits wide. Among the three comparators, only
> 
> No blank line before coma.
You said that need blank line is need a blank space before comma?  I
will add it a blank space before comma.
> 
>> one comparator supports periodic interrupt, all three comparators
>> support non periodic interrupts.
>>
>> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
>> ---
>> Change in v4:
>>                  1. Use common clock framework ops to gain apb clock.
>>                  2. This patch need rely on clock patch, which patchwork
>>                     link was "https://patchwork.kernel.org/project/linux-clk/list/?series=688892".
> 
> Link to lore.
> 
> The point 2 should go to cover letter. It's easy to miss it.
> 
> Best regards,
> Krzysztof
> 

