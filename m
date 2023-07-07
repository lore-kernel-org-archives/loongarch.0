Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C78622
	for <loongarch@lists.linux.dev>; Fri,  7 Jul 2023 02:47:48 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8Cx5_HSfKdkHE8BAA--.5114S3;
	Fri, 07 Jul 2023 10:47:47 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxF8zRfKdk_2EgAA--.55042S3;
	Fri, 07 Jul 2023 10:47:45 +0800 (CST)
Message-ID: <bdc6eb71-482d-5dd6-d527-c2f2f68dfb38@loongson.cn>
Date: Fri, 7 Jul 2023 10:47:45 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5] PCI: Align pci memory space base address with page
 size
Content-Language: en-US
From: bibo mao <maobibo@loongson.cn>
To: Will Deacon <will@kernel.org>, loongson-kernel@lists.loongnix.cn
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn,
 Huacai Chen <chenhuacai@loongson.cn>
Reply-To: Bjorn Helgaas <bhelgaas@google.com>,
 Huacai Chen <chenhuacai@kernel.org>
References: <20230619014715.3792883-1-maobibo@loongson.cn>
 <f676d9e0-bb88-283a-5189-f1ae945ee4dd@loongson.cn>
In-Reply-To: <f676d9e0-bb88-283a-5189-f1ae945ee4dd@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxF8zRfKdk_2EgAA--.55042S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWF4fJFyxZFWDWF4xtr4xAFc_yoWrWw48pF
	yfA3ZrCrW8Jr13Gwsaq34kuFsxZ397KrW5Kry5Ca4rGF9ruryUCry5WryagayDArs8WrW0
	qFn5KF1Yva15XacCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
	JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU74lkDUUUU

Bjourn, Hucai,

ping again.

The is such issue on only LoongArch system since 16K page size is used.

Should we add code in general framework  or in LoongArch specified code
in v1?  

If you do not think that it is problem, I can give up. LoongArch system
is not only for myself own, I do not care about it also since LoongArch
Maintainer think it is not a issue.

Regards
Bibo Mao

在 2023/6/26 09:30, bibo mao 写道:
> gentle ping.
> 
> 在 2023/6/19 09:47, Bibo Mao 写道:
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
>> different architectures, currently arm64/loongarch enable this option.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
>> ---
>> Change history
>> v5: enable option PCI_MEMRES_PAGE_ALIGN on arm64. Verified on LoongArch
>> and pass to compile on arm64 with defconfig
>>
>> v4: add extra kernel option PCI_MEMRES_PAGE_ALIGN to set memory resource
>>     page aligned
>>
>> v3: move alignment requirement to generic pci code
>>
>> v2: add pci resource alignment requirement in arch specified function
>>     pcibios_align_resource on arm64/LoongArch platforms
>>
>> ---
>>  arch/arm64/Kconfig      | 1 +
>>  arch/loongarch/Kconfig  | 1 +
>>  drivers/pci/Kconfig     | 3 +++
>>  drivers/pci/setup-res.c | 7 +++++++
>>  4 files changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 343e1e1cae10..24858bbf2b72 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -232,6 +232,7 @@ config ARM64
>>  	select OF_EARLY_FLATTREE
>>  	select PCI_DOMAINS_GENERIC if PCI
>>  	select PCI_ECAM if (ACPI && PCI)
>> +	select PCI_MEMRES_PAGE_ALIGN if PCI
>>  	select PCI_SYSCALL if PCI
>>  	select POWER_RESET
>>  	select POWER_SUPPLY
>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>> index d38b066fc931..7dbde5e5b351 100644
>> --- a/arch/loongarch/Kconfig
>> +++ b/arch/loongarch/Kconfig
>> @@ -140,6 +140,7 @@ config LOONGARCH
>>  	select PCI_DOMAINS_GENERIC
>>  	select PCI_ECAM if ACPI
>>  	select PCI_LOONGSON
>> +	select PCI_MEMRES_PAGE_ALIGN
>>  	select PCI_MSI_ARCH_FALLBACKS
>>  	select PCI_QUIRKS
>>  	select PERF_USE_VMALLOC
>> diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
>> index 9309f2469b41..9be5f85ff9dc 100644
>> --- a/drivers/pci/Kconfig
>> +++ b/drivers/pci/Kconfig
>> @@ -128,6 +128,9 @@ config PCI_LOCKLESS_CONFIG
>>  config PCI_BRIDGE_EMUL
>>  	bool
>>  
>> +config PCI_MEMRES_PAGE_ALIGN
>> +	bool
>> +
>>  config PCI_IOV
>>  	bool "PCI IOV support"
>>  	select PCI_ATS
>> diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
>> index 967f9a758923..6ad76734a670 100644
>> --- a/drivers/pci/setup-res.c
>> +++ b/drivers/pci/setup-res.c
>> @@ -339,6 +339,13 @@ int pci_assign_resource(struct pci_dev *dev, int resno)
>>  		return -EINVAL;
>>  	}
>>  
>> +#ifdef CONFIG_PCI_MEMRES_PAGE_ALIGN
>> +	/*
>> +	 * force minimum page alignment for vfio pci usage
>> +	 */
>> +	if (res->flags & IORESOURCE_MEM)
>> +		align = max_t(resource_size_t, PAGE_SIZE, align);
>> +#endif
>>  	size = resource_size(res);
>>  	ret = _pci_assign_resource(dev, resno, size, align);
>>  
> 
> _______________________________________________
> Loongson-kernel mailing list -- loongson-kernel@lists.loongnix.cn
> To unsubscribe send an email to loongson-kernel-leave@lists.loongnix.cn

