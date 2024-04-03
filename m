Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30288153598
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 18:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712168730; cv=none; b=TUIrYX686KlQP5oLT13yf6i4+CcuRbdP8T3tnfL/lR4TtgTcQAXiGAN3ZH9h0MrWtlgAJMJDC4dW6EccRroWPvOFAycrLNvhFfJe0vi8WZIhqzm3SGbL6q+UwbFvm6Wtaay/QE9ODYg7WCm8AZB1WRY9jNawCLknBTuv6VmQ5KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712168730; c=relaxed/simple;
	bh=49xRMMJoQJIUdr7zdlVs8BfmW6KWUNR4b9vQnfKmZbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=om0ZdJlstqASjUO8VI1MZfK7O2mvnsq8ODVger5PLNWjUzyb2r8aqNhdiR76WVFbKRk6eCFgFhoh5X9QrXmZ/lsHKjTHBSqjyGIfgO7C6oww3qXXPj+E+xGMmq4uEEebnHI5dNLWQAcwIhbArR9Yn7hoMRvqE5keg3eFlKDwg80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=heMLqqir; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="heMLqqir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712168728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YXsmqoOHzY6mBushOHoxlZz3TK/EfZqT4lQukaq20AM=;
	b=heMLqqirhetqkyRiPCH3Vkky/06M9DspI45IQqhjcTxHwRJubOfrEAI3s1DGL7zlp/MTy2
	crdyh6BwsBeigM43muN/W90oqkQYyAKN72tVevCQkugKm/nHF0HYLETz6gAtdLkcSQWSTD
	qivFh9/9bemWtTCaAawtsUFL7kXEX2A=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-OhYT0OKiOdyTA-9rPpTxYA-1; Wed, 03 Apr 2024 14:25:27 -0400
X-MC-Unique: OhYT0OKiOdyTA-9rPpTxYA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6991ad4ea9eso182706d6.0
        for <loongarch@lists.linux.dev>; Wed, 03 Apr 2024 11:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712168726; x=1712773526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXsmqoOHzY6mBushOHoxlZz3TK/EfZqT4lQukaq20AM=;
        b=CU+j5daNgO8NAxTRgJi3mTAFsmgt4PD1mfCXvQZXxL/HOPAIEz3ieZfsG7NXl8n7dP
         ptS//iwjoJQnGVHIjklIvmPqTRPDjk3oc5BUA7qUJs4bjc1xvewK0ebYC/zARmkPFIFL
         tFA4oPkH/xyhqmkV1ikyuHlAmN3d9UcdSTTFIcJuLLO4v5slWMQIN2GopljAqVLAbFlf
         dTKkspcPHBdJtUqM7+pAjsF8juTeOmr5iJ0klbkzAAW9GwwfT/ppOD50zxf/g2lI5RuA
         A0yJXwq0C1XQhv+a5TVVScm2eAesKhNgG1sI4LWCgWHECkhccnW8GsaH4hEaNFHGIPQf
         zGfA==
X-Forwarded-Encrypted: i=1; AJvYcCUF7t1rRmJUeo1blKr0UhIoAYbuR9MaSFeY/6lg0C9Ciz7x+6dS01UB+nKQ/p+F2WV3q8uB0HeB5BSQGuN3w3BN8RmxPbm0Q7IU
X-Gm-Message-State: AOJu0Yyn63l0EMbM+bscEvK4DhH8ftySu6RJaGInqUeLmQCQL1yYB95N
	BfMhEmiESmcO7TEvghQ9aP1UEU7XQ+WaA4/qRN7C24Sw+SLY7cQ3yPNqOcMv5T002YaJTKn3btQ
	GO7Il7fYgAiixEMLI1/wt/nDJiXdY2a849grjhyPgByvWKfWcZVq+n3k49g==
X-Received: by 2002:ad4:5cab:0:b0:699:2242:4ee8 with SMTP id q11-20020ad45cab000000b0069922424ee8mr129114qvh.3.1712168724118;
        Wed, 03 Apr 2024 11:25:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOuNMZozoa6aScFD4XBgyXphotERni3kWeSwgWQ4wF27W29jsLbCwW0feeq4rwhZfTMS4o4A==
X-Received: by 2002:ad4:5cab:0:b0:699:2242:4ee8 with SMTP id q11-20020ad45cab000000b0069922424ee8mr129072qvh.3.1712168723495;
        Wed, 03 Apr 2024 11:25:23 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id s15-20020a0562140caf00b00698fd63d167sm4435500qvs.123.2024.04.03.11.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 11:25:23 -0700 (PDT)
Date: Wed, 3 Apr 2024 14:25:20 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Yang Shi <shy828301@gmail.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Andrew Jones <andrew.jones@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	James Houghton <jthoughton@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Message-ID: <Zg2fEP4eEeLhgDwE@x1n>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X>
 <ZgyKLLVZ4vN56uZE@x1n>
 <20240402225320.GU946323@nvidia.com>
 <ZgyWUYVdUsAiXCC4@xz-m1.local>
 <20240403120841.GB1723999@nvidia.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240403120841.GB1723999@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 03, 2024 at 09:08:41AM -0300, Jason Gunthorpe wrote:
> On Tue, Apr 02, 2024 at 07:35:45PM -0400, Peter Xu wrote:
> > On Tue, Apr 02, 2024 at 07:53:20PM -0300, Jason Gunthorpe wrote:
> > > On Tue, Apr 02, 2024 at 06:43:56PM -0400, Peter Xu wrote:
> > > 
> > > > I actually tested this without hitting the issue (even though I didn't
> > > > mention it in the cover letter..).  I re-kicked the build test, it turns
> > > > out my "make alldefconfig" on loongarch will generate a config with both
> > > > HUGETLB=n && THP=n, while arch/loongarch/configs/loongson3_defconfig has
> > > > THP=y (which I assume was the one above build used).  I didn't further
> > > > check how "make alldefconfig" generated the config; a bit surprising that
> > > > it didn't fetch from there.
> > > 
> > > I suspect it is weird compiler variations.. Maybe something is not
> > > being inlined.
> > > 
> > > > (and it also surprises me that this BUILD_BUG can trigger.. I used to try
> > > >  triggering it elsewhere but failed..)
> > > 
> > > As the pud_leaf() == FALSE should result in the BUILD_BUG never being
> > > called and the optimizer removing it.
> > 
> > Good point, for some reason loongarch defined pud_leaf() without defining
> > pud_pfn(), which does look strange.
> > 
> > #define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)
> > 
> > But I noticed at least MIPS also does it..  Logically I think one arch
> > should define either none of both.
> 
> Wow, this is definately an arch issue. You can't define pud_leaf() and
> not have a pud_pfn(). It makes no sense at all..
> 
> I'd say the BUILD_BUG has done it's job and found an issue, fix it by
> not defining pud_leaf? I don't see any calls to pud_leaf in loongarch
> at least

Yes, that sounds better too to me, however it means we may also risk other
archs that can fail another defconfig build.. and I worry I bring trouble
to multiple such cases.  Fundamentally it's indeed my patch that broke
those builds, so I still sent the change and leave that for arch developers
to decide the best for the archs.

I think if wanted, we can add that BUILD_BUG() back when we're sure no arch
will break with it.  So such changes from arch can still be proposed
alongside of removal of BUILD_BUG() (and I'd guess some other arch will
start to notice such build issue soon if existed.. so it still more or less
has similar effect of a reminder..).

Thanks,

-- 
Peter Xu

