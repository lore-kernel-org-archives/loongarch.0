Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90458471CFB
	for <loongarch@lists.linux.dev>; Wed, 19 Aug 2026 11:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787140127; cv=none; b=GPQ0DFg4vnsS3KD0mb9VaE1t71XXOGjR9vO368tCn4Nx3rHyRIHXuXihn4rjR36TGaPMZpT1rRYJncun1XSQMfJ7AKfu8ARCFjrTqih/+IyI4PV87Vgtgutk4AatHJKnUTul+UE+KKGJi/caGP9q6c8X4FNXcWhPOOwKsUKzCKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787140127; c=relaxed/simple;
	bh=hlqPu8zxYhXjAp0RnMZVNI6hpIt1GyNxw1ypjjho7mg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHTo5vs6W8i+XeZeZB1vNg2RG7tHk7zuqtcMePqROdR76mdo72uElF7MuPllGI0OSzQ9iApoAhCq2znsKhSgDZUBwT8Khjb1UPayeL/z7TdOkbA85siWTS1Eg3TpKrEj4q59dVjnGw5FTnx5ZNErx2Gjr52SOeOJdv7cIoHaRc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBy+2WjD; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBy+2WjD"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so1105797e87.0
        for <loongarch@lists.linux.dev>; Wed, 19 Aug 2026 04:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787140122; x=1787744922; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Neo+1K8ghUMGN3G9vUjB7A1LbHA9OhMwHPbvzVv5Wg=;
        b=WBy+2WjDW34h6XuEvB0akmDIidiqXB7utoY09oskyuEveiit2++IDg8Dx+ghlw4jax
         Ji5FdADHYd47rChmrDrez7pYSAu9x/4keDsG8opyP8Gp42qok1Te2pfZCgmtrjHdJxOc
         XgQMQfpJ1Tqa9pbkihGscBxCLoXVz+fm/FPLb3shk+e6eGqtXjOB8LG+fpvU6mcx59Ny
         qnJrLXB9zOGWYLbum96FraFf/XUqyKeG1KnAuaokKvup004rpEv5iBTH+JilxpVPbe3f
         E57ImID3kUY2ieuwwP32KZSrziNNN//1oMJxWigG9u8STJP963gPcJ/rJvucINOhceRA
         kyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787140122; x=1787744922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Neo+1K8ghUMGN3G9vUjB7A1LbHA9OhMwHPbvzVv5Wg=;
        b=gCGocIjfxkoTGIEv8xQ1lHc1gMKfxm77RRIGZmbz7rn6CZ9mgiohuDRPcf67EZBrVm
         BUhtvWX4NzF99zgSQ4k9/R3eI/Gg8legvTGLFYYm+nZrPZYu5BWgcDTPv+TRiSTKgeE1
         2v6uZC5oaj5y4/84KEwkoQ8PHTChVS2tYmbT1LDXKMmLX5K0eUq0WuxL2+hVFxa2rVX6
         Oq+z8rxYN26FTKhjZTbykNJ/BipLC+7Q5vL8zgmO5RMLM+nzHUAnQbtsNuIdsYXe2BWQ
         Lwis9TyBUcgL8r4Ic5CV85THb5e6JRSIfrqM6vsGZA861eIRePWpRn42SFXrAjAY3Sm+
         LMRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpf3ASpYWHFelTo0KhprbvimQm2hwJi0IyXd3BTMUNHCIZmzs760EbqHvJiPRSmtgUWhDibEZIQK6U=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDLFH8t3OOzs+YHwteTpac/1DPIL8qSpIfUXT0zF+Vnhe6TQ4u
	P/Y82t+kfZdSaK9AA9ZRVY70l96WwdNSwRR2k+XaxZ0zFJf3jL8rNL4h
X-Gm-Gg: AR+sD13bVGLi4tmjWGjGQs2RldLieCBoO/OxGIS4rWZMoh26KTBaxOW5/3HyjGnUGQ6
	/Mt8+YFDbOezi+vynXGdJk5d4ftg4IchEstcp6TbB/BuKABbxRdVB18rYIc02XCiTEfGGc3V5qg
	6PmIxJOPiAxOaDl2k2lE/AXX/fnnKVNpC4p/WsylWraaVJAMFvy2hLLIq08VADomMvWY5rlMqYv
	R2RwN73QP67UqS/ctAoOHXFiyvpnfxkVVln0A5DK+0aWV3g91vEV6xzePk3xIZknE1PmUstDOwW
	cU6odIXpk/p20evj165RLKRzoJU+tdZBrCHjzxYCkH4OX/IBpqWTzIe4hxsxmbFQdgMLCmf71zM
	eS44kVFjtowLajtkxhT9xXekzXrTnu8OTehAggDsJ3or9YIErXU+ngbu2cvXEpi3CosMfuCrakv
	+SI90iibswRCFr0HkdDPG4yD9hJ8MRoUbVzlIUhmBQBseI57kKSyGYbOcUnvKRhUDndl6ZUnE6o
	3KYM7P2lD9+Wxao8JcfTslFGPhYKA==
