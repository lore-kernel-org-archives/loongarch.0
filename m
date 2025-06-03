Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF19B22DA17
	for <loongarch@lists.linux.dev>; Tue,  3 Jun 2025 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957922; cv=none; b=U7q4HiXVdIuPm+cxyyva8E+HBrWTBumAKxAF+yJOTZqEKSfRV2g3OsCKFqrMi3YF52jSxL7M5LbGtVCWqkfIDRjkR/tVLmpFpYBk9bXP1v3gxN1llZCTtWH2o5gyryqYbtpk1JMhe++LBZwquotO0iFKM1R4agaJeyZ5K2mGl08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957922; c=relaxed/simple;
	bh=FJcBKj5IOAP4zBarRXTdKou4i5eFgR4+RYmNBOBDDmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQaI0ffcH+A7lluNPKnnWwFmOa5Ny/bwy8+gKodEx7Z+VeUg4X29oW1vv3LjnwIazmHnvBPHtYEgCgRG0c0qOXQM10EdV7CY0PvuISkN97WO1uTLAEyopUvWXTIJNfWSwlQsS4BmLJxRGWTfxN6o64Eobcm/85Djw+nv0q0w58w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=LpUHmhuY; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="LpUHmhuY"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fad4a1dc33so40437886d6.1
        for <loongarch@lists.linux.dev>; Tue, 03 Jun 2025 06:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957919; x=1749562719; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2YoBzO9/Vr83m9kWgElnZwYJY0cXKTy7GFrgVmwfY4k=;
        b=LpUHmhuYKgPP8YLwvjLGkoFVfNPYFHGrQQ2HJ/9XAUQ/d1nHQGlpNsMjo9agXHmMBi
         asB7Qiaey5UcqQqTMoX42jDk1Bl5y5scFcS8Ov9t17R2c6Fv8Uizxgfrzsn9Oa3etv9R
         Sejll8E5HUojyVMv0Wol/sPPKnJF8yjxnNaMm2UKE4LN4Qv4azgoLOAgtbZrVOYYPWDk
         cVrGw42pXtRzD5v7LALLTvwHL+e7qGSblcpDjV/FExEYf08pj4svZGvexe3kGDGcwO/h
         yk3HppKuiXF6FI/YmcyP35uVIsL1/+rs7lU4NwqAh/a0hUifE01aMlwC18Ga/GGrOZT5
         eyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957919; x=1749562719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YoBzO9/Vr83m9kWgElnZwYJY0cXKTy7GFrgVmwfY4k=;
        b=JtsPMzuz377t91eC0ZcXokcAnYiAWRwYRX5eEkMHr2N6nro6wfWJKHa5GJnAV5HpD6
         OtrisZHLfv4Ja6yfcv31ox5jCLtmTqs8L/DQ0MmfKgxoe0g6/cLpNqjiPcFMN++WkCN/
         GTmCt9j7/o5rfeVMWhw3LNQkyBR/u9+xKSOgzHUtTOyywvOWkktPaAUZ5Vt5v0/Cywkl
         3WdvfmpfbAZ7P4vP7iEf0M4chKOmI74gdmprsUXYoIjdD8S3CGOv8bSFyyGXoGG07oKp
         iG1SyI3F3KbNi8NtzaRUiorqHKmIdL0F2E9nZXL7xjqWFjGOW3EMGVQwrfY9dBIYi35T
         3kbg==
X-Forwarded-Encrypted: i=1; AJvYcCUgb+ajc4Os0rITChp7zZS/VZdJsDwviI6/jEv7tF4eHJDRVME/2s9YdKa1qNVM6VSVGs5DoJ6eshg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIrAMoLRggqT0CJHeV0m/QtOj+G6BLDauNWpRxsV5RaLKddGVQ
	TsESR3sQEdB+C4rmJj+Dm/nTl96u9FYfoXq4AKPPWDOsowqtyXI/g84qFnSRdM4Fdhg=
X-Gm-Gg: ASbGncsGOKeERiFimFWMrpsRfvGUzpaknjxpDp7tRyt6edgrgO34dp94+Py07oocZqH
	WNpgk7jYPf01KKaVCJsVWUD/SGQdIzT2OXrIqBc7uz1/p1qv+8xOyEs/8s4r/Ohzmg/6f/VMedR
	uSsUJ6IPLxbcZmk34XprHnPnlhvAqGZ2xhGrD3o1ydyRlLroBJNdrOOPD4bO3lOb9PUg+EXaESu
	RDmG0bqN91HXm8+Gb8DjSuecEdokvWW8lsAyTI0mshwkrNMfvZQ38Tv5R2xndGGENH7mBFOxjOz
	okGDx9Fcke71ZMXfA4i+NlTrGgoVLgPPvUUxTSOgzF+bxTaBGJ6WjwAcNiWhHv+4/jTq9W7kPeO
	ckn3adLWkt8dmFjGfB8osZtxk7F8=
X-Google-Smtp-Source: AGHT+IFNNgr1gOgNIDIKGgPc3bhuHOtoZeZOnCuhf1c+LALW25Lvqo21bVxhfooiSUL50e5IoEYUCA==
X-Received: by 2002:a05:6214:194d:b0:6f5:3a79:a4b2 with SMTP id 6a1803df08f44-6fad191b357mr264142056d6.14.1748957918424;
        Tue, 03 Jun 2025 06:38:38 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e1a681sm80140746d6.98.2025.06.03.06.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:38:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRqf-00000001h6M-29EG;
	Tue, 03 Jun 2025 10:38:37 -0300
Date: Tue, 3 Jun 2025 10:38:37 -0300
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
Subject: Re: [PATCH 05/12] mm: Remove remaining uses of PFN_DEV
Message-ID: <20250603133837.GF386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <ee89c9f307c6a508fe8495038d6c3aa7ce65553b.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee89c9f307c6a508fe8495038d6c3aa7ce65553b.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:06PM +1000, Alistair Popple wrote:
> PFN_DEV was used by callers of dax_direct_access() to figure out if the
> returned PFN is associated with a page using pfn_t_has_page() or
> not. However all DAX PFNs now require an assoicated ZONE_DEVICE page so can
> assume a page exists.
> 
> Other users of PFN_DEV were setting it before calling
> vmf_insert_mixed(). This is unnecessary as it is no longer checked, instead
> relying on pfn_valid() to determine if there is an associated page or not.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/gma500/fbdev.c     |  2 +-
>  drivers/gpu/drm/omapdrm/omap_gem.c |  5 ++---
>  drivers/s390/block/dcssblk.c       |  3 +--
>  drivers/vfio/pci/vfio_pci_core.c   |  6 ++----
>  fs/cramfs/inode.c                  |  2 +-
>  include/linux/pfn_t.h              | 25 ++-----------------------
>  mm/memory.c                        |  4 ++--
>  7 files changed, 11 insertions(+), 36 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
