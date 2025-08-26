Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC953002B4
	for <loongarch@lists.linux.dev>; Tue, 26 Aug 2025 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756201317; cv=none; b=VJ8Ifw6Ohc8uH8Itex4bkiYqVtqYB511jfVHt17WCi0YeF+ioDT57ZpcI/z+RkbH1371lPNrZ70rGFW5HBa4h7EhWIcNN5PUl3VCVholiICM1tZxEaCZqjUSvEIY1HEUSeDvA5U7JBfNp5Ee9kPWABYHViApUI78trJPeU7rC3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756201317; c=relaxed/simple;
	bh=6Yi/SP4F+vvFBMFt5ncu7Oa5rF7y/isevPXGyDleOEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7mv+ZYxrf5kmdKvjmCUxhHdkl8pDzRXK+RbjVZOLgioyRMTabYqS5nawugPtiDh+DjNEMZRW0R41rEa0upX0rTVexIM36FHb6ZlZNqkFSHkpoAMsfwpQQFAfB6C2vUk8/jUX+dC82jq+UoavDqrhmFdRhKHNECenclC/Eoa2dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dtWbXo52; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dtWbXo52"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b066b5eso28475315e9.1
        for <loongarch@lists.linux.dev>; Tue, 26 Aug 2025 02:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756201314; x=1756806114; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vqGMxN7g2FZ5I2ZlUxDFgeHjpV96AkI1v/ye9FVXZH8=;
        b=dtWbXo52FcCzJtEKFgtZdYI23BuOqe4IYVnwdky+2ZegqJa8p2I0cVpBktAZN92GNl
         iPuJ910QitbkQ0Z/1U9ozuVDB3oybHLjFfPRNXDi20W5o8xykBh4Sxw543YPsWALprMI
         SVvxU85fIY2m9U40yIRgq020caqKJKOx8p4cJMCSQN8DoVaBu+swO/YsgkomyyHI/ml0
         wozPop4tli25sPy+isO2uDO+MfXRXVqvu1e0B9UQ41atwuvv4Q9tLTUrD41bSoD3qVBC
         dNKHt8inuX4i1Xi2DOVWe8CiLHlSShYTzrL29AL0NNK7GtlZTG2ReGHwSEyFT3D6mLyD
         lFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756201314; x=1756806114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqGMxN7g2FZ5I2ZlUxDFgeHjpV96AkI1v/ye9FVXZH8=;
        b=DjRozLphl1yoa/chCEpiDW9M+4f9ro7ubUYifEO4+RblZoVZeP8AT04OhqAwuIMbs5
         tvEQZnV8onHpsIb22ts6y6R/E4c8ADEY1O1I51D1VPAJn+lhbsEIe+sy3vZWxCkKPRJ5
         Cm5EYFmgXTDc7KxA4fHD+eUVBSIf1cPvzXd/02lS8zlHv5J3UZvgrG+KjlT5h25EOdAA
         hV2hxyTnfK2l3frsAEf3ga8hShxV38SDu8n+sUN9Dqwp/7oOqjmHE+DoCIHiC20ohvYq
         rGphdPfHA/HxeKq0PGjLiq1JHz9pDTxWjZBa8H5boWkm5FAZEYEggGQb8v+YR+8EQety
         GHrA==
X-Forwarded-Encrypted: i=1; AJvYcCUM31tcpBybru3XgiC44/LkThXj4ivQQmCfJb6UmHV1WL95Hgws2qFNJ59GLaNDBswGrYh97V6oZWI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkujAvwdRYxSREEtyYXTByNcPOPfc2CkmXnyXTL9kbc1vPmIel
	jZZl+1CwXZ1zlH50tXcNB/Qx2bZZG/jiB57pkK7Lsa6qdzFYyQX97bTYgWok402EKs4=
X-Gm-Gg: ASbGncsIS25NO82nRAB1Jn1gTUT8qXL6Le/BQZ9U8MfrXx3Z4XY23z7KRVQBtwtsrdK
	JvsPZe9F5f19g1JTNDdPUy2AcaMRbM0t5+yjuIQTI3DLfjBpvpfCeazI5mE6fMVvcZ9Z6X7bpSW
	1a47pBJyR4nKXY4EVbVlMJJ70O3Y/HKlxVxiAQoEMx8C9+uoov9GpkXFSfZpn9/0V4GT4IrmwYu
	4f4z1k25jf55qpPgHVpd7ZrOMzFtTCCHkJkuPQPP8FdV3MXTpl8LPnRmoKIcqYLcUGJ32O65Mkv
	P2TSOOMb822SaXT6/M4KUc3cVgafe9l2t7RUgrnhtqCX+t+Zi40conkMfsXTmhk3Su+qZb8z3/2
	QC19tv/hQMoUxyr9fjYMNT69ntBs=
X-Google-Smtp-Source: AGHT+IEvp//Eb3qaCZvE8rU15Km5LkdaAv1nzJiNdFb5H25Rx3A09MDCbXpDCLgp6CdR6xAWTv2TYQ==
X-Received: by 2002:a05:600c:4f86:b0:459:db80:c29f with SMTP id 5b1f17b1804b1-45b5178e84amr121305475e9.1.1756201313624;
        Tue, 26 Aug 2025 02:41:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b5753550esm143915905e9.5.2025.08.26.02.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:41:53 -0700 (PDT)
Date: Tue, 26 Aug 2025 12:41:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>, bpf@vger.kernel.org,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Hengqi Chen <hengqi.chen@gmail.com>,
	Huacai Chen <chenhuacai@gmail.com>,
	George Guo <guodongtai@kylinos.cn>,
	Chenghao Duan <duanchenghao@kylinos.cn>, loongarch@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] LoongArch: BPF: Fix uninitialized symbol 'retval_off'
Message-ID: <aK2BXe_ADjY0WdAD@stanley.mountain>
References: <20250819111953.3197428-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819111953.3197428-1-chenhuacai@loongson.cn>

On Tue, Aug 19, 2025 at 07:19:53PM +0800, Huacai Chen wrote:
> In __arch_prepare_bpf_trampoline(), retval_off is meaningful only when
> save_ret is not 0, so the current logic is correct. But it may cause a
> build warning:

We pass uninitialized data to invoke_bpf_prog(), it's just that it isn't
used.

In the kernel, we would say that's not a bug if invoke_bpf_prog() is
inlined.  (The C standard doesn't differentiate between inlined and not
inlined, passing uninitialized variables is always considered undefined
behavior).  UBSan will complain about the uninitialized variable at
runtime as well depending on if it's inlined or not.

It's not marked as an __always_inline function...

regards,
dan carpenter

