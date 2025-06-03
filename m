Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE99238C1D
	for <loongarch@lists.linux.dev>; Tue,  3 Jun 2025 13:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958622; cv=none; b=cMjHUtHgF5unkyLUapJiG7vj45iZ3iVC0YKFk+N6yUjKw8C0nL8fkbwcVrqqyFbMmhYAclb9zUSwGpyyW//eNefdmrlsbdNbRk2PRS14Hz4egL9I9PoopO1ev3005+0fV6joctt4FA4cSKD9ZOqvbTmhgY0FsImcnCAn5xGHq2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958622; c=relaxed/simple;
	bh=1doqpPZBZdBJM8o+kHQlB7CeX2bycDJ6ijoRgFE2Vjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJJxWbvbnDtGv68oUF3dIRGexSW+X2IKLdMN/BWWYsCZ4oypROvbW1b/NCviHCHMLP84epI2T/ZtLCqY3bGp3eABJTCB6MWz6xLh/0x3DJLHZvhuRQvaqdsIn9jlRKJguUBJJ21QM5ATKUmZKnjy0qpBk2OPZLnLTXiE3xZhrg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=adVNCd3e; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="adVNCd3e"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a43afb04a7so29710221cf.0
        for <loongarch@lists.linux.dev>; Tue, 03 Jun 2025 06:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958619; x=1749563419; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YkymsPnXdQBda6JrJEhL1GWpprQuWSyxObGqKIJXWus=;
        b=adVNCd3e91rkJuHp3cVaXmA8kx/CsV4FgJRMfxh2uujZJqvSsxaOHL5+tjaJvK6Qwv
         SEYMAHw1D+9T1IC3SeSerBpHLzm5R73eayiZ/zVl+uhk9sCbiolmv4Q8yvjdwP65Ga6z
         YzjeW4c1qS4jPwnvMPJtw5fupQtzB6pXX3XcRP+LWaB0y4Y3ydzl+6ay5GRhKVOwfCBe
         FpalwPZqBE6WCy8CmVjcaNsfzL6mTBEGIN3yLv5bYn31n8gK2eFgD+nc2nBMlMRqk5NQ
         wnvOVC3dL9hQ9R0b1UJztRz9kWTx0oz+yCI+UgICYNzqnrYSWfF1dSNDJ+X8aSOquxxt
         9jRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958619; x=1749563419;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YkymsPnXdQBda6JrJEhL1GWpprQuWSyxObGqKIJXWus=;
        b=VMHp9GI+Jmg/1yo02s84ANoSf2NsTUNK/5d+ZnD/fD0UxQkX+bCNamzvbLOtDQi3NL
         Mrakj9MUJ4HB7w6ao5dHrQLNFKMjfWYJ2kqcwknhRSFwq4e6p9jjPqPaxClS2wO5CCf+
         r9tUk/+/ODtyJ1A5YYqmryUlgPEGtm2hLhzOjmbaXPWTI8kYEI7pUfZ8hJCua8qbiBCO
         vdTvjkqFNNCSxqNRuXF94ZHokY0EjpHeBTtZuU2ZK5vpLWpcOY7E2iD9cC5eNBON8n6u
         akSASp6NRJSPDsjIVchHP0KR6kZa+BJSANZlcsG8bltX7MZAAx93WzNUrx58NCHLoB9S
         w4NA==
X-Forwarded-Encrypted: i=1; AJvYcCU3w3ywoa/ewUOSmQQbMUxOeb0Wt9KCqJzYJQmrOj0KIP82iwVgHsOGm9azbAZBCI5EmAPgfZaWXpk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhHyumc5b58oLKpyOho7J/+d/srvP1+6ruzQLKgKyvhji4+UBC
	UeyfHB7DnWiOAPjR+xk7UdblMopzM1knDCaJMU1oukmnE36fK0MgS209+DMvjnnxGKQ=
