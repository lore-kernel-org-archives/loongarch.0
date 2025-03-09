Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCB236C
	for <loongarch@lists.linux.dev>; Sun,  9 Mar 2025 00:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741478910; cv=none; b=sOOfAbS9RSlp+vsylwWRwLqMoX83DGk4ylx6YN+8Shz1qyyNjlsaOO9mZ5LVwLDlTgzZTMkisyDmaACU1JB578KX5Qpi9qIEL1zyxvpE3jc3EJcCvQ8ewPluieE3eGzSSLpvjcJ2X6F8FtQgCcIsMesBk3OM6VStMU5bJql7iJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741478910; c=relaxed/simple;
	bh=XkQje18o1sHvj+eapngieycehlzqZSwkWhoEiPAoSGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rm2haK7YCLDf1D0Djrf/CZFtxWZSVJg/3bVKwQL1fYhpzaPJArg+ld+2igMWwo0VQP/4EIdWn0guTjur0quMPibZB20vjSENcVWtSSTeShuCZyHPLgYMXVW/hHcui4RB80nc+uYojmQrbrD+MV/V7WYoWz3ldCnr9aJlYWHtv/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=J1TzlbXL; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="J1TzlbXL"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so2552677a91.1
        for <loongarch@lists.linux.dev>; Sat, 08 Mar 2025 16:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741478908; x=1742083708; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dgCgJBvkZIMBc8noi3WFpbSBR9qCOzQZcMrrRAMLJCc=;
        b=J1TzlbXLsWUxMD+bUtGNXy3Uh0PcVR479EMG9QWLYCEqK2S4ifQxa/MkNRddUJ3jpq
         E/Drr9Dc+mRo+OXIbooJGnx5WNI80esvX9gSxGMpH0/fPvIbtfSLfYVWqlJzePRA0tjS
         z7QdrxXy+Dj3m5cyYV2rDIGczyeyHYC8RiR33ykSsJ+kg2gyfJB51u1eKr/ZFCBLtabc
         f0OfWXm2bTXWG97FHAGO2RTnvSxmjBPcMyNeZ/lTSj83YGBj0mqPwJFKLvMCaXnlk2IN
         T36jqU7kc9hV+pBXOw1Uysx2rUrxmMTjaOMw032+UUzU13priYzM58+CybrxIs8+aUza
         NURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741478908; x=1742083708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgCgJBvkZIMBc8noi3WFpbSBR9qCOzQZcMrrRAMLJCc=;
        b=h+mWjAXM3tERpp3+Vdzyf9fsosrncVodiuXIzXAmc+xt8rDh05/cZgikvJDD7L62nJ
         5/5GiudQYn3Ddy4ftRLYPfQBfasKScWSbnH7o7pYVipTaQ8wPPlNeoPzhtl1ApsSWXVN
         SKl+8PQp8zIpU+N3cosoHA3Je5ehOiO0Hop0LZda4ccWqibUUEAD4ZZCu9kXI3uNd8+9
         wd3Xbw6BNXt9/kW61KfJhnab/GKIZcWOBtIdmaiW3m2S1H9j8QF7dCimmSqtmO/Ia7je
         prPyNdBCmhCHzWok1jSTHA/x4u2AFG8Gv682JZB+8BD1s7XxC3SnG/NbDZvPRGT+Ms9i
         yohg==
X-Forwarded-Encrypted: i=1; AJvYcCWOej3oLioxvkXnmhhvtdTov2XWT4rvOngKTlTAr9xvpM9mrOMZyYxlbm+dnGQIkLCilHPoIk8ITog=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVnfsMu93oKJHOZP5kVbtVXRMk7HwPl41oLTZEPSqWccawrcLB
	pSJzVjxPA3lg0AZ4nvxaUL6xsskTdFt0KH5tZ/5NZ49NIhk39GcEFGZS2EJmlNM=
X-Gm-Gg: ASbGncvP/E7MQXUqk/n+amEpDqEFYhIp6UqABWb1BtS+k5M9kNbxZtfBPjyC7fMM2OV
	CmJ9xway+g9+wbTbPSYHusHT96D8OXK/H98kDQt+iOBZ8z+lRM4oSc6FBDfeuIutmt/gJRTYs28
	EzZ2xoC0szmVnq8Xq7HDfw+4d9/TA45qrAFWhoqS0eG66KU7xcy9SbDy74SeQVK39zVXz8LmvCX
	bl9vw6FsmUzeufJ7Ox3qqdTnbFXoWZ7ExmNFtnwqPgCV5oaiUTU+1K7SgviKLVxsEFhD0oW83Qr
	KD1A78n8WmLcV87Md6R46sXbdmeur4wdGsL7/Nml
X-Google-Smtp-Source: AGHT+IFjYW7ZJ+OLH/60YBeqr+NNm0ThrbaJH5Yqhel/9cm1VDsMYXdPNanWyIsdgfurXM5lyU3qXA==
X-Received: by 2002:a05:6a20:c70b:b0:1ea:f941:8d8e with SMTP id adf61e73a8af0-1f55611bdb3mr7382609637.16.1741478908372;
        Sat, 08 Mar 2025 16:08:28 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:e489:3a91:c6e6:513d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af28bbf3ab0sm4009124a12.9.2025.03.08.16.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 16:08:27 -0800 (PST)
Date: Sat, 8 Mar 2025 16:08:24 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v5 4/4] entry: Inline syscall_exit_to_user_mode()
Message-ID: <Z8zb-L8bFMh_YHxO@ghost>
References: <20250305-riscv_optimize_entry-v5-0-6507b5dff3ce@rivosinc.com>
 <20250305-riscv_optimize_entry-v5-4-6507b5dff3ce@rivosinc.com>
 <87senn3dh1.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87senn3dh1.ffs@tglx>

On Sat, Mar 08, 2025 at 01:37:30PM +0100, Thomas Gleixner wrote:
> On Wed, Mar 05 2025 at 16:43, Charlie Jenkins wrote:
> > Architectures using the generic entry code can be optimized by having
> > syscall_exit_to_user_mode inlined.
> 
> That's a pretty handwavy claim. What's the actual benefit in numbers?

I put the numbers in the cover letter! Here is the data I gathered:

Testing was done with the byte-unixbench [1] syscall benchmark (which
calls getpid) and QEMU. On riscv I measured a 7.09246% improvement, on
x86 a 2.98843% improvement, on loongarch a 6.07954% improvement, and on
s390 a 11.1328% improvement.

The Intel bot also reported "kernel test robot noticed a 1.9%
improvement of stress-ng.seek.ops_per_sec" [2]

- Charlie

> 
> Thanks,
> 
>         tglx
