Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2027E294F5
	for <loongarch@lists.linux.dev>; Tue,  6 Jun 2023 10:07:05 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8Cx_eoNBX9k1hYAAA--.494S3;
	Tue, 06 Jun 2023 18:06:05 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxReQMBX9kkCcCAA--.9410S3;
	Tue, 06 Jun 2023 18:06:04 +0800 (CST)
Message-ID: <57c428e9-6d7c-c0b7-be5f-365373ab1b9c@loongson.cn>
Date: Tue, 6 Jun 2023 18:06:04 +0800
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
From: "bibo, mao" <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>, Jianmin Lv <lvjianmin@loongson.cn>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn, Bjorn Helgaas <bhelgaas@google.com>
References: <20230606084539.1694441-1-maobibo@loongson.cn>
In-Reply-To: <20230606084539.1694441-1-maobibo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxReQMBX9kkCcCAA--.9410S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cw1xGry5Ar18WFW7Kr1xWFX_yoW8Kw4kpF
	WxCFn8CrWkKr1fGws2qw1DuF4fWws2gFWYkrWIkas0k3Z7JasFyry7GrW5Cry8Wrs3Gr1j
	qFs8tr1xXa48ZagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
	xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	W8Jr0_Cr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuY
	vjxU7WrWUUUUU

Huacai,

Although I post this patch, I think this should be arch specified rather than general problem.
X86 has solved this problem, arm64 with 64K page size is not popular. However LoongArch
has this problem, page size is 16K rather than 4K. It is the problem of LoongArch system
rather than generic issue.

There is such discussion before:
https://patchwork.kernel.org/project/linux-pci/patch/22400b8828ad44ddbccb876cc5ca3b11@FE-MBX1012.de.bosch.com/#19319457

UEFI bios sets pci memory space 4K aligned, however Loongarch kernel rescans the pci
bus and reassigns pci memory resource. So it it strange like this, here is pci memory info on
 my 7A2000 board.
root@user-pc:~# lspci -vvv | grep Region
        Region 5: Memory at e003526e800 (32-bit, non-prefetchable) [size=1K]
        Region 0: Memory at e003526ec00 (64-bit, non-prefetchable) [size=1K]

Regards
Bibo, Mao

在 2023/6/6 16:45, Bibo Mao 写道:
> Some PCI devices have only 4K memory space size, it is normal in general
> machines and aligned with page size. However some architectures which
> support different page size, default page size on LoongArch is 16K, and
> ARM64 supports page size varying from 4K to 64K. On machines where larger
> page size is use, memory space region of two different pci devices may be
> in one page. It is not safe with mmu protection, also VFIO pci device
> driver requires base address of pci memory space page aligned, so that it
> can be memory mapped to qemu user space when it is passed-through to vm.
> 
> It consumes more pci memory resource with page size alignment requirement,
> it should not be a problem on 64 bit system.
> 
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  drivers/pci/setup-res.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
> index 967f9a758923..55440ae0128d 100644
> --- a/drivers/pci/setup-res.c
> +++ b/drivers/pci/setup-res.c
> @@ -339,6 +339,14 @@ int pci_assign_resource(struct pci_dev *dev, int resno)
>  		return -EINVAL;
>  	}
>  
> +#ifdef CONFIG_64BIT
> +	/*
> +	 * force minimum page alignment for vfio pci usage
> +	 * supposing there is enough pci memory resource on 64bit system
> +	 */
> +	if (res->flags & IORESOURCE_MEM)
> +		align = max_t(resource_size_t, PAGE_SIZE, align);
> +#endif
>  	size = resource_size(res);
>  	ret = _pci_assign_resource(dev, resno, size, align);
>  

