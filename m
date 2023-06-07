Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645D27C
	for <loongarch@lists.linux.dev>; Wed,  7 Jun 2023 01:44:08 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8DxQOmj4H9k62MAAA--.638S3;
	Wed, 07 Jun 2023 09:42:59 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxNeSh4H9kzJIDAA--.13291S3;
	Wed, 07 Jun 2023 09:42:57 +0800 (CST)
Message-ID: <685d3265-ac76-60a9-57b2-66da00b04b32@loongson.cn>
Date: Wed, 7 Jun 2023 09:42:57 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] PCI: Align pci memory space base address with page
 size
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, Jianmin Lv <lvjianmin@loongson.cn>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn, Bjorn Helgaas <bhelgaas@google.com>
References: <20230606204522.GA1142773@bhelgaas>
From: "bibo, mao" <maobibo@loongson.cn>
In-Reply-To: <20230606204522.GA1142773@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxNeSh4H9kzJIDAA--.13291S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCrWrAw1xKry3Cw18uryUJwc_yoWruw4DpF
	WxCFsFkF4DKr1fGws2vw1DuF1Sqw4I9rW5KrySkr9Ykw1DJa42vry7GrW5uryDXrWrGF1j
	qr45tr1xuas5ZagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70Pf
	DUUUU



在 2023/6/7 04:45, Bjorn Helgaas 写道:
> On Tue, Jun 06, 2023 at 06:06:04PM +0800, bibo, mao wrote:
>> Huacai,
>>
>> Although I post this patch, I think this should be arch specified
>> rather than general problem.  X86 has solved this problem, arm64
>> with 64K page size is not popular. However LoongArch has this
>> problem, page size is 16K rather than 4K. It is the problem of
>> LoongArch system rather than generic issue.
> 
> I think this is only related to the page size, not to any
> LoongArch-specific details.  If that's the case, I don't think the
> change should be arch-specific.
> 
>> There is such discussion before:
>> https://patchwork.kernel.org/project/linux-pci/patch/22400b8828ad44ddbccb876cc5ca3b11@FE-MBX1012.de.bosch.com/#19319457
>>
>> UEFI bios sets pci memory space 4K aligned, however Loongarch kernel rescans the pci
>> bus and reassigns pci memory resource. So it it strange like this, here is pci memory info on
>>  my 7A2000 board.
>> root@user-pc:~# lspci -vvv | grep Region
>>         Region 5: Memory at e003526e800 (32-bit, non-prefetchable) [size=1K]
>>         Region 0: Memory at e003526ec00 (64-bit, non-prefetchable) [size=1K]
> 
> I guess these BARs are from different devices, and the problem you're
> pointing out is that both BARs end up in the same 16K page (actually
> even the same 4K page):
> 
>   (gdb) p/x 0xe003526e800 >> 12
>   $1 = 0xe003526e
>   (gdb) p/x 0xe003526ec00 >> 12
>   $2 = 0xe003526e
> 
> I agree that's a potential issue because a user mmap of the first
> device also gets access to the BAR of the second device.  But it
> doesn't seem to be a *new* or LoongArch-specific issue.
> 
> So I *think* the point of this patch is to ensure that BARs of
> different devices never share a page.  Why is that suddenly an issue
> for LoongArch?  Is it only because you see more sharing with 16K pages
> than other arches do with 4K pages?
The UEFI BIOS has assigned the PCI device with minimal 4K aligned, I guest
Linux kernel on X86/ARM uses resource directly rather than reassign resource
again. So there is problem for hot-plug devices, however most hot-plug devices
are used for server system and they are high speed devices, PCI resource size
is larger than 4K. So it is not obvious on x86/ARM system.

However on LoongArch system with page size 16K, the problem is obvious since
pci devices with 4K resource size are popular.
> 
>> 在 2023/6/6 16:45, Bibo Mao 写道:
>>> Some PCI devices have only 4K memory space size, it is normal in general
>>> machines and aligned with page size. However some architectures which
>>> support different page size, default page size on LoongArch is 16K, and
>>> ARM64 supports page size varying from 4K to 64K. On machines where larger
>>> page size is use, memory space region of two different pci devices may be
>>> in one page. It is not safe with mmu protection, also VFIO pci device
>>> driver requires base address of pci memory space page aligned, so that it
>>> can be memory mapped to qemu user space when it is passed-through to vm.
> 
> The minimum memory BAR per spec is 128 bytes (not 4K).  You just
> demonstrated that even with 4K pages, different devices can share a
> page.
> 
>>> It consumes more pci memory resource with page size alignment requirement,
>>> it should not be a problem on 64 bit system.
>>>
>>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>>> ---
>>>  drivers/pci/setup-res.c | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
>>> index 967f9a758923..55440ae0128d 100644
>>> --- a/drivers/pci/setup-res.c
>>> +++ b/drivers/pci/setup-res.c
>>> @@ -339,6 +339,14 @@ int pci_assign_resource(struct pci_dev *dev, int resno)
>>>  		return -EINVAL;
>>>  	}
>>>  
>>> +#ifdef CONFIG_64BIT
>>> +	/*
>>> +	 * force minimum page alignment for vfio pci usage
>>> +	 * supposing there is enough pci memory resource on 64bit system
>>> +	 */
>>> +	if (res->flags & IORESOURCE_MEM)
>>> +		align = max_t(resource_size_t, PAGE_SIZE, align);
>>> +#endif
> 
> Why is this under CONFIG_64BIT?  That doesn't have anything to do with
> the BAR size.  The only reason I can see is that with CONFIG_64BIT=y,
> we *might* have more MMIO space to use for BARs.
yes, I assume that there is enough PCI memory resource with 64 bit system,
after all it consumes more memory resource and brings out negative effect.
For UIO and SRIOV requirements, they are most 64-bit server system, they
can suffer from wasting some PCI memory resource.

Regards
Bibo, Mao
> 
>>>  	size = resource_size(res);
>>>  	ret = _pci_assign_resource(dev, resno, size, align);

