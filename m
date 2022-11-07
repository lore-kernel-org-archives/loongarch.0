Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D4815A9
	for <loongarch@lists.linux.dev>; Mon,  7 Nov 2022 02:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1667789427; bh=aMFRlsXt2zmPjeHZI95pzcZkIK7XiRqia4QhzorL6iY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ORdMVNJ5wDj2H5bd7G2j5uHexkSSbXI6YadvWCeHHuqz6Ik7ppxFrg3uL9YNBMUDV
	 AFJLJ/uIOw/hztRPMtE8lSJWfYgON73pHOWjZa+A+Kl36gm9YTqj1PRhovrqjcuhp3
	 PKheZOCuunUvt4JhiZtCdbCdks1cp1fpydbz4YEg=
Received: from [100.100.35.204] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 2F92A60094;
	Mon,  7 Nov 2022 10:50:27 +0800 (CST)
Message-ID: <89f0adb3-ea3b-e275-b59e-22d30e67f77b@xen0n.name>
Date: Mon, 7 Nov 2022 10:50:25 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:108.0)
 Gecko/20100101 Thunderbird/108.0a1
Subject: Re: [PATCH] LoongArch: Support booting with FDT from efi system table
To: Jianmin Lv <lvjianmin@loongson.cn>, Ard Biesheuvel <ardb@kernel.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev
References: <20221106065619.2543121-1-zhoubinbin@loongson.cn>
 <CAMj1kXG3sJTPzWYx1hKaBeXPgD0xQXW-4NxgwZjWpQ-nGw=MhA@mail.gmail.com>
 <df8e3b76-0594-e26a-b53c-c145b5abbd31@loongson.cn>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <df8e3b76-0594-e26a-b53c-c145b5abbd31@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2022/11/7 10:07, Jianmin Lv wrote:
> 
> 
> On 2022/11/6 下午11:06, Ard Biesheuvel wrote:
>> On Sun, 6 Nov 2022 at 07:58, Binbin Zhou <zhoubinbin@loongson.cn> wrote:
>>>
>>> Since commit 40cd01a9c324("efi/loongarch: libstub: remove dependency on
>>> flattened DT"), we can parse the FDT from efi system table.
>>>
>>> And now, the Loongson-2K series cpus based on LoongArch support booting
>>> with FDT, so we adds the relevant booting support as well as parameter
>>> parsing.
>>>
>>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>>> ---
>>>   arch/loongarch/Kconfig             |  2 +
>>>   arch/loongarch/include/asm/efi.h   |  1 +
>>>   arch/loongarch/include/asm/setup.h |  1 +
>>>   arch/loongarch/kernel/efi.c        | 27 ++++++++++-
>>>   arch/loongarch/kernel/env.c        |  3 ++
>>>   arch/loongarch/kernel/setup.c      | 75 +++++++++++++++++++++++++++++-
>>>   6 files changed, 106 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>>> index 903096bd87f8..ce53d1fa2b64 100644
>>> --- a/arch/loongarch/Kconfig
>>> +++ b/arch/loongarch/Kconfig
>>> @@ -111,6 +111,8 @@ config LOONGARCH
>>>          select MODULES_USE_ELF_RELA if MODULES
>>>          select NEED_PER_CPU_EMBED_FIRST_CHUNK
>>>          select NEED_PER_CPU_PAGE_FIRST_CHUNK
>>> +       select OF
>>> +       select OF_EARLY_FLATTREE
>>>          select PCI
>>>          select PCI_DOMAINS_GENERIC
>>>          select PCI_ECAM if ACPI
>>> diff --git a/arch/loongarch/include/asm/efi.h 
>>> b/arch/loongarch/include/asm/efi.h
>>> index 174567b00ddb..81e5d3371868 100644
>>> --- a/arch/loongarch/include/asm/efi.h
>>> +++ b/arch/loongarch/include/asm/efi.h
>>> @@ -9,6 +9,7 @@
>>>
>>>   void __init efi_init(void);
>>>   void __init efi_runtime_init(void);
>>> +void __init *efi_fdt_pointer(void);
>>>   void efifb_setup_from_dmi(struct screen_info *si, const char *opt);
>>>
>>>   #define ARCH_EFI_IRQ_FLAGS_MASK  0x00000004  /* Bit 2: CSR.CRMD.IE */
>>> diff --git a/arch/loongarch/include/asm/setup.h 
>>> b/arch/loongarch/include/asm/setup.h
>>> index ca373f8e3c4d..b18baf878ed4 100644
>>> --- a/arch/loongarch/include/asm/setup.h
>>> +++ b/arch/loongarch/include/asm/setup.h
>>> @@ -13,6 +13,7 @@
>>>
>>>   extern unsigned long eentry;
>>>   extern unsigned long tlbrentry;
>>> +extern char original_cmdline[COMMAND_LINE_SIZE];
>>>   extern void tlb_init(int cpu);
>>>   extern void cpu_cache_init(void);
>>>   extern void cache_error_setup(void);
>>> diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi.c
>>> index a31329971133..16dcd673e905 100644
>>> --- a/arch/loongarch/kernel/efi.c
>>> +++ b/arch/loongarch/kernel/efi.c
>>> @@ -37,7 +37,7 @@ static efi_config_table_type_t arch_tables[] 
>>> __initdata = {
>>>
>>>   void __init efi_runtime_init(void)
>>>   {
>>> -       if (!efi_enabled(EFI_BOOT))
>>> +       if (!efi_enabled(EFI_BOOT) || !efi_systab->runtime)
>>
>> How can this happen? Why would we ever set EFI_BOOT if
>> efi_systab->runtime == NULL?
>>
> 
> Because some firmware (such as PMON) employed UEFI compatible 
> implementaion without runtime (and set runtime null pointer).

Hmm, is it really "UEFI-compatible" when it's without a UEFI runtime? 
Anyway it's becoming increasingly difficult for community reviewers to 
check things without corresponding firmware sources available... (and I 
think, given the Loongson fork of PMON even back in the MIPS era is 
effectively GPL'd [1], the LoongArch port of PMON could probably be GPL 
as well, in which case it's totally fair for us to request the sources.)

(I know the similar usage pattern i.e. making use of various UEFI 
features but without a runtime was already widespread back in the MIPS 
days of Loongson, but personally I don't think it's enough to justify 
doing the same when it's 2022 and we're fully upstream.)

[1]: https://github.com/loongson-community/pmon/blob/master/LICENSE.md

> Maybe *noefi* in command line is enough for this without 
> CONFIG_CMDLINE_FORCE simillar stuff configured?

I think having/forcing users to add "noefi" themselves wouldn't be good 
ergonomics? Manipulating the cmdline in the firmware could be more 
acceptable but I'm not sure.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

