Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1687D2F24
	for <loongarch@lists.linux.dev>; Wed, 12 Apr 2023 09:54:49 +0000 (UTC)
X-UUID: 35eeddcdc4954451ab74c89fb61f2d95-20230412
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:376d09bc-b81f-48fb-97c0-ac0579071961,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-INFO: VERSION:1.1.22,REQID:376d09bc-b81f-48fb-97c0-ac0579071961,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:7e0ed183-cd9c-45f5-8134-710979e3df0e,B
	ulkID:230412170848Z8CZ0TBW,BulkQuantity:2,Recheck:0,SF:24|17|19|44|38|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 35eeddcdc4954451ab74c89fb61f2d95-20230412
X-User: lienze@kylinos.cn
Received: from [172.30.60.63] [(210.12.40.82)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 111464440; Wed, 12 Apr 2023 17:54:43 +0800
Message-ID: <163de01b34fd5c7207f849c51bdb2eea2ae719aa.camel@kylinos.cn>
Subject: Re: [PATCH] LoongArch: Use VALEN instead of hard code in comments
From: Enze Li <lienze@kylinos.cn>
To: WANG Xuerui <kernel@xen0n.name>, chenhuacai@kernel.org
Cc: loongarch@lists.linux.dev, enze.li@gmx.com
Date: Wed, 12 Apr 2023 17:54:00 +0800
In-Reply-To: <d5f906aa-2fcd-90c0-09dc-df1d8f0cd643@xen0n.name>
References: <20230412025525.116668-1-lienze@kylinos.cn>
	 <d5f906aa-2fcd-90c0-09dc-df1d8f0cd643@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hi Xuerui,

Thanks for your review.

On Wed, 2023-04-12 at 17:08 +0800, WANG Xuerui wrote:
> On 2023/4/12 10:55, Enze Li wrote:
> > Refer to the online documentation[1] for Loongson, use the accurate
> > VALEN in comments to avoid misleading others.
> 
> Reworded some Chinglish for you:

My English sucks :( Please bear with me.

> 
> Subject: LoongArch: Replace hard-coded values in comments with VALEN
> 
> According to LoongArch documentation [1], CSR.PGDL and CSR.PGDH are 
> concerned with the VA's MSB which is VALEN-1 instead of always being
> 47. 
> Fix comments to avoid misleading others.
> 
> > [1] 
> > https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#page-global-directory-base-address-for-lower-half-address-space
> 
> Nit: add a colon after [1]. (i.e. "[1]: xxxxx")
> 
> > Signed-off-by: Enze Li <lienze@kylinos.cn>
> > ---
> >   arch/loongarch/include/asm/loongarch.h | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/loongarch/include/asm/loongarch.h
> > b/arch/loongarch/include/asm/loongarch.h
> > index 65b7dcdea16d..a182a1579148 100644
> > --- a/arch/loongarch/include/asm/loongarch.h
> > +++ b/arch/loongarch/include/asm/loongarch.h
> > @@ -423,9 +423,9 @@ static __always_inline void iocsr_write64(u64
> > val, u32 reg)
> >   #define  CSR_ASID_ASID_WIDTH		10
> >   #define  CSR_ASID_ASID			(_ULCAST_(0x3ff) <<
> > CSR_ASID_ASID_SHIFT)
> >   
> > -#define LOONGARCH_CSR_PGDL		0x19	/* Page table base
> > address when VA[47] = 0 */
> > +#define LOONGARCH_CSR_PGDL		0x19	/* Page table base
> > address when VA[VALEN-1] = 0 */
> >   
> > -#define LOONGARCH_CSR_PGDH		0x1a	/* Page table base
> > address when VA[47] = 1 */
> > +#define LOONGARCH_CSR_PGDH		0x1a	/* Page table base
> > address when VA[VALEN-1] = 1 */
> >   
> >   #define LOONGARCH_CSR_PGD		0x1b	/* Page table base
> > */
> >   
> > 
> > base-commit: fc89d7fb499b0162e081f434d45e8d1b47e82ece
> 
> Change itself is trivial enough, thanks!

I was very impressed with your patience and willingness to help.

Best Regards,
Enze

> 
> With the nits addressed: (Huacai may apply the suggestion while
> applying 
> to loongarch-next, so you won't have to resend v2)
> 
> Reviewed-by: WANG Xuerui <git@xen0n.name>
> 

