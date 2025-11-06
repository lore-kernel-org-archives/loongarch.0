Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6DD2D9EEC
	for <loongarch@lists.linux.dev>; Thu,  6 Nov 2025 07:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762413023; cv=none; b=NXXO/DK/6iFAhIlLVW+/C3qF+HOYmW0s5KOooWotPHDOQjuqrSxSi87b5ntNyE4QsW2IuXcfTb/V6hZ/vWkqRXwqFWxf/i+b3QCKiR9kq6wR8NbpYU5H+RlD3sqOOfEtBGQF2P7UWMtvUgnHeyy42J3dwweR8qzcgym1IzqsBOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762413023; c=relaxed/simple;
	bh=VJRNZcA3kTanfiZF8OZOxH78vaFDupiQD/NwZKA+vQU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=bLO47kYPzUZ2qlgQKShB1QplWBCdq7WATVz8dl0ETZmjtL2ZYy/mAmMCmh74LsSu3footCAz5I2IHuCrgRRpR7e4Sy7maplB1AO3sxAJIk7UivC1+lqxtB2Vl6Gw7ZwpJzUlBt9m2X0+7r7bEhlly4qGUOBJIjDWMMR9mw0xRqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8CxK9LVSQxpDpkfAA--.961S3;
	Thu, 06 Nov 2025 15:10:13 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxpeTRSQxp8V0pAQ--.58117S3;
	Thu, 06 Nov 2025 15:10:12 +0800 (CST)
Subject: Re: [PATCH] Loongarch:Make pte/pmd_modify can set _PAGE_MODIFIED
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, akpm@linux-foundation.org, willy@infradead.org,
 david@redhat.com, linmag7@gmail.com, thuth@redhat.com, apopple@nvidia.com
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 Liupu Wang <wangliupu@loongson.cn>
References: <20251104073006.1764241-1-zhangtianyang@loongson.cn>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <48f8f2d8-e6e0-ec2a-7323-11551c66dac2@loongson.cn>
Date: Thu, 6 Nov 2025 15:07:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251104073006.1764241-1-zhangtianyang@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxpeTRSQxp8V0pAQ--.58117S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGw4DGr1rXry3GFy7Xw43urX_yoW5Jw43pF
	Z7CF9Yva1rKF1IvayfJanxXFy5AwsrGas7JwnrK3WkG34qq3yjgr4xK3y5Ar1rJaykZw18
	Zw40gws8WF47twbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr
	1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8yrW7UU
	UUU==



On 2025/11/4 下午3:30, Tianyang Zhang wrote:
> In the current pte_modify operation, _PAGE_DIRTY might be cleared. Since
> the hardware-page-walk does not have a predefined _PAGE_MODIFIED flag,
> this could lead to loss of valid data in certain scenarios.
> 
> The new modification involves checking whether the original PTE has the
> _PAGE_DIRTY flag. If it exists, the _PAGE_MODIFIED bit is set, ensuring
> that the pte_dirty interface can return accurate information.
> 
> Co-developed-by: Liupu Wang <wangliupu@loongson.cn>
> Signed-off-by: Liupu Wang <wangliupu@loongson.cn>
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> ---
>   arch/loongarch/include/asm/pgtable.h | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
> index bd128696e96d..106abfa5183b 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -424,8 +424,13 @@ static inline unsigned long pte_accessible(struct mm_struct *mm, pte_t a)
>   
>   static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>   {
> -	return __pte((pte_val(pte) & _PAGE_CHG_MASK) |
> -		     (pgprot_val(newprot) & ~_PAGE_CHG_MASK));
> +	unsigned long val = (pte_val(pte) & _PAGE_CHG_MASK) |
> +		     (pgprot_val(newprot) & ~_PAGE_CHG_MASK);
> +
> +	if (pte_val(pte) & _PAGE_DIRTY)
> +		val |= _PAGE_MODIFIED;
Since ptep_get_and_clear() is not atomic operation on LoongArch like 
other architectures, considering this scenery with HW PTW enabled:
     CPU 0:                         CPU1
                              old_pte = ptep_modify_prot_start(); 

                                   old_pte = ptep_get(ptep);

     write(buf);
*HW will set _PAGE_DIRTY bit*
                                   pte_clear(mm, address, ptep);
^^^^^^^^^^ For CPU1, bit _PAGE_DIRTY is no set in old_pte, _PAGE_DIRTY 
will be lost also. ^^^^^^^^^^^
                              pte = pte_modify(old_pte,)
                              ptep_modify_prot_commit(.., pte)

Regards
Bibo Mao
> +
> +	return __pte(val);
>   }
>   
>   extern void __update_tlb(struct vm_area_struct *vma,
> @@ -547,9 +552,13 @@ static inline struct page *pmd_page(pmd_t pmd)
>   
>   static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>   {
> -	pmd_val(pmd) = (pmd_val(pmd) & _HPAGE_CHG_MASK) |
> +	unsigned long val = (pmd_val(pmd) & _HPAGE_CHG_MASK) |
>   				(pgprot_val(newprot) & ~_HPAGE_CHG_MASK);
> -	return pmd;
> +
> +	if (pmd_val(pmd) & _PAGE_DIRTY)
> +		val |= _PAGE_MODIFIED;
> +
> +	return __pmd(val);
>   }
>   
>   static inline pmd_t pmd_mkinvalid(pmd_t pmd)
> 

