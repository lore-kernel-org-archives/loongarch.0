Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A713815DD
	for <loongarch@lists.linux.dev>; Fri, 24 Jul 2026 06:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784873272; cv=none; b=kUeypMbCCEIUrzU/y5/XOcwqHJiECXONrHp6EZKw2hINFLVCB4CfK1z0Ua0wYuXUgwhTLx62513RtI1rljcEZsj1BJ1ABQDWHTOrtSsbx1ObftmNJX/UgwaOEmLe3RxyjB8uBWrAuWa0Nt8spSFOnRlHvRFPmnhS+tPIzyEjS4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784873272; c=relaxed/simple;
	bh=Cu28WmwUbWWQpAAiXCiPfSm7Bn2yUp9mrIW1Omwfolw=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=n2YCRYAEJuFZmLAm9O94ntcL1gS7DqWlaWKjyEUl0sogzZO8ASTahMQ7oc09+VOO/FMtTLfqA1V8did/Tg5KVmLydRQmo1H1HJypQjvlb2iAy1r94JNI72sETu7Obe7TijUOIle4L4uhiqDM+aY2BwZpOPfsS3FUEgK5Xi1GVEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx8+kwAWNq3dQGAA--.15914S3;
	Fri, 24 Jul 2026 14:07:44 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxPscpAWNqcyUXAA--.59809S2;
	Fri, 24 Jul 2026 14:07:38 +0800 (CST)
Subject: Re: [PATCH v2 2/2] LoongArch: Skip address pairing for non-exec
 sections
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-mm@kvack.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
References: <20260721090606.8982-1-yangtiezhu@loongson.cn>
 <20260721090606.8982-3-yangtiezhu@loongson.cn>
Message-ID: <11c42b7c-7805-cce7-305d-6e52c14db20e@loongson.cn>
Date: Fri, 24 Jul 2026 14:07:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260721090606.8982-3-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxPscpAWNqcyUXAA--.59809S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGryfuw17Cr4DZry8tr4fWFX_yoWrCFy3pr
	sxCrs5uFWkGF1DJ3s5tw1kua4UWaykuF4aqF95tryxAFnxXF95t3ZxtrnxJayUuws5Aw40
	qryFgw4Fv3WUCabCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_Ma
	UUUUU

On 2026/7/21 下午5:06, Tiezhu Yang wrote:
> The module loader currently runs expensive address pairing logic for all
> sections blindly during relocation. For massive modules like amdgpu, this
> causes the loader to waste lots of CPU cycles analyzing non-exec sections.
> 
> Furthermore, there is an inconsistency since module_frob_arch_sections()
> already ignores non-exec sections during the counting phase.
> 
> Check the SHF_EXECINSTR flag in apply_relocate_add(). If the section is
> non-exec, skip address pairing and then jump to normal relocation. This
> eliminates redundant search loops to improve module loading efficiency.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   arch/loongarch/kernel/module.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/loongarch/kernel/module.c b/arch/loongarch/kernel/module.c
> index 7d4d571ee55e..c84ac1546dc6 100644
> --- a/arch/loongarch/kernel/module.c
> +++ b/arch/loongarch/kernel/module.c
> @@ -484,6 +484,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>   	Elf_Addr v;
>   	Elf_Sym *sym;
>   	Elf_Rela *rel = (void *) sechdrs[relsec].sh_addr;
> +	Elf_Shdr *dst_sec = sechdrs + sechdrs[relsec].sh_info;
>   
>   	pr_debug("%s: Applying relocate section %u to %u\n", __func__, relsec,
>   	       sechdrs[relsec].sh_info);
> @@ -522,6 +523,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>   
>   		v = sym->st_value + rel[i].r_addend;
>   
> +		/* Skip address pairing for non-exec sections */
> +		if (!(dst_sec->sh_flags & SHF_EXECINSTR))
> +			goto apply_normal;
> +
>   		if (type == R_LARCH_PCADD_LO12 || type == R_LARCH_GOT_PCADD_LO12) {
>   			bool found = false;
>   			unsigned int j = idx;
> @@ -562,6 +567,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>   			idx = j; /* Record the previous j-loop end index */
>   		}
>   
> +apply_normal:
>   		switch (type) {
>   		case R_LARCH_B26:
>   			err = apply_r_larch_b26(mod, sechdrs, location,
> 

According to the LoongArch ABI specification, the following relocation
types exist exclusively in executable code sections:

R_LARCH_PCADD_LO12
R_LARCH_GOT_PCADD_LO12
R_LARCH_B26
R_LARCH_GOT_PC_HI20...R_LARCH_GOT_PC_LO12
R_LARCH_GOT_PCADD_HI20...R_LARCH_GOT_PCADD_LO12
R_LARCH_SOP_PUSH_PLT_PCREL

https://github.com/loongson/la-abi-specs/blob/release/laelf.adoc

Thus, here is a better way:

```
diff --git a/arch/loongarch/kernel/module.c b/arch/loongarch/kernel/module.c
index 7d4d571ee55e..b1452b8adc63 100644
--- a/arch/loongarch/kernel/module.c
+++ b/arch/loongarch/kernel/module.c
@@ -484,6 +484,8 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char 
*strtab,
         Elf_Addr v;
         Elf_Sym *sym;
         Elf_Rela *rel = (void *) sechdrs[relsec].sh_addr;
+       Elf_Shdr *dst_sec = sechdrs + sechdrs[relsec].sh_info;
+       bool is_exec = !!(dst_sec->sh_flags & SHF_EXECINSTR);

         pr_debug("%s: Applying relocate section %u to %u\n", __func__, 
relsec,
                sechdrs[relsec].sh_info);
@@ -522,6 +524,14 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const 
char *strtab,

                 v = sym->st_value + rel[i].r_addend;

+               /* Skip relocation types that exist exclusively in 
executable sections */
+               if (!is_exec) {
+                       err = handler(mod, location, v, rela_stack, 
&rela_stack_top, type);
+                       if (err)
+                               return err;
+                       continue;
+               }
+
                 if (type == R_LARCH_PCADD_LO12 || type == 
R_LARCH_GOT_PCADD_LO12) {
                         bool found = false;
                         unsigned int j = idx;
```

For the non-exec sections such as .orc_unwind_ip:

fedora@linux:~/7.2-rc3.git$ objdump -h 
drivers/gpu/drm/amd/amdgpu/amdgpu.ko | grep -A 1 .orc_unwind_ip
  32 .orc_unwind_ip 000ac104  0000000000000000  0000000000000000 
18592470  2**0
                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, DATA

there are 176193 relocation entries:

fedora@linux:~/7.2-rc3.git$ readelf -rW 
drivers/gpu/drm/amd/amdgpu/amdgpu.o | grep .rela.orc_unwind_ip
Relocation section '.rela.orc_unwind_ip' at offset 0x3a5321e8 contains 
176193 entries:

Using the section flag check reduces the operation to a single check for
massive data sections; otherwise, the loader would have to perform six
redundant type comparisons across the if-statement and switch-case for
every single relocation entry.

Thanks,
Tiezhu

