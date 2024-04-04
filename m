Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30F6126F11
	for <loongarch@lists.linux.dev>; Thu,  4 Apr 2024 14:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712240490; cv=none; b=pTZL/7qV8l5ya4bMLKqzQolp+ZrEzRtiJUUoz1IzqyqE5+D8q6LyJPS5i7QyZntv6Ej3uEiBTQh+luxvEUI3vEL3gqne+1GVG9CkSMABZ6K0lI3/HKtzeDL078x1r1T6ocbiu06NbVNIa9wCX1thjN1gH9ztYcKyEoxBut8ejPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712240490; c=relaxed/simple;
	bh=uZs9vFWiBVwL0RNEsVNDtCzUyXIvEgWlKme4WB6s9cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=P5ZgXSV3feFE5fLp5DIqZ3JQnUiad6Jl5CZ1Lo0bJlcSwceoHtX+FP55WQLUZQfwlIC2N0rU+IiTrPGDgMSX435Zq5Gn50mHNXUF86tzstJ23X443GJiYIXoryytQ5AwsAIoudcxQcECjd5bNqM9lV8jyEC+D48ypC7PjxmgUp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gA20zKXF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gA20zKXF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712240487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GtUY7Ryd2UNJdbdMjsCmGsf3yGM88gtp0MfZqJx3q0c=;
	b=gA20zKXFDPhobeZS4BGlNmDCYpSoqR1C7T7WXb+bjW6EU6swYsYFS93BJ5+FoxRPaKVM0r
	DZKNGpOhNbZBLismtda7ZOSGBOTjryB8/WWqzQNKkuWz/4V0askBkn4Lz0UnnMvNex5FXL
	wVeKSHZp6q4/pQFotgfHmJDFRuZBRdc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-lYGkiMUZOhmSfX7C82qK3Q-1; Thu, 04 Apr 2024 10:21:26 -0400
X-MC-Unique: lYGkiMUZOhmSfX7C82qK3Q-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-430c9bbe925so1636171cf.0
        for <loongarch@lists.linux.dev>; Thu, 04 Apr 2024 07:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712240486; x=1712845286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtUY7Ryd2UNJdbdMjsCmGsf3yGM88gtp0MfZqJx3q0c=;
        b=U0+Ix8gBw5nHHjLHUsNDZyDHpaYMDmWBZGKc584UBhebO5TTEF0F2oWBvycK502s3p
         iVgk7szkq5kEQi2Bcc+/n9BC24nngl8OPqOL4TmISq8pQKViCfYUhy8vNf6xO+SJZGD7
         jOo90xF7lwoqdf5MCkAYTw+KvM1eUMJUjvso6hbDXKKQ74N5vUlUG5AilvPHX7DPRv2P
         4bAb71qPdf3YZi68+RVBnox1LdJYFpAdPQf9WNxkvdzf+HiwrRcMzLLAbgv1MEbv9yCF
         18TzAJaPYUk5Qis3cDSptIACpplkQ3CmFh8D7O9X9uVNYlu8oKvd4HALIaXxTQXuUlwC
         427A==
X-Forwarded-Encrypted: i=1; AJvYcCXZ2IpgPLHqQj5S0WDD6HcfkN7PYxqHm0wbvapDpF/i5qAQc16TklPYjpGVt7chv3D+U+7OYscWlFxqGW0PtwvNkBFuziEipxq/
X-Gm-Message-State: AOJu0Yx5k4d1FGn65KaeHyheHq/RMn8RHy2QVH6F9XPPIfOvx7SMWqHV
	Swo3g+/DcplRChqF1xB0PqDRbdGGd527uMz7e9ZlygDIsDqZLG7HjMoAHsn2DwFeeeCvednssFe
	5qkDlRpJcUW1VLZb/Top0jQ2zTWkmOJzC8JzTvH1a2LgJR2PCtKu8quG0p3A1EzN4Co+g
X-Received: by 2002:ac8:5c8a:0:b0:431:810c:a96e with SMTP id r10-20020ac85c8a000000b00431810ca96emr2500140qta.1.1712240485545;
        Thu, 04 Apr 2024 07:21:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhRpq+S4LQZCpwLVYW+GY9j4DweRYw1JwLI2Ay6RMPXkR0iYHpJNomz2Qmf2zJxRBaHVxPfw==
X-Received: by 2002:ac8:5c8a:0:b0:431:810c:a96e with SMTP id r10-20020ac85c8a000000b00431810ca96emr2500097qta.1.1712240484909;
        Thu, 04 Apr 2024 07:21:24 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id fk15-20020a05622a558f00b0043439982526sm2514858qtb.22.2024.04.04.07.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 07:21:24 -0700 (PDT)
Date: Thu, 4 Apr 2024 10:21:21 -0400
From: Peter Xu <peterx@redhat.com>
To: Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
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
Message-ID: <Zg63YZaXqYdSLHG-@x1n>
References: <20240403013249.1418299-1-peterx@redhat.com>
 <20240403013249.1418299-2-peterx@redhat.com>
 <Zg3u5Sh9EbbYPhaI@casper.infradead.org>
 <Zg6vFtciZAl4SQHW@x1n>
 <Zg6z4ZEt7rbILgl8@casper.infradead.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Zg6z4ZEt7rbILgl8@casper.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Apr 04, 2024 at 03:06:25PM +0100, Matthew Wilcox wrote:
> On Thu, Apr 04, 2024 at 09:45:58AM -0400, Peter Xu wrote:
> > On Thu, Apr 04, 2024 at 01:05:57AM +0100, Matthew Wilcox wrote:
> > > 	if (PageHuge(page))
> > > 		page = compound_head(page);
> > 
> > I would think PageHead() check would help us to avoid compound_head() on
> > heads, which should still be the majority cases iiuc (assuming page->flags
> > is already around in the cache anyway).  I've no strong opinion though, as
> > I can hardly tell a difference in reality.
> 
> compound_head() includes a check for PageHead().  Adding the check just
> makes things slower.

They check different fields (compound_head, offset 0x8 for the former).
Again I'm ok with either way to go and I don't expect measurable
difference.. so if you prefer this I'm happy with it too.

Andrew, could you help update with Matthew's fixup?  The comment is
definitely better than what I wrote in all cases.

Thanks,

-- 
Peter Xu

