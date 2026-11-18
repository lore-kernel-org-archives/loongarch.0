Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975291;
	b=HBsVBsstUMnLEkTpZAz+pcX9isxIsA3T6LrRe+3t15b2U8E3ZhCO7xfrQ2fAoXHt/YWg
	 FTqFVgkjLLyYLaPO7KuaftrL126dO3Zw3wRXbwtNvqDFDAmoM3OIcRU8SgUw7nKhhMu0F
	 3xyy3/sS5cOtSTEqNoNMCQwEIEUFrZQxnuekC/QWooIqZH/aejbpCYmFqIEhzvhquU7n4
	 NKmDaYU71WA9OLW5dND4KURFtzqdWOVxKuPTD4r2r5qHEJlcgIGOS27Jxfgyl6vPZsxgm
	 pejTY0hqcNA3gLViMEpVC7/BVM10mkFBHyGb6sZR2qTBxEys7s5DScYGJzgDEdAeqcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975291;
	h=DMARC-Filter:Received:Received:Subject:To:Cc:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=YaOJJ7N+YdkFsLd9dYhGoiJMuptcbuFjKbt7Cq4JOQQ=;
	b=BnkiXYRmnQUImn1BNjcMbbvAaEDfoDkrANLo2QvwDZeIlV6Jh+vVM0c7NFqyyEpC3XUL
	 5czWx1Rtr9HPYTjEHPAi0cUng17kmaXZUQz7yZcY+xStf512IwNS/BND11mVwlDuXLTVQ
	 qrqt0COzwKp3+Zx2iuLgPZLr3eoJ2ZSgEv1aaEB/T2kisNNb63OquXvEyh/XlK23c1Uwq
	 0YJOtppSDSFGIHP91ZZnyxmtPwUOfnl9/6EpMfy4CVY9bLUjKIWg6S/LQZWeB296krhBJ
	 nYmhAv0Ycf4PdaWpAKefWpu1S9gH4prnUHMctGWfd1tOQ5tPbDYe+RKnXk4/c3w/AeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B220F606A31C
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 04:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B220F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8Dxl7UxJv1qobQgAA--.808S3;
	Wed, 18 Nov 2026 12:14:41 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJBxJs0wJv1qSII1AA--.65343S2;
	Wed, 18 Nov 2026 12:14:40 +0800 (CST)
Subject: Re: [PATCH] LoongArch: BPF: Fix the offset of stptr.w and stptr.d
 stores
To: George Guo <dongtai.guo@linux.dev>, chenhuacai@kernel.org
Cc: hengqi.chen@gmail.com, guodongtai@kylinos.cn, bpf@vger.kernel.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261118030219.6230-1-dongtai.guo@linux.dev>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <7226bf46-05e3-b52d-af28-aabf1d504929@loongson.cn>
Date: Wed, 18 Nov 2026 12:14:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261118030219.6230-1-dongtai.guo@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJBxJs0wJv1qSII1AA--.65343S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrur1kur1DGry5Cw1kGF18CrX_yoWkAwcEqw
	nrC39rWw1rAayDJF17Kry5Jw4UK3WrAryrCF1kWr17AF1Y9r45XFWvgryku3y0g3y3CrWa
	9ay5XFyS93y2yosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkU
	UUUU=

On 11/18/26 11:02 AM, George Guo wrote:
> From: George Guo <guodongtai@kylinos.cn>
> 
> When testing bpf selftests "jit_insns" and "jit_insns_blinded", the
> "ldst_offsets" subtest fails for word and doubleword stores:

...

> diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.h
> index 2bd0dc5b911c..5207ad30fade 100644
> --- a/arch/loongarch/net/bpf_jit.h
> +++ b/arch/loongarch/net/bpf_jit.h
> @@ -52,6 +52,15 @@ do {										\
>   #define is_signed_imm52(val)	signed_imm_check(val, 52)
>   #define is_unsigned_imm12(val)	unsigned_imm_check(val, 12)
>   
> +/*
> + * ldptr.{w,d} and stptr.{w,d} take a 14-bit signed immediate in units of
> + * 4 bytes: they reach a multiple of 4 in [-32768, 32764], passed as off >> 2.
> + */
> +static inline bool is_ptr_off(int off)
> +{
> +	return !(off & 3) && is_signed_imm16(off);
> +}
> +

Please use a self-documenting function name and remove the redundant
comment:

static inline bool is_aligned_signed_imm16(int off)
{
	return !(off & 3) && is_signed_imm16(off);
}

Moreover, please remove the unused is_signed_imm14 macro in bpf_jit.h.

Thanks,
Tiezhu

