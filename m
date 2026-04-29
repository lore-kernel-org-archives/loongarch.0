Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9CF37BE7A
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 07:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448095; cv=none; b=aRlybKeHnhVcYW41v++n9pV2RqHzb0SfaZXR2TZUDCaTj8YeJz1K8TiPFWgRHHf3Fz5cDEeGfPJ1x1DeWx9oWrZNRO7ogSOCaB7V2BsI7SHcntIjeF488ySNjwNsnPOyde1NJutDzKnhltyfubaVIp9+a7vnr73Csr4/f7/J0PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448095; c=relaxed/simple;
	bh=av3I1arZxuA8ONdk+KtRCUjmxd5/n7r0JMJxot7sMKc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=KofYTszPUpWnk1EZYlL+4j48Ar1WdNnqWxzRB29rnx8LhxjbfMm+uxYXnJAPBre98wthIt/kYDrsD4xH3JqwA3uKyCaS+SJN2Tw2gE1oVcznpSoawrlkt6uODJo8PtvZwMmmAyveTU/YqnInzEGttis2tv/5AcRo9e7/5oUqu/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Cx4eqLtPFplQ4FAA--.17167S3;
	Wed, 29 Apr 2026 15:34:35 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxjcKKtPFpHSl3AA--.27741S3;
	Wed, 29 Apr 2026 15:34:34 +0800 (CST)
Subject: Re: [PATCH] LoongArch/KVM: Simplify _kvm_pte_init with memset64
To: Tao Cui <cuitao@kylinos.cn>, zhaotianrui@loongson.cn,
 chenhuacai@kernel.org, loongarch@lists.linux.dev
Cc: kernel@xen0n.name
References: <20260428131138.409698-1-cuitao@kylinos.cn>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <be0a5d0c-b2c9-67f5-7497-977acc6fa1f9@loongson.cn>
Date: Wed, 29 Apr 2026 15:31:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260428131138.409698-1-cuitao@kylinos.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxjcKKtPFpHSl3AA--.27741S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZrWDAF4rJFykGry5Jw4fZwc_yoWkGrbE9a
	47J3WkKrWkXa18ZF1Ykrn8W3W5Kw1kGFZYka1UZrs7JwnxArs3Jw47ta15ZF12gr4UCF45
	trW0gFyrGr1jkosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXU
	UUUU=



On 2026/4/28 下午9:11, Tao Cui wrote:
> Replace the manual 8x loop unrolling in _kvm_pte_init() with a single
> memset64() call.
> 
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> ---
>   arch/loongarch/kvm/mmu.c | 16 +---------------
>   1 file changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
> index e104897aa532..5a56dd5dcd4a 100644
> --- a/arch/loongarch/kvm/mmu.c
> +++ b/arch/loongarch/kvm/mmu.c
> @@ -122,21 +122,7 @@ kvm_pte_t *kvm_pgd_alloc(void)
>   
>   static void _kvm_pte_init(void *addr, unsigned long val)
>   {
> -	unsigned long *p, *end;
> -
> -	p = (unsigned long *)addr;
> -	end = p + PTRS_PER_PTE;
> -	do {
> -		p[0] = val;
> -		p[1] = val;
> -		p[2] = val;
> -		p[3] = val;
> -		p[4] = val;
> -		p += 8;
> -		p[-3] = val;
> -		p[-2] = val;
> -		p[-1] = val;
> -	} while (p != end);
> +	memset64(addr, val, PTRS_PER_PTE);
>   }
>   
>   /*
> 
what is the benefit of memset64() here? I think that 8x loop unrolling 
is better from performance side. The page size is 16K or 4K and buffer 
is large enough, unrolling seems to be better.

Regards
Bibo Mao

