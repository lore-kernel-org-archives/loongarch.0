Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4432B238176
	for <loongarch@lists.linux.dev>; Tue,  3 Jun 2025 13:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958472; cv=none; b=HunPVDV10pLpv53B6iVFhGl6GXg8xo28Eg3PN7Z3IVvm8gbhn2OhLf3zSCtBTb3l6LID7JjOHvcX88EQ1JdHGL3TeF8VuKxdVJGVNM+y+dISs2byuB9NBmY+4H62PQjPhIFQ0Rxnt/Sv5AZVoYguaR12wCj5adxtwDnARLtIUF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958472; c=relaxed/simple;
	bh=QuA4bLScr7zZl9oRdPCFKpAujll0Lr/hMN/nG963i68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LehaUMj4xmO8CXvPqKBTLVmp+ObomDmfQZzsbHRjVxAgIKZtO8Vq3ZXlttpbY6aXOyLgSxdkQ1rB10IaPksPQUG0NChVxWrAetR0rJGL0x9ws+/3d4PYZqM1M/ytqcoWQNLB3Y8+cWfzWHkTKYOZFa4q895QC4ubkH8lbmvg2lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=VIorGOHR; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="VIorGOHR"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-40356cb3352so3640826b6e.1
        for <loongarch@lists.linux.dev>; Tue, 03 Jun 2025 06:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958470; x=1749563270; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UpF3njOJtHrMyikmrAfZ4zzOg2YUvEVFUbKoE3kb2rM=;
        b=VIorGOHRWcCxYNGhOlLB3lagw6iar6Gu9O+YIL7q/gmeRBg5OwZpcXoioRQRH/lNTV
         ftkVNJ4Pg5Gcqc6a8K7fanHnd9VGY9i6VdhK7wbN1ehghs6l7LhQv8KWC2OIsVhShjvo
         et0od1SF3tlEYvgID6NC6NLxEcwHBPoa8bKhUcyUkn/ij08RnPPHpBMvBxg+s6JD7CQZ
         LSwa2zS2ewUZsWp50oAl3T9EcNseBbcRVA3DXvVLUz+SbMGa/jB9rf3DZs8lzXJR8HC6
         DURJJIusha4zs5uz5GbQQCCvQTgzeRwPbnpQdaSaW4QBlvPA0MbRexb3myT8gP35S7UB
         wa8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958470; x=1749563270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpF3njOJtHrMyikmrAfZ4zzOg2YUvEVFUbKoE3kb2rM=;
        b=CvcxIqp7ZOW7dT0py7NqqgY7DkQgk5xdln9/fu/WxFkG5WvNztMgNcHG+tp5piAWv3
         DRi2CYFs3RJ2U3+fkkrwozVYBnb/VAi7zbNQHQ5gNPjYsgv1Ok3ooWSQi4APDvoXs9Ht
         jc2CfvFB4bgtkMfIoz0dHQGHCl5/zfG8y4kXKm6L19CLxy0jd8n51f7Uy26+R69XH6/f
         XG/rJAOhHTD0mZP5dYFeTf5sqRTSJjLiI/dhNL/5JKlslTTEOzSGly+Y/7EAeGkeBgDj
         GfgAd6qm1ftIgmn98wBSYQSWZT6hkSI50AM08bbJcHG7NUEWhFzHipr1jqsbgZ8L9T70
         9S3A==
X-Forwarded-Encrypted: i=1; AJvYcCV63+qZlTbiRqB0ejZg+O31KeMyxVEge3cA3yjmfdem8vWra6pqqCpbyFeSX//AkYAUGpOJSu9XAaI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGqlY4XFOESiwkxYdMvtgb0l7HqToudQ0M13t1O6dWqgsEU5v+
	Nnnk+Oz6N9yi6Oe1jHA6wiKL5hSg9akQTyYLnB7wEI/2lu+UOzbEqvly2v7tPh7hSlrbSp4nrey
	c0ezF
X-Gm-Gg: ASbGnctU3ZD/9JNl66xWj+ZdxNDO2vt5nZ2OwVAgVYPALhGa4r6zKNX1r7kmqUm7hJw
	bLh/uvgqj8eD48vqM68xeQulSWRJ/NwzT64cfo9HCl8v1J8zlCekSA/LiRiLtSawiLTrwGIQAjV
	Vu3hvIOreM8mBgoUX5SonyRo/9VQ8/3oB9udC6oH6gbbt7c1kI+4u7XH0c00CY+HM+lQaFx7uBd
	FbYbtqPMMZ9/yvMWh3aFwHLR0jI6r2l0MqOvfxhYiZGAq2iGRDqyt132qlULgoLLlmlGpPOeKFz
	CYKEkrpUTbFy6QIkVQDhEHyjcB3eV2Z8U+ijfgi5w8woVFpFgwQIje/3Ah6mfXZToLg4ijrAiRj
	6L68bGGZN1I5spm+mb/5axvvAnv+ai3zlURNEqw==
X-Google-Smtp-Source: AGHT+IEn/uCXnqGk9mGrQEIlQbsguMg4s70jmRhOs28+dV79kPuZtTFgI19mnXFgGkPMbOXTAF/Qjg==
X-Received: by 2002:a05:620a:278d:b0:7c5:d71c:6a47 with SMTP id af79cd13be357-7d211676724mr394455585a.8.1748958459265;
        Tue, 03 Jun 2025 06:47:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a195d7dsm840098585a.78.2025.06.03.06.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:47:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRzO-00000001hB3-1CmA;
	Tue, 03 Jun 2025 10:47:38 -0300
Date: Tue, 3 Jun 2025 10:47:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 06/12] mm/gup: Remove pXX_devmap usage from
 get_user_pages()
Message-ID: <20250603134738.GG386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <c4d81161c6d04a7ae3f63cc087bdc87fb25fd8ea.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4d81161c6d04a7ae3f63cc087bdc87fb25fd8ea.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:07PM +1000, Alistair Popple wrote:
> GUP uses pXX_devmap() calls to see if it needs to a get a reference on
> the associated pgmap data structure to ensure the pages won't go
> away. However it's a driver responsibility to ensure that if pages are
> mapped (ie. discoverable by GUP) that they are not offlined or removed
> from the memmap so there is no need to hold a reference on the pgmap
> data structure to ensure this.

Yes, the pgmap refcounting never made any sense here.

But I'm not sure this ever got fully fixed up?

To solve races with GUP fast we need a IPI/synchronize_rcu after all
VMAs are zapped and before the pgmap gets destroyed. Granted it is a
very small race in gup fast, it still should have this locking.

> Furthermore mappings with PFN_DEV are no longer created, hence this
> effectively dead code anyway so can be removed.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/huge_mm.h |   3 +-
>  mm/gup.c                | 162 +----------------------------------------
>  mm/huge_memory.c        |  40 +----------
>  3 files changed, 5 insertions(+), 200 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
