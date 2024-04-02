Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394F63D962
	for <loongarch@lists.linux.dev>; Tue,  2 Apr 2024 23:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712100953; cv=none; b=tJqxphXsvL9bQ6ao9PCp4l4P+2VyFuSZaUXeTva9K92SA+obvnDKKAnzX8m4IStrtOHGAi+x7yVKN2H8YUpYEs4KOTz0414XeVateR+17F65sGHEeCp1sxX684A+UQ+5/totszF4Fpp4OlbEbCJMTr+3MCl6GCyGA3aiJXzNwmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712100953; c=relaxed/simple;
	bh=dCoRqma6yqwIrFc2Ju/9ocy+ca8jMOV5zqLtsYm4O98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=tcICIzDQXjiL3bp4X5S3eZ6B5YOadC+SFNZoucAl1Wuq6bhou1e9IdHDbSZrlk+mzaz02wPOoxrPFf/fEzuhLA+84LQoYt91I4mNB8bACh3s3UjM9IeUwe+2fYg2D615o3Lv9Mpv1H25ASqJqaNpW84eR+Sax9nmG/6+hZA3NNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SernlilP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SernlilP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712100951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HP6iCpNSGY021srGiNxOfFS1yawEzwYl7dLs1n/YW+Y=;
	b=SernlilPx0ivm1TcTtzb7+vEpxjwHEyJDuDBqj8+JyXykNsdXTQ+HHACBTxSxQ11VzxUqg
	jMuV5q7ipH+LXIHpJd2lJTYx1H59Z9EHIpua3K+zyajwImDVX1FQE30CKeZ9C+Rah+Uo9E
	gk69vgrtq6qhJefGuiVsjjtP3HkkVbM=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-sHClzX7RMaGgDQihDJKJyQ-1; Tue, 02 Apr 2024 19:35:50 -0400
X-MC-Unique: sHClzX7RMaGgDQihDJKJyQ-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6e6b0efc193so2551209a34.0
        for <loongarch@lists.linux.dev>; Tue, 02 Apr 2024 16:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712100949; x=1712705749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HP6iCpNSGY021srGiNxOfFS1yawEzwYl7dLs1n/YW+Y=;
        b=GPjBRQIcX9XBplWNOVb+1jR0ObruaG88/gQ7LEEqZqz9depdvyOUrGYZj1+fY5jJpE
         VkKczE34eUukNQPEE8L0Y6YfvMmobsTiWReQ1znKePfV2BDcWLJ4J4Amx/lTtGxOOLCd
         XAgtGdMUbNOgbynHaKVUk870p2Vpi0hxCTbP03NPFooxziwD0fPfmjgKy028VZ3MJn/C
         j0fSEBSIida+2MZlRdOji7hFv2bmvs8X7t7O9g5t/YKyusx++go+CcjO6Go0aG7IM/NO
         ilUnk5VPjHaU4jkFyFs9wCLqS0vWsRO6xnTgNPekywxhLeNls+pmX6Ncg5cD4LbRnWPQ
         yR8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWby1LKkTSXx0NulPY77ch8rLj7SsEY8pJLRwR9FbqlcSDCYes6hK1uq15kUCmXGSWqmxSmrVgKyYOyf1XtvbS418DLN6qiaYsH
X-Gm-Message-State: AOJu0YyXKqlmVk9KljXmgycy71oFz/ECSsQdqr4Ryw/SfIX7ocbXK6HI
	GFWuAB1kjMoDacbhkO/OJ9w6q7NFT22aQT2hlCrAI9lj2EVfHy4/8alZXjbUn/ff/5NbnV/EWvT
	o0/qrKxijfjtVtDbsO5wQKn6M56To+LV+aVQ9grz4BEGKcqtcWsUb7m9evg==
X-Received: by 2002:a9d:4c86:0:b0:6e7:7ef6:10da with SMTP id m6-20020a9d4c86000000b006e77ef610damr13684100otf.1.1712100949125;
        Tue, 02 Apr 2024 16:35:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvGEFvbrAiLdQh8lUIUnqC+uQoSnGXUScHs/S+SFU0VVogBN2f5CbF/OzNKGljOo4S/t2faA==
X-Received: by 2002:a9d:4c86:0:b0:6e7:7ef6:10da with SMTP id m6-20020a9d4c86000000b006e77ef610damr13684059otf.1.1712100948622;
        Tue, 02 Apr 2024 16:35:48 -0700 (PDT)
Received: from xz-m1.local ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id ob12-20020a0562142f8c00b0069046d929a3sm5893803qvb.145.2024.04.02.16.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 16:35:48 -0700 (PDT)
Date: Tue, 2 Apr 2024 19:35:45 -0400
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
Message-ID: <ZgyWUYVdUsAiXCC4@xz-m1.local>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X>
 <ZgyKLLVZ4vN56uZE@x1n>
 <20240402225320.GU946323@nvidia.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240402225320.GU946323@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 02, 2024 at 07:53:20PM -0300, Jason Gunthorpe wrote:
> On Tue, Apr 02, 2024 at 06:43:56PM -0400, Peter Xu wrote:
> 
> > I actually tested this without hitting the issue (even though I didn't
> > mention it in the cover letter..).  I re-kicked the build test, it turns
> > out my "make alldefconfig" on loongarch will generate a config with both
> > HUGETLB=n && THP=n, while arch/loongarch/configs/loongson3_defconfig has
> > THP=y (which I assume was the one above build used).  I didn't further
> > check how "make alldefconfig" generated the config; a bit surprising that
> > it didn't fetch from there.
> 
> I suspect it is weird compiler variations.. Maybe something is not
> being inlined.
> 
> > (and it also surprises me that this BUILD_BUG can trigger.. I used to try
> >  triggering it elsewhere but failed..)
> 
> As the pud_leaf() == FALSE should result in the BUILD_BUG never being
> called and the optimizer removing it.

Good point, for some reason loongarch defined pud_leaf() without defining
pud_pfn(), which does look strange.

#define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)

But I noticed at least MIPS also does it..  Logically I think one arch
should define either none of both.

> 
> Perhaps the issue is that the pud_leaf() is too far from the pud_pfn?

My understanding is follow_pud_mask() should completely get optimized and
follow_huge_pud() will be dropped in the compiler output if pud_leaf()==false.

Thanks,

-- 
Peter Xu

