Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8972A4AEEB
	for <loongarch@lists.linux.dev>; Tue, 12 Mar 2024 22:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710280970; cv=none; b=dJCPU5fNc2bzVbw8m/CwgLugHTmZQ4IjR5Ebu6XSa8jJ/WdnBOUxcgc/aHcpDvtDpPS4Nl0moI48S0dWcFfYhYXsmeWNd0DBO4C1MyJgSo+Q34yyA8LM0uqdpEpFbR0UjR1k/dUnWDZQ+CycXYEZcHDmzbRGraZ0bqPZiYVyLEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710280970; c=relaxed/simple;
	bh=oexVpmdnuJzE5NnIT+grB7HUdJL7OkTLS1ozx4Z/KWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaWQrmjMT979qd0ciUM9FNCQ2E8HGt3G0O7LnECHdktfMvemxHz8GdKe4bhJsJo8G4t6tBWO0NVfiXThJl2VfLzyHl8TrtVCs2lq1w+eM7zEbp+v4oi0kLrtimJGDRrlGM3pSp3cymqgMcruMHzepogsw+OSNI4TBjdZxprQPcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ITBDOZIB; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ITBDOZIB"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e6adc557f3so831387b3a.1
        for <loongarch@lists.linux.dev>; Tue, 12 Mar 2024 15:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710280967; x=1710885767; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1akdFCp/NrQTZkdZoE61av7sk42pTtpjjQoFP3uV05s=;
        b=ITBDOZIB+SVanmc7Wd2033IC9qjhNfcUM8M0hX6Dd9dIZSAYEhNt3nslLMWxOlGVMY
         QV6/4fNxm+jQ1YB9i9W1uDD1SRVFp6e3Pq3EeCXGiumHJNj9oBVg/injc7RL0sG7/x1h
         075xCbu9yJOmZ8hIwFlTMdTaOTKKBNcs+sRPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710280967; x=1710885767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1akdFCp/NrQTZkdZoE61av7sk42pTtpjjQoFP3uV05s=;
        b=E8AC0ZpJF4733gwy7jk5rV06xeF8FoHOvtLOYAKA2yr8PS4MaXPe4Yc4oiGvzeaeXG
         RfMGttjTwNtTlpUcEOW1n7aPFHn5KjgQ1XFDo2ntpdAEj5//mc0YiKaXfdyYhBCUQ/M2
         Vo2fZgH7WrDEhikoZSMieFNwHEDX9vTXzyz1YLjUGifcMLK3pIyiffESNkwYIZcBNMBZ
         bD6vzx2Rub2GrmI6cjUFh0sg4gwCvQomFT2CDSUBOTbP4h7cC5dvBnnjDjvNy39W4TaM
         2lYkx+l+Yjna8i2Op0lhBqZzp58rO+XODMyjP3tv0lqa9qfCBDprXfckJG/lZZQvMUbV
         jDSA==
X-Forwarded-Encrypted: i=1; AJvYcCXMY5/fKXXgDZTV73lfMRJ3EAomDBm8RBfb13HATiJlkOGb6LFfgkY9INeCFrg8FGR5Mvx7xTP8/7h4dpwxqN7/xVIVVJqQWjNq
X-Gm-Message-State: AOJu0Yydipf3ZtWnEPSpVSQ4O/E0YKJD5ATZeM8EDCPLUmuftvDHnyci
	yRtTXWwGVvfQ7g2jKAjwEV2tgmY7gBsnfWD/29ooGUj+P9FAkYqoksaGp/zY6Q==
X-Google-Smtp-Source: AGHT+IFKZ+X2o3xvUM/DPjpn5dJMdSK/7jBm9riFOy6GxFDG2jNN2P7xmSx2+ecCvjPJ+atiR43WGA==
X-Received: by 2002:a05:6a20:9382:b0:1a0:efd0:b183 with SMTP id x2-20020a056a20938200b001a0efd0b183mr14145890pzh.44.1710280967019;
        Tue, 12 Mar 2024 15:02:47 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e11-20020a17090301cb00b001dd6c0800b4sm7193896plh.188.2024.03.12.15.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 15:02:46 -0700 (PDT)
Date: Tue, 12 Mar 2024 15:02:46 -0700
From: Kees Cook <keescook@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
	netdev@lists.linux.dev
Subject: Re: [PATCH 03/14] kunit: Add test cases for backtrace warning
 suppression
Message-ID: <202403121502.95F27A01@keescook>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <20240312170309.2546362-4-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-4-linux@roeck-us.net>

On Tue, Mar 12, 2024 at 10:02:58AM -0700, Guenter Roeck wrote:
> Add unit tests to verify that warning backtrace suppression works.
> 
> If backtrace suppression does _not_ work, the unit tests will likely
> trigger unsuppressed backtraces, which should actually help to get
> the affected architectures / platforms fixed.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
