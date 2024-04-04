Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9DA84FD8
	for <loongarch@lists.linux.dev>; Thu,  4 Apr 2024 12:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712232055; cv=none; b=q9FGdCP0EhscyrWPcvAwTWdSFl9vsUSq2/Hd6d59umwjy7anD5J2EZM1BpoOGezNg64yz8gVtd7+rU5i46+A9+c0F3vVvjf97URb11DNxRXRaEuNOsx5X0kyILgpuuACQvG2zESnQ+NbkKx7/N03VegmJFWlTsGkTkRMJ+DWzrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712232055; c=relaxed/simple;
	bh=GZ85xvnSn7AShFQ6AU6qZKZ/QUsMQjF1VcpNN5Uuyx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fp7Uw05dbjrXETny18OTumzjWfmj4UPL/hj++WFMwT7uyAFGJSp6NRTNEzobjzIGWbzWujkghhpFkfw214Iq7WivzMmnXo5iKAQlxdFIsm7kEZCHWV1CuBPodUaGUNvZ/Na3VYdSRE66dMPkF9N5PYeWyXvqEZpu2v8PbkIYFwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZJQO1LKQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZJQO1LKQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712232053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qfuooD1IfgatoIS7OAIU70Y79yHtd6slmR6Wd2lGo90=;
	b=ZJQO1LKQ4/YdGI4ahHtm0KHDzGiPpcFyi0D+eNTsS8jSj7xNYjiSNbeXK+IrEphm3v9lbN
	fwLRrKlox7Xa/HcduDl+D0NX1FxoGzfU4qYy2Hf5sd12bU+m543M7zAnw9W9k8zMs18K0d
	xgXaxFZjgJc/Gj5uUT2nryrwDpbzG/k=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-0hpoAETWPNWhqW30fR8aig-1; Thu, 04 Apr 2024 08:00:51 -0400
X-MC-Unique: 0hpoAETWPNWhqW30fR8aig-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6992d40ea4aso1903706d6.1
        for <loongarch@lists.linux.dev>; Thu, 04 Apr 2024 05:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712232051; x=1712836851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfuooD1IfgatoIS7OAIU70Y79yHtd6slmR6Wd2lGo90=;
        b=QCQjXu3PNteRqkiC1prM6c+Ls7qQimLJv4VjXKhcHk0HcARh/UV4Ee7n50PZtLYQUA
         /2pmaht5kH7XRA4xrZ0kUgv1q+oYe5LnZeL10SK7l9bo8URQw7Vh7GrQjcqFMBY36a/l
         yzpb0Jbn+mlT7dlRwKNzqHCdQE/jNqkWC6COxDbUShIPcp40o7nlfnV5UU7cGWF5TzxX
         HP+OZT9rcYk0ZMCkmgO6jtE2RxXckAn0YpyFs9ADig+1fQ3nbFjakGMqzIZAyqilxN7T
         ELHI1+6YAKLjPNUiZTjlb2eKpXT12RSEEJtnUIq1b0n/8sIPcsZ+S+pfcup0x4Kk7Toz
         cDPw==
X-Forwarded-Encrypted: i=1; AJvYcCVV7L3BFCT9ry+ykE6mCSIpBcmq3xQ6yyJqrmddOifCNWeCgP7MryGqOcSKs9ZpByO4SBNTHBoUyfIa9iX4+ffH4/L4LphWox6J
X-Gm-Message-State: AOJu0YyuY6uy/9/kvx6D6bECowCf3vvvkBdRYP/FfMkcNm1rjsE0kwOB
	bj1bxlF8//zFfvCm1NNfjKHO0mcpE806c4I6tIbQfq6aD/eKmuayCtCkbntY21JU+XBBKyPqgck
	OmaLNLH7fh6G3UzjnRn8DOl3MknbnVDDavc7IofBUYp3aMVjMxBUFelbjfw==
X-Received: by 2002:a05:6214:5007:b0:699:4d3:98dc with SMTP id jo7-20020a056214500700b0069904d398dcmr2122695qvb.0.1712232050940;
        Thu, 04 Apr 2024 05:00:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMCWtQWiLpesBQTQo5kp7GWlhuKWfgLgdLeENDjrnl6Gj4+sgwXTUEXT7yElLHvch56DwpwQ==
X-Received: by 2002:a05:6214:5007:b0:699:4d3:98dc with SMTP id jo7-20020a056214500700b0069904d398dcmr2122629qvb.0.1712232050343;
        Thu, 04 Apr 2024 05:00:50 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id jf14-20020a0562142a4e00b006987021a724sm7171209qvb.118.2024.04.04.05.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:00:50 -0700 (PDT)
Date: Thu, 4 Apr 2024 08:00:47 -0400
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
Message-ID: <Zg6WbzWkoLtbY2LZ@x1n>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X>
 <ZgyKLLVZ4vN56uZE@x1n>
 <20240402225320.GU946323@nvidia.com>
 <ZgyWUYVdUsAiXCC4@xz-m1.local>
 <20240403120841.GB1723999@nvidia.com>
 <Zg2fEP4eEeLhgDwE@x1n>
 <20240404112404.GG1723999@nvidia.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240404112404.GG1723999@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Apr 04, 2024 at 08:24:04AM -0300, Jason Gunthorpe wrote:
> On Wed, Apr 03, 2024 at 02:25:20PM -0400, Peter Xu wrote:
> 
> > > I'd say the BUILD_BUG has done it's job and found an issue, fix it by
> > > not defining pud_leaf? I don't see any calls to pud_leaf in loongarch
> > > at least
> > 
> > Yes, that sounds better too to me, however it means we may also risk other
> > archs that can fail another defconfig build.. and I worry I bring trouble
> > to multiple such cases.  Fundamentally it's indeed my patch that broke
> > those builds, so I still sent the change and leave that for arch developers
> > to decide the best for the archs.
> 
> But your change causes silent data corruption if the code path is
> run.. I think we are overall better to wade through the compile time
> bugs from linux-next. Honestly if there were alot then I'd think there
> would be more complaints already.
> 
> Maybe it should just be a seperate step from this series.

Right, that'll be imho better to be done separate, as I think we'd better
consolidate the code.

One thing I don't worry is the warning would cause anything real to fail; I
don't yet expect any arch that will not define pud_pfn when it needs
it.. so it can mean all of the build errors may not cause real benefits as
of now.  But I agree with you we'd better have it.  I'll take a todo and
I'll try to add it back after all these fallouts.  With my cross build
chains now it shouldn't be hard, just take some time to revisit each arch.

Thanks,

-- 
Peter Xu

