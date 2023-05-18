Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6894A19B
	for <loongarch@lists.linux.dev>; Thu, 18 May 2023 03:23:32 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8Cxe+osmmVkPbwJAA--.16867S3;
	Thu, 18 May 2023 11:23:24 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_7MrmmVkrihnAA--.44677S3;
	Thu, 18 May 2023 11:23:24 +0800 (CST)
Subject: Re: [PATCH v1 2/3] dt-bindings: soc: add loongson-2 pm
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Marc Zyngier <maz@kernel.org>, Youling Tang <tangyouling@loongson.cn>,
 Baoqi Zhang <zhangbaoqi@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 Yun Liu <liuyun@loongson.cn>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
Cc: Jianmin Lv <lvjianmin@loongson.cn>, wanghongliang@loongson.cn,
 Liu Peibao <liupeibao@loongson.cn>, loongson-kernel@lists.loongnix.cn,
 zhuyinbo@loongson.cn
References: <20230517073149.31980-1-zhuyinbo@loongson.cn>
 <20230517073149.31980-3-zhuyinbo@loongson.cn>
 <d3791702-4d41-0208-1346-34738a2883b6@linaro.org>
From: zhuyinbo <zhuyinbo@loongson.cn>
Message-ID: <4521c591-6fcd-c96a-e2f6-f41f5c191036@loongson.cn>
Date: Thu, 18 May 2023 11:23:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <d3791702-4d41-0208-1346-34738a2883b6@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx_7MrmmVkrihnAA--.44677S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7ArW7Zr4DtrWrZF45CrW8Xrb_yoW8Ar48pa
	yUKa1qyayUJF15Aw40qa4kCrsxKa98Gay5Gr95Xa4akFZ0q3WIvFy7K3W5urZa9ryIq342
	v3W0vryrXa15AFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bxxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487
	Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l42xK82IY6x
	8ErcxFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzgAwDUUUU



在 2023/5/17 下午11:00, Krzysztof Kozlowski 写道:
> On 17/05/2023 09:31, Yinbo Zhu wrote:
>> Add the Loongson-2 SoC Power Management Controller binding with DT
>> schema format using json-schema.
>>
>> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> 
> ...
> 
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - loongson,ls2k-pmc
>> +      - const: syscon
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  suspend-address:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      This option indicate this PM suspend address.
> 
> This tells me nothing. Drop "This option indicate this" and rephrase
> everything to actually describe this property. Why would the address
> differ on given, specific SoC? It looks like you just miss compatibles.
> Anyway this needs much more explanation so we can judge whether it fits DT.

Hi Krzysztof,

I will add following description about "suspend-address", please review.

The "suspend-address" is a ACPI S3 (Suspend To RAM) firmware entry
address which was jumped from kernel and it's value was dependent on 
specific platform firmware code. In addition, the PM driver need 
according to it to indicate that current SoC whether support ACPI S3.

Thanks.

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    pmc: pm@1fe27000 {
>> +        compatible = "loongson,ls2k-pmc", "syscon";
>> +        reg = <0x1fe27000 0x58>;
>> +        interrupt-parent = <&liointc1>;
>> +        interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
>> +        suspend-address = <0x1c000500>;
> 
> 
> Best regards,
> Krzysztof
> 

