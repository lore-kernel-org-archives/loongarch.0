Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED991C10
	for <loongarch@lists.linux.dev>; Fri,  9 Jun 2023 03:47:07 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8Bxb+u3oIJkc+AAAA--.2757S3;
	Fri, 09 Jun 2023 11:47:04 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax6OS2oIJkTq4JAA--.29890S3;
	Fri, 09 Jun 2023 11:47:02 +0800 (CST)
Message-ID: <4cfe93cb-7713-f994-45c3-e99fe34a3f9e@loongson.cn>
Date: Fri, 9 Jun 2023 11:47:02 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4] PCI: Align pci memory space base address with page
 size
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
References: <20230609022047.2195689-1-maobibo@loongson.cn>
 <CAAhV-H7n1Z58h2qxCASDXMMQBDN6x_vq6bH_utVhB5boYoZDGQ@mail.gmail.com>
From: "bibo, mao" <maobibo@loongson.cn>
In-Reply-To: <CAAhV-H7n1Z58h2qxCASDXMMQBDN6x_vq6bH_utVhB5boYoZDGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Ax6OS2oIJkTq4JAA--.29890S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW3Xr15ur1Uur4xXw1xWr4UAwc_yoWxZF4rpF
	y5uFnxZryvkry8GrZrtw1UCwsxZ39I9F4YkrWUC3s3Gas7Xr9rtr9rZ3yUAFZ7Crs8Gry5
	WFn5tr1UXan3J3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2eT5DU
	UUU



在 2023/6/9 10:29, Huacai Chen 写道:
> Hi, Bibo,
> 
> On Fri, Jun 9, 2023 at 10:20 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> Some PCI devices have only 4K memory space size, it is normal in general
>> machines and aligned with page size. However some architectures which
>> support different page size, default page size on LoongArch is 16K, and
>> ARM64 supports page size varying from 4K to 64K. On machines where larger
>> page size is use, memory space region of two different pci devices may be
>> in one page. It is not safe with mmu protection, also VFIO pci device
>> driver requires base address of pci memory space page aligned, so that it
>> can be memory mapped to qemu user space when it is passed-through to vm.
>>
>> It consumes more pci memory resource with page size alignment requirement,
>> here extra option PCI_MEMRES_PAGE_ALIGN is added, it can be enabled by
>> different architectures.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>> Change history
>> v4: add extra kernel option PCI_MEMRES_PAGE_ALIGN to set memory resource
>>     page aligned.
>>
>> v3: move alignment requirement to generic pci code
>>
>> v2: add pci resource alignment requirement in arch specified function
>>     pcibios_align_resource on arm64/LoongArch platforms
>>
>> ---
>>  arch/loongarch/Kconfig  | 1 +
>>  drivers/pci/Kconfig     | 3 +++
>>  drivers/pci/setup-res.c | 7 +++++++
>>  3 files changed, 11 insertions(+)
>>
>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>> index d38b066fc931..65b2f6ba9f8e 100644
>> --- a/arch/loongarch/Kconfig
>> +++ b/arch/loongarch/Kconfig
>> @@ -142,6 +142,7 @@ config LOONGARCH
>>         select PCI_LOONGSON
>>         select PCI_MSI_ARCH_FALLBACKS
>>         select PCI_QUIRKS
>> +       select PCI_MEMRES_PAGE_ALIGN
>>         select PERF_USE_VMALLOC
>>         select RTC_LIB
>>         select SMP
>> diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
>> index 9309f2469b41..9be5f85ff9dc 100644
>> --- a/drivers/pci/Kconfig
>> +++ b/drivers/pci/Kconfig
>> @@ -128,6 +128,9 @@ config PCI_LOCKLESS_CONFIG
>>  config PCI_BRIDGE_EMUL
>>         bool
>>
>> +config PCI_MEMRES_PAGE_ALIGN
>> +       bool
>> +
>>  config PCI_IOV
>>         bool "PCI IOV support"
>>         select PCI_ATS
>> diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
>> index 967f9a758923..6ad76734a670 100644
>> --- a/drivers/pci/setup-res.c
>> +++ b/drivers/pci/setup-res.c
>> @@ -339,6 +339,13 @@ int pci_assign_resource(struct pci_dev *dev, int resno)
>>                 return -EINVAL;
>>         }
>>
>> +#ifdef CONFIG_PCI_MEMRES_PAGE_ALIGN
>> +       /*
>> +        * force minimum page alignment for vfio pci usage
>> +        */
>> +       if (res->flags & IORESOURCE_MEM)
>> +               align = max_t(resource_size_t, PAGE_SIZE, align);
>> +#endif
> Does this really have its effect? The common version of
> pcibios_align_resource() simply returns res->start, and doesn't care
> about the 'align' parameter.
yes, it works. The is output of command " lspci -vvv | grep Region" on my
3C5000+7A2000 box. After the patch base address of all pci mem resource
is aligned with 16K.

