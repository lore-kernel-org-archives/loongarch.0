Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDE8127B51
	for <loongarch@lists.linux.dev>; Thu,  4 Apr 2024 13:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712238366; cv=none; b=Q3HgWyXx0oW20tkU6hFWZRVxk5IbW4/1nULDSX0cQrkE+NPkWEFI+ukUprPQPBw7Chw/+7IbVM8YjiaHyH8HytsrFN/DRBd6B/QuUPv9Q53jX59vo+XpWoqhdTBWtoz30EfGprGN7ogdhLLqoko3rzgdGRWUWyMlgB836emmLAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712238366; c=relaxed/simple;
	bh=h7s8i68ZyCWn59nSV0PE6ZG8mJhzJGtaDhaD8CtIEkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=C07J4BSOq8ChZxULYsZhgudsHgmtlZHfDWIkoq9rjK+zAFSdXJ/FCzG9OfLDBTNgNIZNJfUCiWCLIcIUuiU4nHGnpMXTOzRZdq35FrtPdpZ6W5bi7Pxd3F3/MzPjVoElfjws7OHT8Ew7fVkOiX/wNYiYa4EUA7Yahzi5fy/jVRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ekfguBny; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ekfguBny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712238364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EmzOZMLQMmyXptbwJ4TCleo+H/I/LAr89e90GsrIjic=;
	b=ekfguBnycU5JvUlHfHc7OWdJld8xq9mb9XvIwEiqYXBFjQhlJAvD5QFg6qndYYh8q2St3I
	7OY0SVEJRLuvUWh9zW3dkP4MAuonFKE7teMySR+nBpY2bv5pxgIaU6GbkHlqjyW1lXHMr1
	rF6f9GdvdUys+/lCDL6dYLyLKFZGKls=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-H4N1MPZ2NmCP3ERM16KjAQ-1; Thu, 04 Apr 2024 09:46:02 -0400
X-MC-Unique: H4N1MPZ2NmCP3ERM16KjAQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-78d3ea0d2faso12030485a.0
        for <loongarch@lists.linux.dev>; Thu, 04 Apr 2024 06:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712238362; x=1712843162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmzOZMLQMmyXptbwJ4TCleo+H/I/LAr89e90GsrIjic=;
        b=NDbq2U9i1QNrFABbv4NPtHfqA2Ud7I6ZBpJ2rZ2rghTfj476ng+rXZy58fo79U+lNd
         cK2WC+iYSbAl9Zy27vxPyshzp12ZP6PQ2RyLWrL1ATAVmfnRUAviN4SlYZ19iNDLyrV0
         bqikgAIYwc3bIXAe5WIMGAjoX+fvYBTRX5rsyxCjWW/iqd+a+tuOniZ0BFqqgXhLD2qE
         ZLVds7uSowlfhMgJ2zoq1bWXQB5N3wWKTORXKdAhUZPNUlEyCpOGbimgfX9ltd+e5Dav
         GIV5uXTf8tHYnoDlGp19P9gDhLHqtPy5hWqfGApSqh3ZZxLw5vCV1t80D94Xrv2W9fpc
         oQAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU07Sc3Vs8k0uU9FQX7LOpRseaiodTAJjQ4f0eo640JcZRjfvoLY9mrABhHmvUKsLol9Ol3WxmQhMiUmZQrR1FRFQ1BZzGEUZqw
X-Gm-Message-State: AOJu0Yx2lRAvLHnM2GfGCz9eKWRdDPbpQTlYhh3yeWwidOfUCjB21BDW
	caBmgWhMngX32gqS23lUM4rimAI7jv0+hmtUAkBQ1yxRE9rqSmt2Y3v00cjnriTTGB5WVSeCeDV
	dTRcuqw/D9FnxW3r5zeDzO4wu4p6dB9thjff5ZjH/GeP7Qg9eYV0nR0SF7w==
X-Received: by 2002:a05:6214:5084:b0:699:2f16:4d2d with SMTP id kk4-20020a056214508400b006992f164d2dmr2447157qvb.3.1712238361989;
        Thu, 04 Apr 2024 06:46:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJdNkFmzOBKBFyhb53lG1h+VUGQqqfUd/DRv4waZks+wqY9XKFnnPlb39Aj880wVEqUvqQog==
X-Received: by 2002:a05:6214:5084:b0:699:2f16:4d2d with SMTP id kk4-20020a056214508400b006992f164d2dmr2447114qvb.3.1712238361317;
        Thu, 04 Apr 2024 06:46:01 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id g12-20020a0562141ccc00b0069915b47bf4sm2696616qvd.146.2024.04.04.06.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 06:46:01 -0700 (PDT)
Date: Thu, 4 Apr 2024 09:45:58 -0400
From: Peter Xu <peterx@redhat.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Ryan Roberts <ryan.roberts@arm.com>, loongarch@lists.linux.dev
Subject: Re: [PATCH 1/3] mm: Allow anon exclusive check over hugetlb tail
 pages
Message-ID: <Zg6vFtciZAl4SQHW@x1n>
References: <20240403013249.1418299-1-peterx@redhat.com>
 <20240403013249.1418299-2-peterx@redhat.com>
 <Zg3u5Sh9EbbYPhaI@casper.infradead.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Zg3u5Sh9EbbYPhaI@casper.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Apr 04, 2024 at 01:05:57AM +0100, Matthew Wilcox wrote:
> On Tue, Apr 02, 2024 at 09:32:47PM -0400, peterx@redhat.com wrote:
> > +++ b/include/linux/page-flags.h
> > @@ -1095,7 +1095,13 @@ PAGEFLAG(Isolated, isolated, PF_ANY);
> >  static __always_inline int PageAnonExclusive(const struct page *page)
> >  {
> >  	VM_BUG_ON_PGFLAGS(!PageAnon(page), page);
> > -	VM_BUG_ON_PGFLAGS(PageHuge(page) && !PageHead(page), page);
> > +	/*
> > +	 * Allow the anon-exclusive check to work on hugetlb tail pages.
> > +	 * Here hugetlb pages will always guarantee the anon-exclusiveness
> > +	 * of the head page represents the tail pages.
> > +	 */
> > +	if (PageHuge(page) && !PageHead(page))
> > +		page = compound_head(page);
> 
> I think this should be written as:
> 
> 	/*
> 	 * HugeTLB stores this information on the head page; THP keeps
> 	 * it per page
> 	 */

This comment does look clean and cleaner indeed.  And yes, mention THP can
be helpful too.

> 	if (PageHuge(page))
> 		page = compound_head(page);

I would think PageHead() check would help us to avoid compound_head() on
heads, which should still be the majority cases iiuc (assuming page->flags
is already around in the cache anyway).  I've no strong opinion though, as
I can hardly tell a difference in reality.

> 
> >  	return test_bit(PG_anon_exclusive, &PF_ANY(page, 1)->flags);
> >  }
> 

Thanks,

-- 
Peter Xu

