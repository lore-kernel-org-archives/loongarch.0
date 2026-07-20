Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DC843B3D0
	for <loongarch@lists.linux.dev>; Mon, 20 Jul 2026 17:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784569491; cv=none; b=HCN3Y6eADM6uHy6PIy2txM2QhR4JXpIQWkZf+eFGBvLZymCj9z5522RL8eljjsgSxWpt6VoyNtp1e0f8Bbzkj46dUgVs3hk8s+otq+8u525FTCUMzt1anwx+J2WZs8TFJTFNlbzSRAeBNpuI24h6zkUo5gZwgAhqTk33j4tr2fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784569491; c=relaxed/simple;
	bh=eQwLG50FQTlGIaxFUWOZqCCOrmund6wJNcAiP3xOaXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGlgH8adXoKYyeQaSgi8UZw/BWdYi7YqYG269TDbKFEF5ONUNFcPmUWhnE+yjVB/Wbp1AEqA3rV+InDZoYJhnnxM3p7oY/foBwbPrB6tx2cIt14FNoNiVAQAGLvGilm5xmc/cDRRBw4UMbJi34N4SKgi7rmxkWl4W7jVctSTx3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=L6oWXhYE; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="L6oWXhYE"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c21495722so73980051cf.3
        for <loongarch@lists.linux.dev>; Mon, 20 Jul 2026 10:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784569485; x=1785174285; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fh0Ky+WC8JAb92VghcxhTRFBn6Go7CAcxa18f3039ho=;
        b=L6oWXhYEF36n0bRKPvz5emMmp9SD+Uhh8E0/vFw//BazCUTnEpGGWCp4OqxRSF4VD9
         THT+52xJwG8ehYSnJmhrtmoEFbc1mGyw/btYRxbg2idy1CfC8/o/D2LVCAAV6K+GvqNa
         ZO4D/s/BjOJw588c3gzwLho3/ERPNyGCe1+LuzjUhelnwFw9X243f1QDWQRb+oV0KCD4
         Bjep26TH1mTs1D74HCXPtp16gKhnqbcq3rTgDd/fYtzvsjooKxnXtbT+WmVrCFKAAFwu
         Ch4KjKmORvbssoRoZT1oQe1FumzKOm1a6LiHq+y5SGA1qubAe/+nRXDAwe8c6AszXy1L
         87Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784569485; x=1785174285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fh0Ky+WC8JAb92VghcxhTRFBn6Go7CAcxa18f3039ho=;
        b=EYYf03Wj2MKBNPIeLcBlI+pQY6FtrmTga3/Wps6IjV+e652wFowD3kTYsnefogQFR1
         e5TTsvQ5/ERIqgRnvohcrlL4QfS7pqR0yMk0eOgkk8qcqsQ3efmpZ4s+reXG5BpUc9PM
         4KZDMwlOziSILM0Zwnm2L6M0+tMcyRpv2fQunKeFgIpmdasgY+HYYragIHGpLUdRotNi
         r2/qjWMeWDb72hH8qkFSZcjPouWAZkT2sa1T76PoRApW9UZAQSf83e4VsbfeoHAJHITL
         NHSUSd2GdxdWrlwzL4dTYsVF4rXVSxLIoLXpcBpTAsO7ypjQ5cH2lpiQWT3A79baVKMH
         o5VQ==
X-Forwarded-Encrypted: i=1; AHgh+RpiMrRtv/yXjXS4QD2OQ5wZwsQyLaZQg+Q5RQsMu1tesFqVKl9lEKYdPRSB46fg9gUF3JzJbhIiO1o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJKpJWMmUb0H3qZ/UZD+E7gJ3t9NsfyQd/GzuUKeLxpyHP7gRw
	LNDfxR/a1AYcymV5c+HD4II1xxb1iq49PSusVGe+UGOQhL2VZ6Phv9P11T73pgSC/1s=
X-Gm-Gg: AfdE7cnlx59ZPcJLtbN3mqfCQLu1hA1QDjGP9lv1BwvdtifTEyPpXTo297SJ195ngKP
	9yNYH1fsf9AxfJSXLiERrZWXRlpjXIAyWdT9uTTLY+wwzMZgex8xLVAHm+bsU3blkOiJNFEWtAY
	db9tbcuGn5OfLgWYnc/rOB1RzW+J88g7VUv5dSwhS5YSb9lLH+sEjAM5kbM+BXkXORdfXwgNOXa
	7FnFE/M/WM7Y8vfB2pEYyzs9k1nhKqvT6/1wyoPpxy5juhPC/nqi0Z2VZ8jh72bBU6K0bdoN1f1
	7z4GEYRitxdtRfrIOvNkVOjcapmDeib17f29rymCuYSQFpCBd4V1ej22ehTwU6t0sWVY3xP0mSG
	rEgjEUJXcPcouzfQT2+jYDI4nv7fc7J4XWrlhio5ahssfplAOL8JvcHVEYN2pTdrfgvftq/V8yl
	MhuaKJX0y/c72DHCK4lcip2XN8RdFPMzVhc6UxovLiN+KBKCAhjO8d2cI1Qg==
X-Received: by 2002:a05:622a:1107:b0:51b:fddc:1de8 with SMTP id d75a77b69052e-5213e67e2c1mr141645811cf.65.1784569485065;
        Mon, 20 Jul 2026 10:44:45 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214cda7dbfsm77462971cf.9.2026.07.20.10.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:44:44 -0700 (PDT)
Date: Mon, 20 Jul 2026 13:44:39 -0400
From: Gregory Price <gourry@gourry.net>
To: Brendan Jackman <jackmanb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
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
Subject: Re: [PATCH 3/3] mm: move __folio_alloc() to page_alloc.h
Message-ID: <al5eCOfvXR3OZjVi@gourry-fedora-PF4VCD3F>
References: <20260716-folio-alloc-cleanups-v1-0-5363b8e92d33@google.com>
 <20260716-folio-alloc-cleanups-v1-3-5363b8e92d33@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-folio-alloc-cleanups-v1-3-5363b8e92d33@google.com>

On Thu, Jul 16, 2026 at 02:30:12PM +0000, Brendan Jackman wrote:
> This is no longer used outside of mm so reduce the scope.
> 
> Ulterior motive for the move to mm/: A later patch will add an
> alloc_flags arg here.
> 

I have a similar commit that is coming in on my next private node rfc,
i'll reference this, but i wanted to make sure i hit a solid mm-new base
so sashiko picks it up and people can actually apply it.

> Signed-off-by: Brendan Jackman <jackmanb@google.com>

Reviewed-by:Gregory Price <gourry@gourry.net>

