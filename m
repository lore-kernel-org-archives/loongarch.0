Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142482F3638
	for <loongarch@lists.linux.dev>; Sat, 20 Dec 2025 05:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766209445; cv=none; b=PBlCskwmm6a3LbCCoY5QWqZ0UADpSovW+H/rJ8LIHMPeer6e0Q8Pqjt7OlggJXO+WghOGWoFm+EnEwqbcHe1GALMJ6tdkty4KagzFiOS3U1E2GoswseA+k2rS0RtZhzWHOZrDgVtzvl/TmomuI85eOzcCmCb5bu3nqWCpu89CUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766209445; c=relaxed/simple;
	bh=2rUEeNaiXe0HgQEU0UbwqKlxkxSjadYoOlLr3HUE5Xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NZ06RZ3xPSTTJ1PlDJD0aYGfhO51Be9sPxI662+DKgA+qq1rf8KOQ/UoCsAY9f87KIDU1NpzyQHPqA4yKCulGcZbv7zjh+JyXO8E5Gqr9P0yFA+2sqmuVyl7n6Dy7r/8EIsjB62Cky9T2L/WCF1vevJeb7Fv0rdZXz12h9gLuxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: db8d1ab4dd6611f0a38c85956e01ac42-20251220
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:51651edb-493c-41a1-801f-dabd13d97b87,IP:10,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:5
X-CID-INFO: VERSION:1.3.6,REQID:51651edb-493c-41a1-801f-dabd13d97b87,IP:10,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:5
X-CID-META: VersionHash:a9d874c,CLOUDID:ff1733cf03d1e39fa358ca7d4eb7e3f6,BulkI
	D:251219101318D8IDDZQS,BulkQuantity:2,Recheck:0,SF:17|19|38|64|66|78|80|81
	|82|83|102|127|841|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,
	RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DK
	P:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: db8d1ab4dd6611f0a38c85956e01ac42-20251220
X-User: lienze@kylinos.cn
Received: from [192.168.3.106] [(61.48.209.219)] by mailgw.kylinos.cn
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1618505666; Sat, 20 Dec 2025 13:43:48 +0800
Message-ID: <b2e84054-bf3b-4a1a-b946-bd024f341512@kylinos.cn>
Date: Sat, 20 Dec 2025 13:43:46 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] LoongArch: kfence: avoid use
 CONFIG_KFENCE_NUM_OBJECTS
To: Huacai Chen <chenhuacai@kernel.org>, yuan linyu <yuanlinyu@honor.com>
Cc: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, WANG Xuerui <kernel@xen0n.name>,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, enze.li@gmx.com
References: <20251218063916.1433615-1-yuanlinyu@honor.com>
 <20251218063916.1433615-2-yuanlinyu@honor.com>
 <CAAhV-H5n_3Ndk5yRm=S-9WktD9xivVF8-JLaycV8JB-pVuybbA@mail.gmail.com>
Content-Language: en-US
From: Enze Li <lienze@kylinos.cn>
In-Reply-To: <CAAhV-H5n_3Ndk5yRm=S-9WktD9xivVF8-JLaycV8JB-pVuybbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025/12/19 10:13, Huacai Chen wrote:
> Hi, Enze,
> 
> On Thu, Dec 18, 2025 at 2:39 PM yuan linyu <yuanlinyu@honor.com> wrote:
>>
>> use common kfence macro KFENCE_POOL_SIZE for KFENCE_AREA_SIZE definition
>>
>> Signed-off-by: yuan linyu <yuanlinyu@honor.com>
>> ---
>>  arch/loongarch/include/asm/pgtable.h | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
>> index f41a648a3d9e..e9966c9f844f 100644
>> --- a/arch/loongarch/include/asm/pgtable.h
>> +++ b/arch/loongarch/include/asm/pgtable.h
>> @@ -10,6 +10,7 @@
>>  #define _ASM_PGTABLE_H
>>
>>  #include <linux/compiler.h>
>> +#include <linux/kfence.h>
>>  #include <asm/addrspace.h>
>>  #include <asm/asm.h>
>>  #include <asm/page.h>
>> @@ -96,7 +97,7 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
>>  #define MODULES_END    (MODULES_VADDR + SZ_256M)
>>
>>  #ifdef CONFIG_KFENCE
>> -#define KFENCE_AREA_SIZE       (((CONFIG_KFENCE_NUM_OBJECTS + 1) * 2 + 2) * PAGE_SIZE)
>> +#define KFENCE_AREA_SIZE       (KFENCE_POOL_SIZE + (2 * PAGE_SIZE))
> Can you remember why you didn't use KFENCE_POOL_SIZE at the first place?

