Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9EF23816C
	for <loongarch@lists.linux.dev>; Tue,  3 Jun 2025 13:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958686; cv=none; b=Ph1e6PACQPBfoWYcvBcnsvQHfKAN7dZpURXIFfyxMmXGWw/KXBsHr5d9k68LnzTw2CMpRgEqWj/CYMB4lv42Fk6KyTlNfpwS8dtbWbXbt97BxrycszT4jVKOp1RYv6HsSbiqarIPMeAuidy5K9jnDuDVTn8Rtv7JZg1wlqLMBXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958686; c=relaxed/simple;
	bh=DZgdvaQsVzy3FEkZ9qjIOfWCU7WN4gcYp04RM+bGGPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxCRl7XGaPO0EYD+n+agBKQXMC81xPdPksw6WdphecKTSGax/3yZPZBFc1+IzFKGMZf1QtUjAVUPO/Rdo+ghCdRdBk7D3XGDsaiKVvm/zqILBzxqD8CBHzFRPstR8fmcFukeLkukIUtvSpHzi9Ct/OX1wwqI2BL/Ry8kfE5Cn2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=CIHU3AW2; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="CIHU3AW2"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d09a17d2f7so466322085a.1
        for <loongarch@lists.linux.dev>; Tue, 03 Jun 2025 06:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958684; x=1749563484; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VzY+cZCL0448RY0GID08t4arF/zf+2+XaBNqbHYkIpY=;
        b=CIHU3AW2TojuEjgtXOdP9TASuFRuULleL3soLTDe9p54M+LB/IpAK8oRH8decbeRR/
         5SIXJFFiywR1K/BKYKYt85AR1cuRQDS7ifvhzDpEmiRj4B85aqXtSLoI6SWZVsPP3+cB
         KM089d/z3SEyTpt96cG7sJ7VJGAsFf+sLuHYqqCk/zUVeQZbMX928WLN0SMHdTypp70r
         7+XwyGWcz0KCCA47EavDEiS8dEdQWZXcMT8MWSrXskPGcCUZf+FosnNPAlm+RJygpGrn
         E1FKP7BJ/uaA1sSOKC9vC21AYPzlks4VFOI+iSx09+B5feuh54Aw3BlFx1m9blFnO5wl
         r9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958684; x=1749563484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzY+cZCL0448RY0GID08t4arF/zf+2+XaBNqbHYkIpY=;
        b=OQcLVlYIkWTsFfqxJzKiAuWlcfQo8tV6+wn6a/QswZTGz2/r14DRgoNo+Qgl1JEH9S
         DOY/GC7AONPK9BER+TtSz4t1m/qWsEZ9vowjnVvZfxiQiDe2Q+ETdrkxeuCVHn7lp3uX
         JnC3p7Z84biYwfucVPuKsKXtCeE3n4BBOM1P501TUsU0eVi/Abr7OMG7KBd5hxtrgoVe
         ge614FN/JwMjXzvSQZ0G8/MeH+aymRUW5VDRRMFoNmMfYcj0fURe8tGSTYTvC5uCg4Uz
         UbLgGxFxSTgmla5UDXodWf2XId830dAbBC9qwhcRwZ8RfT9racQ/DkE2KCH2mlCwq9F1
         OJdw==
X-Forwarded-Encrypted: i=1; AJvYcCU2YHEtYiAR5Ck1SSTYszMF4w+J61nthdU1wlN8C7u0JqNGSUcTwhjo0nnWsiOcS6Edes3LhTNNxlE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ4V+m99gRrESw4NR/SN05K68QKrhdiYm4AxPBQ9XmwAQqLjt5
	9L7/dlq5Jeht4jGJkDZvacOiJr51ByNYHp2fEdW36IVmdV7t2Ym5YAS+G9nXN/X/vBXfpOAR71Z
	4Gzws
X-Gm-Gg: ASbGnctvOa61AL6g40ycWIgj/EskSgRUQyWEhKPMMt7F+12zCLUbd/Tgber1tOJAuJx
	vsmCSgmChU0JSMTY970wcyPj8eeRBtDudi4KGi+0GEgfVgag3kM26imA5qY2FfRPxmdnXqRQCsk
	TSOIUjtut+53UxMoC/JfKFilOp5t7mMBMsqaN43fpQ8mXweyVX9yhfxKrVmnqbLFVtpPjMXcrxt
	y9pLuwzvo9S3JwE4gnxTHvwhzTFZvKl2xRvTXME31U76LY+IIhzM8suBKnQy9MQVHvUROZdJj/l
	L+oY9Dx49Vhpa26wFJgsQptOy1i10Ikbj/WQ9LfkTX9HBbXlGy5raYtjVxTG97/TldqDBqE3dcZ
	64Glgpw0UjaIPN8g/EWlaq+NvY6rm29Q9WH/i3g==
X-Google-Smtp-Source: AGHT+IFvqH9ubcC6dbv0UqQGW5DGDtp+BZ9QNaQHwHo+bs9Vg0oCfSh3AzQ5xeJI5fTattmwccxXPg==
X-Received: by 2002:a05:6214:2aa3:b0:6fa:caa2:19bc with SMTP id 6a1803df08f44-6fad916605amr159392986d6.44.1748958672893;
        Tue, 03 Jun 2025 06:51:12 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fad0495cf2sm68040826d6.39.2025.06.03.06.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:51:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS2p-00000001hDX-3xh9;
	Tue, 03 Jun 2025 10:51:11 -0300
Date: Tue, 3 Jun 2025 10:51:11 -0300
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
Subject: Re: [PATCH 12/12] mm/memremap: Remove unused devmap_managed_key
Message-ID: <20250603135111.GM386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <112f77932e2dc6927ee77017533bf8e0194c96da.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <112f77932e2dc6927ee77017533bf8e0194c96da.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:13PM +1000, Alistair Popple wrote:
> It's no longer used so remove it.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  mm/memremap.c | 27 ---------------------------
>  1 file changed, 27 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
