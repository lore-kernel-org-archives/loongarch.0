Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFE42DF6FD
	for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 13:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755784146; cv=none; b=Jl+26KsEZVIT10ecJ3G1EaU9A+2yhvCSgzh89MPUCCxOaZqdCE9ebd1pMJgLPyEOnnUS5qEUokSvUGr0Wp3R1l1HnJ0p2oSTg7xu3HhIWOk3GQxHeCYG/9u0ZpcxwnAf6sH9yriiR9A0YLZVdmVejI5j1vMllEhFjTi6wmCIrE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755784146; c=relaxed/simple;
	bh=5Gwu3gr9vnmpJzZUJbk2sP4G4x7XcGQ7vcQ/3FcAoMg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ungC8HhC5suJjQKk2fqievuEamT0I3ufyrrGigmsap517qnS97bTvBhVo1ZJGoigucdc3aG1CTI2YRkPc1+1sHhnoE6uI1DFjQRi9ytxVDSbxJCZQyoa95FDKwfTomBXwvpFswBXSdK2PmhJtuEyHvhY+VnCxvfOaixj/tHcM8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dxfb_HI6do8nQBAA--.1714S3;
	Thu, 21 Aug 2025 21:48:55 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxdOTGI6do_r9dAA--.27533S3;
	Thu, 21 Aug 2025 21:48:55 +0800 (CST)
Subject: Re: [PATCH 1/3] LoongArch: BPF: Remove duplicated flags check
To: Hengqi Chen <hengqi.chen@gmail.com>, chenhuacai@kernel.org,
 jianghaoran@kylinos.cn, duanchenghao@kylinos.cn, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 vincent.mc.li@gmail.com
Cc: bpf@vger.kernel.org, loongarch@lists.linux.dev
References: <20250821091003.404870-1-hengqi.chen@gmail.com>
 <20250821091003.404870-2-hengqi.chen@gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <800cfa7a-ecaf-94bc-a44f-3ee83acc9d3a@loongson.cn>
Date: Thu, 21 Aug 2025 21:48:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250821091003.404870-2-hengqi.chen@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxdOTGI6do_r9dAA--.27533S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JF4fWw4xGrW8XFW5AF1kJFc_yoWkGrb_Jr
	17A34xCrs8JFWrC3WDKr45ArnFvw15XFn5uFn3WrWIka45XrW5ArW8t345Zry7K39I9rW5
	G393Xas3Aw4jvosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbDkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa02
	0Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1l
	Yx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI
	0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0Urc3UUUUU==

On 2025/8/21 下午5:10, Hengqi Chen wrote:
> The check for (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY)
> is duplicated in __arch_prepare_bpf_trampoline(). Remove it.
> 
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>   arch/loongarch/net/bpf_jit.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index abfdb6bb5c38..b646c6b73014 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1462,9 +1462,6 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
>   	struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
>   	u32 **branches = NULL;
>   
> -	if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY))
> -		return -ENOTSUPP;
> -
>   	/*
>   	 * FP + 8       [ RA to parent func ] return address to parent
>   	 *                    function
> 

Acked-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Maybe "stack_size = 0;" in this function is redundant too, if yes,
you can remove it together.

Thanks,
Tiezhu

