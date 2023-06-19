Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F22723C0
	for <loongarch@lists.linux.dev>; Mon, 19 Jun 2023 07:49:37 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.22])
	by gateway (Coremail) with SMTP id _____8Bx4OiQCJBkrMgGAA--.12143S3;
	Mon, 19 Jun 2023 15:49:36 +0800 (CST)
Received: from [10.180.13.22] (unknown [10.180.13.22])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax6OSPCJBk5P8fAA--.24411S3;
	Mon, 19 Jun 2023 15:49:35 +0800 (CST)
Message-ID: <ae880c97-e38d-0f01-f349-a427ab4afd41@loongson.cn>
Date: Mon, 19 Jun 2023 15:49:12 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/3] ASoC: Add support for Loongson I2S controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, broonie@kernel.org,
 lgirdwood@gmail.com
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn,
 Dan Carpenter <dan.carpenter@linaro.org>, Dan Carpenter <error27@gmail.com>,
 kernel-janitors@vger.kernel.org
References: <20230615122718.3412942-1-mengyingkun@loongson.cn>
 <cf2f3bc9-3141-8d7b-b57d-73eac70a21d2@oracle.com>
 <6901166d-387f-24de-6ffd-1c8eea724718@oracle.com>
 <325dd825-6fa5-0ebc-4b7e-7acf2d2840e4@loongson.cn>
 <bd4da934-72b7-67f3-0c9c-c18d3af16e7d@linaro.org>
Content-Language: en-US
From: Yingkun Meng <mengyingkun@loongson.cn>
In-Reply-To: <bd4da934-72b7-67f3-0c9c-c18d3af16e7d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Ax6OSPCJBk5P8fAA--.24411S3
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQAHDGSO9AIDRgAHsU
X-Coremail-Antispam: 1Uk129KBj9xXoW7JrW5Ww15CrWUJF13Ar1rZrc_yoWkGFg_Xw
	4q9wn8XFyUJay5Jrs7Kr9FvFyDXr13trn8Jw4rZF1UXwnrJF95Wr15Gwn3JrZrGrWUGr1U
	Xrn8Wa43u3WUWosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbaAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E
	14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryU
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsG
	vfC2KfnxnUUI43ZEXa7IU8vApUUUUUU==


On 2023/6/19 15:00, Krzysztof Kozlowski wrote:
> On 19/06/2023 03:45, Yingkun Meng wrote:
>>>>> +    tx_data->irq = fwnode_irq_get_byname(fwnode, "tx");
>>>> Smatch detects that tx_data->irq and rx_data->irq are of type
>>>> u32(unsigned) so they can never be negative.
>>>>
>>>>> +    if (tx_data->irq < 0) {
>>>>               ^^^^^^^^ This can never be true.
>>>>
>>>> Should irq be of type 'int' instead?
>>>>
>>>>> +        dev_err(&pdev->dev, "dma tx irq invalid\n");
>>>>> +        return tx_data->irq;
>>>>> +    }
>>>>> +
>>>>> +    rx_data->irq = fwnode_irq_get_byname(fwnode, "rx");
>>>>> +    if (rx_data->irq < 0) {
>>>>               ^^^ Same problem here.
>>>>
>>>> Should irq
>>> Should 'irq' be of type int instead?
>>>
>>> As fwnode_irq_get_byname() returns a integer.
>>>
>> Yes, you are right. I will add a patch to fix the type of 'irq' to int.
> Run smatch and sparse on your code before posting. It would find such
> trivial mistakes.

Thanks, got it.

Thanks,
Yingkun

>
> Best regards,
> Krzysztof

