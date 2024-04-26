Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D0A374EA
	for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 21:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714168719; cv=none; b=QFPWF2+JsCGGcOx42h2UmBJyIqfCyBBF24esIK13BYIf2YGRuX2LzYQ2q4e+OdR0N/1ZqbRdzsyfDJBecpXIMdz4ONxVRQ97lGV7S5Cb/05IlaF79B7e5R50y4teCIqyG+E6ozDtAPuypa5+tQRP8gINs43dznz5GRhO8yXWmYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714168719; c=relaxed/simple;
	bh=GpKDeVd3Be5OZTf7mdPRg/LKaWMV3/RuUFvbHOM6pQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=pHIu6kTcSJc8imbmZzexdkWBbvbQYP4Wp4iQuDzdbwxPGcEsinbyDP5eMFAB7oq1c22oPLGINaWGMOydrCauk3qPPoZrPuUY3B39jt6wZZVY0uSO7hRf74Sux5LhQp9exSwibHhEw6CkP+lZGvaTU98mzZbeXKxXEiD5kDCCsiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c0HwmGX9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c0HwmGX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714168717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+QCnlzmJ6bjL+5B5nZfc9uwhSIwhhaQo56prOJlaB+0=;
	b=c0HwmGX9cMfnjhlUORFjEoGsq0lFQbCYG5e75ey6Nn/j6sLMc+Fw2rYN/ITcVYO8WwQZrS
	BDCAi19bRq5ayqTq8GR6veIXDOgt1xjVmoISlgbNZEMyJEBJzbnbAJn03maAwE6lob29Z/
	wDpi0Z6XNQvoWSuVijRHGGMEShkx+TY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-8nJTFKY_NVyMwafj0WsCtA-1; Fri, 26 Apr 2024 17:58:35 -0400
X-MC-Unique: 8nJTFKY_NVyMwafj0WsCtA-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-78f008cb479so3447685a.3
        for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 14:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714168714; x=1714773514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QCnlzmJ6bjL+5B5nZfc9uwhSIwhhaQo56prOJlaB+0=;
        b=nzzc85wE3mMeel5sm0640jaw+LPRNyLhV0YQ1tejTMwyYFBezg5D5vRdJjNqVzVjnI
         FwlY1y4TNJR+38oRnYW+1W9rz0BnjWTVXhZL8mzNWeDnIKnX00gzFCmRceXWG70aH7dm
         O1ezxanO2bDfumrDUkmTCN7Z1E7Nm4fEvibbimnoXv+7b8GibMW4UgEjzE99J6Umu8VR
         lnzRGRjMcR6JCyYd0KwIR+E01eb52UkDPV5NWVG1waEeBLidGY0NWW//88jE1kucYhNk
         1hWwqGmaHRrFRxc4MvwGCv2Hvk1Q7MfYx0MONOK+hGxglaSOGkTffXN7iA2HD+GkGUcz
         sLMA==
X-Forwarded-Encrypted: i=1; AJvYcCWS7KbAKLXL5QwqXcFPLYb52Q9x+XWzlXVf15hPSmCvT9fUdVOnCnnRhjggcSJ4iaX/1gbKaG1ib9maE5oNaKeaqiXkkvLwYckX
X-Gm-Message-State: AOJu0YyFpdJQtX7XlnVnggZvB6Oxu53+JTY0i05StJRrp/w7RIrLbS2R
	yudCF+rFo5wSyGaLOSUwcVUDLD0a0fsTGedOq03uPKFIvVGw/oI7JkJT9y0A9jZEbHJwLZvv3oa
	S+lockyD3XZ2Y4wyQcEc/GkN69iUgonubyeV4CLhoBVym/u/hEnEoo/hpCA==
X-Received: by 2002:a05:620a:17a7:b0:790:95ad:9260 with SMTP id ay39-20020a05620a17a700b0079095ad9260mr4428405qkb.0.1714168713790;
        Fri, 26 Apr 2024 14:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9TXpTvynaKbMe+uWh4XQxgfNR94gVb6jB/4BIiWgOtfhaqFyr6WLW6qYoOzAm6Sij+K5ZPQ==
X-Received: by 2002:a05:620a:17a7:b0:790:95ad:9260 with SMTP id ay39-20020a05620a17a700b0079095ad9260mr4428368qkb.0.1714168713163;
        Fri, 26 Apr 2024 14:58:33 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id g13-20020a05620a218d00b00790789db3cbsm4659252qka.29.2024.04.26.14.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:58:32 -0700 (PDT)
Date: Fri, 26 Apr 2024 17:58:30 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH v1 1/3] mm/gup: consistently name GUP-fast functions
Message-ID: <ZiwjhkTTRG1ZjyLf@x1n>
References: <20240402125516.223131-1-david@redhat.com>
 <20240402125516.223131-2-david@redhat.com>
 <e685c532-8330-4a57-bc08-c67845e0c352@redhat.com>
 <Ziuv2jLY1wgBITiP@x1n>
 <ZivScN8-Uoi9eye8@x1n>
 <8b42a24d-caf0-46ef-9e15-0f88d47d2f21@redhat.com>
 <Ziwal-SucIye3hPM@x1n>
 <fb3bd167-748a-4548-a94f-9194443c0bc3@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <fb3bd167-748a-4548-a94f-9194443c0bc3@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Apr 26, 2024 at 11:33:08PM +0200, David Hildenbrand wrote:
> I raised this topic in the past, and IMHO we either (a) never should have
> added COW support; or (b) added COW support by using ordinary anonymous
> memory (hey, partial mappings of hugetlb pages! ;) ).
> 
> After all, COW is an optimization to speed up fork and defer copying. It
> relies on memory overcommit, but that doesn't really apply to hugetlb, so we
> fake it ...

Good summary.

> 
> One easy ABI break I had in mind was to simply *not* allow COW-sharing of
> anon hugetlb folios; for example, simply don't copy the page into the child.
> Chances are there are not really a lot of child processes that would fail
> ... but likely we would break *something*. So there is no easy way out :(

Right, not easy.  The thing is this is one spot out of many of the
specialties, it also may or may not be worthwhile to have dedicated time
while nobody yet has a problem with it.  It might be easier to start with
v2, even though that's also hard to nail everything properly - the
challenge can come from different angles.

Thanks for the sharings, helpful.  I'll go ahead with the Power fix on
hugepd putting this aside.

I hope that before the end of this year, whatever I'll fix can go away, by
removing hugepd completely from Linux.  For now that may or may not be as
smooth, so we'd better still fix it.

-- 
Peter Xu

