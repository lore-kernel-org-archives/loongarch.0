Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505401E871
	for <loongarch@lists.linux.dev>; Fri, 13 Jun 2025 16:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749831893; cv=none; b=B3rTzunbEod8cGGOlxDKl6fLXhx+cBUnk801h39AW8zK7XgG1V35V1QD5yzsny/LaQdUtBVhywcF1oruA/5q5WlUC5vXvtZiCFXrW8ZUlTzOX+QkKMDTJcOlFScICPGSYGbjhnqGlSoPCgvVie3ArMCsbI315ZixuyQNGqc061g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749831893; c=relaxed/simple;
	bh=ezAPkeMmfcqGy1OO+aJ5oa0dXrm8ejKbGu1v5Dg5Cqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iJCn1vNq4eQIHU29iH0t2lwauG5xDzTVgObb3bz9Bq2yzfQvww/svt7HVww5KsHMjan0Esm4Aco2dxYsj9JuIO6NVxWJ+RLWNUhTsHsN1LFezbQbU70I43kVbudFGQui7mUhk/lZ5SBfETdtDEWwVrakkM7TNVFfLqQ1YaX4z1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MjhrZQsj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MjhrZQsj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749831890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M6UPs3wZZzH8Vr1Vmqrw6Xud3sdfgHi+vy7XvS9r/Jo=;
	b=MjhrZQsj/JkW5i8G8Or0WLQSxRLDCsZYmlOf9vVD0W81t4a5X5mXXvySGZkt+4kAXRvBAW
	RmfkoV0mD8OCcGhPGKqq27bgsWYxVaa55IUCE1tSafze30NV3m30GYs7pVgFph3KdZ/npU
	VRfXZx36vT6jGwGNiasBKCnOBIRBzv8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-G7AXUMdZOHac4IgrjWpf1Q-1; Fri, 13 Jun 2025 12:24:49 -0400
X-MC-Unique: G7AXUMdZOHac4IgrjWpf1Q-1
X-Mimecast-MFC-AGG-ID: G7AXUMdZOHac4IgrjWpf1Q_1749831888
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a42c569a9aso54257751cf.0
        for <loongarch@lists.linux.dev>; Fri, 13 Jun 2025 09:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749831888; x=1750436688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6UPs3wZZzH8Vr1Vmqrw6Xud3sdfgHi+vy7XvS9r/Jo=;
        b=dp+mwhb+E97FIviIr0Ej03aHdw8etDyNWNOFj+t63Ki49d9BECg19it8ipOaUopyzU
         oPWDhAY1ZaTt66RI4GekHtrzd7yEDiRlACiv8qNpM5HHqP8c8681WMEIoD1mw7fTl4HY
         HhywA3Oz5nXLhoUBhpOP8OAx72mJrZ4FWkVZbTzyKu3GCUY9kwqezqBuK/WMgLnoaJIO
         eY2hPxpccf5UOXD0zVyj8OGPKOd/XRoKMJltS2+e7dfUfVQhhdJaMI/7T8hGlNcWyWs4
         MZjhrKDjxJ6sEQfly5imJQxigNRJHgbH97ww/gm6W2DwO8KzjB3e8CHaHccrLYjnEAij
         cJJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1+dsWtBglykG9K+qVuT38c6EAegdJHzdlggPpDrkXsgsBIKHRS/MGsFPwVHtGFy5bi6oOI/v6U34=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYh87snc3J174fqRZIL1q8CiPLsdKTiKS4OeRZEiup14oTTpy+
	tu8gABbtSaUEpraYpJumxvSSVaffoArDCi9tkzbgqDgK+VFllBzYucyA2h2C1+W2aMe0xi+GYZ1
	ZTGCoCw5n1PWMkDXWhrjT8szpCXGCmkui0pJGVQ2bHC7Y0K3BeNrVfcpeFnVGWw==
X-Gm-Gg: ASbGncv2M384mCq/mnC9ZE5A4D6lSu2JKYZMUZ/AiqHv1ozx0Aqe5f87DgnPcngwwLd
	rS7wd+EDJeNsHSpvJ4x/5NuBGk7fASA5dTTQ5USEPcgiN4UO2Y5SAXLitiJ/e47FMrmGEGPEPLl
	3zeYcQzFpL175bSF4wmgeM+x5LEBbJhPXtMXkAU6mX24Mtlx+h5LdjFWAX9d08pRtJwFqTZJ9wj
	QIFudfGZsb9rfmDXDjk/5DjYz7PzPo79u7O7nfyINnIlbOqG4C0nDf06XsGaeomeNZeiPjAi2Ud
	sonsiy2VYW11Rw==
X-Received: by 2002:a05:622a:44:b0:4a6:fa1f:46a5 with SMTP id d75a77b69052e-4a73b69e837mr6261661cf.2.1749831888560;
        Fri, 13 Jun 2025 09:24:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwE/aMkplM3bTE+98WG9z6ojodJYRohckJBl51t/zS9y9pPDUtOdEYutdKcOPE5vAqv+nUow==
X-Received: by 2002:a05:622a:44:b0:4a6:fa1f:46a5 with SMTP id d75a77b69052e-4a73b69e837mr6261261cf.2.1749831888182;
        Fri, 13 Jun 2025 09:24:48 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4cf7desm18773181cf.53.2025.06.13.09.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 09:24:47 -0700 (PDT)
