Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B032902
	for <loongarch@lists.linux.dev>; Fri, 24 Feb 2023 08:56:33 +0000 (UTC)
X-UUID: c9717bd47cae43d0911e1fd4d8dc24da-20230224
X-CPASD-INFO: 7dd45989569642d19af65cc12933cc8f@gLSeVGJsZmlhVnuCg3Wva1mSlmZlj4O
	AdHNTY5GTZIaVhH5xTV5nX1V9gnNXZF5dXFV3dnBQYmBhXVJ3i3-XblBgXoZgUZB3hqaeVGVnaA==
X-CLOUD-ID: 7dd45989569642d19af65cc12933cc8f
X-CPASD-SUMMARY: SIP:-1,APTIP:-2.0,KEY:0.0,FROMBLOCK:1,OB:0.0,URL:-5,TVAL:168.
	0,ESV:0.0,ECOM:-5.0,ML:0.0,FD:0.0,CUTS:145.0,IP:-3.0,MAL:-5.0,PHF:-5.0,PHC:-5
	.0,SPF:4.0,EDMS:-5,IPLABEL:-5.0,FROMTO:0,AD:0,FFOB:0.0,CFOB:0.0,SPC:0,SIG:-5,
	AUF:9,DUF:16924,ACD:243,DCD:243,SL:0,EISP:0,AG:0,CFC:0.397,CFSR:0.09,UAT:0,RA
	F:2,IMG:-5.0,DFA:0,DTA:0,IBL:-5,ADI:-5,SBL:0,REDM:0,REIP:0,ESB:0,ATTNUM:0,EAF
	:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: c9717bd47cae43d0911e1fd4d8dc24da-20230224
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: c9717bd47cae43d0911e1fd4d8dc24da-20230224
X-User: lienze@kylinos.cn
Received: from [172.30.60.63] [(210.12.40.82)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 957161311; Fri, 24 Feb 2023 16:56:32 +0800
Message-ID: <35436454a1bdd4c98896a14b1d2e96f90d828057.camel@kylinos.cn>
Subject: Re: [PATCH] LoongArch/syscall: remove asm/unistd.h include from
 syscall.c
From: Enze Li <lienze@kylinos.cn>
To: WANG Xuerui <kernel@xen0n.name>, chenhuacai@kernel.org,
 xry111@xry111.site
Cc: loongarch@lists.linux.dev, enze.li@gmx.com
Date: Fri, 24 Feb 2023 16:56:25 +0800
In-Reply-To: <78e9232e-ff2f-fc17-edc2-560c5bced72b@xen0n.name>
References: <20230224064921.299908-1-lienze@kylinos.cn>
	 <78e9232e-ff2f-fc17-edc2-560c5bced72b@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hi Xuerui, Ruoyao,

Thanks for your swift reply.

On Fri, 2023-02-24 at 15:39 +0800, WANG Xuerui wrote:
> On 2023/2/24 14:49, Enze Li wrote:
> > At first glance, this inclusion looks weird.  After digging
> > further, I
> 
> It's not weird, it's just overriding the fallback entries with
> actual 
> function pointers for the existing supported syscalls.

Thanks again for pointing out the actual mechanism.

It's clear that I should have checked the preprocessing source code
while digging further.

> 
> > realized that there's no need to include the "asm/unistd.h"
> > file.  I've
> > tested this patch for a few weeks, and didn't see any regressions.
> > Therefore, removes the unnecessary inclusion.
> > 
> > Signed-off-by: Enze Li <lienze@kylinos.cn>
> > ---
> >   arch/loongarch/kernel/syscall.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/arch/loongarch/kernel/syscall.c
> > b/arch/loongarch/kernel/syscall.c
> > index 3fc4211db989..4dea411e9e0d 100644
> > --- a/arch/loongarch/kernel/syscall.c
> > +++ b/arch/loongarch/kernel/syscall.c
> > @@ -31,7 +31,6 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr,
> > unsigned long, len, unsigned long,
> >   
> >   void *sys_call_table[__NR_syscalls] = {
> >   	[0 ... __NR_syscalls - 1] = sys_ni_syscall,
> > -#include <asm/unistd.h>
> 
> Is this really supposed to work? You're removing *every* handler
> from 
> the syscall table so every single syscall will just -ENOSYS. I don't 
> believe you can test such a kernel "for a few weeks without
> regressions".

Oops!  Sorry about that, I've been kind of flaky these days :(  Maybe
some other patches, I'm not quite sure.

Anyway, I'll devote more attention to the following work (Especially
for testing).  Please drop this one as it is unnecessary.

Best Regards,
Enze

> 
> >   };
> >   
> >   typedef long (*sys_call_fn)(unsigned long, unsigned long,
> > 
> > base-commit: 804f6d04b1adae9602edbd6410c0ba3a556964fe

