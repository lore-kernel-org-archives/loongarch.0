Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670740;
	b=n6+SHMoyS4NFRYDXcwbOOwiuYZASExbH9VBrwaQ1vSN+3PSpbHzp8Jp8POLy7Ggg3Loy
	 8KL9xD0K/q+9q1Tbm4IlsBz/1fYU/I+QflC3G1B7EK+ONh1WiRWyYhlJCocV4ZGSbcsaW
	 HCggqguuyPEtACQRhbxbTKoXPe/ERT76qfKsU+GD3POecDQKv+3mxt7t8KZxZsUrF53q9
	 agNy3bTXqG/v4mdUfsJpMTuUNPD1tZhysgBOfG+GewBLs0YYXu9WQu8PtYO3e4IWEZXUZ
	 gxXrPab15sPzphGtwXihdxtnk8Udl08R5GFUDi6oCo0xTYsCHMge49eOuiVJHlwPRkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670740;
	h=DMARC-Filter:Received:Received:Subject:To:Cc:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=RtyNW0gmNKu+F4S4geYgGRfWCseBxV4f/FbulQHc5qY=;
	b=b3Tk7BcogUVHywTqEKy7EOA79n0QkxLHrWt6tHSec7JMIe2TxojbpQLkvlqVPTuwv6sm
	 U7DM6rn3CnEC/TnSiG4zO/AGnL1vTmvGuxZENoK4MfvNQbpxruogmbItJOg/8BIac5fwF
	 7gIl907Rt81Svvh9Wnc/8bdtQeqqux/J55BfLtp8/wh4+tGf9hLzrryW4HY3r9KuQPCrE
	 QN3yV5m6TTeCuvKy64u7FAZCGTxqdACRR7bEMXTeq8JngPKnTAiM4V+Dl4nBAz51Lp+OF
	 X1rD5ZkTCTGb325JegceyJu97qitT468UAbBacEx3bVBzB6CgVpsuEgBJOUNQfq3SRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A01606A329
	for <loongarch@lists.linux.dev>; Tue,  3 Nov 2026 01:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5A01606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxHNJNPulqFM0bAA--.15221S3;
	Tue, 03 Nov 2026 09:52:13 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxBc1MPulq3QkyAA--.9889S2;
	Tue, 03 Nov 2026 09:52:12 +0800 (CST)
Subject: Re: [PATCH v1] mm/slub: Genericize x86-specific cmpxchg16b comment
To: Harry Yoo <harry@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
 loongarch@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261102082730.12430-1-yangtiezhu@loongson.cn>
 <auihvtpGJPDbb4Hz@thinkstation>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <5ce58389-db68-54f2-51fb-0d43b0e0cb2d@loongson.cn>
Date: Tue, 3 Nov 2026 09:52:11 +0800
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
In-Reply-To: <auihvtpGJPDbb4Hz@thinkstation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxBc1MPulq3QkyAA--.9889S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ar13WFyktF43uFyDCF13WrX_yoW8Gr18pa
	yktFW8X398Xr1a9ws7Ca17Ww1fXa4UKr97Cw15G348Jr9xKr15GFy0yrWfWayrXryS9342
	kas2qFW3Zw4UXFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j5o7tUUUUU=

On 2026/11/2 下午10:49, Harry Yoo wrote:
> On Mon, Nov 02, 2026 at 04:27:30PM +0800, Tiezhu Yang wrote:
>> The kmalloc_nolock() infrastructure relies on slab caches with double-word
>> atomic cmpxchg capabilities (__CMPXCHG_DOUBLE). The current inline comment
>> in __kmalloc_nolock_noprof() uses 'cmpxchg16b' as the prerequisite hardware
>> capability.

...

>> diff --git a/mm/slub.c b/mm/slub.c
>> index 45e077c7526c..216bc6b5d776 100644
>> --- a/mm/slub.c
>> +++ b/mm/slub.c
>> @@ -5589,8 +5589,8 @@ static void *__kmalloc_nolock_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t gfp_f
>>   	if (!(s->flags & __CMPXCHG_DOUBLE) && !kmem_cache_debug(s))
>>   		/*
>>   		 * kmalloc_nolock() is not supported on architectures that
>> -		 * don't implement cmpxchg16b and thus need slab_lock()
>> -		 * which could be preempted by a nmi.
>> +		 * don't implement 128-bit atomic cmpxchg and thus need
>> +		 * slab_lock() which could be preempted by a nmi.
> 
> maybe "double-width atomic cmpxchg" is more accurate considering
> e.g.) x86-32 implements cmpxchg8b?

OK. Using "double-width atomic cmpxchg" is much more accurate
as it perfectly covers both 32-bit and 64-bit platforms, and
aligns well with the __CMPXCHG_DOUBLE flag.

I will send out v2 with this update later if no more comments.

Thanks,
Tiezhu

