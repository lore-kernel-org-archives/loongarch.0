Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8163BD63B
	for <loongarch@lists.linux.dev>; Mon, 20 Jul 2026 18:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784572184; cv=none; b=Rar2YYEs3Ig2tnA/XadjsU1DruCPV1cvrjd9NksNYQI+SsO27+XcEJgagcCfDaVMpwHir6hucxTDphq9EcSwMdmKJJeSmv4XIS2bbYkSoG/gBgyLOQANuuW/AW4JObwPod07SgKEMv9i217yH8JN6ndHjgctRbwi2idCPvRtBpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784572184; c=relaxed/simple;
	bh=bZ1i/ob8RAwD2ONrC55boLi9X2aDJHrAWwM59fdDkbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJz4ju/Ur+CTAaL89JSk93YDK6xfnFricsARDfUuXZv5rqYezhHMkD1a1pZo93r2z+GoHyWFuWryPQtjuQdEAp+WLYxmtvfIKIwt8WjfJROVNpQ4e8QQtrdcP9Zigqr01iRsZ8q3KivSMHJ2PuHeGc541eCLy7vRMgRHr79E/WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=hhMCqvzR; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="hhMCqvzR"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c0c45c580so90814041cf.0
        for <loongarch@lists.linux.dev>; Mon, 20 Jul 2026 11:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784572182; x=1785176982; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EvlY+ZnuMunvG4k74l6eGWIXWbaZN9lfqhpu+ESLMPs=;
        b=hhMCqvzRb6DU220urbuIqPeYVbaC91qLJzAepC0xCkiKE+5GG+NEgsY7uYoo0B+rAQ
         fZzKRmT+uTGNCp7a/kwAfMRyt0UjxPvbSICgULZP+ZysSmBzmYsvfFilDlCAJwo7QQ1x
         bBL4/3i0hgYDmOmhGcACPdQvsoIGUyy2vJt4UHbBhF9/A9m7EE+Qd9Fy33i+TT8fuvf7
         B/Pyw/wF2GI0bYYEYOEf09WtkPULcxntBnLS4KdwH2RN7zP79L35YVomrdsxRyAySwVE
         JP7piRYC7YRgmqM0FI7nZzpoYTV1o+/5FL0hsyoUU7kMxPCMFOnJIDruj01bnT+p4jJr
         0Orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784572182; x=1785176982;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvlY+ZnuMunvG4k74l6eGWIXWbaZN9lfqhpu+ESLMPs=;
        b=SFDEfw4/6X0WB8eLGRjchxEDt7GIjqg/3gkRGGWIXiDHDbJ+RK7vVQlMdhEBtfs84O
         GZJfdy5qD2Ouqb8okjHgCtfB8/iBRrNNIssAdkf8bHk4//Ls+EPbPee3LemCLMQIOWgY
         DWIlbd8OlSH7DKFYhl/1r8qnLOf7UkUBA5m+lnK0RVaonxbYg7MJGgTA9yEKN4Pa5+LD
         lxyRM5B+9A9PJxRFrKtXV7Cu4pg4avYFQYst248R6O4ekD+0Cy2wS03XDlMR/jrVyqV1
         c7vdZYjdzUIP/s+hIMBX0u8bSp9NqVlNVsxRV1NDXaHpp76EJCrm/LobHH6RbY1MgiCG
         caJA==
X-Forwarded-Encrypted: i=1; AHgh+RquACDZOuE0iO2NXFs8ZhRnMHe+Ag8ZxwcTeU1qb9gxG+rh5r8fxZOJO0b0GTzGbDb2dSkLqiJNLUk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMnwocoLPUGs8o2Hz4pFEorOlaEksWItff1GQ22AIbLRJtzB0G
	S6tO0bVSMv1fSLg3uMGQydJNSIFg3JetQHSklq5N8rCuZ/NZ8+/z+3umVU6++Fqjy7Q=
