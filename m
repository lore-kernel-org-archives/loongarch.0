Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AECD10EE
	for <loongarch@lists.linux.dev>; Wed,  1 Mar 2023 09:21:49 +0000 (UTC)
Received: from loongson.cn (unknown [192.168.200.1])
	by gateway (Coremail) with SMTP id _____8Ax69kTGf9j1sQGAA--.7272S3;
	Wed, 01 Mar 2023 17:21:23 +0800 (CST)
Received: from [0.0.0.0] (unknown [192.168.200.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxaL3CGP9jtlJDAA--.53207S3;
	Wed, 01 Mar 2023 17:20:03 +0800 (CST)
Subject: Re: [PATCH] efi/loongarch: Reintroduce efi_relocate_kernel() to
 relocate kernel
To: Huacai Chen <chenhuacai@loongson.cn>, Ard Biesheuvel <ardb@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>
References: <20230301085545.2373646-1-chenhuacai@loongson.cn>
Cc: linux-efi@vger.kernel.org, loongarch@lists.linux.dev,
 Xuefeng Li <lixuefeng@loongson.cn>, Xuerui Wang <kernel@xen0n.name>,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Youling Tang <tangyouling@loongson.cn>
Message-ID: <aba37b65-6fc4-721e-ebc5-df52533e4791@loongson.cn>
Date: Wed, 1 Mar 2023 17:20:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230301085545.2373646-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8DxaL3CGP9jtlJDAA--.53207S3
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Zr1rCr17ZF4DXr18Aw15XFb_yoW5JF17p3
	sxAr40yr47Xr4rA3Z7J34UuF98Xws7trWagF9Fyw1ruryav3WDZr1rWrZ7WFWjyFWkK3y5
	XF1IyF12ka1UGw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bO8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
	CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
	6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAK
	I48JMxAIw28IcVCjz48v1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7
	UUUUU==

Hi, Huacai

On 03/01/2023 04:55 PM, Huacai Chen wrote:
> Since Linux-6.3, LoongArch supports PIE kernel now, so let's reintroduce
> efi_relocate_kernel() to relocate the core kernel.

If we strongly rely on the PIE feature after the modification, we need
to modify it as follows,

--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -137,6 +137,7 @@ config LOONGARCH
         select PCI_MSI_ARCH_FALLBACKS
         select PCI_QUIRKS
         select PERF_USE_VMALLOC
+       select RELOCATABLE
         select RTC_LIB
         select SMP
         select SPARSE_IRQ

or:

--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -360,6 +360,7 @@ config EFI_STUB
         default y
         depends on EFI
         select EFI_GENERIC_STUB
+       select RELOCATABLE
         help

Youling.

>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  drivers/firmware/efi/libstub/loongarch-stub.c | 24 ++++++-------------
>  1 file changed, 7 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/firmware/efi/libstub/loongarch-stub.c b/drivers/firmware/efi/libstub/loongarch-stub.c
> index eee7ed43cdfb..72c71ae201f0 100644
> --- a/drivers/firmware/efi/libstub/loongarch-stub.c
> +++ b/drivers/firmware/efi/libstub/loongarch-stub.c
> @@ -21,26 +21,16 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
>  				 efi_loaded_image_t *image,
>  				 efi_handle_t image_handle)
>  {
> -	int nr_pages = round_up(kernel_asize, EFI_ALLOC_ALIGN) / EFI_PAGE_SIZE;
> -	efi_physical_addr_t kernel_addr = EFI_KIMG_PREFERRED_ADDRESS;
>  	efi_status_t status;
> +	unsigned long kernel_addr = 0;
>
> -	/*
> -	 * Allocate space for the kernel image at the preferred offset. This is
> -	 * the only location in memory from where we can execute the image, so
> -	 * no point in falling back to another allocation.
> -	 */
> -	status = efi_bs_call(allocate_pages, EFI_ALLOCATE_ADDRESS,
> -			     EFI_LOADER_DATA, nr_pages, &kernel_addr);
> -	if (status != EFI_SUCCESS)
> -		return status;
> -
> -	*image_addr = EFI_KIMG_PREFERRED_ADDRESS;
> -	*image_size = kernel_asize;
> +	kernel_addr = (unsigned long)&kernel_offset - kernel_offset;
> +
> +	status = efi_relocate_kernel(&kernel_addr, kernel_fsize, kernel_asize,
> +		     EFI_KIMG_PREFERRED_ADDRESS, efi_get_kimg_min_align(), 0x0);
>
> -	memcpy((void *)EFI_KIMG_PREFERRED_ADDRESS,
> -	       (void *)&kernel_offset - kernel_offset,
> -	       kernel_fsize);
> +	*image_addr = kernel_addr;
> +	*image_size = kernel_asize;
>
>  	return status;
>  }
>

