Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B8620DD48
	for <loongarch@lists.linux.dev>; Mon, 22 Dec 2025 09:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766396252; cv=none; b=MT6FpB8DpZmUGrSUfnfMm+4QoqsBSnM7kOaJJ7iJzuqcg4xlpr0y1+yst5Z7DkYVH2fyjl4iFBrxm4jGkUBIVDx0xJ0fnZJdmNzp6t3BUUAKE1HEv7EUky/WUUQhNCckRcIq0f4i3jzRmP+quXFF5iUdrkF1KJQC+1vcImAgrmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766396252; c=relaxed/simple;
	bh=pq0QymWSi/nn1vuRTyHrD7rcnF42YaRBMHZqtdUaKLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iw1jHp3ro/JVLI3Uamo7J17OC70Nvo2H6crougVhWAp1sL+iLOWz/133fhFF9weXZGwa2BOGEXRXcK9aV6MkcWJJwVd1mdsfgxufoGn4NCbHhXg2v3PyvSjT4jNiwFjWdJG+X1oK30Y40ICbJzcyE6bAQ7XXsUCcVvmX0SzftCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d11e6e98df1911f0a38c85956e01ac42-20251222
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:de4d8268-dc8d-48f1-805e-f682d3a06cd1,IP:10,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:5
X-CID-INFO: VERSION:1.3.6,REQID:de4d8268-dc8d-48f1-805e-f682d3a06cd1,IP:10,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:5
X-CID-META: VersionHash:a9d874c,CLOUDID:ccaa6ce40de7d863f75bdf900ecd0ee9,BulkI
	D:251219101318D8IDDZQS,BulkQuantity:6,Recheck:0,SF:17|19|38|64|66|78|80|81
	|82|83|102|127|841|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,
	RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DK
	P:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d11e6e98df1911f0a38c85956e01ac42-20251222
X-User: lienze@kylinos.cn
Received: from [192.168.31.182] [(183.242.174.20)] by mailgw.kylinos.cn
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1610835472; Mon, 22 Dec 2025 17:37:22 +0800
Message-ID: <44d4cf82-982c-455b-85c1-138e8c37cc8f@kylinos.cn>
Date: Mon, 22 Dec 2025 17:37:19 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] LoongArch: kfence: avoid use
 CONFIG_KFENCE_NUM_OBJECTS
To: yuanlinyu <yuanlinyu@honor.com>, Huacai Chen <chenhuacai@kernel.org>
Cc: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, WANG Xuerui <kernel@xen0n.name>,
 "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "enze.li@gmx.com" <enze.li@gmx.com>
References: <20251218063916.1433615-1-yuanlinyu@honor.com>
 <20251218063916.1433615-2-yuanlinyu@honor.com>
 <CAAhV-H5n_3Ndk5yRm=S-9WktD9xivVF8-JLaycV8JB-pVuybbA@mail.gmail.com>
 <b2e84054-bf3b-4a1a-b946-bd024f341512@kylinos.cn>
 <ab69f5a942824394af6010f75a06c5f7@honor.com>
