Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDDD2040B6
	for <loongarch@lists.linux.dev>; Tue,  3 Jun 2025 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957864; cv=none; b=JsItWAB95hwr+FxahQQElgX04O2hWlIPhOIpzLEwVNfEOY5kdb7a4dSnIq2rPw63i4GsT1ZcCkuUQErCLKCQovvCFPdIvjoASdMnSwn+lhDzSAo2RhCUdVf2hDAv1DrJWEbEyOzkybkZ+dm2Sn3jaEoVQkOrZCiIg7vx8uimioI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957864; c=relaxed/simple;
	bh=tQw110EHLRiTqyKmaEl6CwpwtZx8Pit5aVtH22wzAog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwChBa4PTuZETwPDn/5UMxCky/sBUNYk/L0e05g9X3ga8/56uW4wcuXdvBpUd5ebUZpzwoV8TOGBo1n+31b7z5idfHXv+JalegPL6Oq1feri769/nYO9nip9O7Qjgoi3Pid6LoAVFKW5ReNSW7Of7e+Fc+Nxz2wPkFEM3aKCwPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=neFnfMA+; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="neFnfMA+"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a5a196f057so5698431cf.3
        for <loongarch@lists.linux.dev>; Tue, 03 Jun 2025 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957861; x=1749562661; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UoX6ZYAbWcKDR6KFcgyyRoqI5kTXzqc7rOw8qvSUCMg=;
        b=neFnfMA+eARIXimJUE4lZL+eZAMms5ihCtBhjl+Wj9ZNs0JLPgeDiv8qJ1+ZuHzJRB
         jLvbvXwUVWeTxLi6epSkqICC85eeUZWgv1w4enkYwRYRO4pihS0uUez1d+vYX+wlbprn
         Qn6CTz9S+e+gG2hWVuAFk7RQBEUGVB56thP9tbDCXlMJkCcjAdnBmFSr7HPviyAulmug
         0qcisKq2pBEu8NJ8KJeH8yknSMLhGbwWLfSOmpF0gxK4p3OA+6TgL3YzBHhshHyhDHOV
         7G6yvnAjwyxjDHt/0p5+IBiEaA99qzWkuQcKgFlJr5fYxCB/OCyHClkx5RpOWQ22oZVd
         D71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957861; x=1749562661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoX6ZYAbWcKDR6KFcgyyRoqI5kTXzqc7rOw8qvSUCMg=;
        b=w3VeFoYNboal0oPNDffP9RzrwD+/d9/HGdE5eSFV9Qwu7tbHLEcpDYU/pXMNmn9X4V
         B6kSfVAMC8kDhfMcVDePfQU1JKnzfSC5EZHyUqJM1XBCfgSlMMNjfNWWCLQ9mTOyqrc7
         hi7G5q5NxcVQq2QahPqRiIzCkvLDbxEjIT13af5njy4GMe3ebqUNnRUzYmWouaTmymDQ
         cpRAcmwdg63NDJOOQ/wE0IEr9o3ZPUr7sJw9/AMOq5kQn8TPDZzjI6hMgRunXjnNyEMQ
         u6raeZPI8b4gYh8xeYmCOsq9OU66Kj0KX4GLJrai5kD6hpJX5WNCWr1pDQ6ABnC4w8bW
         0Wkw==
X-Forwarded-Encrypted: i=1; AJvYcCV4EwFIvmoTORrvSimM6UhlZOPvCalILIFKzZCi3G60YDgxcuucgBSRGd69pXQ2lY3pl6dQCbMokfw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzU39l7m9OO/ywRBVfnFgBCqgjtf1460MPxAvuwoWSbTT4rvIYH
	OAD9A74BLKsDjcYrt1wFhorRhyZpEloJjtca3D5GY4iNiOixbA78GFZHfxTITS4G3S8=
X-Gm-Gg: ASbGnctp1knZCyKDej4jZJ8cUMliyX2n4gQVbIeTJXROrxy8bT+AAGWFFqwFMogoTsZ
	DVnZU+xtOMZmkk2H8nY+JhtMbPuhSLxokuj7cEBmRV61gfUiOvspQQUluU/yjbSfiHhR4AYdnxV
	sn2BdtTpYkGyc7taHgOepby8rjJ5fJJTPHbLxGWcmLeW/npHM4RJLKBcMyARIFCP1jZPcMmAQQY
	2J0Tn5+OZrouid77VjE/K8ddDYpyRblunPWpDz/hmG6oVWWKvmrAb0hLbSsMwYkH7eaQwKvMT7d
	JO51TdrHaICmd7+FCioew88kmXsEk0hVE5kI6p8FridxqW7/Chrs6To176aGjzCBh2maci9Kghw
	eYVtC66NzDFkcTzIsXOZrD1bh/wgZVYZTL6WmPg==
X-Google-Smtp-Source: AGHT+IHIja21FGplZEuqybwyfzBxoI5k6ggct08qhelvg2n2Sr3vDQGi+qZrCCr84f/KmAHse8r0Yw==
X-Received: by 2002:a05:622a:4c16:b0:4a4:2e99:3a92 with SMTP id d75a77b69052e-4a443f2d1a2mr265367291cf.38.1748957861491;
        Tue, 03 Jun 2025 06:37:41 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a36e1bsm73924021cf.62.2025.06.03.06.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:37:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRpk-00000001h5v-1tYD;
	Tue, 03 Jun 2025 10:37:40 -0300
Date: Tue, 3 Jun 2025 10:37:40 -0300
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
Subject: Re: [PATCH 04/12] mm: Convert vmf_insert_mixed() from using
 pte_devmap to pte_special
Message-ID: <20250603133740.GE386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <171c8ae407198160c434797a96fe56d837cdc1cd.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171c8ae407198160c434797a96fe56d837cdc1cd.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:05PM +1000, Alistair Popple wrote:
> DAX no longer requires device PTEs as it always has a ZONE_DEVICE page
> associated with the PTE that can be reference counted normally. Other users
> of pte_devmap are drivers that set PFN_DEV when calling vmf_insert_mixed()
> which ensures vm_normal_page() returns NULL for these entries.
> 
> There is no reason to distinguish these pte_devmap users so in order to
> free up a PTE bit use pte_special instead for entries created with
> vmf_insert_mixed(). This will ensure vm_normal_page() will continue to
> return NULL for these pages.
> 
> Architectures that don't support pte_special also don't support pte_devmap
> so those will continue to rely on pfn_valid() to determine if the page can
> be mapped.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  mm/hmm.c    |  3 ---
>  mm/memory.c | 20 ++------------------
>  mm/vmscan.c |  2 +-
>  3 files changed, 3 insertions(+), 22 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
