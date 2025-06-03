Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEE2239581
	for <loongarch@lists.linux.dev>; Tue,  3 Jun 2025 13:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958549; cv=none; b=sqK8xTfOUu7T3szuSvLPg0dCBxaV3DzVawiFfaJHdHrZTxeZwEZO+j03mV/uofTppQczuVf4ziRYKql9OfNtiznYS7JZyZ673Rm7Sec5ifqwhSJNW0CKQ1l6opVriWxWES1VeQA8ULqexSLI2pwg+RMR04jkmGdHCxULD+ZKpfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958549; c=relaxed/simple;
	bh=z6KLOqm9i0ROrUFmuMKuPSFgLeSRnBoRY1z3awpPe7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZKBQeF6hWLTLvSMGn78SQ0GUSdqkG5MChHFEkzF2ejTfV89bqvsfDiCLCU6Cuf8K3wn/SxhKdYa7b1/3TRU0FL1WuIuqLLcxta3appLSN1/ZtlcSx+m0+DBOz9Wi19QiPr94/S+7PA5G3jQOjRNgpOxiZs5PsLPBcjlh+QDlvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ZdJpsidk; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ZdJpsidk"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a43afb04a7so29699901cf.0
        for <loongarch@lists.linux.dev>; Tue, 03 Jun 2025 06:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958546; x=1749563346; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ooaH+MVJLI6au3+Z1ecUWfQ+S7G2Wg3KD+ti8ca06oA=;
        b=ZdJpsidk/Nvo5Yy1FBD9Sqz0QYtoLEYDsol3Wd4yXCC5dmisc6oKf/1hANTRKiEPzv
         TB2+BuOEnzpjolAsNA30WTM2PH6lxvIMQaM57KPEHOZ0Z/2+l27dVlFPzv4bhZBFEWFd
         MDKrThjhNMW4aKtQzSdHylzP5EuPerrfpDse/028DN9HjSXvAXqb/IjP7OQwVmRvAvir
         Nj/HFIgwo5kePdTTdku5xyzDcCf1k9aEm6AfflcKkFaw86jfXsdI7DCVQxmN4yHlNCIr
         9bGsWt2e4fOo18wXpIe9f6WlkTKDvsJ0xsAbhMTqmlBNXZoFszeSwNWXW2E/jD5ZYWZ6
         onKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958546; x=1749563346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ooaH+MVJLI6au3+Z1ecUWfQ+S7G2Wg3KD+ti8ca06oA=;
        b=JVvLD0Nm3AbgO/vx9v37EL1Kp/xijvde9e5L6kcNfBMzxRU/aj+iVGyW9bKrEyRtVO
         aA/tLlH2VcdfiRWSSQjGd23O5KkPZjwf90lMdb+CpKq7/fEfvL3XEseBqVL9IrLIU29O
         dqLw5ytRbwsFWUjkpLIzH+5HpGNPq76+jZRVS0yHMzbJeNH0TNzpX9dhvZVc5qqV284H
         NRjOnO36SM/0/OW90V7ZB/csR0LVpixS7Sg+cfblvg5B/YDkxaOPLKz1hMLHZG0S82WL
         PUVtL4mj/UGzjZoAly8DvSjoXcVx+39DB7LI05N2b3+Cc/EJsdO25cwRtjFR88V4WFv6
         1SJg==
X-Forwarded-Encrypted: i=1; AJvYcCURcbD/KG2uxdyuPjWDbzuzJvDCBe3YDesIouioYC9rogEfD9SPF0LMQ2lxvteQo0BnnSUtZm8+oxU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9wag1z8BTxdLl5BblD86uJl4XMaxoxyWpud2osDNbVssDvAvt
	Dc1lCoyYlIpOJmg06YbOXB1xlZutjeuc/nYCM0xGW3WbQi3B4LNpunYyTTJfL1rdc/Y=
X-Gm-Gg: ASbGncvYk7LxbksnekytDklrb2mev7VswFP5HcclljNXaOB02Hd6Nr0lyTH1Q1G8Wln
	WJyKM/eZij1LU0dAOzIK/Cem3vPeZkMeAutjLIHtTdZU1EyS8HlZvUK5vdkqchLzsTW+ojri6B7
	G5qpF6vW6j4r2gKfy1HZR0JeqXB2keMecyj4ERaBWr7ReUhcWvtN8j2qMZH0LLxfwqwRmw0KsVE
	6ztydrZ/eOx3qr28gzojbdcA6kpVsqZp+Xq505PNWIl5wesaxSCz6DeNrq3S7bhPgiJpnJ9FJyi
	W1g3x+EBNcSxLmElLGMB4whDUyW9PomHx6KpXodmXOtLaxUnnsE1amViOhUIqkjQcyXJ/T+ZlFV
	MTEyjo38UbWmCVl4Vdie0kEQkWx0=
X-Google-Smtp-Source: AGHT+IGIU1g+493Q79vIGhbP57BxcXzG4cORozjsE0WNUaw+m77zFEPhKIIEfe6WhON7WEL1UbHK4w==
X-Received: by 2002:a05:622a:5a98:b0:494:b914:d140 with SMTP id d75a77b69052e-4a4aed8a697mr209908281cf.43.1748958546430;
        Tue, 03 Jun 2025 06:49:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435772a19sm74189111cf.1.2025.06.03.06.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:49:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS0n-00000001hCF-1wNL;
	Tue, 03 Jun 2025 10:49:05 -0300
Date: Tue, 3 Jun 2025 10:49:05 -0300
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
Subject: Re: [PATCH 09/12] powerpc: Remove checks for devmap pages and
 PMDs/PUDs
Message-ID: <20250603134905.GJ386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <b837a9191e296e0b9f4e431979bab1f6616beab6.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b837a9191e296e0b9f4e431979bab1f6616beab6.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:10PM +1000, Alistair Popple wrote:
> PFN_DEV no longer exists. This means no devmap PMDs or PUDs will be
> created, so checking for them is redundant. Instead mappings of pages that
> would have previously returned true for pXd_devmap() will return true for
> pXd_trans_huge()
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  arch/powerpc/mm/book3s64/hash_hugepage.c |  2 +-
>  arch/powerpc/mm/book3s64/hash_pgtable.c  |  3 +--
>  arch/powerpc/mm/book3s64/hugetlbpage.c   |  2 +-
>  arch/powerpc/mm/book3s64/pgtable.c       | 10 ++++------
>  arch/powerpc/mm/book3s64/radix_pgtable.c |  5 ++---
>  arch/powerpc/mm/pgtable.c                |  2 +-
>  6 files changed, 10 insertions(+), 14 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
