Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB4528E8
	for <loongarch@lists.linux.dev>; Mon,  7 Nov 2022 08:44:53 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.32])
	by gateway (Coremail) with SMTP id _____8Bxnrd9xWhjk_0EAA--.11549S3;
	Mon, 07 Nov 2022 16:44:45 +0800 (CST)
Received: from [10.20.42.32] (unknown [10.20.42.32])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxPuJ7xWhj4F4OAA--.40059S3;
	Mon, 07 Nov 2022 16:44:43 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Support booting with FDT from efi system table
To: WANG Xuerui <kernel@xen0n.name>, Ard Biesheuvel <ardb@kernel.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev
References: <20221106065619.2543121-1-zhoubinbin@loongson.cn>
 <CAMj1kXG3sJTPzWYx1hKaBeXPgD0xQXW-4NxgwZjWpQ-nGw=MhA@mail.gmail.com>
 <df8e3b76-0594-e26a-b53c-c145b5abbd31@loongson.cn>
 <89f0adb3-ea3b-e275-b59e-22d30e67f77b@xen0n.name>
From: Jianmin Lv <lvjianmin@loongson.cn>
Message-ID: <e832b206-9891-ab62-254c-c7a55e36d718@loongson.cn>
Date: Mon, 7 Nov 2022 16:44:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <89f0adb3-ea3b-e275-b59e-22d30e67f77b@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxPuJ7xWhj4F4OAA--.40059S3
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3WFy8Cr1DXry3AF47Wr15urg_yoW7Wr4xpr
	ykAFn8GFWrWFn3Jrnxta4UWr98trn5G3W2qF13KFykArsrXF1jqr10qrn09F1UJw48JFy0
	qFyrGw1S9F45JwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70PfDUUUU



On 2022/11/7 上午10:50, WANG Xuerui wrote:
> On 2022/11/7 10:07, Jianmin Lv wrote:
>>
>>
>> On 2022/11/6 下午11:06, Ard Biesheuvel wrote:
>>> On Sun, 6 Nov 2022 at 07:58, Binbin Zhou <zhoubinbin@loongson.cn> wrote:
>>>>
>>>> Since commit 40cd01a9c324("efi/loongarch: libstub: remove dependency on
>>>> flattened DT"), we can parse the FDT from efi system table.
>>>>
>>>> And now, the Loongson-2K series cpus based on LoongArch support booting
>>>> with FDT, so we adds the relevant booting support as well as parameter
>>>> parsing.
>>>>
>>>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>>>> ---
>>>>   arch/loongarch/Kconfig             |  2 +
>>>>   arch/loongarch/include/asm/efi.h   |  1 +
>>>>   arch/loongarch/include/asm/setup.h |  1 +
>>>>   arch/loongarch/kernel/efi.c        | 27 ++++++++++-
>>>>   arch/loongarch/kernel/env.c        |  3 ++
>>>>   arch/loongarch/kernel/setup.c      | 75 
>>>> +++++++++++++++++++++++++++++-
>>>>   6 files changed, 106 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>>>> index 903096bd87f8..ce53d1fa2b64 100644
>>>> --- a/arch/loongarch/Kconfig
>>>> +++ b/arch/loongarch/Kconfig
>>>> @@ -111,6 +111,8 @@ config LOONGARCH
>>>>          select MODULES_USE_ELF_RELA if MODULES
>>>>          select NEED_PER_CPU_EMBED_FIRST_CHUNK
>>>>          select NEED_PER_CPU_PAGE_FIRST_CHUNK
>>>> +       select OF
>>>> +       select OF_EARLY_FLATTREE
>>>>          select PCI
>>>>          select PCI_DOMAINS_GENERIC
>>>>          select PCI_ECAM if ACPI
>>>> diff --git a/arch/loongarch/include/asm/efi.h 
>>>> b/arch/loongarch/include/asm/efi.h
>>>> index 174567b00ddb..81e5d3371868 100644
>>>> --- a/arch/loongarch/include/asm/efi.h
>>>> +++ b/arch/loongarch/include/asm/efi.h
>>>> @@ -9,6 +9,7 @@
>>>>
>>>>   void __init efi_init(void);
>>>>   void __init efi_runtime_init(void);
>>>> +void __init *efi_fdt_pointer(void);
>>>>   void efifb_setup_from_dmi(struct screen_info *si, const char *opt);
>>>>
>>>>   #define ARCH_EFI_IRQ_FLAGS_MASK  0x00000004  /* Bit 2: CSR.CRMD.IE */
>>>> diff --git a/arch/loongarch/include/asm/setup.h 
>>>> b/arch/loongarch/include/asm/setup.h
>>>> index ca373f8e3c4d..b18baf878ed4 100644
>>>> --- a/arch/loongarch/include/asm/setup.h
>>>> +++ b/arch/loongarch/include/asm/setup.h
>>>> @@ -13,6 +13,7 @@
>>>>
>>>>   extern unsigned long eentry;
>>>>   extern unsigned long tlbrentry;
>>>> +extern char original_cmdline[COMMAND_LINE_SIZE];
>>>>   extern void tlb_init(int cpu);
>>>>   extern void cpu_cache_init(void);
>>>>   extern void cache_error_setup(void);
>>>> diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi.c
>>>> index a31329971133..16dcd673e905 100644
>>>> --- a/arch/loongarch/kernel/efi.c
>>>> +++ b/arch/loongarch/kernel/efi.c
>>>> @@ -37,7 +37,7 @@ static efi_config_table_type_t arch_tables[] 
>>>> __initdata = {
>>>>
>>>>   void __init efi_runtime_init(void)
>>>>   {
>>>> -       if (!efi_enabled(EFI_BOOT))
>>>> +       if (!efi_enabled(EFI_BOOT) || !efi_systab->runtime)
>>>
>>> How can this happen? Why would we ever set EFI_BOOT if
>>> efi_systab->runtime == NULL?
>>>
>>
>> Because some firmware (such as PMON) employed UEFI compatible 
>> implementaion without runtime (and set runtime null pointer).
> 
> Hmm, is it really "UEFI-compatible" when it's without a UEFI runtime? 

To be frank, it seems that runtime should be always valid in UEFI 
complaint firmware (according to UEFI spec section 4.5, 8). 
Unfortunately, some machines shipped with *partially-compatible" 
(without runtime) firmware have been outside (maybe not many, I'm not 
sure). So, thinking about compatibility with them, the case have to be 
taken account, unless rather.

> Anyway it's becoming increasingly difficult for community reviewers to 
> check things without corresponding firmware sources available... (and I 
> think, given the Loongson fork of PMON even back in the MIPS era is 
> effectively GPL'd [1], the LoongArch port of PMON could probably be GPL 
> as well, in which case it's totally fair for us to request the sources.)
> 
> (I know the similar usage pattern i.e. making use of various UEFI 
> features but without a runtime was already widespread back in the MIPS 
> days of Loongson, but personally I don't think it's enough to justify 
> doing the same when it's 2022 and we're fully upstream.)
> 
> [1]: https://github.com/loongson-community/pmon/blob/master/LICENSE.md
> 
>> Maybe *noefi* in command line is enough for this without 
>> CONFIG_CMDLINE_FORCE simillar stuff configured?
> 
> I think having/forcing users to add "noefi" themselves wouldn't be good 
> ergonomics? Manipulating the cmdline in the firmware could be more 
> acceptable but I'm not sure.
> 

I think so, adding it in firmware internally (if using "noefi") maybe 
acceptable rather than adding it by users.