output without the patch:
        Region 0: Memory at e0045240000 (64-bit, non-prefetchable) [size=32K]
        Region 0: Memory at e0045248000 (64-bit, non-prefetchable) [size=32K]
        Region 0: Memory at e0045250000 (64-bit, non-prefetchable) [size=32K]
        Region 0: Memory at e0045258000 (64-bit, non-prefetchable) [size=32K]
        Region 0: Memory at e0045260000 (64-bit, non-prefetchable) [size=32K]
        Region 0: Memory at e0045271400 (64-bit, non-prefetchable) [size=256]
        Region 2: Memory at e0040000000 (64-bit, non-prefetchable) [size=64M]
        Region 4: Memory at e0045200000 (64-bit, non-prefetchable) [size=64K]
        Region 0: Memory at e0045210000 (64-bit, non-prefetchable) [size=64K]
        Region 0: Memory at e0045220000 (64-bit, non-prefetchable) [size=64K]
        Region 0: Memory at e0045230000 (64-bit, non-prefetchable) [size=64K]
        Region 5: Memory at e0045271000 (32-bit, non-prefetchable) [size=1K]
        Region 0: Memory at e0045268000 (64-bit, non-prefetchable) [size=4K]
        Region 0: Memory at e0045269000 (64-bit, non-prefetchable) [size=4K]
        Region 0: Memory at e004526a000 (64-bit, non-prefetchable) [size=4K]
        Region 0: Memory at e004526b000 (64-bit, non-prefetchable) [size=4K]
        Region 0: Memory at e004526c000 (64-bit, non-prefetchable) [size=4K]
        Region 0: Memory at e004526d000 (64-bit, non-prefetchable) [size=4K]
        Region 0: Memory at e004526e000 (64-bit, non-prefetchable) [size=4K]
        Region 0: Memory at e004526f000 (64-bit, non-prefetchable) [size=4K]
        Region 0: Memory at e0045270000 (64-bit, non-prefetchable) [size=4K]
        Region 2: Memory at e0044000000 (64-bit, non-prefetchable) [size=16M]
        Region 0: Memory at e0045100000 (64-bit, non-prefetchable) [size=1M]
        Region 0: Memory at e0045000000 (64-bit, non-prefetchable) [size=16K]

out put with the patch:
        Region 0: Memory at e0045240000 (64-bit, non-prefetchable) [size=32K]
        Region 0: Memory at e0045248000 (64-bit, non-prefetchable) [size=32K]
        Region 0: Memory at e0045250000 (64-bit, non-prefetchable) [size=32K]
        Region 0: Memory at e0045258000 (64-bit, non-prefetchable) [size=32K]
        Region 0: Memory at e0045260000 (64-bit, non-prefetchable) [size=32K]
        Region 0: Memory at e0045290000 (64-bit, non-prefetchable) [size=256]
        Region 2: Memory at e0040000000 (64-bit, non-prefetchable) [size=64M]
        Region 4: Memory at e0045200000 (64-bit, non-prefetchable) [size=64K]
        Region 0: Memory at e0045210000 (64-bit, non-prefetchable) [size=64K]
        Region 0: Memory at e0045220000 (64-bit, non-prefetchable) [size=64K]
        Region 0: Memory at e0045230000 (64-bit, non-prefetchable) [size=64K]
        Region 5: Memory at e004528c000 (32-bit, non-prefetchable) [size=1K]
        Region 0: Memory at e0045268000 (64-bit, non-prefetchable) [size=4K]
        Region 0: Memory at e004526c000 (64-bit, non-prefetchable) [size=4K]
        Region 0: Memory at e0045270000 (64-bit, non-prefetchable) [size=4K]
        Region 0: Memory at e0045274000 (64-bit, non-prefetchable) [size=4K]
        Region 0: Memory at e0045278000 (64-bit, non-prefetchable) [size=4K]
        Region 0: Memory at e004527c000 (64-bit, non-prefetchable) [size=4K]
        Region 0: Memory at e0045280000 (64-bit, non-prefetchable) [size=4K]
        Region 0: Memory at e0045284000 (64-bit, non-prefetchable) [size=4K]
        Region 0: Memory at e0045288000 (64-bit, non-prefetchable) [size=4K]
        Region 2: Memory at e0044000000 (64-bit, non-prefetchable) [size=16M]
        Region 0: Memory at e0045100000 (64-bit, non-prefetchable) [size=1M]
        Region 0: Memory at e0045000000 (64-bit, non-prefetchable) [size=16K]

Regards
Bibo, Mao
> 
> Huacai
>>         size = resource_size(res);
>>         ret = _pci_assign_resource(dev, resno, size, align);
>>
>> --
>> 2.27.0
>>

