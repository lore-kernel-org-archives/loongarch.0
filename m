Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30CF2F50A2
	for <loongarch@lists.linux.dev>; Wed,  2 Jul 2025 17:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476814; cv=none; b=fT8/3DvnyImcFADxtzn+wtbuqDzSQ03FfIFYIkZ319qi6ue5MYuEcl1uIfIsTKXT3LkNmlhi1NPOY9pteRwLQuuWE5US34FiMFwi3Kz1j7pG0YVFfrj8kgBr0bHvJ8tNhCQq1OKE9h52z37ZBBFz64ZR/HlLxdwaGkVrcRwj3Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476814; c=relaxed/simple;
	bh=FWRZKvWiItvy6hxJjRoYrslXi/LBIi5lbHx16cmY1qc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=S4/MnZtthrast5ElTm4n71Kk7PvHdjabAFhqVnusQInteIoXpG/+uZbrzrRyulVKfW2OZ3hYRTAi46r5z26XDQEodaem5JGx31YeQ+y5Cqy1m+ieAgASc7F4U2Afu9VwlWw/VtrhiDLwyBau99tMN1VtCjXiY3gldsa/sgKNo2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X/t4FIDx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X/t4FIDx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751476811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X4OXeIMkVHqZr0TmFdZKIZ9QEBYkowbL9PbKefie20c=;
	b=X/t4FIDxRRiA/I3KNv3K/l9iPZ7d6mJ3nhwE4658gk8zF3X7Pt340BiRPc7sX1/zMU/ZIa
	md3pQ36I+BK6wrq2deXiMlXsQtzGUeiMUaq4Tzv0Mt+M5lcrkZ/8mB1Gk3QB1SdSglJ+ir
	C2gSNc6boQ8efCfnIMArlSOdqxh6WaM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14--T6e4_38NK6igf4Sistvyg-1; Wed, 02 Jul 2025 13:20:10 -0400
X-MC-Unique: -T6e4_38NK6igf4Sistvyg-1
X-Mimecast-MFC-AGG-ID: -T6e4_38NK6igf4Sistvyg_1751476810
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d5077ef51bso300834285a.3
        for <loongarch@lists.linux.dev>; Wed, 02 Jul 2025 10:20:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751476810; x=1752081610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4OXeIMkVHqZr0TmFdZKIZ9QEBYkowbL9PbKefie20c=;
        b=dt9NxyoWvDvYomc2syXc2lbE7LjdTTPOJx0v3eDmu4eTyAp9Cs0EHEqatI+SUoXRKP
         9xaRPfPgIXKBlzgbwcKTre7xv37JTZvTqLD18aWMs35uPdmGX6A+oETOPxI+DcZAhOJh
         fO1OEwaxkRqZC4Y/ORV+BbVGboXaH3qz2EY4kx5T1K2tfQfxM633PXaWkGSquFS0zSak
         TXBLi+t8N1TPmQSHqC//pznHddKXCxc3a8UBwxkg01RHsUY+eL46IrUvDguODs6j99jt
         eAeWgw+AMLIuq2gD2eBhtKfrucM9/q8w+UVvbI9Az63BuRldtj8EQWztTQaZ2bVmjyF0
         trQA==
X-Forwarded-Encrypted: i=1; AJvYcCVfktpeubXF+jffsj8yuL6kli56pbQolGxkaRhI1dJinCRyRWa7plOxyPfMaKhv7vB7rWGeSYg2OeU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7y7tSYAn6J4LrvsN0J9tLSrH3sh9n5bIfdEDbXh9b9BQWLcPo
	kiXry4aGc7KDBoA7USWn+F3rk6gGb9MvrHX5t9GVWwsHHyaQfhqWRCBUhVEVHowMz//zdklOLRu
	P24y4/Ihor3wXhMjIL1k1JpzKzxkxEAK4tTbyjsz8OjNOrQStESymwWtYSIGqNw==
