Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A242239E75
	for <loongarch@lists.linux.dev>; Tue,  3 Jun 2025 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958498; cv=none; b=H33mIL1QaRdZ4lRyUNTP25/ApleD2Jf+Kb2nlQKK09pblacF8u543y5JZWCFSL11wqPqoNpvN61k+yOfJ4HvrSqB9Fi2o51VR4AhhNSpwVHuN7+k1sS4MQRCWAhmf6+QjRXq4cLrv6S0KzvHTES3P2bWMCr9pzX2bwKUa60K/NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958498; c=relaxed/simple;
	bh=y7QlyC6KXPLMJYPeW/fxUEb7YGMf3rqlxQiF8jReTpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTzwVJl2U7TqjoxkH4asALA8XKf99uAcsUsrIHLvDqpuZh6y0GDmUVSH1/Eh1AtvPUqSsOMGcVczmH0C0F0sWR9K0BEYUK0m7qavVVTqNIpV0Pn3v5F86/olcIEShk+/DqRqA8jI5GDMvI1hlfYlBzq4kl46+kqn7KiVVkccwD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=TyjtvbMx; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="TyjtvbMx"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d20f79a00dso160561285a.0
        for <loongarch@lists.linux.dev>; Tue, 03 Jun 2025 06:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958496; x=1749563296; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ag2KSfmpizoceiuoj+cZXZUUA1usyi82jYygfJs/Bg=;
        b=TyjtvbMxs02CiuHETYCDlZ8EiWHuYLqE43D0FLlHW2wwi+qjYdF/uWOZ7mNopgNAzF
         L1LVj53DBXx0+lQZj6o0IKsyNkr9XlZppbBuDHA0yRFVmEdKuGdB75Gw9BEySeP3LFbX
         vUf5kAX3q2VtbyfbiuJyIU/iaj7HJCJNsl2w4XPZnRRMZ/LaD/cOZ1VkA4yrb+jxHk6M
         CyAQeD2KnAWQuxWYCS1a0T5vPZHDK1+fnS6QitdicMAiEi6ZZe+Y2xQOUXV+L8unM0qp
         XnomrqlsOzXz0c/OLPMh86fPb9DRJbZbBBwowp1Ujr+gqUQ4QDQzYLuvzHr26JTXR2zv
         BbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958496; x=1749563296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ag2KSfmpizoceiuoj+cZXZUUA1usyi82jYygfJs/Bg=;
        b=r2/JVLeXRwOgV0rRA2uQfgeKRAnELPWakWDzFdEN8lk1jS/awom59+06pAmFxlyaII
         dpv8vcVt55FkZL5F/fy+l97EwhX617ivPrYyWUvc+4pWxXxgAQAXVchmmPaLQyEYEukr
         zi0AYwLplCSIdUqvDj9CKMXgKAU2pPJWmzE3BH5FYtcfIAPqxTK3ttqk3IKtlCw+nb9c
         Bvh9oTRpciWvd8423DpsLAwvHs4VITiAeIPh0a8dyq1eXLfAhBGou1nGSv/IFFBhrXQ3
         qSiHHusZXCjOLzslcRjrwC6NXZQYvgSMun6/ibT2R1V5dqirgYblWPCkgMY5FxbPWkO/
         8DaA==
X-Forwarded-Encrypted: i=1; AJvYcCWkw6c0GKA+p+3xzWoStihHkAxHz0QtRMW/KjAbvZTMBh9HM+C0t0c0oMhsVBXKsTYhGihD/DMM6Do=@lists.linux.dev
X-Gm-Message-State: AOJu0YysOw3FFI03xZVa8xaFjZ3Dzm4jstA19hZxRAZ/hKo40V2Ok7nl
	PKd8xb1usG5a7R5NhNycFccmg77jVqvCU4KVQAWHEWal718hp1Tdv+/4np+9I89oxG0=
X-Gm-Gg: ASbGncs7HD0GC+HmKo8JPd1Pt1dpty4FTni0hP4CssmRvoxjZTXUX+svy2xAeMzDSEn
	0mti6BUQ8HIjvL3kbGdTn/YogS7a7IKM3CattE+d27HRbzSlROGkTnx3g9ZjJNIRWdtj4DZUpSM
	Da2MtE8Mc31Q7plEWu7pPvn5GhdihB4+o5Qu5QDZnmQCwTYGG/CPhV9fTBKdgbgopK0x5tW3poY
	7Wq7fP03mlD+ri8tZ6B7PNDZkWSLqXdIxV95xROMDZAhwDT+gqVXhYmsx0RRVMu7IDk0VVMSVTW
	aWKm7sMLY3DN7g6vy3IYz6CAdvXvcJ/Vk1mDL2JSG8zeqHWN7EvvkbPjYVXnGU7a22TSF0ERAVZ
	0fxBLrNAsZnBC52itjkaY92xtfDI=
X-Google-Smtp-Source: AGHT+IEC7tetoyd4MWB27Cys7lEZRwLgg/tDNDKGL2nO8t1WlsQDGW4e4zhoToAJp9Wky9F+fr/2kQ==
X-Received: by 2002:a05:620a:290a:b0:7c5:544e:2ccf with SMTP id af79cd13be357-7d0a4e57644mr2655730585a.57.1748958495697;
        Tue, 03 Jun 2025 06:48:15 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0e3fa9sm838696585a.24.2025.06.03.06.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:48:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRzy-00000001hBT-2tOq;
	Tue, 03 Jun 2025 10:48:14 -0300
Date: Tue, 3 Jun 2025 10:48:14 -0300
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
Subject: Re: [PATCH 07/12] mm: Remove redundant pXd_devmap calls
Message-ID: <20250603134814.GH386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:08PM +1000, Alistair Popple wrote:
> DAX was the only thing that created pmd_devmap and pud_devmap entries
> however it no longer does as DAX pages are now refcounted normally and
> pXd_trans_huge() returns true for those. Therefore checking both pXd_devmap
> and pXd_trans_huge() is redundant and the former can be removed without
> changing behaviour as it will always be false.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  fs/dax.c                   |  5 ++---
>  include/linux/huge_mm.h    | 10 ++++------
>  include/linux/pgtable.h    |  2 +-
>  mm/hmm.c                   |  4 ++--
>  mm/huge_memory.c           | 30 +++++++++---------------------
>  mm/mapping_dirty_helpers.c |  4 ++--
>  mm/memory.c                | 15 ++++++---------
>  mm/migrate_device.c        |  2 +-
>  mm/mprotect.c              |  2 +-
>  mm/mremap.c                |  5 ++---
>  mm/page_vma_mapped.c       |  5 ++---
>  mm/pagewalk.c              |  8 +++-----
>  mm/pgtable-generic.c       |  7 +++----
>  mm/userfaultfd.c           |  4 ++--
>  mm/vmscan.c                |  3 ---
>  15 files changed, 40 insertions(+), 66 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
