Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D51AD32
	for <loongarch@lists.linux.dev>; Mon, 28 Nov 2022 23:31:56 +0000 (UTC)
Received: from loongson.cn (unknown [117.133.84.114])
	by gateway (Coremail) with SMTP id _____8AxhfDqRIVjwdgBAA--.4367S3;
	Tue, 29 Nov 2022 07:31:54 +0800 (CST)
Received: from [192.168.1.7] (unknown [117.133.84.114])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxj+DqRIVjIskdAA--.9504S3;
	Tue, 29 Nov 2022 07:31:54 +0800 (CST)
Message-ID: <c1f46cb8-dfbb-8b2a-5617-173bb62084ec@loongson.cn>
Date: Tue, 29 Nov 2022 07:31:53 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 1/2] gpio: loongson: add gpio driver support
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Juxin Gao <gaojuxin@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 Arnaud Patard <apatard@mandriva.com>, Huacai Chen <chenhuacai@kernel.org>,
 Jianmin Lv <lvjianmin@loongson.cn>,
 Hongchen Zhang <zhanghongchen@loongson.cn>,
 Liu Peibao <liupeibao@loongson.cn>
References: <20221128064300.12021-1-zhuyinbo@loongson.cn>
 <CACRpkdZoD8v6pPStaKLf14houZk5e89ZBz5wZJVQJxJ1Xq37Ug@mail.gmail.com>
From: Yinbo Zhu <zhuyinbo@loongson.cn>
In-Reply-To: <CACRpkdZoD8v6pPStaKLf14houZk5e89ZBz5wZJVQJxJ1Xq37Ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bxj+DqRIVjIskdAA--.9504S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7CFW5XF1Dtw1kKr17tFyxXwb_yoW8Jw4xpF
	W7Cay7KFWUKr45CrWDKryrZFyfGFZ8Krsxtr4v9rWDK34DJ3Z2q3y3uF1j9F1xAFyrCr15
	ZrZ3CrW09an8JFJanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bDkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUGVWUXwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY
	6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrV
	C2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE
	7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14
	v26r126r1DMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_WwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I
	0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcV
	CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8xnY5UUUUU==


在 2022/11/29 4:35, Linus Walleij 写道:
> On Mon, Nov 28, 2022 at 7:43 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
>
>> The Loongson platforms GPIO controller contains 60 GPIO pins in total,
>> 4 of which are dedicated GPIO pins, and the remaining 56 are reused
>> with other functions. Each GPIO can set input/output and has the
>> interrupt capability.
>>
>> This driver added support for Loongson GPIO controller and support to
>> use DTS or ACPI to descibe GPIO device resources.
>>
>> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
>> Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
>> Signed-off-by: Liu Peibao <liupeibao@loongson.cn>
>> Signed-off-by: Juxin Gao <gaojuxin@loongson.cn>
>> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> v8 looks really nice.
>
>> +static int loongson_gpio_to_irq(
>> +                       struct gpio_chip *chip, unsigned int offset)
>> +{
>> +       struct platform_device *pdev =
>> +               container_of(chip->parent, struct platform_device, dev);
>> +
>> +       if (offset >= chip->ngpio)
>> +               return -EINVAL;
> You forgot to drop this.

You mean to remove this if judgment?

"if(offset >= chip->ngpio)"

         return -EINVAL;

>
> With this fixed (and Bartosz requested fix):
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