Content-Language: en-US
From: Enze Li <lienze@kylinos.cn>
In-Reply-To: <ab69f5a942824394af6010f75a06c5f7@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/22/25 5:16 PM, yuanlinyu wrote:
>> From: Enze Li <lienze@kylinos.cn>
>> Sent: Saturday, December 20, 2025 1:44 PM
>> To: Huacai Chen <chenhuacai@kernel.org>; yuanlinyu <yuanlinyu@honor.com>
>> Cc: Alexander Potapenko <glider@google.com>; Marco Elver
>> <elver@google.com>; Dmitry Vyukov <dvyukov@google.com>; Andrew Morton
>> <akpm@linux-foundation.org>; WANG Xuerui <kernel@xen0n.name>;
>> kasan-dev@googlegroups.com; linux-mm@kvack.org; loongarch@lists.linux.dev;
>> linux-kernel@vger.kernel.org; enze.li@gmx.com
>> Subject: Re: [PATCH v2 1/2] LoongArch: kfence: avoid use
>> CONFIG_KFENCE_NUM_OBJECTS
>>
>> On 2025/12/19 10:13, Huacai Chen wrote:
>>> Hi, Enze,
>>>
>>> On Thu, Dec 18, 2025 at 2:39 PM yuan linyu <yuanlinyu@honor.com> wrote:
>>>>
>>>> use common kfence macro KFENCE_POOL_SIZE for KFENCE_AREA_SIZE
>>>> definition
>>>>
>>>> Signed-off-by: yuan linyu <yuanlinyu@honor.com>
>>>> ---
>>>>  arch/loongarch/include/asm/pgtable.h | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/loongarch/include/asm/pgtable.h
>>>> b/arch/loongarch/include/asm/pgtable.h
>>>> index f41a648a3d9e..e9966c9f844f 100644
>>>> --- a/arch/loongarch/include/asm/pgtable.h
>>>> +++ b/arch/loongarch/include/asm/pgtable.h
>>>> @@ -10,6 +10,7 @@
>>>>  #define _ASM_PGTABLE_H
>>>>
>>>>  #include <linux/compiler.h>
>>>> +#include <linux/kfence.h>
>>>>  #include <asm/addrspace.h>
>>>>  #include <asm/asm.h>
>>>>  #include <asm/page.h>
>>>> @@ -96,7 +97,7 @@ extern unsigned long empty_zero_page[PAGE_SIZE /
>> sizeof(unsigned long)];
>>>>  #define MODULES_END    (MODULES_VADDR + SZ_256M)
>>>>
>>>>  #ifdef CONFIG_KFENCE
>>>> -#define KFENCE_AREA_SIZE       (((CONFIG_KFENCE_NUM_OBJECTS + 1)
>> * 2 + 2) * PAGE_SIZE)
>>>> +#define KFENCE_AREA_SIZE       (KFENCE_POOL_SIZE + (2 *
>> PAGE_SIZE))
>>> Can you remember why you didn't use KFENCE_POOL_SIZE at the first place?
>>
>> I don't recall the exact reason off the top of my head, but I believe it was due to
>> complex dependency issues with the header files where KFENCE_POOL_SIZE is
>> defined.  To avoid those complications, we likely opted to use
>> KFENCE_NUM_OBJECTS directly.
>>
>> I checked out the code at commit
>> (6ad3df56bb199134800933df2afcd7df3b03ef33 "LoongArch: Add KFENCE
>> (Kernel
>> Electric-Fence) support") and encountered the following errors when compiling
>> with this patch applied.
>>
>> 8<------------------------------------------------------
>>   CC      arch/loongarch/kernel/asm-offsets.s
>> In file included from ./arch/loongarch/include/asm/pgtable.h:13,
>>                  from ./include/linux/pgtable.h:6,
>>                  from ./include/linux/mm.h:29,
>>                  from arch/loongarch/kernel/asm-offsets.c:9:
>> ./include/linux/kfence.h:93:35: warning: 'struct kmem_cache' declared inside
>> parameter list will n ot be visible outside of this definition or declaration
>>    93 | void kfence_shutdown_cache(struct kmem_cache *s);
>>       |                                   ^~~~~~~~~~
>> ./include/linux/kfence.h:99:29: warning: 'struct kmem_cache' declared inside
>> parameter list will n ot be visible outside of this definition or declaration
>>    99 | void *__kfence_alloc(struct kmem_cache *s, size_t size, gfp_t flags);
>>       |                             ^~~~~~~~~~
>> ./include/linux/kfence.h:117:50: warning: 'struct kmem_cache' declared inside
>> parameter list will not be visible outside of this definition or declaration
>>   117 | static __always_inline void *kfence_alloc(struct kmem_cache *s, size_t
>> size, gfp_t flags)
>>       |
>> ^~~~~~~~~~
>> ./include/linux/kfence.h: In function 'kfence_alloc':
>> ./include/linux/kfence.h:128:31: error: passing argument 1 of '__kfence_alloc'
>> from incompatible p ointer type [-Wincompatible-pointer-types]
>>   128 |         return __kfence_alloc(s, size, flags);
>>       |                               ^
>>       |                               |
>>       |                               struct kmem_cache *
>> ./include/linux/kfence.h:99:41: note: expected 'struct kmem_cache *' but
>> argument is of type 'stru ct kmem_cache *'
>>    99 | void *__kfence_alloc(struct kmem_cache *s, size_t size, gfp_t flags);
>>       |                      ~~~~~~~~~~~~~~~~~~~^
>> ------------------------------------------------------>8
>>
>> Similarly, after applying this patch to the latest code
>> (dd9b004b7ff3289fb7bae35130c0a5c0537266af "Merge tag 'trace-v6.19-rc1'")
>> from the master branch of the Linux repository and enabling KFENCE, I
>> encountered the following compilation errors.
>>
>> 8<------------------------------------------------------
>>   CC      arch/loongarch/kernel/asm-offsets.s
>> In file included from ./arch/loongarch/include/asm/pgtable.h:13,
>>                  from ./include/linux/pgtable.h:6,
>>                  from ./include/linux/mm.h:31,
>>                  from arch/loongarch/kernel/asm-offsets.c:11:
>> ./include/linux/kfence.h:97:35: warning: 'struct kmem_cache' declared inside
>> parameter list will n ot be visible outside of this definition or declaration
>>    97 | void kfence_shutdown_cache(struct kmem_cache *s);
>>       |                                   ^~~~~~~~~~
>> ./include/linux/kfence.h:103:29: warning: 'struct kmem_cache' declared inside
>> parameter list will not be visible outside of this definition or declaration
>>   103 | void *__kfence_alloc(struct kmem_cache *s, size_t size, gfp_t flags);
>>       |                             ^~~~~~~~~~
>> ./include/linux/kfence.h:121:50: warning: 'struct kmem_cache' declared inside
>> parameter list will not be visible outside of this definition or declaration
>>   121 | static __always_inline void *kfence_alloc(struct kmem_cache *s, size_t
>> size, gfp_t flags)
>>       |
>> ^~~~~~~~~~
>> ./include/linux/kfence.h: In function 'kfence_alloc':
>> ./include/linux/kfence.h:132:31: error: passing argument 1 of '__kfence_alloc'
>> from incompatible p ointer type [-Wincompatible-pointer-types]
>>   132 |         return __kfence_alloc(s, size, flags);
>>       |                               ^
>>       |                               |
>>       |                               struct kmem_cache *
>> ./include/linux/kfence.h:103:41: note: expected 'struct kmem_cache *'
>> but argument is of type 'str
>> uct kmem_cache *'
>>   103 | void *__kfence_alloc(struct kmem_cache *s, size_t size, gfp_t flags);
>>       |                      ~~~~~~~~~~~~~~~~~~~^
>> ------------------------------------------------------>8
>>
>> So, this patch currently runs into compilation issues.  linyu probably didn't have
>> KFENCE enabled when compiling locally, which is why this error was missed.
>> You can enable it as follows:
>>
>>   Kernel hacking
>>     Memory Debugging
>>       [*] KFENCE: low-overhead sampling-based memory safety
> 
> Hi Enze,
> 
> Sorry only test on arm64.
> 
> Could you help fix the compile issue and provide a correct change ?
> 
> Or I need sometime to resolve the issue.
> 

Thanks for pointing out this issue.  I've taken a look at the
compilation problem you mentioned.  Based on my current understanding,
the header dependencies are quite complex, and I couldn't find a
straightforward fix without potentially affecting other parts of the
codebase.

Given the risk of introducing broader compilation errors, I think it
might be safer to hold off on using the KFENCE_POOL_SIZE macro for now,
unless there's a clear and safe path forward that I might have missed.
I'm happy to discuss this further if you have any insights or suggestions.

Thanks,
Enze



