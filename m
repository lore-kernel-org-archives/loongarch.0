Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C01C2D638
	for <loongarch@lists.linux.dev>; Fri, 24 May 2024 04:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716526245; cv=none; b=BnGccQFV3e+yPOEnW/2+x/aV7LP/sxrHXfeX/5y14o08e1NsKpRfriG/wsY8rm7fshzeOR980IwHQexShNV+3mNlWzTk/JG8fn7UQEFducn3JvVnweLOanU76v0jZJHUCLGjZa1X0TL9irngPl4BK7RPtCYsG3MCerUSc6BIT6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716526245; c=relaxed/simple;
	bh=ZPWeYL/M8BoD4LoPUMjAiO4jhFdlLax9jM14Clchk1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CITkNwBtKYaQiON4xVm5FCGKp20X6e06CAS9wRgoTJF64b0Uj6kPmm1luwFkWlyLtSjXhS/fMYX7gdFQaavIk+/owoXV9Krr6/aoW9YfPuDwVhwaFy8FmBvAlmTQ3+B3Ak2yJS8yW5BUmG04cD+gUe64JAHApn4osleXkVDkeZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtpPgYis; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtpPgYis"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-68194ee2174so374659a12.3
        for <loongarch@lists.linux.dev>; Thu, 23 May 2024 21:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716526243; x=1717131043; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIptIV19IdFhks5FxO4qOze6Xd4kuAo9MJ+XTfG/tCk=;
        b=AtpPgYisJcSrfSD+QPwXWZuJSEUv5FyhNpgWQoReZ00R+Rz5ab8C3biDBit9nvm8yn
         P1ArFCSbrBRLx/OtDtnHDje6v7VESGgI2r069fHN+6cSHLM1MONNSjRTHOcy3AkYHBjG
         646+L85XjMEDyZ5j0rg2xhSoAlt08BhCa4RnoQSP33KQfoSvYVnoc2+hROrtTJsfYiS7
         ORGmRlT3ToaXF46CiX7pCsCpPndc8YWUGRyWeOxdt5mBPM5i8/74HJuYTKH5d22wAgk5
         wHewbJSwnyJoHtj6OEen1eOHVz14LAYg3WlwFmf1HNA93EUo5kTdqyCwoKIIrjlF3N9w
         ScqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716526243; x=1717131043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIptIV19IdFhks5FxO4qOze6Xd4kuAo9MJ+XTfG/tCk=;
        b=DO8IL0Z6Hls4GwANmzc+rMCM9ixdAMSP8EwnFXvnw2SAvOqiiNWFbJzMC3S4z0PRzE
         4etNdDqnkAGRafCFQZNJOn/ii0ILKzvjmZtlH1Wui1yNsP9K6kg1xX1G+lb7HO97IenW
         mprr4SrROwGlLPQ3FY9cLTnL5GrgeBTUf5VHb/G5HQNlt49zGG5x74qzKakUC6SOTONX
         FyxI7RNc9j7YJSDJRh4BF3MoG0APMTXwZonEDBJO4OZUS+EWC4DbuJvkduk90yBqqerv
         Oi1nXYOXmuSb7rHfO0B/p/dspIcEQ0aCm2idiZGarDSYCFmHkIJQkp+lh/fzYPYpilLv
         pRow==
X-Forwarded-Encrypted: i=1; AJvYcCVxK3oLRShiBmOITjB+qkNzmTAMXQrAh14LtY1Asd4bhcaBsEneIi/YwwMrItGDvJb23ly+1ibXH7ID6SuFam+Zk5TMwGiFLWwp
X-Gm-Message-State: AOJu0YwNN+x2SeVdqPtpulROBtycAFF+Bo8D2GCgNFga1Jcag8mWtGlQ
	o71BjaCtAxKCacdpPRhbHvaQpQsUdso+WG4zGgS6Ky9YBgKUj/Yc
X-Google-Smtp-Source: AGHT+IGph2ngJGkIc2ZoYCJl38SlsP/yXGoytXnEgHL9Q+wVYFcQgbKU4AH+MCEZUe8DoMBNd28k3w==
X-Received: by 2002:a17:902:64d7:b0:1f3:3f33:2873 with SMTP id d9443c01a7336-1f4486ed8afmr11797375ad.25.1716526243411;
        Thu, 23 May 2024 21:50:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c7ab7fasm4449235ad.81.2024.05.23.21.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 21:50:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 23 May 2024 21:50:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
Message-ID: <eeffaec3-df63-4e55-ab7a-064a65c00efa@roeck-us.net>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329072441.591471-14-samuel.holland@sifive.com>

Hi,

On Fri, Mar 29, 2024 at 12:18:28AM -0700, Samuel Holland wrote:
> Now that all previously-supported architectures select
> ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instead
> of the existing list of architectures. It can also take advantage of the
> common kernel-mode FPU API and method of adjusting CFLAGS.
> 
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

With this patch in the mainline kernel, I get the following build error
when trying to build powerpc:ppc32_allmodconfig.

powerpc64-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
powerpc64-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o

[ repeated many times ]

The problem is no longer seen after reverting this patch.

Guenter