X-Received: by 2002:a05:6512:224d:b0:5b2:f453:1073 with SMTP id 2adb3069b0e04-5b478b9070dmr1376566e87.2.1787140121681;
        Wed, 19 Aug 2026 04:48:41 -0700 (PDT)
Received: from pc636 (host-95-193-137-165.mobileonline.telia.com. [95.193.137.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b478853971sm482752e87.10.2026.08.19.04.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:48:41 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 19 Aug 2026 13:48:36 +0200
To: Mike Rapoport <rppt@kernel.org>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Len Brown <lenb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 2/6] mm/vmalloc: set area's page_order after allocation
 succeeds
Message-ID: <aoWYFH_FJXlMK8fw@pc636>
References: <20260816-execmem-set-vm-perms-v0-2-v1-0-90944a3ad43f@kernel.org>
 <20260816-execmem-set-vm-perms-v0-2-v1-2-90944a3ad43f@kernel.org>
 <aoNFZU_QzghDBgbZ@milan>
 <aoVUF2pgl8JYNyIU@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoVUF2pgl8JYNyIU@kernel.org>

On Wed, Aug 19, 2026 at 09:58:31AM +0300, Mike Rapoport wrote:
> On Mon, Aug 17, 2026 at 07:31:17PM +0200, Uladzislau Rezki wrote:
> > On Sun, Aug 16, 2026 at 01:59:25PM +0300, Mike Rapoport (Microsoft) wrote:
> > > __vmalloc_area_node() calls set_vm_area_page_order() to set area's
> > > page_order before actually allocating pages to populate the area.
> > > 
> > > If allocation of large pages in HUGE_VMAP case fails midway, this leaves
> > > the area with elevated page_order throughout the cleanup path.
> > > 
> > > There is no actual issue with this because the only place that currently
> > > relies on area->page_order on the cleanup path is the loop calculating
> > > the direct map alias range in vm_reset_perms() and it anyway skips
> > > unpopulated pages.
> > > 
> > > But having set_vm_area_page_order() in the middle of __vmalloc_area_node()
> > > makes things very obscure, hard to reason about and error prone against
> > > future changes of the cleanup path.
> > > 
> > > Move the call to set_vm_area_page_order() after __vmalloc_area_node()
> > > succeeded where page order is guaranteed.
> > > 
> > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > ---
> > >  mm/vmalloc.c | 11 +++++++++--
> > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index 22566e0b6e38..6822f0fe9583 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -3901,8 +3901,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
> > >  		goto fail;
> > >  	}
> > >  
> > > -	set_vm_area_page_order(area, page_shift - PAGE_SHIFT);
> > > -	page_order = vm_area_page_order(area);
> > > +	page_order = page_shift - PAGE_SHIFT;
> > >  
> > >  	/*
> > >  	 * High-order nofail allocations are really expensive and
> > > @@ -4106,6 +4105,14 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
> > >  	if (!ret)
> > >  		goto fail;
> > >  
> > > +	/*
> > > +	 * Set area->page_order once it's known exactly that the order of the
> > > +	 * pages the area contains.
> > > +	 * Even if we succeeded to partially populate the area with large pages,
> > > +	 * still treat the area as populated with order-0 pages.
> > > +	 */
> > > +	set_vm_area_page_order(area, shift - PAGE_SHIFT);
> > > +
> > >  	/*
> > >  	 * Mark the pages as accessible, now that they are mapped.
> > >  	 * The condition for setting KASAN_VMALLOC_INIT should complement the
> > > 
> > > -- 
> > > 2.53.0
> > > 
> > OK, can we just set it right after the:
> > 
> > 	area->nr_pages = vm_area_alloc_pages(
> > 			vmalloc_gfp_adjust(gfp_mask, page_order), node,
> > 			page_order, nr_small_pages, area->pages);
> > 
> > 
> > succeeds?
> 
> Here it's still not clear if vm_area_page_order() succeeded :)
> 
> I can move it just before
> 
>  	return area->addr;
> 
Even better :) For next version:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
