Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BF915ACE
	for <loongarch@lists.linux.dev>; Tue,  6 Jun 2023 12:11:14 +0000 (UTC)
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8DxPPBKIn9kmScAAA--.753S3;
	Tue, 06 Jun 2023 20:10:51 +0800 (CST)
Received: from [192.168.100.8] (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxauVIIn9kcVMCAA--.9829S3;
	Tue, 06 Jun 2023 20:10:50 +0800 (CST)
Message-ID: <569f203c-8e77-6ba8-56f9-b57d4840f502@loongson.cn>
Date: Tue, 6 Jun 2023 20:10:48 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/4] ALSA: hda: Using polling mode for loongson controller
 by default
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, perex@perex.cz, chenhuacai@loongson.cn,
 alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn, Yingkun Meng <mengyingkun@loongson.cn>
References: <cover.1685501806.git.siyanteng@loongson.cn>
 <ad85194e2da2118ff49f127ffd74727e298a3ea5.1685501806.git.siyanteng@loongson.cn>
 <87sfb6icoa.wl-tiwai@suse.de>
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <87sfb6icoa.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8AxauVIIn9kcVMCAA--.9829S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ur45tF17CF1ktFWrZFWxXwc_yoW8uw4xpF
	48Ca45KF48Jws09r4q9FW5Kr13ta93JF47KrWIg34DAwn29w13Wa42yr109FWvk3sa9r43
	AwsFqas3X3yYvabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UWHqcU
	UUUU=


On 2023/6/5 15:35, Takashi Iwai wrote:
> On Wed, 31 May 2023 05:21:32 +0200,
> Yanteng Si wrote:
>> On loongson controller, RIRBSTS.RINTFL cannot be cleared,
>> azx_interrupt() is called all the time. We disable RIRB
>> interrupt, and use polling mode by default.
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
>> ---
>>   sound/hda/hdac_controller.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
>> index 3c7af6558249..dbaa19cb8162 100644
>> --- a/sound/hda/hdac_controller.c
>> +++ b/sound/hda/hdac_controller.c
>> @@ -10,6 +10,7 @@
>>   #include <sound/hdaudio.h>
>>   #include <sound/hda_register.h>
>>   #include "local.h"
>> +#include "../pci/hda/hda_controller.h"
>>   
>>   /* clear CORB read pointer properly */
>>   static void azx_clear_corbrp(struct hdac_bus *bus)
>> @@ -42,6 +43,8 @@ static void azx_clear_corbrp(struct hdac_bus *bus)
>>    */
>>   void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
>>   {
>> +	struct azx *chip = bus_to_azx(bus);
> You can't convert in this way in the generic HD-audio bus code in
> sound/hda/*.  The struct azx is specific to sound/pci/hda/*.
I see!
>
>
>>   	WARN_ON_ONCE(!bus->rb.area);
>>   
>>   	spin_lock_irq(&bus->reg_lock);
>> @@ -79,7 +82,10 @@ void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
>>   	/* set N=1, get RIRB response interrupt for new entry */
>>   	snd_hdac_chip_writew(bus, RINTCNT, 1);
>>   	/* enable rirb dma and response irq */
>> -	snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);
>> +	if (chip->driver_caps & AZX_DCAPS_LOONGSON_WORKAROUND)
>> +		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN);
>> +	else
>> +		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);
> That is, for some device-specific workaround like this, you'd need to
> introduce a new flag in struct hdac_bus, set up in the
> sound/pci/hda/hda_intel.c instead.

OK! I will try to put your ideas into practice.


Thanks,

Yanteng

>
>
> thanks,
>
> Takashi

