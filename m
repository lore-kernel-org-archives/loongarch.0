Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E115184F
	for <loongarch@lists.linux.dev>; Mon, 13 Mar 2023 05:19:51 +0000 (UTC)
X-UUID: 4ee9ad19c9b045beac41d4a0fac29c62-20230313
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:5eb4b174-43b0-4c81-8feb-bd17ac4628d5,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:4,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:14
X-CID-INFO: VERSION:1.1.20,REQID:5eb4b174-43b0-4c81-8feb-bd17ac4628d5,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:4,FILE:0,BULK:0,RULE:Release_HamU,ACTION:
	release,TS:14
X-CID-META: VersionHash:25b5999,CLOUDID:78bb05b3-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:230313105556PTETS613,BulkQuantity:0,Recheck:0,SF:38|23|16|19|42|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 4ee9ad19c9b045beac41d4a0fac29c62-20230313
X-User: lienze@kylinos.cn
Received: from [172.30.60.63] [(210.12.40.82)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1229125721; Mon, 13 Mar 2023 10:55:55 +0800
Message-ID: <35f61f336d390c0117270fc4b5a0f842dd459083.camel@kylinos.cn>
Subject: Re: [PATCH] LoongArch: use EXCCODE_INT_START instead of hard coded
 value
From: Enze Li <lienze@kylinos.cn>
To: chenhuacai@kernel.org, kernel@xen0n.name
Cc: loongarch@lists.linux.dev, enze.li@gmx.com
Date: Mon, 13 Mar 2023 10:55:54 +0800
In-Reply-To: <20230224033017.15653-1-lienze@kylinos.cn>
References: <20230224033017.15653-1-lienze@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hi Huacai,

Kindly PING for this tiny patch. :)

Thanks,
Enze

On Fri, 2023-02-24 at 11:30 +0800, Enze Li wrote:
> The for loop in per_cpu_trap_init function use a hard coded length
> while
> setting default exception handler.  Use the proper define instead of
> hard coded value.
> 
> Signed-off-by: Enze Li <lienze@kylinos.cn>
> ---
>  arch/loongarch/kernel/traps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/kernel/traps.c
> b/arch/loongarch/kernel/traps.c
> index de8ebe20b666..7d5784eccf19 100644
> --- a/arch/loongarch/kernel/traps.c
> +++ b/arch/loongarch/kernel/traps.c
> @@ -755,7 +755,7 @@ void per_cpu_trap_init(int cpu)
>  
>  	/* Initialise exception handlers */
>  	if (cpu == 0)
> -		for (i = 0; i < 64; i++)
> +		for (i = 0; i < EXCCODE_INT_START; i++)
>  			set_handler(i * VECSIZE, handle_reserved,
> VECSIZE);
>  
>  	tlb_init(cpu);
> 
> base-commit: 804f6d04b1adae9602edbd6410c0ba3a556964fe

