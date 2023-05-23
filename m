Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FCA4C94
	for <loongarch@lists.linux.dev>; Tue, 23 May 2023 03:22:29 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8CxNulzMWxkeicLAA--.19250S3;
	Tue, 23 May 2023 11:22:27 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxHuRwMWxkvdtvAA--.57042S3;
	Tue, 23 May 2023 11:22:25 +0800 (CST)
Subject: Re: [PATCH v2 2/3] dt-bindings: soc: add loongson-2 pm
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Marc Zyngier <maz@kernel.org>, Youling Tang <tangyouling@loongson.cn>,
 Baoqi Zhang <zhangbaoqi@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 Yun Liu <liuyun@loongson.cn>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, Jianmin Lv <lvjianmin@loongson.cn>,
 wanghongliang@loongson.cn, Liu Peibao <liupeibao@loongson.cn>,
 loongson-kernel@lists.loongnix.cn, zhuyinbo@loongson.cn
References: <20230522093156.7108-1-zhuyinbo@loongson.cn>
 <20230522093156.7108-3-zhuyinbo@loongson.cn>
 <20230522-kooky-outbid-82662b45d305@wendy>
From: zhuyinbo <zhuyinbo@loongson.cn>
Message-ID: <d88c0965-8f72-7be1-b67f-1bcf3be60da3@loongson.cn>
Date: Tue, 23 May 2023 11:22:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230522-kooky-outbid-82662b45d305@wendy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxHuRwMWxkvdtvAA--.57042S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAr45tr1fWw1xZF17WrWkXrb_yoW5tr1fpa
	n7Ca1Ykr48ZF13uws5JFy8Aw1Y9rZakFsrXFZrJry0kr98u3WFq3y7KF98ZFW3ArykGFW2
	vFyIgw4jgF4DCFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bxxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487
	Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l42xK82IY6x
	8ErcxFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzgAwDUUUU



在 2023/5/22 下午8:47, Conor Dooley 写道:
> Hey!
> 
> On Mon, May 22, 2023 at 05:31:55PM +0800, Yinbo Zhu wrote:
>> Add the Loongson-2 SoC Power Management Controller binding with DT
>> schema format using json-schema.
> 
> Grabbing thread from lore.kernel.org/all/20230522093156.7108-3-zhuyinbo%40loongson.cn/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 3 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>    [PATCH v2 1/3] loongarch: export loongarch pm interface
>      + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>    [PATCH v2 2/3] dt-bindings: soc: add loongson-2 pm
>      + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>    ERROR: missing [3/3]!
> ---
> Total patches: 2
> ---
> WARNING: Thread incomplete!
> Applying: loongarch: export loongarch pm interface
> Applying: dt-bindings: soc: add loongson-2 pm
> 
> Looks like the user for these bindings got lost somewhere along the way?
> Please make sure to keep a series threaded.

okay, I got it.  I will use a thread to send a series patch.

> 
>>
>> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
>> ---
>>   .../soc/loongson/loongson,ls2k-pmc.yaml       | 51 +++++++++++++++++++
>>   MAINTAINERS                                   |  6 +++
>>   2 files changed, 57 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
>> new file mode 100644
>> index 000000000000..ddad62889c60
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/loongson/loongson,ls2k-pmc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Loongson-2 Power Manager controller
>> +
>> +maintainers:
>> +  - Yinbo Zhu <zhuyinbo@loongson.cn>
>> +
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
>> +      The "suspend-address" is a deep sleep state (Suspend To RAM)
>> +      firmware entry address which was jumped from kernel and it's
>> +      value was dependent on specific platform firmware code. In
>> +      addition, the PM need according to it to indicate that current
>> +      SoC whether support Suspend To RAM.
> 
> I (still) think this property is rather odd, maybe I am just not really
> understanding the property as it seems to be described partly in terms
> of operating system behaviour rather than its actual function. "was
> jumped from kernel" I don't get.

The function Suspend-To-RAM include kernel logic and firmware logic and
if no define "suspend-address" that kernel will can't into firmware 
after suspend to ram and the Suspend-To-RAM function will not be 
finished in LoongArch.


> 
> The whole setup here seems a bit odd, but that's for the loongson arch
> folks reviewing the actual code to comment on!

okay, I got it.

Thanks
Yinbo.
> 
> Thanks,
> Conor.
> 