X-Gm-Gg: ASbGnctc9pR7Uaxb6iz/KXLUnmqgDb/ri+QWN4kAWYLJ4kyBKnAafjGO13619XOgxt4
	58o/60aDN5p0oqhrBcBDzzd78l2hJhrRnOU9e8Hfd8KjxwxvwxkxO97zi2cFKLx5UEaSAHcGY2k
	ci6FsDdoZkW1hGZkwsgIiNoJpKx/URzgWrRiRsLiJfF01YtwYjKVziTr2CfYZ5W3bp9QGJQ/D1L
	eyZXmWDbhVodl+k23CKgXTsPmSKN12MKGOYmavcCg4YB1XOjIKwILqRxJWdCiX+2+z1QKQJt2Yd
	zs2UTlxIXhkA+dvIv77TzBzoaveizEvBErTb3teJr7RMZA0QQ9n4XjwtpkYjbV/KoT073H41/GY
	5ZgIy/OOkKahtyp7y9vIczbKmkOk=
X-Google-Smtp-Source: AGHT+IFrQ3mNOrW6/ZBr5BKf2weoO3iOKbQMChhnKb6iKzSLwy4jyxYkXr8u6rUugOKC/0R4gbcrnw==
X-Received: by 2002:a05:622a:4d96:b0:4a4:3171:b942 with SMTP id d75a77b69052e-4a4aed86ba3mr229299171cf.39.1748958619327;
        Tue, 03 Jun 2025 06:50:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a4358eef6csm75933171cf.48.2025.06.03.06.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:50:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS1y-00000001hCj-1MTz;
	Tue, 03 Jun 2025 10:50:18 -0300
Date: Tue, 3 Jun 2025 10:50:18 -0300
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
	John@groves.net, Will Deacon <will@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH 10/12] mm: Remove devmap related functions and page table
 bits
Message-ID: <20250603135018.GK386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <32209333cfdddffc76f18981f41a989b14780956.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32209333cfdddffc76f18981f41a989b14780956.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:11PM +1000, Alistair Popple wrote:
> Now that DAX and all other reference counts to ZONE_DEVICE pages are
> managed normally there is no need for the special devmap PTE/PMD/PUD
> page table bits. So drop all references to these, freeing up a
> software defined page table bit on architectures supporting it.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Acked-by: Will Deacon <will@kernel.org> # arm64
> Suggested-by: Chunyan Zhang <zhang.lyra@gmail.com>
> Reviewed-by: Björn Töpel <bjorn@rivosinc.com>
> ---
>  Documentation/mm/arch_pgtable_helpers.rst     |  6 +--
>  arch/arm64/Kconfig                            |  1 +-
>  arch/arm64/include/asm/pgtable-prot.h         |  1 +-
>  arch/arm64/include/asm/pgtable.h              | 24 +--------
>  arch/loongarch/Kconfig                        |  1 +-
>  arch/loongarch/include/asm/pgtable-bits.h     |  6 +--
>  arch/loongarch/include/asm/pgtable.h          | 19 +------
>  arch/powerpc/Kconfig                          |  1 +-
>  arch/powerpc/include/asm/book3s/64/hash-4k.h  |  6 +--
>  arch/powerpc/include/asm/book3s/64/hash-64k.h |  7 +--
>  arch/powerpc/include/asm/book3s/64/pgtable.h  | 53 +------------------
>  arch/powerpc/include/asm/book3s/64/radix.h    | 14 +-----
>  arch/riscv/Kconfig                            |  1 +-
>  arch/riscv/include/asm/pgtable-64.h           | 20 +-------
>  arch/riscv/include/asm/pgtable-bits.h         |  1 +-
>  arch/riscv/include/asm/pgtable.h              | 17 +------
>  arch/x86/Kconfig                              |  1 +-
>  arch/x86/include/asm/pgtable.h                | 51 +-----------------
>  arch/x86/include/asm/pgtable_types.h          |  5 +--
>  include/linux/mm.h                            |  7 +--
>  include/linux/pgtable.h                       | 19 +------
>  mm/Kconfig                                    |  4 +-
>  mm/debug_vm_pgtable.c                         | 59 +--------------------
>  mm/hmm.c                                      |  3 +-
>  mm/madvise.c                                  |  8 +--
>  25 files changed, 17 insertions(+), 318 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
