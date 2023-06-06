Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3BE651
	for <loongarch@lists.linux.dev>; Tue,  6 Jun 2023 06:50:38 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8Ax3eo8135kVAYAAA--.157S3;
	Tue, 06 Jun 2023 14:50:36 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxauU8135ka+cBAA--.8527S3;
	Tue, 06 Jun 2023 14:50:36 +0800 (CST)
Message-ID: <7fe18fdb-4335-fca8-f596-03aa6c642315@loongson.cn>
Date: Tue, 6 Jun 2023 14:50:36 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] PCI: Align pci memory space base address with page
 size
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>, Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, helgaas@kernel.org,
 linux-pci@vger.kernel.org, Jianmin Lv <lvjianmin@loongson.cn>,
 WANG Xuerui <kernel@xen0n.name>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn
References: <20230605034423.1528206-1-maobibo@loongson.cn>
 <20230605145138.GH21212@willie-the-truck>
 <CAAhV-H449Kv0WVfpD-d_j1Gq0Ud-TGqZRHAn6MrjQWH76cLGCA@mail.gmail.com>
From: "bibo, mao" <maobibo@loongson.cn>
In-Reply-To: <CAAhV-H449Kv0WVfpD-d_j1Gq0Ud-TGqZRHAn6MrjQWH76cLGCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxauU8135ka+cBAA--.8527S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxAr4UCF1xZFy3Gw4DAry8CrX_yoW5XrWfp3
	yxC3Z8CFs8Gr13Gwsavw1DuFsag3Z2kw43Xry3Jr9IkrnxZry7Cr15try7ury8ur48Kr4j
	vFs0vr1a9Fy5ZagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
	AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
	W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZE
	Xa7IU8YXdUUUUUU==



在 2023/6/6 10:27, Huacai Chen 写道:
> On Mon, Jun 5, 2023 at 10:51 PM Will Deacon <will@kernel.org> wrote:
>>
>> On Mon, Jun 05, 2023 at 11:44:23AM +0800, Bibo Mao wrote:
>>> Some PCI devices has only 4K memory space size, it is normal in general
>>> machines and aligned with page size. However some architectures which
>>> support different page size, default page size on LoongArch is 16K, and
>>> ARM64 supports page size varying from 4K to 64K. On machines where larger
>>> page size is use, memory space region of two different pci devices may be
>>> in one page. It is not safe with mmu protection, also VFIO pci device
>>> driver requires base address of pci memory space page aligned, so that it
>>> can be memory mapped to qemu user space when it is pass-through to vm.
>>>
>>> It consumes more pci memory resource with page size alignment requirement,
>>> on 64 bit system it should not be a problem. And UEFI bios set pci memory
>>> base address with 4K fixed-size aligned, the safer solution is to align
>>> with larger size on UEFI BIOS stage on these architectures, linux kernel
>>> can reuse resource from UEFI bios. For new devices such hotplug pci
>>> devices and sriov devices, pci resource is assigned in Linux kernel side.
>>>
>>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>>> ---
>>>  arch/arm64/kernel/pci.c  | 13 +++++++++++++
>>>  arch/loongarch/pci/pci.c | 18 ++++++++++++++++++
>>>  2 files changed, 31 insertions(+)
>>>
>>> diff --git a/arch/arm64/kernel/pci.c b/arch/arm64/kernel/pci.c
>>> index 2276689b5411..e2f7b176b156 100644
>>> --- a/arch/arm64/kernel/pci.c
>>> +++ b/arch/arm64/kernel/pci.c
>>> @@ -232,4 +232,17 @@ void pcibios_remove_bus(struct pci_bus *bus)
>>>       acpi_pci_remove_bus(bus);
>>>  }
>>>
>>> +resource_size_t pcibios_align_resource(void *data, const struct resource *res,
>>> +                             resource_size_t size, resource_size_t align)
>>> +{
>>> +     resource_size_t start = res->start;
>>> +
>>> +     /*
>>> +      * align base address of pci memory resource with page size
>>> +      */
>>> +     if ((res->flags & IORESOURCE_MEM) && (align < PAGE_SIZE))
>>> +             start = ALIGN(start, PAGE_SIZE);
>>> +
>>> +     return start;
>>> +}
>>>  #endif
>>
>> If this is needed by all architectures with !4k page size, why don't we
>> instead handle the alignment in the core code, given that it is aware
>> of the page size?
> Agree, modifying the common weak version of pcibios_align_resource()
> seems better. Maybe we can use CONFIG_VFIO_PCI to guard the align
> operation.
will do. only that I am not sure it is ok for all architectures, after all it consumes
more pci memory resource if forced to page size aligned.
 
Regards
Bibo, Mao
> 
> Huacai
>>
>> Will

