Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC26653
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 04:01:59 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8DxRum23otkz9MFAA--.10495S3;
	Fri, 16 Jun 2023 12:01:58 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxVeS13otkmNccAA--.16633S3;
	Fri, 16 Jun 2023 12:01:57 +0800 (CST)
Subject: Re: [PATCH v3 3/3] soc: loongson2_pm: add power management support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 zhuyinbo@loongson.cn, Conor Dooley <conor+dt@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Marc Zyngier <maz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, Jianmin Lv <lvjianmin@loongson.cn>,
 wanghongliang@loongson.cn, Liu Peibao <liupeibao@loongson.cn>,
 loongson-kernel@lists.loongnix.cn
References: <20230615091757.24686-1-zhuyinbo@loongson.cn>
 <968b7c81-a24e-1e0d-31a4-f633a82d17b0@loongson.cn>
 <CAAhV-H4Z13wpOsj5GxkuwMK1D6N6=sArQ52yHjcdiEen=dUpjg@mail.gmail.com>
 <9edfe58a-7901-c2d1-8e01-5f10b3a51287@loongson.cn>
 <a9292d85-83b5-5b43-6c2a-7e393213c6c9@loongson.cn>
 <CAAhV-H4-LCryuQKJrwE65w5BZ66a6PQAq+ZT8mqE7vHa7L3_zw@mail.gmail.com>
From: zhuyinbo <zhuyinbo@loongson.cn>
Message-ID: <15c4c3cf-819b-c298-c212-d58b1e28ccd8@loongson.cn>
Date: Fri, 16 Jun 2023 12:01:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4-LCryuQKJrwE65w5BZ66a6PQAq+ZT8mqE7vHa7L3_zw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxVeS13otkmNccAA--.16633S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==



在 2023/6/16 上午9:54, Huacai Chen 写道:
> Hi, Yinbo,
> 
> On Fri, Jun 16, 2023 at 9:45 AM zhuyinbo <zhuyinbo@loongson.cn> wrote:

...

>>>
>>>
>>> okay, I got it.
>>>
>>>>
>>>>> +}
>>>>> +
>>>>> +static void loongson2_power_button_irq_enable(void)
>>>>
>>>> Using loongson2_pm_irq_enable is a little better.
>>>
>>>
>>
>> Previously, you suggested that I combine loongson2_pm_irq_enable() and
>> power button irq enable code as loongson2_power_button_irq_enable, then
>> I remove the function loongson2_pm_irq_enable, in this case that I won't
>> be able to call loongson2_pm_irq_enable, so have I misunderstood your
>> meaning ? or only rename loongson2_power_button_irq_enable as
>> loongson2_pm_irq_enable ?
> I'm very sorry for that. At first I only wanted to combine two
> functions, but then I found the name  loongson2_pm_irq_enable is
> better. So just rename is OK. Thanks.
> 


okay, I got it.

Thanks,
Yinbo