I don't recall the exact reason off the top of my head, but I believe it
was due to complex dependency issues with the header files where
KFENCE_POOL_SIZE is defined.  To avoid those complications, we likely
opted to use KFENCE_NUM_OBJECTS directly.

I checked out the code at commit
(6ad3df56bb199134800933df2afcd7df3b03ef33 "LoongArch: Add KFENCE (Kernel
Electric-Fence) support") and encountered the following errors when
compiling with this patch applied.

8<------------------------------------------------------
  CC      arch/loongarch/kernel/asm-offsets.s
In file included from ./arch/loongarch/include/asm/pgtable.h:13,
                 from ./include/linux/pgtable.h:6,
                 from ./include/linux/mm.h:29,
                 from arch/loongarch/kernel/asm-offsets.c:9:
./include/linux/kfence.h:93:35: warning: 'struct kmem_cache' declared
inside parameter list will n
ot be visible outside of this definition or declaration
   93 | void kfence_shutdown_cache(struct kmem_cache *s);
      |                                   ^~~~~~~~~~
./include/linux/kfence.h:99:29: warning: 'struct kmem_cache' declared
inside parameter list will n
ot be visible outside of this definition or declaration
   99 | void *__kfence_alloc(struct kmem_cache *s, size_t size, gfp_t
flags);
      |                             ^~~~~~~~~~
./include/linux/kfence.h:117:50: warning: 'struct kmem_cache' declared
inside parameter list will
not be visible outside of this definition or declaration
  117 | static __always_inline void *kfence_alloc(struct kmem_cache *s,
size_t size, gfp_t flags)
      |                                                  ^~~~~~~~~~
./include/linux/kfence.h: In function 'kfence_alloc':
./include/linux/kfence.h:128:31: error: passing argument 1 of
'__kfence_alloc' from incompatible p
ointer type [-Wincompatible-pointer-types]
  128 |         return __kfence_alloc(s, size, flags);
      |                               ^
      |                               |
      |                               struct kmem_cache *
./include/linux/kfence.h:99:41: note: expected 'struct kmem_cache *' but
argument is of type 'stru
ct kmem_cache *'
   99 | void *__kfence_alloc(struct kmem_cache *s, size_t size, gfp_t
flags);
      |                      ~~~~~~~~~~~~~~~~~~~^
------------------------------------------------------>8

Similarly, after applying this patch to the latest code
(dd9b004b7ff3289fb7bae35130c0a5c0537266af "Merge tag 'trace-v6.19-rc1'")
from the master branch of the Linux repository and enabling KFENCE, I
encountered the following compilation errors.

8<------------------------------------------------------
  CC      arch/loongarch/kernel/asm-offsets.s
In file included from ./arch/loongarch/include/asm/pgtable.h:13,
                 from ./include/linux/pgtable.h:6,
                 from ./include/linux/mm.h:31,
                 from arch/loongarch/kernel/asm-offsets.c:11:
./include/linux/kfence.h:97:35: warning: 'struct kmem_cache' declared
inside parameter list will n
ot be visible outside of this definition or declaration
   97 | void kfence_shutdown_cache(struct kmem_cache *s);
      |                                   ^~~~~~~~~~
./include/linux/kfence.h:103:29: warning: 'struct kmem_cache' declared
inside parameter list will
not be visible outside of this definition or declaration
  103 | void *__kfence_alloc(struct kmem_cache *s, size_t size, gfp_t
flags);
      |                             ^~~~~~~~~~
./include/linux/kfence.h:121:50: warning: 'struct kmem_cache' declared
inside parameter list will
not be visible outside of this definition or declaration
  121 | static __always_inline void *kfence_alloc(struct kmem_cache *s,
size_t size, gfp_t flags)
      |                                                  ^~~~~~~~~~
./include/linux/kfence.h: In function 'kfence_alloc':
./include/linux/kfence.h:132:31: error: passing argument 1 of
'__kfence_alloc' from incompatible p
ointer type [-Wincompatible-pointer-types]
  132 |         return __kfence_alloc(s, size, flags);
      |                               ^
      |                               |
      |                               struct kmem_cache *
./include/linux/kfence.h:103:41: note: expected 'struct kmem_cache *'
but argument is of type 'str
uct kmem_cache *'
  103 | void *__kfence_alloc(struct kmem_cache *s, size_t size, gfp_t
flags);
      |                      ~~~~~~~~~~~~~~~~~~~^
------------------------------------------------------>8

So, this patch currently runs into compilation issues.  linyu probably
didn't have KFENCE enabled when compiling locally, which is why this
error was missed.  You can enable it as follows:

  Kernel hacking
    Memory Debugging
      [*] KFENCE: low-overhead sampling-based memory safety

Thanks,
Enze

<...>
