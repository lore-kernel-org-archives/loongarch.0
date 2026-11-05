Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843424;
	b=MwiOgFS63Y1oD3j+h9miCrlIcKO9zg9isxxmHtPZ3Xc2vCGeVnPwf31+cTeQa9CO5ShE
	 OPpLcQOAN05ELzS0VJLEN4nabUJBne4ybtGhUcWicjIhNXcILrI/nr8R6qGpcfk9m7tUN
	 Z30aMSltnYX718eEisxrImyADQmj73hm6uWdiiRCC/IAO2EDl7eqBpKwTE9QOoKe0svG4
	 z5zFqmRUgw5RCWxUEh9GCy0xm8W/kqldZILZj5b3tD+j20y7LISAVfGMQZfgIDRjwEdI6
	 pm8y/Ne88qAATgruR/SZGuzsSX+FxaHw/KimnnzyP8yDbvRfr4WU5wA6YTiIj/7biZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843424;
	h=DMARC-Filter:Received:Received:Subject:To:Cc:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=w3bjmnRpABvjjTMc+j8jy7xf8N+60afMMXD7WGaabWI=;
	b=3B90j2wl/luCzYBK52seem+7o5MgAI26BR+AAcRgHFpISczS4vwvick26kZUDCA+Y5B2
	 rCw5Vxte+1SUFRDZqRmbaD37jnR9nViqfBhmIju+k5nENIZkmOo2kcrjQHt6BqnL5ov1J
	 oIUEUPb0qJ1/aSga6yr+yVrNJf4fB4d5GQCOwZNcn5zCNwN5vnM+39Bgpx0ssttPMEpvo
	 t+Z817Hte0NjptQ2sfcHPsA8R5W/x67K10DSAyk4zs64d1jfkKgn3hnyYD4IgKLTz+wzP
	 TF7bcWpgl0qlb16oF7/pRjc6xWzR4u2fP1rFY6SfAVm7T5JDRbC0MEizBi6eFgk9dnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED38C606A326
	for <loongarch@lists.linux.dev>; Thu,  5 Nov 2026 01:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED38C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxC9LV4Otq7H4cAA--.17085S3;
	Thu, 05 Nov 2026 09:50:14 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJBxJs3T4OtqVHgyAA--.61748S2;
	Thu, 05 Nov 2026 09:50:12 +0800 (CST)
Subject: Re: [PATCH v1 1/2] LoongArch: BPF: Make arena support depend on SCQ
 extension
To: George Guo <dongtai.guo@linux.dev>
Cc: chenhuacai@kernel.org, hengqi.chen@gmail.com, loongarch@lists.linux.dev,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261102072808.23080-2-yangtiezhu@loongson.cn>
 <20261104101753.20704-1-dongtai.guo@linux.dev>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <4e9bcddf-7dfe-b78f-035f-8a4b76584fdd@loongson.cn>
Date: Thu, 5 Nov 2026 09:50:11 +0800
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
In-Reply-To: <20261104101753.20704-1-dongtai.guo@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJBxJs3T4OtqVHgyAA--.61748S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WFW3Cr17ZFW5tFWDAry7Jwc_yoW8ur15pa
	y8Wr4UZrZ0gw1jyr4Iyw4fuF4rW34rCF4UJw1fW348Zwn8Wr1fWr4FkFW5XF1Uurs3AF4U
	tF4Iqa429r4jyagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOxhLUUUUU=

On 11/4/26 6:17 PM, George Guo wrote:
> Hi Tiezhu,
> 
> On 2026/11/2 15:28, Tiezhu Yang wrote:
>> This is because the arena range tree uses kmalloc_nolock(), which requires
>> 128-bit atomic cmpxchg support, provided by SCQ extension on LoongArch.
> 
> There is an existing SLUB debug fallback worth checking before making
> arena support depend on SCQ.
> 
> In __kmalloc_nolock_noprof(), the rejection condition is:
> 
>          if (!(s->flags & __CMPXCHG_DOUBLE) && !kmem_cache_debug(s))
>                  return NULL;
> 
> Debug caches do not require cmpxchg128 for this path. They use
> kmem_cache_node->list_lock with spin_trylock_irqsave() instead.
> With CONFIG_SLUB_DEBUG=y, booting with slab_debug enables this path;
> CONFIG_SLUB_DEBUG_ON=y enables debugging by default as well.
> 
> The proposed bpf_jit_supports_arena() check would reject arena maps on
> CPUs without SCQ, even when the SLUB debug fallback is available.
> This would prevent us from running arena tests on those machines
> with slab_debug enabled.
> 
> Could you rerun jit_insns/cast_to_user on the 3A5000 with slab_debug
> enabled, before and after this patch? The claim that kmalloc_nolock()
> requires 128-bit cmpxchg should account for debug caches, and it would
> be useful to preserve that fallback when addressing the error reporting.

I noticed that a similar concern regarding the slub_debug exception
was previously raised by the CI bot in the RISC-V ZACAS patch:
https://lore.kernel.org/bpf/594ed4944926f6a7202b016eca03d879d11bfdf09a2cbaea039421ae4ab962c0@mail.kernel.org/

I highly agree with the bot's conclusion there:
 > "That narrowing is arguably desirable (BPF should not depend on a SLUB
 > debug-mode escape hatch)."

Moreover, handling this runtime debug mode inside the architecture's JIT
layer would inevitably introduce undesirable cross-module coupling with
SLUB internals. Restricting the JIT capability solely to native hardware
and toolchain support keeps the implementation clean and robust.

Thanks,
Tiezhu

