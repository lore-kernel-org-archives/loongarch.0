Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1BE217F53
	for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 01:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757986211; cv=none; b=QiavSt2pbrwrEByiMAgAYg9eM3vs8icCyYOOLIJsgmenIl58O3nRNWKqPy3KDr/Vp/AFsUS+5Y0NyxYonL/Gb8PohVwxQCfs6i/msDtxUNaGMoSkyfAbQiEgNPs34m4b1BkTs2hsK6snnVmpQPLtdpNVnjQlkQcYqhPYF1IZwDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757986211; c=relaxed/simple;
	bh=Rm0gHAfk+FjEIZWY7YKRbPW4JOwxvHlJnH3iKfsrlHY=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=CkuZ0cO3xhJrM9skK4Ged5yMsIiYddUUTGFf0yFZrpgzF/PGL7sCX0PXZ/CKHUxsP5WIMpPxJhH+CSi163LDbtYo0Wixq3n1TfEh7K6cl+oNo1n5m7rvu4eFWxnmwi8vPU8Sm71EdYUx5aHx2Kp0Ooef1KglET/1wb7/mZImxAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8DxLvCXvcho2MUKAA--.23092S3;
	Tue, 16 Sep 2025 09:30:00 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJAxvsGVvcho7lSYAA--.49454S3;
	Tue, 16 Sep 2025 09:29:59 +0800 (CST)
Subject: Re: [PATCH] LoongArch: KVM: rework pch_pic_update_batch_irqs()
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Xianglai Li <lixianglai@loongson.cn>,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250913002907.69703-1-yury.norov@gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <0e330fc0-1200-6a02-7b21-78064fc63a2e@loongson.cn>
Date: Tue, 16 Sep 2025 09:27:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250913002907.69703-1-yury.norov@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxvsGVvcho7lSYAA--.49454S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF1DGFW5AF47WFyDtr4UJrc_yoW8GF1UpF
	W5uanIkFs5Gr1DXFy8uayUtF4ayrnrtr1SgF9F934xKrnxtr1FvF1kGrWkX3W5K393GF4I
	vrs3tr1Sqa47AacCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcveHDUUUU



On 2025/9/13 上午8:29, Yury Norov (NVIDIA) wrote:
> Use proper bitmap API and drop all the housekeeping code.
> 
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> ---
>   arch/loongarch/kvm/intc/pch_pic.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/pch_pic.c
> index 119290bcea79..57e13ae51d24 100644
> --- a/arch/loongarch/kvm/intc/pch_pic.c
> +++ b/arch/loongarch/kvm/intc/pch_pic.c
> @@ -35,16 +35,11 @@ static void pch_pic_update_irq(struct loongarch_pch_pic *s, int irq, int level)
>   /* update batch irqs, the irq_mask is a bitmap of irqs */
>   static void pch_pic_update_batch_irqs(struct loongarch_pch_pic *s, u64 irq_mask, int level)
>   {
> -	int irq, bits;
> +	DECLARE_BITMAP(irqs, 64) = { BITMAP_FROM_U64(irq_mask) };
> +	unsigned int irq;
>   
> -	/* find each irq by irqs bitmap and update each irq */
> -	bits = sizeof(irq_mask) * 8;
> -	irq = find_first_bit((void *)&irq_mask, bits);
> -	while (irq < bits) {
> +	for_each_set_bit(irq, irqs, 64)
>   		pch_pic_update_irq(s, irq, level);
> -		bitmap_clear((void *)&irq_mask, irq, 1);
> -		irq = find_first_bit((void *)&irq_mask, bits);
> -	}
>   }
>   
>   /* called when a irq is triggered in pch pic */
> 
Thanks for doing this.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>

