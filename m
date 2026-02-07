Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8BC33CEA1
	for <loongarch@lists.linux.dev>; Sat,  7 Feb 2026 20:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770495608; cv=none; b=GGb8WB8M7JkwuvDDuNNLmEK8XpD5hUIH8DoylimkUGbBqIgSRt0ZemZDBer6XzpCbXbX/MoyJJGzl3Typ9UpG8g4MwqIYtCptFAF+mSq+W0K/ygUI0CVwmtLOEqHR1JEyqDIiEyT/3uKNL/CKTuW74VT5B1mzqFph9GWCR8RjSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770495608; c=relaxed/simple;
	bh=ImAYCiSTK6i1+gxOxS9jG+GM+vLaHxdB1SVCmCPXlrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUFwCkhpdyQR/mjCoohefA0bmikvicZAs4kuGkdMkPTy92Ih7plH4T0+SalAJaz8+UjYpVotoSI3WgUSVTTL+x+ZCPjW+ihQY8DHRpwpf4mCM7paAyIu48Q6b7BjRBrHqBvm8VR83JY6qrKWVgIPebuO7AafTJV+B5RO4JIei4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jakHV6cQ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jakHV6cQ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so33140355e9.1
        for <loongarch@lists.linux.dev>; Sat, 07 Feb 2026 12:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770495607; x=1771100407; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2CLN/nBgZu1TXV2x2w92nD7nqppwuTNa2tEtzd/B9Hg=;
        b=jakHV6cQy2d03Q/3zueXxbsNeLfZiRQWKPPuA4XC1t3DWDjUFr5KrXEr1Q65+sD+za
         NYemtfF+5MKObIEXVMs1GEgSqh+yHrUOUtcQalehcs7F2a+SCzegUEnco/+PbjPNNBe6
         An8Zm/CpHkaM8Bdq4ezsyerRkMGG9ldpyZwgCLge21o4/2wOvS0rNZ2VgazBXW0B0rY3
         KLIu6ThyX44R+rzN5PyyUTsTQVma9LmkmxTnBI59gnYsKl1HKL5R68COvCfN0JhyXhVI
         6dx5ePBX7ziTRIl02a0sYPBKWg46y6vB7uNF0nWw4f9jm+R3y+726lXcYpkmslHcpP3R
         umeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770495607; x=1771100407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CLN/nBgZu1TXV2x2w92nD7nqppwuTNa2tEtzd/B9Hg=;
        b=T6TNKET0XX/kysKt0+/05T1D0OycG1Jjtu5w/D7Ehy7GHb14q1fEd/u/ht8In9yh8W
         TzTlJNxyI7Z7hYq+8aDzgUbUh/ciI9Jy6iEGWl0V9cg4FjjruYv/5/1/dEw9qyoI3F4A
         19btbQNWkp17Mw4eq4DtIilK5NcXaPlF0YO3nlaPaVM4pKV8Hwy7XXLBsOamObUPDGaz
         LjeQCG0JyBLswmjRFo46C6KmlcWbzLj4MWejeM21L3gdLQONeel02Z1YFzfzlKR3/Gqd
         eUV311gUQ/a3YGaDAlecqwzLmIES/7DIwQM3Oe7RysjzJimkes0fIeSYGlSAq/z7GbtG
         eUxw==
X-Forwarded-Encrypted: i=1; AJvYcCULgK5uSQxyyL+BoNNiaeXk2MRXAUF9hONk8dTMV0yI4oP1YLMqA5sqd1tM4fWNdIcXWK6MavpgRtQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAWHw1yG8csiuvUX9yZSAryPlCaRiE7YoqEDEvuMhiWYw7McuS
	b3RzI8PZYWzE63WlQi/ez29ueFAv9783LXSiWdloUz4KlnN4PZaHsEf2
X-Gm-Gg: AZuq6aL8rx75S4ZpjjgCmcWozQOYOQSEZHwLZSAKxBVrXLf4SxI1efqQQy0QzQ6d+fq
	PderiBNJLnVSKrxj4CehrwdETkpJe5ZSqVUGOXmEx6k9kEFCDWzS+x2E5RB7cBocF8CGBUjlQE3
	2O9s3s1dsO5F5Izx+h8UcV2+rIVHGW5QyXyjOm4afaQ7U2xRQujEg1+T6Jl1DuZ66IVOsy6GTz2
	srcaK3ODq59adTrbmp+5ArdQmTbHLO6Qb9v9hOq63jkNMA+N/YIhW+ubmLFITXO3ozLDu/ZRIyF
	mbAzoGlULed+smx2retPJCmD9Kbku5QW48nQC+o6oRNA3wMlrQKgYjHEBjMeK3fLVeUMR9teFmQ
	VQdK9WPxn73SRnZFlREIg0uiVDqyen0hEefbv/uFtmIYfPuTQT6UD9NIfg60H16PEfqwlibxK7y
	KBEc0RPiZxnxggAINbZg4HOoObvyeKjxeczRQF4AzjRdGwK/OEp49tlvpeJmw70E1RUfRlH5jsS
	4xSuITWbXLbcF4=
X-Received: by 2002:a05:600c:548d:b0:480:7162:fa48 with SMTP id 5b1f17b1804b1-483201ecd90mr108547085e9.13.1770495606497;
        Sat, 07 Feb 2026 12:20:06 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e752:9400:18cf:c773:ee86:c436? ([2a02:6b6f:e752:9400:18cf:c773:ee86:c436])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483209cfd77sm51750705e9.14.2026.02.07.12.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 12:20:05 -0800 (PST)
Message-ID: <f4e66e8d-d285-4362-8bc9-fef00f2f624d@gmail.com>
Date: Sat, 7 Feb 2026 20:20:04 +0000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 01/17] mm: Move MAX_FOLIO_ORDER definition to mmzone.h
Content-Language: en-GB
To: Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 "David Hildenbrand (Red Hat)" <david@kernel.org>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-2-kas@kernel.org>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20260202155634.650837-2-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02/02/2026 15:56, Kiryl Shutsemau wrote:
> Move MAX_FOLIO_ORDER definition from mm.h to mmzone.h.
> 
> This is preparation for adding the vmemmap_tails array to struct
> pglist_data, which requires MAX_FOLIO_ORDER to be available in mmzone.h.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Acked-by: Muchun Song <muchun.song@linux.dev>

Acked-by: Usama Arif <usamaarif642@gmail.com>
