Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8A7322A
	for <loongarch@lists.linux.dev>; Tue, 29 Nov 2022 13:19:48 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.110])
	by gateway (Coremail) with SMTP id _____8DxvuvzBoZjchECAA--.4945S3;
	Tue, 29 Nov 2022 21:19:47 +0800 (CST)
Received: from [0.0.0.0] (unknown [112.20.109.110])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxXuDxBoZjsX4eAA--.10991S3;
	Tue, 29 Nov 2022 21:19:47 +0800 (CST)
Message-ID: <38f385b8-0df4-bcd9-f6a0-4b30108efa6c@loongson.cn>
Date: Tue, 29 Nov 2022 21:19:45 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V3 4/5] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
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
 <822356908305580d601e5b3e424371ed7f220b85.1669359515.git.zhoubinbin@loongson.cn>
 <Y4Cb19PM97M9HaiB@smile.fi.intel.com>
 <8b0e2e61-2e54-127e-7cb8-9e1068dbc390@loongson.cn>
 <Y4S2cnlAm3YYvZ8E@smile.fi.intel.com>
 <ada74168-4aef-b73e-ec47-437dfcdcea77@loongson.cn>
 <Y4YAtWgQieDJV1bG@smile.fi.intel.com>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <Y4YAtWgQieDJV1bG@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxXuDxBoZjsX4eAA--.10991S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uFW5Ww1fZw4xtF18tFW8WFg_yoW8GF13pF
	W5JFyUKF4j9F10grn2gwn0gwsayr9xJrnaqrnYgwn3XFnF9asrGFWrtw1qkFnFgr10qw12
	va18Kry3G3ySqaUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bqxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
	e7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280
	aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
	AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
	IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI
	42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280
	aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8xHUDUUUUU==


在 2022/11/29 20:53, Andy Shevchenko 写道:
> On Tue, Nov 29, 2022 at 07:34:58PM +0800, Binbin Zhou wrote:
>> 在 2022/11/28 21:24, Andy Shevchenko 写道:
>>> On Mon, Nov 28, 2022 at 08:03:40PM +0800, Binbin Zhou wrote:
>>>> 在 2022/11/25 18:41, Andy Shevchenko 写道:
>>>>> On Fri, Nov 25, 2022 at 04:55:20PM +0800, Binbin Zhou wrote:
> ...
>
>>>>>> +static int ls2x_i2c_start(struct i2c_adapter *adap, struct i2c_msg *msgs)
>>>>>> +{
>>>>>> +	struct ls2x_i2c_dev *dev = i2c_get_adapdata(adap);
>>>>>> +	unsigned char addr = i2c_8bit_addr_from_msg(msgs);
>>>>>> +
>>>>>> +	reinit_completion(&dev->cmd_complete);
>>>>>> +	addr |= (msgs->flags & I2C_M_RD) ? 1 : 0;
>>>>> Why is this needed?
>>>> In the ls2x I2C controller, the bit 0 of TXR indicates the read/write status
>>>> when transferring the address.
>>> Yes, I understand this. I don't understand why do you need this twice.
>> Are you saying that the "is_read" variable in ls2x_i2c_xfer_one() already
>> indicates the read/write state of data transfer?
>>
>> I just didn't think it was necessary to take "is_read" as an argument to
>> ls2x_i2c_start() at the time, since we could get it from "msg".
> Have you checked what i2c_8bit_addr_from_msg() is doing?

Emm... Sorry, it was a cheap mistake on my part, I will drop it.

Then I will send the V4 patchset, with all the relevant changes.

Thanks.

Binbin

>

