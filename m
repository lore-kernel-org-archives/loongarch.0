Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A3023A7
	for <loongarch@lists.linux.dev>; Mon, 13 Mar 2023 09:18:29 +0000 (UTC)
X-UUID: 7810a74f1e444c5eaeda0a22040f851f-20230313
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:1870c969-fa28-4846-86a6-54ff5edf3bdd,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:1,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:6
X-CID-INFO: VERSION:1.1.20,REQID:1870c969-fa28-4846-86a6-54ff5edf3bdd,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:1,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:6
X-CID-META: VersionHash:25b5999,CLOUDID:c8bea0f5-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230313105556PTETS613,BulkQuantity:2,Recheck:0,SF:23|17|19|42|102,TC:
	nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 7810a74f1e444c5eaeda0a22040f851f-20230313
X-User: lienze@kylinos.cn
Received: from [172.30.60.63] [(210.12.40.82)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1147020156; Mon, 13 Mar 2023 17:18:22 +0800
Message-ID: <98fd597524d6a04bffab13c01dbcf0801d0a59ba.camel@kylinos.cn>
Subject: Re: [PATCH] LoongArch: use EXCCODE_INT_START instead of hard coded
 value
From: Enze Li <lienze@kylinos.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, enze.li@gmx.com
Date: Mon, 13 Mar 2023 17:18:21 +0800
In-Reply-To: <CAAhV-H5nFj8U_cp3o0Q41OhFZN+K809A=TbGbw0c=CpQnBCa0g@mail.gmail.com>
References: <20230224033017.15653-1-lienze@kylinos.cn>
	 <35f61f336d390c0117270fc4b5a0f842dd459083.camel@kylinos.cn>
	 <CAAhV-H5nFj8U_cp3o0Q41OhFZN+K809A=TbGbw0c=CpQnBCa0g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Huacai,

Thanks for your review :)

On Mon, 2023-03-13 at 15:52 +0800, Huacai Chen wrote:
> Though EXCCODE_INT_START is 64, its meaning is not suitable in this
> case.

Humm...Yeah.  Sharing the same macro may make things difficult to
understand.

What about defining a new macro to indicate this?  Something like
EXCCODE_NOR_NUM or EXCCODE_EXC_NUM?

For a newcomer, thank you in advance for your patience.

Thanks,
Enze

> 
> Huacai
> 
> On Mon, Mar 13, 2023 at 12:42 PM Enze Li <lienze@kylinos.cn> wrote:
> > Hi Huacai,
> > 
> > Kindly PING for this tiny patch. :)
> > 
> > Thanks,
> > Enze
> > 
> > On Fri, 2023-02-24 at 11:30 +0800, Enze Li wrote:
> > > The for loop in per_cpu_trap_init function use a hard coded
> > > length
> > > while
> > > setting default exception handler.  Use the proper define instead
> > > of
> > > hard coded value.
> > > 
> > > Signed-off-by: Enze Li <lienze@kylinos.cn>
> > > ---
> > >  arch/loongarch/kernel/traps.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/loongarch/kernel/traps.c
> > > b/arch/loongarch/kernel/traps.c
> > > index de8ebe20b666..7d5784eccf19 100644
> > > --- a/arch/loongarch/kernel/traps.c
> > > +++ b/arch/loongarch/kernel/traps.c
> > > @@ -755,7 +755,7 @@ void per_cpu_trap_init(int cpu)
> > > 
> > >       /* Initialise exception handlers */
> > >       if (cpu == 0)
> > > -             for (i = 0; i < 64; i++)
> > > +             for (i = 0; i < EXCCODE_INT_START; i++)
> > >                       set_handler(i * VECSIZE, handle_reserved,
> > > VECSIZE);
> > > 
> > >       tlb_init(cpu);
> > > 
> > > base-commit: 804f6d04b1adae9602edbd6410c0ba3a556964fe

