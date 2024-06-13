Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDACC8C7
	for <loongarch@lists.linux.dev>; Thu, 13 Jun 2024 01:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718242051; cv=none; b=IKIQxf9cFbJZ8WiGyTRhQ9oRGI50r2C//1F37+IAn6VTdUA/+m61thE5j/TNHXXAsc6yxl5t860VWEKkh0AzDKZfJczn1aIVbspqM8YAqfMWUuM+SEmlXBO6HC/nskzC2EfQLKSCcOVYR7YC7bg2h+QrmehmRDyLPqc7257c458=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718242051; c=relaxed/simple;
	bh=5mgBH13DKl/I/xUby8jCKmJWhWVgmo/bpC3wtoWpOaY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=DmaZSCUQLX7VS4sYZcjIX+F9R2fSztFj9s9D2pII8qXMwJWds8lEHfTxK12/R9Mge43oEEb+BfoODuzTVLASKDSmBoDfPVor5278syj8sSlE0jgM0KyJtUiF29srQ6tkV1tVxVF8TO2Q9nDtbTNy4hQ2T7fDkUpzuSEf305y8HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxHuv4Smpm8D0GAA--.25400S3;
	Thu, 13 Jun 2024 09:27:20 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxnsf1SmpmjvgdAA--.8480S3;
	Thu, 13 Jun 2024 09:27:19 +0800 (CST)
Subject: Re: [PATCH] LoongArch: KVM: always make pte yong in page map's fast
 path
To: jiaqingtong97@gmail.com, zhaotianrui@loongson.cn, chenhuacai@kernel.org,
 kernel@xen0n.name
Cc: loongarch@lists.linux.dev, kvm@vger.kernel.org
References: <20240613003217.129303-1-jiaqingtong97@gmail.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <28916be2-f14d-069b-0543-172e261375a6@loongson.cn>
Date: Thu, 13 Jun 2024 09:27:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240613003217.129303-1-jiaqingtong97@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bxnsf1SmpmjvgdAA--.8480S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CryfWryUJr18Ww1xXrW5Arc_yoW8XFy5pF
	WfCr1Dtr48Jr1fKrnIqaykXF45u398Gr4Iqa12934UCrnFqFyxu3y0qrZ5X34DA392ya1f
	ZFyrJ3WxWa90y3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8czVUUU
	UUU==

Hi Qingtong,

On 2024/6/13 上午8:32, jiaqingtong97@gmail.com wrote:
> From: Jia Qingtong <jiaqingtong97@gmail.com>
> 
> It seems redundant to check if pte is yong before the call to
> kvm_pte_mkyoung in kvm_map_page_fast.
> Just remove the check.
> 
> Signed-off-by: Jia Qingtong <jiaqingtong97@gmail.com>
> ---
>   arch/loongarch/kvm/mmu.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
> index 98883aa23ab8..a46befcf85dc 100644
> --- a/arch/loongarch/kvm/mmu.c
> +++ b/arch/loongarch/kvm/mmu.c
> @@ -551,10 +551,8 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
>   	}
>   
>   	/* Track access to pages marked old */
> -	new = *ptep;
> -	if (!kvm_pte_young(new))
> -		new = kvm_pte_mkyoung(new);
> -		/* call kvm_set_pfn_accessed() after unlock */
> +	new = kvm_pte_mkyoung(*ptep);
> +	/* call kvm_set_pfn_accessed() after unlock */
Thanks for noticing this.

The logic is right, however it does not improve performance to update 
pte entry unconditionally since pte entry is frequently accessed by HW 
and multpile CPUs. There may be cache thrashing issue, just maybe from 
my own point -:)

It is the same such as test_and_set_bit implementation on x86 or other 
architectures, it is not unconditionally logic or on x86.

Regards
Bibo Mao
>   
>   	if (write && !kvm_pte_dirty(new)) {
>   		if (!kvm_pte_write(new)) {
> 
> base-commit: eb36e520f4f1b690fd776f15cbac452f82ff7bfa
> 

