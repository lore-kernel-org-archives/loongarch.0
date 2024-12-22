Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1922AF1D
	for <loongarch@lists.linux.dev>; Sun, 22 Dec 2024 05:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734843841; cv=none; b=klg007zO8G7NfR9i1w3W/FYpnnYMvOz3DUUDPe25qxT3QksF1/Uag4kvGSlAv3YfG2LeOwdrLsbthav7PFhX4wvnlT6O5aIyUeJUHz2OJRhyHYRftKZYoG/EEpjm3zqpIwyhVNVTPyFdawMl78Ru84odDulBieCBXIc22oR/rNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734843841; c=relaxed/simple;
	bh=5t7THXeYLUSycCBIfcIjI9AFeum3p8DXxikqHy9ZaHM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkSdhFXNqD3ZnL0f21Poc5BbUL9XPKTcz3ZZmf4Q1Hn9W5qebz+gK97QB3wMJatgqVdAxeZqU6clNM/Nm3+f1LtwXsrjhwJWtqo/i7x+MChGaignW62CrofPBGanQFaff0OJ+LRKgv+5Q41k/jKpX+BQKoiirMzkjAVKgeb/EMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=S0bPjQRR; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="S0bPjQRR"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso2235061a91.3
        for <loongarch@lists.linux.dev>; Sat, 21 Dec 2024 21:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1734843840; x=1735448640; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aRqCUQOlRgtZiRc2AC0vsaNCGW6lWCvjfZ2K0ekwaBA=;
        b=S0bPjQRR4UyMOAoJ6GBAPnXwx8DmLrv48b0QAb0KC2DcdX8dPb+RUkEcWEioVhQMgm
         U0DDbRJ7gRx1Fids0U+/ztNsLlRwXICDRlkoK9pAGz05iMigzEnf0L+pabml3R/FyKlQ
         RB0uwOvFZQvq11gzsihFHmpx6RZM2qAQKo6retOGlzVCdZ59ZFvyfUHFdgKC8HS/N4FK
         L2QDXGwAD8mxuG0ixKAMt1p/Q573TK47Vr0H533ZcuxbpsAaq3eo/TT+Mxnbu6Cz3bkS
         9eBS/Bf4Xtc10D99VHMHPms9EaBgzN7bsS3ao6qwGWh/rJfHSjGTh8/KXi2JzQkBPjAX
         KbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734843840; x=1735448640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRqCUQOlRgtZiRc2AC0vsaNCGW6lWCvjfZ2K0ekwaBA=;
        b=RkX1w6sellbel359vTJ+0I8RUjBkNf6dq/VhR0YJNtDA/B1hcRUfIP18BC0zp6KGSq
         LRJbX9ipByRbu1evi167/mFlcs4IPfm4aMk6HCxJJIUKiFhXwUnx4YJ7pCXkqUn2vtlQ
         5ICvXfYnBJFhIEOR+/Hzrtq6QxAgYUUWYJRaTXAK5RcQykFmHQNbg1V9JMFopVEgCyU1
         BHMwDFImVdPSkuktRuFDbzUOujeDDomsUG730HjhsQcAinAs7m2L2pOgapauOYkaR19i
         QT4nY+zWCClAGW1z2GCCCMABCj1HPC6nMqNWBh2ZynTBxvZalAfWDrPAXkw/JmYEXeSK
         wHvg==
X-Forwarded-Encrypted: i=1; AJvYcCXhmQqjjzQGQ32Zjd8YlKHcAk3QWuKotXvAtJHcEEiqXhylr3kBlzBaVSHwekfMZrIkl8kLAsKavsI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfSm4yJt7PsDiTaG5IA/OgE0Vm+gi/+sYQH7MEzpaplp6j4vJe
	4sgw/xJyZ6P3uXi944QpvE2cW7ceJ8zRqYSmHg0P9Rv5EFxqktnRXKSBqhX9TDI=
X-Gm-Gg: ASbGncsh5e216SvPVVb1KLllcIhn73mtnXnrZ4KjaP5pfofkh+5XxxBnSZ+EsH3xvSy
	RFypRJejTCEYtCk2n19BO783jzxsfNQmwruCNIflGFAkd3Iy2qBmKLyDkWyigNEZ7++VIts/mTH
	42JFa+ZYyNzPyk8rWutPWQNa3Wq4Kf3EI1eXxkaY2mT6Hm13+zKdPxk40i/OorOHKb4kna3lWFN
	wHrC1TZG7I2CKe2md7hr8VmxPR6ZMleHzAtGYr4+7TLFmmoODNg12e5/yjkx6dLiEGbeTlp+ZPP
	3PHdOZ4=
X-Google-Smtp-Source: AGHT+IEz6nqPahLXccgfO9cSrt88CcjDjg2Jbhh4D2ThWhv0YE8dqXggljaBjhQgpLKbihe32IQpgQ==
X-Received: by 2002:a17:90b:2e06:b0:2ee:ba0c:1718 with SMTP id 98e67ed59e1d1-2f452ee8cd4mr13567612a91.37.1734843839761;
        Sat, 21 Dec 2024 21:03:59 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F ([75.167.163.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed52dfffsm7819678a91.5.2024.12.21.21.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 21:03:59 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
X-Google-Original-From: Gregory Price <gourry@gourry-fedora-pf4vcd3f>
Date: Sun, 22 Dec 2024 00:03:56 -0500
To: David Hildenbrand <david@redhat.com>
Cc: Gregory Price <gourry@gourry.net>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, kernel-team@meta.com, corbet@lwn.net,
	osalvador@suse.de, akpm@linux-foundation.org, chenhuacai@kernel.org,
	kernel@xen0n.name, gregkh@linuxfoundation.org, rafael@kernel.org
Subject: Re: [PATCH v3] mm: add build-time option for hotplug memory default
 online type
Message-ID: <Z2edvO0X6H_IoMRz@gourry-fedora-PF4VCD3F>
References: <20241220210709.300066-1-gourry@gourry.net>
 <5e958aaa-b1ac-4512-a592-0e1612032861@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e958aaa-b1ac-4512-a592-0e1612032861@redhat.com>

On Sat, Dec 21, 2024 at 04:30:21PM +0100, David Hildenbrand wrote:
> 
> > -config MEMORY_HOTPLUG_DEFAULT_ONLINE
> > -	bool "Online the newly added memory blocks by default"
> > -	depends on MEMORY_HOTPLUG
> > +choice
> > +	prompt "Memory Hotplug Default Online Type"
> > +	default MHP_DEFAULT_ONLINE_TYPE_OFFLINE
> >   	help
> > +	  Default memory type for driver managed hotplug memory.
> 
> We should call it "hotplugged memory" consistently, which it is from a pure
> core-mm perspective ("add memory").
> 
> "Driver managed" reminds too much about add_memory_driver_managed(), which
> is only one case. Maybe just drop the "e.g., page tables" from the examples
> below.
>

I suppose it's accurate that this also affects VM-hotplugged memory,
which may not necessarily be "driver managed" in that regard. So it's
more accurate to just say "hotplugged memory" - although even that's not
quite completely accurate according to the definition in the docs.

Either way, will change it to "hotplugged memory".

Probably at the point where you have multiple sources affected by this
change, you need a udev/systemd setup anyway.  We may have to revisit
this later, but I doubt it.

~Gregory