X-Gm-Gg: AfdE7clX/9rWvvADHIIldsC2VoCyaU86NgEyLGRNGscNxX6lzgYRLlr8TwbMeH0BEbH
	P3hbvdoujy7sLER+0nidU834QU34A15ACTcCMwKFhHoeBkC+LHssWjPN4SozlW7tftnyMWj7y70
	He3joxGh6BZGX0ccFn77rEgnxczIM2ZRF0z5kyst8zHDG9CrUdAcitkkFQvJVytgQEvh0DyVRC3
	Lcjut/g58NesFsjNqCZ6s1zKE+SfeqigZjSi4nffppUJkCiPgx35JyW+gLHOFuO/bVkEaCiHuQr
	m1XpZzrPeK8pf4B2lGyt2a1as4Zvk/s110l6uizCrnxfbr6jWUej1WWIU2UUUp4xx2z4s/HPl8F
	5LVmUtsSvg1SNAzVr4XdHOapg/SzVo0fpGm8EJYYv8NWq0pnjpxiX9Ofk9YvMsbwUK/bWy0Vm38
	ypqI0P7lVk8w60rSbjJCA0k+oex9kzqr+7eGmQz0n26zsl0ymXRnN49BjvFhuUu2pQmetF
X-Received: by 2002:ac8:5714:0:b0:51c:1857:b622 with SMTP id d75a77b69052e-5213e082210mr141591671cf.54.1784572182072;
        Mon, 20 Jul 2026 11:29:42 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214c5cc8d5sm80304611cf.6.2026.07.20.11.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 11:29:41 -0700 (PDT)
Date: Mon, 20 Jul 2026 14:29:36 -0400
From: Gregory Price <gourry@gourry.net>
To: Matthew Wilcox <willy@infradead.org>
Cc: Brendan Jackman <brendan.jackman@linux.dev>, 
	Brendan Jackman <jackmanb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Jan Kara <jack@suse.cz>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Byungchul Park <byungchul@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	iommu@lists.linux.dev, loongarch@lists.linux.dev, linux-nfs@vger.kernel.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH 1/3] mm: move internal mempolicy APIs to new internal
 header
Message-ID: <al5ldslYontDDKPJ@gourry-fedora-PF4VCD3F>
References: <20260716-folio-alloc-cleanups-v1-0-5363b8e92d33@google.com>
 <20260716-folio-alloc-cleanups-v1-1-5363b8e92d33@google.com>
 <alkLSzQvzT9zJbY1@casper.infradead.org>
 <DK05KUIDJVLZ.61UIWOL0K3OT@linux.dev>
 <al5gQgnBCjNCSD_4@casper.infradead.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al5gQgnBCjNCSD_4@casper.infradead.org>

On Mon, Jul 20, 2026 at 06:52:02PM +0100, Matthew Wilcox wrote:
> 
> > ... With the ulterior motive that I want to add a new parameter to it
> > that actually _is_ mm-internal. Namely, alloc_flags, so I can add
> > ALLOC_UNMAPPED to implement AS_NO_DIRECT_MAP, i.e. the next iteration of
> > [0]. So basically this is
> > about trying to extend the allocator without creating a GFP flag.
> 
> Yeah.  I'm not sold on the whole alloc_flags thing, but I'm too busy to
> sit down and think it through properly to get involved in a proper
> argument about how it should work.
> 
> My entirely unresearched and ill-considered opinion is that the __GFP
> flags should _be_ the ALLOC flags.  We shoudn't be translating GFP flags
> into ALLOC flags that are what the allocator actually uses, the
> translation should be done at compile time.  So if GFP_KERNEL and
> GFP_ATOMIC need to be composed of different flags with different
> semantics, then we should do that, not invent a different set of flags
> that special people can use for special purposes.
> 

alloc_flags is putting me between a rock and a hard place.

I figured out a clean isolation mechanism with zonelists (new rfc is
posting today, i'm doing one last proofread), but it required me to
extend some of the mm/ internal interfaces with a zonelist selector.

Since Brendan's base work made it in mm-new, i decided to replace
the zonelist selector with ALLOC_ZONELIST_PRIVATE as the selector
to avoid *yet more* arguments.

I'll be posting with ALLOC_ZONELIST_PRIVATE on top of mm-new, but
the churn is getting painful.

It really seems like we just want an mm/ internal interface that
exposes struct alloc_context for specific *mm/* callers
(see: compaction_context, migration_context, etc), and interfaces
that keep this nonsense transparent for everyone else.

Then if you want access to alloc_context interface, you need to get
export approval for that component (similar to EXPORT_FOR_MODULES).

Just spitballing here, but the churn is killing me.

~Gregory

