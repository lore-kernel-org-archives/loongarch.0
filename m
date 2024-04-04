Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D90F13AA27
	for <loongarch@lists.linux.dev>; Thu,  4 Apr 2024 20:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712263009; cv=none; b=LhNo7WUBJyFRDIKXiAQWwuc4p/mDzuT60WKAKFTBWxr7yUMvm6WuCKbrCRLw6LLc3MgyMGU6L3tVHEA4lCx5bZGPtEpHUVTTfOY1vI3qIMZxJcWD2KRYDFXw00ENV+3R1hIyQbeAOVOZ98jiSBFh5bFxP9HrTgECpwzGOZr0RlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712263009; c=relaxed/simple;
	bh=y1Rsrld3EEbDp6rEcRf4DJgr5shNa6Z5QESiLrsf31A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=VhRc7Hx5z08TRLaKCsETR3Anf9AkI4QBypzPIBWgFGZTm1CrsSi88Vhq0E8meEIC1K27FhbyozN9WPufoHiTiVdWsTsKqWHc5mtqp5JcH2yAvGZz8VMjjfSxEOxOQ2vdyrtsXKeIjuiBzhpdODpZCxR5lPRG2hILmfJndOoiHjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JNi1crAz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JNi1crAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712263006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B/DObdPmk2vIFww25ZF0AN9UF35je65YLgjdkhWbsjU=;
	b=JNi1crAzudHf4ufDPbjHnMj2+8kpDcyqYCJUbcjrVU9W9Fg2m10shNdU5t7EnNnx9iDLjp
	oMrY58pYRkhG25+cq01qxkWiVBOBxM0zJsmzEzUmD0eVbNsqa3Y1LcZxk0n2K0V8UFbmPU
	xZY0zjWXy/9TpTRV+b4f4DVnBcA7Gb8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-0CdLbTqvNLygtf30mRXTVw-1; Thu, 04 Apr 2024 16:36:45 -0400
X-MC-Unique: 0CdLbTqvNLygtf30mRXTVw-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6993921ae18so1517356d6.0
        for <loongarch@lists.linux.dev>; Thu, 04 Apr 2024 13:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712263004; x=1712867804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/DObdPmk2vIFww25ZF0AN9UF35je65YLgjdkhWbsjU=;
        b=BlGlWt8Ra463yMQ0aJLRum9qQZRW2+ExKW0ko4YBxTi98ppa4jrVG26afRDUyKoZzI
         7nbexEEqelAbgLSKLv/boCbTyNf9XHEe42D6w4Cm9evhsv7YFOptEuSSmmD5ZCailtUF
         7dzFxfyE6tqX9H//qvOLpEUT4H18RYsH5RrnEdHyTOt66Fj0uWt3EyggdNeFp4evMNhP
         5+axyma6rWdgrjOXMuqV/C0lJNCS/MdeLajLm5RB+sNhBnzoka5A83Hn2MJgJ9jePZIE
         efO/wx9L+Tjfp8nzGfg9wGhsjKwXZGlSMWFeMZXvS/dGZHiLXS4+CxrRfIFYC8yu2zgy
         eGbw==
X-Forwarded-Encrypted: i=1; AJvYcCUVei2GwB+KB65VWuRq1W4HdeV6BXFwVEj3Mabdy76m0KEg1Z7YpwhY0rKt9XW63aVmEB/BBbN8A0KK2DrADLrgcFpKCTkUkaod
X-Gm-Message-State: AOJu0YwFiOt/Zk07jR/9mxKUUCC/0rjon2VN2oVx7d3i1elCG0dL7U7q
	1bYgstfgvRJd42+HphCFv/cNkMJD8O3gXx/nDFtneAEfxJ+sp9IMFCc9p5zIIyWnhX601CLobhZ
	fUe8JEL1nZV70l2tSWaLCiLhuHW09XmW+PesxwbbOnQKFQPdmByjekT3usA==
X-Received: by 2002:a05:6214:5084:b0:699:1b70:da97 with SMTP id kk4-20020a056214508400b006991b70da97mr3574424qvb.0.1712263004366;
        Thu, 04 Apr 2024 13:36:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIpQWyjNAjmxMD5sLmyARNNdxOYRp+t32fubrk31G8hnVLmzAp/R36F4eQIQpaEtl6eQpvYw==
X-Received: by 2002:a05:6214:5084:b0:699:1b70:da97 with SMTP id kk4-20020a056214508400b006991b70da97mr3574392qvb.0.1712263003617;
        Thu, 04 Apr 2024 13:36:43 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id b19-20020a0ccd13000000b00699103a1cf1sm44942qvm.119.2024.04.04.13.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 13:36:43 -0700 (PDT)
Date: Thu, 4 Apr 2024 16:36:41 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Nathan Chancellor <nathan@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Ryan Roberts <ryan.roberts@arm.com>, loongarch@lists.linux.dev
Subject: Re: [PATCH 1/3] mm: Allow anon exclusive check over hugetlb tail
 pages
Message-ID: <Zg8PWdGYFEUbzbJH@x1n>
References: <20240403013249.1418299-1-peterx@redhat.com>
 <20240403013249.1418299-2-peterx@redhat.com>
 <Zg3u5Sh9EbbYPhaI@casper.infradead.org>
 <Zg6vFtciZAl4SQHW@x1n>
 <Zg6z4ZEt7rbILgl8@casper.infradead.org>
 <Zg63YZaXqYdSLHG-@x1n>
 <20240404133137.560d15c1a3bc7176424901fb@linux-foundation.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240404133137.560d15c1a3bc7176424901fb@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Apr 04, 2024 at 01:31:37PM -0700, Andrew Morton wrote:
> On Thu, 4 Apr 2024 10:21:21 -0400 Peter Xu <peterx@redhat.com> wrote:
> 
> > Andrew, could you help update with Matthew's fixup?  The comment is
> > definitely better than what I wrote in all cases.
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: mm-allow-anon-exclusive-check-over-hugetlb-tail-pages-fix
> Date: Thu Apr  4 01:27:47 PM PDT 2024
> 
> simplify PageAnonExclusive(), per Matthew

Thank you!

-- 
Peter Xu