X-Gm-Gg: ASbGncvDdc57YlIsQnMoDzhPssXvsy2moYw/HH4t7e/NAjgE2gAOk2lSYWD/5bOGWKQ
	B5vMHaJ3ZzRHE83UduKt6hOFaE2Ba4a6pas8rqjZ80ekMy4HrnlUE9wlyxIVTQ66DQv8nTOEYRk
	0N2dwW2VBfhwUF+Gl0G7do6yQKRpftdpNHc2s+krSomKLf9li1FToFU9bSojiaK3rGvdPDNBHQl
	cxW9vQqXCzHKw1Ige+j2HOe6spkJx0xyXclZqrkcoNLmCgBXZwAFZH/ufbgB7ePFFNerykMSH15
	mI3GXh4KZJNa9Q==
X-Received: by 2002:a05:620a:2493:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7d5c462ac6bmr497721185a.0.1751476810083;
        Wed, 02 Jul 2025 10:20:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEABzvdSXcUcA35EvmAadp6Gl0tgp7duV0eKH1z56ocBWqywdOnkcWFAdC7968vXYiaa2gJNQ==
X-Received: by 2002:a05:620a:2493:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7d5c462ac6bmr497717285a.0.1751476809650;
        Wed, 02 Jul 2025 10:20:09 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443134f32sm971947685a.12.2025.07.02.10.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 10:20:09 -0700 (PDT)
Date: Wed, 2 Jul 2025 13:20:05 -0400
From: Peter Xu <peterx@redhat.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] mm/hugetlb: Remove prepare_hugepage_range()
Message-ID: <aGVqRQKWu9IDVwk6@x1.local>
References: <20250627160707.2124580-1-peterx@redhat.com>
 <jjwzfnbz7uzuniwd2qc6prfg4sboa7dnjswnbeotjbaqngbs6s@2y42bsqcjpv6>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <jjwzfnbz7uzuniwd2qc6prfg4sboa7dnjswnbeotjbaqngbs6s@2y42bsqcjpv6>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qFS3PQTTo1jh0mbamnZCk5SAoIlBZAzkXO7lplP5gkQ_1751476810
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jun 30, 2025 at 10:26:13AM -0400, Liam R. Howlett wrote:
> * Peter Xu <peterx@redhat.com> [250627 12:07]:
> > Only mips and loongarch implemented this API, however what it does was
> > checking against stack overflow for either len or addr.  That's already
> > done in arch's arch_get_unmapped_area*() functions, even though it may not
> > be 100% identical checks.
> > 
> > For example, for both of the architectures, there will be a trivial
> > difference on how stack top was defined.  The old code uses STACK_TOP which
> > may be slightly smaller than TASK_SIZE on either of them, but the hope is
> > that shouldn't be a problem.
> > 
> > It means the whole API is pretty much obsolete at least now, remove it
> > completely.
> 
> Thanks for rewording this change, apologies for the late response on
> your change log.  I think it's fine.

That's totally OK, thanks for keeping an eye.

> 
> I think the only meaningful difference is that the failure would have
> aborted entirely if stack_top - len < addr, but with this change it will
> attempt to search in the opposite direction.  Unless I missed something?

IIUC the prepare_hugepage_range() API shouldn't affect the direction of VA
allocation yet, but rather a (likely proven unnecessary by this patch) way
to fail fast for hugetlbfs for no good reason.

It is currently only invoked with MAP_FIXED, and if it returns 0 it'll
further move on to the core VA allocator.  Then the allocation can happen
either TOP->DOWN or DOWN->TOP.

So "stack_top - len < addr" check is meaningful no matter if MMF_TOPDOWN or
not, because we want to make sure it won't overflow in any direction.  It's
just that it's already covered at least by the two archs providing this
hugetlbfs specific hook.

> 
> I suspect that this wasn't meant to happen in the first place anyways,
> and I bet there are no tests for it and no real-world harm in changing
> an error scenario into a potential successful mapping.

Yes, checking stack for hugetlbfs so far just looks redundant.  Maybe keep
digging the history we may found why we had it before, but so far it looks
not useful at all.

> 
> Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

Thanks,

-- 
Peter Xu

