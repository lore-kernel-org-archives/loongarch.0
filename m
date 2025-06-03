Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44D4230BE3
	for <loongarch@lists.linux.dev>; Tue,  3 Jun 2025 13:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957823; cv=none; b=utRHllRaKXgOrbYG1y3e7TwD3WQsDUYJYyCRoywxUQ25MeaHOr26bOXfrlygvm1gYHxaG53xIo+sNP48rhoWMHUDJRgDaX89gQYLbiGk/bkUTw6tdFhwELNLthc9XqxQJEX5SXgrw0L25JTVYq48MeljDRRaa+K00xD1Qt5n1C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957823; c=relaxed/simple;
	bh=MfnZO5lFJA5kphVhQXFmjyYwzPaWj6A9QLg5HcsjC6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExHtv/ZbQNj/KrhNno2uzJHulVYhx2HOEEopNTpD/3atVSKt2GbPmUbQmlW1ypiJFgnmkUXWjfmEqOwH2DTyld7pFxYJ014H82oEXNBXnr3mBwOorakkgjdMT8Qdb7LBUqn/I2qDuzimyWUiXkpCANMAusyAxncLSEPZQhzjoIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jlJU/yIJ; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jlJU/yIJ"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d09f11657cso510010985a.0
        for <loongarch@lists.linux.dev>; Tue, 03 Jun 2025 06:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957821; x=1749562621; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M2tOvYIRYhJ3zgazeT9iy9SxHIfkqCxujQJZWAlLZ4g=;
        b=jlJU/yIJe44QW2Y15FakA1Jy8j8rgYPOj8DxQgVW4o3hJbIyd8HEaQxh5JK4XSDREo
         AnC8A/YORbsGJiDPkEJDYqZOpegWB5TTwVsMCt5N0bsxHRSBzqYjs3jE7fvetxeEOK7F
         1jObFFkU06boaQaxroRTzM8ma5AdTvxHt56yiyWgEcAroFPjV1uDjvkWAOr+oTaZ35lR
         /1pxUIpObjh2JgqjOFbfnJuxX8Ow/tYaPg06KYwuJTsx1BBBfd5i1/RLeC+11TtXBvBV
         jvADcaUO2pgB4pr9YI71MNVRLNbs+OBMpElMsuOEkmbHDtJNI0rTZ3/YkDS8AfMRX4Ke
         llaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957821; x=1749562621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2tOvYIRYhJ3zgazeT9iy9SxHIfkqCxujQJZWAlLZ4g=;
        b=CXUH6cXfGTjmF74HO6q9C76O3N2XEGPUMo+hHFJrGEvGZIlaaBF5RW9HbQzUYqvw6H
         1M2aN7ra4xO0XpzPtA5CPEHPoRj/5NhEJ4nEToikJYTc3H3WPEDgU9lrmrlvFOFRIhnF
         RZPcmuC1apNNVR4VTa/eim/lbiPLihNqGpkONQdsSTBP6BAu2xJ9SQbqCZPZ7ZFXUIiF
         6Uxmj9+pHLn1naxhvZejrYg5XrRQRjeT3nkQGh++dqGoMuNcBOBCuzugsLWL1n4k6bxU
         9oxkuV/rIy1kwkm1XTRA8Wvibi9ACTqeeCPgOuyKked4+naWDca8QSpdoUyuN8wxrrLk
         QSPw==
X-Forwarded-Encrypted: i=1; AJvYcCXe8G8jrgxZkEkzWVJccqpXwb46pvIPTro3adKhtBNDiP89ZFXjV5gLdZjW8wr+tOnbTN2WNaUFr8Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnpBCnxxrm8fhepiPM8SGlXSYN6mf29Cj1H2eVv/OJxLRokQdo
	LySHtqjdjGToff/k2YIn502ILxn8couYvGKuHvlKIjzY1jM3/VDQpNCCyLJ7bQcKIA8=
X-Gm-Gg: ASbGncsa6F/GYZWWleMXp9jpt/GWVhcV2U4IPIkg11wc8W1EDti2zUeIFtv7c1CZQTo
	tQJQMaUGaqZc8pUUiDcD007FEpw6HGvcYoHJJK0rnMWB6TD6Bl7dBOGXUX5TBwtx+eXQEwJzJVb
	9z08yazD2cacyYe5Aio9BcgXXaR+Og6XVMk01MONq6TyMlUiai8eqSXkmCgS5D1wTNB6CfCtCPx
	EJ/nquByuyryxtsfRUIgD+47Riwfh16eGLLTL+DtbH3eQwR69REeE4M8fdFhF8PRkyNve44g+g0
	nffIXd34PgxpK+/f4oxIURbiSryBYXbHZFJy4Z4oci6Ksdx6b2EP+O/xbNkkyZUirrKyx6josx0
	h/Ind1PFCkDmIVtj4tHilPauHvXU=
X-Google-Smtp-Source: AGHT+IF/1nQKKWghBymIv6kapapYp3T/T+mDb2uBcjAQYD1rkFwd/p2CMx7wy82AG8RXeUKzw729SQ==
X-Received: by 2002:a05:620a:4408:b0:7c5:3d60:7f8d with SMTP id af79cd13be357-7d0a1fb91a0mr2626422385a.19.1748957820692;
        Tue, 03 Jun 2025 06:37:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0fa38fsm842635185a.35.2025.06.03.06.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:37:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRp5-00000001h5Y-2rWO;
	Tue, 03 Jun 2025 10:36:59 -0300
Date: Tue, 3 Jun 2025 10:36:59 -0300
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
Subject: Re: [PATCH 03/12] mm/pagewalk: Skip dax pages in pagewalk
Message-ID: <20250603133659.GD386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:04PM +1000, Alistair Popple wrote:
> Previously dax pages were skipped by the pagewalk code as pud_special() or
> vm_normal_page{_pmd}() would be false for DAX pages. Now that dax pages are
> refcounted normally that is no longer the case, so add explicit checks to
> skip them.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/memremap.h | 11 +++++++++++
>  mm/pagewalk.c            | 12 ++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)

But why do we want to skip them?

Like hmm uses pagewalk and it would like to see DAX pages?

I guess it makes sense from the perspective of not changing things,
but it seems like a comment should be left behind explaining that this
is just for legacy reasons until someone audits the callers.

Jason