Date: Fri, 13 Jun 2025 12:24:43 -0400
From: Peter Xu <peterx@redhat.com>
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 2/5] mm/hugetlb: Remove prepare_hugepage_range()
Message-ID: <aExQy6xMDc9Igm5v@x1.local>
References: <20250613134111.469884-1-peterx@redhat.com>
 <20250613134111.469884-3-peterx@redhat.com>
 <050B65EF-6A1E-44A8-87D5-152FA9A60641@nvidia.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <050B65EF-6A1E-44A8-87D5-152FA9A60641@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SxbqD3qLoPTxJRDaFamb3VQ7ccJ86D-uIHQsL-oN3B0_1749831888
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jun 13, 2025 at 11:13:50AM -0400, Zi Yan wrote:
> On 13 Jun 2025, at 9:41, Peter Xu wrote:
> 
> > Only mips and loongarch implemented this API, however what it does was
> > checking against stack overflow for either len or addr.  That's already
> > done in arch's arch_get_unmapped_area*() functions, hence not needed.
> >
> > It means the whole API is pretty much obsolete at least now, remove it
> > completely.
> >
> > Cc: Huacai Chen <chenhuacai@kernel.org>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Muchun Song <muchun.song@linux.dev>
> > Cc: Oscar Salvador <osalvador@suse.de>
> > Cc: loongarch@lists.linux.dev
> > Cc: linux-mips@vger.kernel.org
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  arch/loongarch/include/asm/hugetlb.h | 14 --------------
> >  arch/mips/include/asm/hugetlb.h      | 14 --------------
> >  fs/hugetlbfs/inode.c                 |  8 ++------
> >  include/asm-generic/hugetlb.h        |  8 --------
> >  include/linux/hugetlb.h              |  6 ------
> >  5 files changed, 2 insertions(+), 48 deletions(-)
> >
> > diff --git a/arch/loongarch/include/asm/hugetlb.h b/arch/loongarch/include/asm/hugetlb.h
> > index 4dc4b3e04225..ab68b594f889 100644
> > --- a/arch/loongarch/include/asm/hugetlb.h
> > +++ b/arch/loongarch/include/asm/hugetlb.h
> > @@ -10,20 +10,6 @@
> >
> >  uint64_t pmd_to_entrylo(unsigned long pmd_val);
> >
> > -#define __HAVE_ARCH_PREPARE_HUGEPAGE_RANGE
> > -static inline int prepare_hugepage_range(struct file *file,
> > -					 unsigned long addr,
> > -					 unsigned long len)
> > -{
> > -	unsigned long task_size = STACK_TOP;
> > -
> > -	if (len > task_size)
> > -		return -ENOMEM;
> > -	if (task_size - len < addr)
> > -		return -EINVAL;
> > -	return 0;
> > -}
> > -
> >  #define __HAVE_ARCH_HUGE_PTE_CLEAR
> >  static inline void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
> >  				  pte_t *ptep, unsigned long sz)
> > diff --git a/arch/mips/include/asm/hugetlb.h b/arch/mips/include/asm/hugetlb.h
> > index fbc71ddcf0f6..8c460ce01ffe 100644
> > --- a/arch/mips/include/asm/hugetlb.h
> > +++ b/arch/mips/include/asm/hugetlb.h
> > @@ -11,20 +11,6 @@
> >
> >  #include <asm/page.h>
> >
> > -#define __HAVE_ARCH_PREPARE_HUGEPAGE_RANGE
> > -static inline int prepare_hugepage_range(struct file *file,
> > -					 unsigned long addr,
> > -					 unsigned long len)
> > -{
> > -	unsigned long task_size = STACK_TOP;
> > -
> > -	if (len > task_size)
> > -		return -ENOMEM;
> 
> arch_get_unmapped_area_topdown() has this check.
> 
> > -	if (task_size - len < addr)
> > -		return -EINVAL;
> 
> For this one, arch_get_unmapped_area_topdown() instead will try to
> provide a different addr if the check fails.
> 
> So this patch changes the original code behavior, right?

It almost shouldn't change.  Note that prepare_hugepage_range() is only
used for MAP_FIXED before this patch:

hugetlb_get_unmapped_area():
        if (flags & MAP_FIXED) {
                if (addr & ~huge_page_mask(h))
                        return -EINVAL;
                if (prepare_hugepage_range(file, addr, len))
                        return -EINVAL;
        }

Then for MAP_FIXED, on MIPS:

arch_get_unmapped_area_common():
        ...
	if (flags & MAP_FIXED) {
		/* Even MAP_FIXED mappings must reside within TASK_SIZE */
		if (TASK_SIZE - len < addr)
			return -EINVAL;
                ...
        }

But if we want to be super accurate, it's indeed different, in that the old
hugetlb code was checking stack top with STACK_TOP, which is
mips_stack_top() for MIPS: it's a value that might be slightly less than
TASK_SIZE..

So strictly speaking, there's indeed a trivial difference on the oddity of
defining stack top, but my guess is nothing will be affected.  I can add
some explanation into the commit message in that case.

Thanks,

-- 
Peter Xu

