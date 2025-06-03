Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD3222DA17
	for <loongarch@lists.linux.dev>; Tue,  3 Jun 2025 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957675; cv=none; b=c3KYEJis6o+KmMH0h1Ccmk/3vlokKwNTJOAjNbSlX51aNy+DxQ35O2HPks15vf9B0rbtT677jXT8h6/WpG5xRm4Ez8iG11kHk5OQBUw8El7jsj/k1NbW5I4AKpcM+4aMLfBqyjckp0Wzpt7go42sBIvSnxCI97JD2UpQHbLDLjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957675; c=relaxed/simple;
	bh=Lw5cSrf9yXELvBT6bTYGu3OBlBOa4jK7fmgeC+bgcao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUaCmlpP5Cu0iiIZVXOLDhx0SFT0dkrhP/JEFtMFzC8su37UXfMKdIv4IGatm3KK+Ee3W9QvrvitExgIgg1iiJbVYiEC0jcYL3Kie/svS8emjy0FT7UndYwOqroAr8LHCvwelqF+NWtusDR17mAij5IyjBLwbhE0bX442B8HiGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=JhUX/DDB; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="JhUX/DDB"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so36679546d6.2
        for <loongarch@lists.linux.dev>; Tue, 03 Jun 2025 06:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957672; x=1749562472; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o9eD6fBv50JvJ7Gx4KUjwD3EkSFG+lO7duRzw9dtFZs=;
        b=JhUX/DDBcBWmFh90125f0e9CnRBp5oVNNUdbBpQ4u5OIHnX/I7VzY7asIpHi/0UfCV
         xsKf3hQ5pf6+nagRcazGG7KzgRUWZgIWPdHG5asjrD1TOj6yw688Jos3JoKgAvcPpyX4
         R4qjXZ4emnMJbAdpqubFhiMGcCAUaeUn1X4tXloUrPaXDNYSeyBU9V75jJNvg3eonsk8
         alL2WRul5RV0IXa3u5M3lMRQpfOWMkl+I5ydHwEZaU8T3P0bt7YvI3rT3svi5yi8ZNgp
         Jga4IYnxIkJwbnGkpenyebBTtDfWGD0iFcmfKJG4E4KOEcWkWl4Fymi8TVuV2rXwlofL
         fTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957672; x=1749562472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9eD6fBv50JvJ7Gx4KUjwD3EkSFG+lO7duRzw9dtFZs=;
        b=pK+MCwxyOoUAO+zh4m8g7bqb0DZ4abX1sN6L3etmLn+W4HjPIF+QpZul2ZIigRMs2x
         ZXf/T4R1ruooG9IFIiGjdAczaTGGtyMoMWhpUou48/Qxgte6L4EoJ9G/hzNIdrFVlm5Y
         yJGfFFmN1oGhhJ5rSDhVB7GMmmKz7Jg/F6tim/ria6KDL83hh028R+WJHqsyOg5VTGmC
         USZmyzyMwPGBpVaQjkscnHXFvRyl0ayOLwWbNppEQ2NerIMlxhWrO7xn7PcFBNiNzDYY
         DWRKS7mRQYEygcqUlp32dKMiEalwy/SJG7wBal52GLmbpRta9mA4O1pmKAnMfqkBa/VZ
         G9Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXRnMoq+NRGrXA6aE3MTqIkg+9gwGuA8wdiuzZWk+5D0D3NW+2JIvYxDQTJV1naCrV9LSKDbgz8Gnw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+7icu1YAQmstqUj/xFARr8ljaEwF1xlaN4eJD0Dg2KZLfhRt2
	wCvnDTUkjLzU71PpGHaHJdSarj80xZ6Vi/DaszzpWnHDZEv9SxoKiShXOHJrNiiNp2E=
X-Gm-Gg: ASbGncvXr9NSdVLaLVnX81bsi1uMs9dcFSS20I/UAcdYFaQ7eqx7YDuneeQRpmgSGxv
	hLyXZAr2FrEfGdCy42/vu6A4+Nfx7WhKy1fk7IueIbixLfQ5ASeGBpN++xmQgT0FkSYNwuRXQ2r
	G0QYgmzss2oj25ZFZfWCqzpDhKwlkO6O5aj0mrJp2EKm4FYgOzfIByeQxCEfLEiBHIdy2DSjKx3
	IgJ27LeYWtLLB85juFZpi2kU5co4BX8oGlaPrRGebWNr4IjMizzm5aviX0ZMFXPta4T6sSL3hBs
	Aq54KA8UyMjFAm5p/8b9Gr0k+flK92G3b6qz8ZOHw4gtwHtv3Y7ou8JhLzWdooKqZefQcjm2ZOX
	vHlM1d/1OgY2Ja9R8718kaRHb+RE=
X-Google-Smtp-Source: AGHT+IH3/hKllTZ0eEK/dcuWTgO5QsHZ5LZ3JNRLIXTEioRhdRSPfL4GWfnU3eDieGqXq6aFnuzp+A==
X-Received: by 2002:a05:6214:5096:b0:6ed:1651:e8c1 with SMTP id 6a1803df08f44-6fad90aa622mr189063246d6.13.1748957671754;
        Tue, 03 Jun 2025 06:34:31 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e00b78sm80064216d6.75.2025.06.03.06.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:34:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRmg-00000001h3q-2scY;
	Tue, 03 Jun 2025 10:34:30 -0300
Date: Tue, 3 Jun 2025 10:34:30 -0300
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
Subject: Re: [PATCH 01/12] mm: Remove PFN_MAP, PFN_SG_CHAIN and PFN_SG_LAST
Message-ID: <20250603133430.GB386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <cb45fa705b2eefa1228e262778e784e9b3646827.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb45fa705b2eefa1228e262778e784e9b3646827.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:02PM +1000, Alistair Popple wrote:
> The PFN_MAP flag is no longer used for anything, so remove it. The
> PFN_SG_CHAIN and PFN_SG_LAST flags never appear to have been used so
> also remove them.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/pfn_t.h             | 31 +++----------------------------
>  mm/memory.c                       |  2 --
>  tools/testing/nvdimm/test/iomap.c |  4 ----
>  3 files changed, 3 insertions(+), 34 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
