Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7FE7C
	for <loongarch@lists.linux.dev>; Wed,  7 Jun 2023 04:49:01 +0000 (UTC)
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8Dx_+s3DIBkiAYAAA--.136S3;
	Wed, 07 Jun 2023 12:48:56 +0800 (CST)
Received: from [192.168.100.8] (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxFOQ2DIBkP9MDAA--.13899S3;
	Wed, 07 Jun 2023 12:48:55 +0800 (CST)
Message-ID: <7d5c7765-936e-e7be-a80b-feec61b9f9ef@loongson.cn>
Date: Wed, 7 Jun 2023 12:48:54 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/4] ALSA: hda: Using polling mode for loongson
 controller by default
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, perex@perex.cz, chenhuacai@loongson.cn,
 alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn, Yingkun Meng <mengyingkun@loongson.cn>
References: <cover.1686057365.git.siyanteng@loongson.cn>
 <521be42ac818d35a996e01cc3d591e1c87f230d9.1686057365.git.siyanteng@loongson.cn>
 <87wn0gg16g.wl-tiwai@suse.de>
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <87wn0gg16g.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxFOQ2DIBkP9MDAA--.13899S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCryfuFy5GF45CF4ruF47ZFc_yoW5Gw4UpF
	ykCa4rKFZrJr4jkFsrK3WUKr1fXa97GF13GrWj9340yrnFv3WrWw1qkr4rZFWjvr4Igrya
	qr1vqa48JayYqabCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jjQ6JUUU
	UU=


在 2023/6/6 21:39, Takashi Iwai 写道:
> On Tue, 06 Jun 2023 15:25:28 +0200,
> Yanteng Si wrote:
>> On loongson controller, RIRBSTS.RINTFL cannot be cleared,
>> azx_interrupt() is called all the time. We disable RIRB
>> interrupt, and use polling mode by default.
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
>> ---
>>   include/sound/hdaudio.h     | 1 +
>>   sound/hda/hdac_controller.c | 5 ++++-
>>   sound/pci/hda/hda_intel.c   | 4 ++++
>>   3 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
>> index 97f09acae302..a1dcc7f97d08 100644
>> --- a/include/sound/hdaudio.h
>> +++ b/include/sound/hdaudio.h
>> @@ -346,6 +346,7 @@ struct hdac_bus {
>>   	bool reverse_assign:1;		/* assign devices in reverse order */
>>   	bool corbrp_self_clear:1;	/* CORBRP clears itself after reset */
>>   	bool polling_mode:1;
>> +	bool no_intr_polling_mode:1;
> It isn't clear enough what this flag does.  It's basically prohibiting
> the RIRB IRQ (hence requiring the polling mode), right?  Write it in
> the comment.
OK!
>
>> diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
>> index 3c7af6558249..705e09cc50ac 100644
>> --- a/sound/hda/hdac_controller.c
>> +++ b/sound/hda/hdac_controller.c
>> @@ -79,7 +79,10 @@ void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
>>   	/* set N=1, get RIRB response interrupt for new entry */
>>   	snd_hdac_chip_writew(bus, RINTCNT, 1);
>>   	/* enable rirb dma and response irq */
>> -	snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);
>> +	if (bus->no_intr_polling_mode)
>> +		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN);
>> +	else
>> +		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);
>>   	/* Accept unsolicited responses */
>>   	snd_hdac_chip_updatel(bus, GCTL, AZX_GCTL_UNSOL, AZX_GCTL_UNSOL);
>>   	spin_unlock_irq(&bus->reg_lock);
>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>> index 9c353dc7740c..1e8993836fc6 100644
>> --- a/sound/pci/hda/hda_intel.c
>> +++ b/sound/pci/hda/hda_intel.c
>> @@ -1875,6 +1875,10 @@ static int azx_first_init(struct azx *chip)
>>   	if (chip->driver_type == AZX_DRIVER_GFHDMI)
>>   		bus->polling_mode = 1;
>>   
>> +	if (chip->driver_type == AZX_DRIVER_LOONGSON) {
>> +		bus->no_intr_polling_mode = 1;
>> +	}
> Don't you need to set the bus->polling_mode?

Yes, I do.

Although it works now, some messages will print.


Thanks,

Yanteng

>
>
> thanks,
>
> Takashi

