Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8D13C25
	for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 12:24:26 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.22])
	by gateway (Coremail) with SMTP id _____8AxV+n4X4hkXqMEAA--.7921S3;
	Tue, 13 Jun 2023 20:24:24 +0800 (CST)
Received: from [10.180.13.22] (unknown [10.180.13.22])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax6OT3X4hknyMZAA--.6254S3;
	Tue, 13 Jun 2023 20:24:23 +0800 (CST)
Message-ID: <bda7c25f-65cf-d45f-3ac0-f2471e3aacf8@loongson.cn>
Date: Tue, 13 Jun 2023 20:23:58 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [ PATCH v2 3/3] ASoC: dt-bindings: Add support for Loongson audio
 card
To: Conor Dooley <conor@kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 conor+dt@kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn
References: <20230612085614.3039498-1-mengyingkun@loongson.cn>
 <20230612-booted-french-186dd95e78a9@spud>
Content-Language: en-US
From: Yingkun Meng <mengyingkun@loongson.cn>
In-Reply-To: <20230612-booted-french-186dd95e78a9@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Ax6OT3X4hknyMZAA--.6254S3
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQABDGSIXIIAKwABsU
X-Coremail-Antispam: 1Uk129KBj93XoWxGF4DKrW3ZF13AFWkuw43XFc_yoW5Gr47pF
	WrCasrKF4xt3W7C3savFyrJr4fZFZayanxJr42qw1UC3s8Ka4rWw42kF1rZay2yrn5GrW2
	vFyF9w48G3Z0yagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnI
	WIevJa73UjIFyTuYvjxU2BT5DUUUU


On 2023/6/13 01:24, Conor Dooley wrote:
> Hey!
>
> On Mon, Jun 12, 2023 at 04:56:14PM +0800, YingKun Meng wrote:
>> From: Yingkun Meng <mengyingkun@loongson.cn>
>>
>> The audio card uses loongson I2S controller present in
>> 7axxx/2kxxx chips to transfer audio data.
>>
>> On loongson platform, the chip has only one I2S controller.
>>
>> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
> I got 2 copies of this patch, but none of the rest of the series appears
> to be threaded with it.
>
>>   .../sound/loongson,ls-audio-card.yaml         | 70 +++++++++++++++++++
>>   1 file changed, 70 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
>> new file mode 100644
>> index 000000000000..61e8babed402
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
>> @@ -0,0 +1,70 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/loongson,ls-audio-card.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Loongson 7axxx/2kxxx ASoC audio sound card driver
>> +
>> +maintainers:
>> +  - Yingkun Meng <mengyingkun@loongson.cn>
>> +
>> +description:
>> +  The binding describes the sound card present in loongson
>> +  7axxx/2kxxx platform. The sound card is an ASoC component
>> +  which uses Loongson I2S controller to transfer the audio data.
>> +
>> +properties:
>> +  compatible:
>> +    const: loongson,ls-audio-card
> Reviewing sound stuff is beyond my pay grade, so forgive me if I am off
> the rails here, but this (and the "x"s in the description) look a bit
> odd. Recently, we've noticed quite a few loongson dt-bindings attempting
> to use a single compatible for many different chips.
> Usually you have individual compatibles for the various SoCs with this
> core, which can fall back to a generic one, rather than just adding a
> generic compatible for all devices.
> As far as I know, there's several SoCs fitting 2kxxx, and the format
> being used elsewhere is "loongson,ls2k1000" etc.


Currently, Loongson has 2K0500/2K1000LA/2K1500/2K2000 chips.

Here, its' possible to use a single compatible for different chips,

as the audio device is a logical device, not dependent on chip model.


> Cheers,
> Conor.
>

