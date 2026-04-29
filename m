Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233A654652
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 03:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777433138; cv=none; b=W5Yh7WoMVWOqZKEJAuim9OYSiIvrSD5ZKcE2dOB1HVq32XlBPMtT5aJlTEzyz9o8A8YMdznioias1bpdexhSfXFNcXkMuS9J1lr18GEZGsmfRoh31tlDnQZEtVn0hRrIzLQaduu5GkE39mp3WEzqkpA8b2N3Tr2lvuXagh+2eTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777433138; c=relaxed/simple;
	bh=YUBO2JR/kQ1Ey1X/WalGnrkNqXt5MRZAAa22BgZ9UQo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=mOa3f7ghkhNI6eqY6BJv/uM7SwILoUaTark1zTfROSl3Uv06v6NlAzxK/AelJzIi1FAqHgQ57lCns8ZRb1RyaFknwOVmwVumj0+Eh8gZ2UxwEVKXh1J8ggEMzcb8FOCqj/H2nPzrQ3vw3WPW+oklAec8c5LuRG3xXjCZTgwchYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxAussevFpiAEFAA--.16921S3;
	Wed, 29 Apr 2026 11:25:32 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJCx98AkevFp+gl3AA--.15944S3;
	Wed, 29 Apr 2026 11:25:31 +0800 (CST)
Subject: Re: [PATCH] LoongArch/KVM: Use kvm_set_pte() in kvm_flush_pte
To: Tao Cui <cuitao@kylinos.cn>, zhaotianrui@loongson.cn,
 chenhuacai@kernel.org, loongarch@lists.linux.dev
Cc: kernel@xen0n.name
References: <20260428130031.409066-1-cuitao@kylinos.cn>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <bdfd9d8a-7614-420f-0ef3-fddc694fe9e4@loongson.cn>
Date: Wed, 29 Apr 2026 11:22:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260428130031.409066-1-cuitao@kylinos.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx98AkevFp+gl3AA--.15944S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZF4fKrW5Xw48ur4DKF4kGrX_yoWfGFc_XF
	4xt3WUurW8Ja4vv3Wjva98CryfWw1UJFZYvF93Zr1xXas8tr45ArsYqan5AryjgrWjkFWr
	ArZ5tasakr1IyosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70PfDUUU
	U



On 2026/4/28 下午9:00, Tao Cui wrote:
> kvm_flush_pte() is the only caller that directly assigns *pte instead
> of using the kvm_set_pte() wrapper. Use the wrapper for consistency
> with the rest of the file.
> 
> No functional change intended.
> 
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> ---
>   arch/loongarch/kvm/mmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
> index a7fa458e3360..e104897aa532 100644
> --- a/arch/loongarch/kvm/mmu.c
> +++ b/arch/loongarch/kvm/mmu.c
> @@ -95,7 +95,7 @@ static int kvm_flush_pte(kvm_pte_t *pte, phys_addr_t addr, kvm_ptw_ctx *ctx)
>   	else
>   		kvm->stat.pages--;
>   
> -	*pte = ctx->invalid_entry;
> +	kvm_set_pte(pte, ctx->invalid_entry);
>   
>   	return 1;
>   }
> 
Reviewed-by: Bibo Mao <maobibo@loongson.cn>

