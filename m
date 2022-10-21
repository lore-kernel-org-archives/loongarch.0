Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763D87E
	for <loongarch@lists.linux.dev>; Fri, 21 Oct 2022 01:59:00 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.32])
	by gateway (Coremail) with SMTP id _____8Axbdri_FFjd0cBAA--.6028S3;
	Fri, 21 Oct 2022 09:58:58 +0800 (CST)
Received: from [10.20.42.32] (unknown [10.20.42.32])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxXuDh_FFjy1kCAA--.9584S3;
	Fri, 21 Oct 2022 09:58:57 +0800 (CST)
Subject: Re: [PATCH V4 1/4] ACPI / PCI: fix LPIC IRQ model default PCI IRQ
 polarity
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>,
 Bjorn Helgaas <bhelgaas@google.com>, Len Brown <lenb@kernel.org>,
 rafael@kernel.org, linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20221020164718.GA127832@bhelgaas>
From: Jianmin Lv <lvjianmin@loongson.cn>
Message-ID: <f8a64289-6560-7d75-461c-39b7a612e9c2@loongson.cn>
Date: Fri, 21 Oct 2022 09:58:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20221020164718.GA127832@bhelgaas>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxXuDh_FFjy1kCAA--.9584S3
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAr1UXF4DXw1xXw1UZw4ruFg_yoWrKw18pF
	ZF93Wayr4ktF47X3s2ka1xZr1fAFs3KrW5Crs5Cw15G3s8ur1vqF1xKrW5Xr98CrZ5Zayj
	vryYv3yUXayDCFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7XTmDUUUU



On 2022/10/21 上午12:47, Bjorn Helgaas wrote:
> On Thu, Oct 20, 2022 at 04:22:02PM +0800, Jianmin Lv wrote:
>> On LoongArch ACPI based systems, the PCI devices (e.g. sata
>> controlers and PCI-to-to PCI bridge controlers) existed in
>> Loongson chipsets output high-level interrupt signal to the
>> interrupt controller they connected to,
> 
> I assume the active high behavior is hardware behavior that is
> independent of the fact that you're using ACPI firmware on the
> hardware.  If so, I would omit "ACPI based".
> 
> s/sata/SATA/
> s/controlers/controllers/ (twice)
> s/PCI-to-to PCI/PCI-to-PCI/
> s/existed in/in/
> s/they connected/they are connected/
> 

Ok, thanks, I'll improve them again.

>> while the IRQs are
>> active low from the perspective of PCI(in 2.2.6. Interrupt
>> Pins, "Interrupts on PCI are optional and defined as level
>> sensitive, asserted low),
> 
> I don't think you need this spec reference, since "asserted low" is
> the standard thing that happens everywhere.  But if you do want it, it
> needs to specify which spec it refers to, e.g., "Conventional PCI
> r3.0, sec 2.2.6" so it's not confused with the PCIe spec.
> 
> The quote from the spec itself should be terminated with a close quote
> ("), i.e.,
> 
>    "Interrupts on PCI ... asserted low"
> 

Ok, thanks, I'll specify spec version with correct pattern.

>> which means that the interrupt
>> output of PCI devices plugged into PCI-to-to PCI bridges of
>> Loongson chipset will be also converted to high-level. So
>> high level triggered type is required to be passed to
>> acpi_register_gsi() when creating mappings for PCI devices.
> 
> This is the part where I was hoping for a reference to a spec that
> talks about how PCI interrupts are inverted.  The inverter is the part
> that's special here.
> 
> I see that ACPI r6.5, sec 5.2.12, mentions LPIC, but it doesn't
> mention the inverter.  It has a lot more mentions of GIC, but also no
> details about an inverter.  I suppose that would be in the GIC spec,
> which I'm not familiar with.
> 
> The point is that one should be able to write this code from a spec,
> without having to empirically discover the interrupt polarity.  What
> spec tells you about using ACTIVE_HIGH here?
> 
Yes, no mentions for the inverter in ACPI spec, the description about
device interrupt type can be found in Loongson chipset manual:

https://github.com/loongson/LoongArch-Documentation/blob/main/docs/Loongson-7A1000-usermanual-EN/interrupt-controller/device-interrupt-types.adoc

where the interrupts coming from interrupt source are level triggered 
and active high except some specific device such as AC97 DMA and GPIO.

> s/PCI-to-to PCI/PCI-to-PCI/ again
>
> Rewrap the log to fill 75 columns like the rest of the history.
> 
Ok, thanks.

>> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
>> ---
>>   drivers/acpi/pci_irq.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
>> index 08e15774fb9f..ff30ceca2203 100644
>> --- a/drivers/acpi/pci_irq.c
>> +++ b/drivers/acpi/pci_irq.c
>> @@ -387,13 +387,15 @@ int acpi_pci_irq_enable(struct pci_dev *dev)
>>   	u8 pin;
>>   	int triggering = ACPI_LEVEL_SENSITIVE;
>>   	/*
>> -	 * On ARM systems with the GIC interrupt model, level interrupts
>> +	 * On ARM systems with the GIC interrupt model, or LoongArch
>> +	 * systems with the LPIC interrupt model, level interrupts
> 
> Is "LoongArch" required in this comment?  Might the LPIC model be used
> on non-LoongArch systems?
> 
Just like GIC is restricted to ARM, and LPIC is restricted to LoongArch, 
as you mentioned below. So LPIC model will be not used on non-LoongArch 
systems.

> I see it follows the example of "ARM systems".  In my opinion, "ARM"
> probably should be removed, too, because the code checks only for GIC
> or LPIC; it doesn't check for ARM or LoongArch.
> 
> If GIC is restricted to ARM and LPIC is restricted to LoongArch,
> that's fine, but that constraint should be expressed somewhere else
> and doesn't need to be repeated here.
> 
Though the definition and constraints for GIC and LPIC are explicitly 
expressed in ACPI spec, to be clear, repeating the relation here only 
with short words maybe worthy so that people understand the workaround 
conveniently without having to referencing ACPI spec, right?

>>   	 * are always polarity high by specification; PCI legacy
>>   	 * IRQs lines are inverted before reaching the interrupt
>>   	 * controller and must therefore be considered active high
>>   	 * as default.
>>   	 */
>> -	int polarity = acpi_irq_model == ACPI_IRQ_MODEL_GIC ?
>> +	int polarity = acpi_irq_model == ACPI_IRQ_MODEL_GIC ||
>> +		       acpi_irq_model == ACPI_IRQ_MODEL_LPIC ?
>>   				      ACPI_ACTIVE_HIGH : ACPI_ACTIVE_LOW;
>>   	char *link = NULL;
>>   	char link_desc[16];
>> -- 
>> 2.31.1
>>

