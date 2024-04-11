Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA985FBA6
	for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 01:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712797334; cv=none; b=UoRUB5owMlwksdiAi2aTuoV74tavKISSQAWHnSreH3WGuW+GZYLOf634EgmIdiU/aUP7FpzRwgmzIzvlVdFxTHgdmL1wD8lHPr8nnvQ+X9000jv6TKPgNTV/Ft+Nrqdkmmr9w22DnHQB58PUvbm4SbsYXw89qHuPK/0qYuSE25s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712797334; c=relaxed/simple;
	bh=kLD5kpB2LP2j5uUBOjlchyyyLOgJsQ4KSunDLcwJfvc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S44Kh4lBmnEpDThWMieu6GKXmox5EufNjab1jZ/Eqg/H9IGjEeotlfdEC3hXzHdl2BQ4O28DVbvNAKLKGNu2m9+coB54zwtPp4Ec7EryQk4P2hBpY1Sg+6YNTo3g6B/7gbmhO0lasLHFlI3js2qBPwCkrBR2N2Qf/yrueo19Uos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pMvnJwZs; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pMvnJwZs"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2a4df5d83c7so2617409a91.0
        for <loongarch@lists.linux.dev>; Wed, 10 Apr 2024 18:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712797332; x=1713402132; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kLD5kpB2LP2j5uUBOjlchyyyLOgJsQ4KSunDLcwJfvc=;
        b=pMvnJwZsIXsFxMNPeJerFvXd/UTi526JRRFk+k1rGbflf/AYgobLXUMtc27YpyKjrN
         ZaVpKn6ebTUBc6Lz38KFqdVabba63OprzWEu45J0wjx+KKY0h9KfKtWMHCPmU+/C7R3W
         Dh78W0dGfKCEAat8knO/+9UoYhZwQr9bFsNo0SksSNnbq6tm6ck3wTP5Yw7JAoqHiQBg
         n9Ygm9dCBIY/x0QOaUArApWx3uLa6K7fjnhAI4/vVYdXXucUEf5svI1lP8hJyhQDMaHk
         lSQxI9QhcPxge3LgLbg2NrXkcDKgQ2kCRFhI3ZtzvPlkYi7Z0N6LykSXTguHqQKOKSyi
         sqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712797332; x=1713402132;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLD5kpB2LP2j5uUBOjlchyyyLOgJsQ4KSunDLcwJfvc=;
        b=hdHPvYRKfBb/U/8TOBOVu+5UPeSVmy4mN5vXXYfHqGppLZ9M+JldSD+OZkuAtCVUuI
         lykhEkhHU5sNkdGgf5yympwm0RQ8fy8wo3iIhcPcJTg1uE7+f28MOR845rZ3KZqmgcUQ
         yMOErHA+Wlc+b0RAzWMmV2qA9QtdXJnjsEUJQy6P6bhbBn60hXZomRJvHCHtx8jNNRZm
         krr551/u00898tlYc2Z+Sj168dLoquYoAmMRNg8Al47G2mkdnvJq1UU1u1xHZOiK5Gm6
         LEjW3YEdGORaKAaUP4hEmi0RgayAAEuiv13gsfmYFr3H5u2AN1TUz+1a1QvAPj13u78I
         lnRw==
X-Forwarded-Encrypted: i=1; AJvYcCUTetUvSAArUg2FY3ufFpG/PntA0W0igmcbbcQbPkiGDPyAHwNoqpV5ZW2IAakHaaQhnT+ZcEuzKr/ke63rNyknaEebvQ6f33cJ
X-Gm-Message-State: AOJu0YxUY6Kp+GDuWE8sxFbOq3tBSECinbrW+Ywno0F3SYpKb2kgVSy3
	OMFDHFMe8FtSN0JX8ECJYW31CAu4TCNz8g1eV+F49gYcsuk5MRLwKX05EtYJmcQ=
X-Google-Smtp-Source: AGHT+IFCQFsX0y012c0RYVyy1pzruF/1YvRQvQO3mIZBA6xLw4Uhegn+z6nHl9NsGJg7fqoOGUPO2w==
X-Received: by 2002:a17:90b:3643:b0:2a5:608e:1012 with SMTP id nh3-20020a17090b364300b002a5608e1012mr4531315pjb.21.1712797332116;
        Wed, 10 Apr 2024 18:02:12 -0700 (PDT)
Received: from localhost ([2804:14d:7e39:8470:fcac:9b42:fe81:c62f])
        by smtp.gmail.com with ESMTPSA id q4-20020a17090a68c400b002a22c8e99afsm248176pjj.12.2024.04.10.18.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 18:02:11 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
  linux-arm-kernel@lists.infradead.org,  x86@kernel.org,
  linux-kernel@vger.kernel.org,  linux-arch@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org,  linux-riscv@lists.infradead.org,
  Christoph Hellwig <hch@lst.de>,  loongarch@lists.linux.dev,
  amd-gfx@lists.freedesktop.org,  Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
In-Reply-To: <75a37a4b-f516-40a3-b6b5-4aa1636f9b60@sifive.com> (Samuel
	Holland's message of "Wed, 10 Apr 2024 17:47:27 -0500")
References: <20240329072441.591471-1-samuel.holland@sifive.com>
	<20240329072441.591471-14-samuel.holland@sifive.com>
	<87wmp4oo3y.fsf@linaro.org>
	<75a37a4b-f516-40a3-b6b5-4aa1636f9b60@sifive.com>
User-Agent: mu4e 1.12.2; emacs 29.3
Date: Wed, 10 Apr 2024 22:02:09 -0300
Message-ID: <87wmp4ogoe.fsf@linaro.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


Hello Samuel,

Thank you for the quick reply!

Samuel Holland <samuel.holland@sifive.com> writes:
> On 2024-04-10 5:21 PM, Thiago Jung Bauermann wrote:
>>
>> Unfortunately this patch causes build failures on arm with allyesconfig
>> and allmodconfig. Tested with next-20240410.

<snip>

> In both cases, the issue is that the toolchain requires runtime support to
> convert between `unsigned long long` and `double`, even when hardware FP is
> enabled. There was some past discussion about GCC inlining some of these
> conversions[1], but that did not get implemented.

Thank you for the explanation and the bugzilla reference. I added a
comment there mentioning that the problem came up again with this patch
series.

> The short-term fix would be to drop the `select ARCH_HAS_KERNEL_FPU_SUPPORT` for
> 32-bit arm until we can provide these runtime library functions.

Does this mean that patch 2 in this series:

[PATCH v4 02/15] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT

will be dropped?

--
Thiago
