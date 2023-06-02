Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD4310E5
	for <loongarch@lists.linux.dev>; Fri,  2 Jun 2023 06:48:43 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8Cx_OrIkHlk7IgDAA--.3292S3;
	Fri, 02 Jun 2023 14:48:41 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxD7_HkHlkSXqFAA--.19214S3;
	Fri, 02 Jun 2023 14:48:40 +0800 (CST)
Message-ID: <17a2ba54-2b85-9cc9-2a43-16eb20d6ce84@loongson.cn>
Date: Fri, 2 Jun 2023 14:48:39 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] LoongArch: Align pci memory base address with page size
Content-Language: en-US
To: loongson-kernel@lists.loongnix.cn, Bjorn Helgaas <helgaas@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Jianmin Lv <lvjianmin@loongson.cn>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230602030732.1047696-1-maobibo@loongson.cn>
 <CAAhV-H58dR4JWtCdqCR553H1-pbppKyi114BMhsrV74Zb_c58Q@mail.gmail.com>
From: "bibo, mao" <maobibo@loongson.cn>
In-Reply-To: <CAAhV-H58dR4JWtCdqCR553H1-pbppKyi114BMhsrV74Zb_c58Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxD7_HkHlkSXqFAA--.19214S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXFW8Zr15GF4xuFy7uw15Jwb_yoW5urWDpF
	WfAFsxCrs5Gr17CwsIqw1DuF4ru392kFW3ArWfAry3CryDZ34fZry3Jry5ZFWUArs8Gr10
	vr4YkFW8WF4UZaDanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
	AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
	07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
	JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
	YxBIdaVFxhVjvjDU0xZFpf9x07jeSoXUUUUU=



在 2023/6/2 12:11, Huacai Chen 写道:
> +cc Bjorn
> 
> Hi, Bibo,
> 
> On Fri, Jun 2, 2023 at 11:07 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> LoongArch linux kernel uses 16K page size by default, some pci devices have
>> only 4K memory size, it is normal in general architectures. However memory
>> space of different pci devices will share one physical page address space.
>> This is not safe for mmu protection, also UIO and VFIO requires base
>> address of pci memory space page aligned.
>>
>> This patch adds check with function pcibios_align_resource, and set base
>> address of resource page aligned.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>  arch/loongarch/pci/pci.c | 23 +++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
>> diff --git a/arch/loongarch/pci/pci.c b/arch/loongarch/pci/pci.c
>> index 2726639150bc..1380f3672ba2 100644
>> --- a/arch/loongarch/pci/pci.c
>> +++ b/arch/loongarch/pci/pci.c
>> @@ -83,6 +83,29 @@ int pcibios_alloc_irq(struct pci_dev *dev)
>>         return acpi_pci_irq_enable(dev);
>>  }
>>
>> +/*
>> + * memory space size of some pci cards is 4K, it is separated with
>> + * different pages for generic architectures, so that mmu protection can
>> + * work with different pci cards. However page size for LoongArch system
>> + * is 16K, memory space of different pci cards may share the same page
>> + * on LoongArch, it is not safe here.
>> + * Also uio drivers and vfio drivers sugguests that base address of memory
>> + * space should page aligned. This function aligns base address with page size
>> + */
>> +resource_size_t pcibios_align_resource(void *data, const struct resource *res,
>> +               resource_size_t size, resource_size_t align)
>> +{
>> +       resource_size_t start = res->start;
>> +
>> +       if (res->flags & IORESOURCE_MEM) {
>> +               if (align & (PAGE_SIZE - 1)) {
>> +                       align = PAGE_SIZE;
>> +                       start = ALIGN(start, align);
> I don't know whether this patch is really needed, but the logic here
> has some problems.
> 
> For example, if PAGE_SIZE=16KB, align=18KB, what should we do? Align
> to 16KB or align to 32KB? IMO it should align to 32KB, but in your
> patch it will align to 16KB.
In general pci device is aligned by size, and its value is a power of 2 in value.
I do not see such devices with 18K alignment requirements.

By pci local bus spec, there are such lines:

"Devices are free to consume more address space than required, but decoding down
to a 4 KB space for memory is suggested for devices that need less than that amount. For
instance, a device that has 64 bytes of registers to be mapped into Memory Space may
consume up to 4 KB of address space in order to minimize the number of bits in the address
decoder."

I cannot  think whether it is necessary simply from judging whether other
architectures have similar code. If so, LoongArch system just  always follows others.
It is actually one problem since LoongArch uses 16K page size.

Regards
Bibo, Mao
> 
> Huacai
>> +               }
>> +       }
>> +       return start;
>> +}
>> +
>>  static void pci_fixup_vgadev(struct pci_dev *pdev)
>>  {
>>         struct pci_dev *devp = NULL;
>> --
>> 2.27.0
>>
> _______________________________________________
> Loongson-kernel mailing list -- loongson-kernel@lists.loongnix.cn
> To unsubscribe send an email to loongson-kernel-leave@lists.loongnix.cn

