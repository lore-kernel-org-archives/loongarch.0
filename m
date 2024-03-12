Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60C614290A
	for <loongarch@lists.linux.dev>; Tue, 12 Mar 2024 22:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710280988; cv=none; b=J4N5u6HrFN3R5oEyqhkWN1JFlIQLtnPGVHLWCPOAowfaNasesVLqwbgh2S8NlBzP4mpGuw5HN7xG8W0obsJ0C4QOrDhLKVwtI36eKJNwvLT4HbTpMGyN/4ovq4K+UmeIxquenp7m1RXtU8TDMdrpvKfgL0rbk6nQrH1fUdyH7Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710280988; c=relaxed/simple;
	bh=D4lY7fxdRPJh4W1hrWZC0Kv5/fDQzdNIZGvAvIvgwj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pptm898fwYGySPTSm1eWs9xRuHAa+fAeVEAVAaSv2/HkSTIpedGxAHaQ2owGCTDUGkFV0rnYjmSt987CwzBICFm05Oux7K7+L7jAFyMu6sd+QrYn5EoDCyMa+Sv5bhWquak7w4H4ma5AnH6kvc4UqGNYNH02VE2tUnbD0QxH4uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NllEfewF; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NllEfewF"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7c8a8428b09so13274839f.0
        for <loongarch@lists.linux.dev>; Tue, 12 Mar 2024 15:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710280986; x=1710885786; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bFZkOPzjUiG9hBeGxmULl/XMqNk9IbEaqEvdeXcgD8s=;
        b=NllEfewFq4RhoTe+o3JSviLnWxX9Qqmqz22Jh5uWDP5IVWi7jJPVHEDFTrJcMGoINq
         Uaj350lbTa0EJoy/iRDZ61HxDTnFn2Y8Z3sD/gQW6ikmR83UgQZyzHdZd1p2prKbkyi6
         KcEQdhSwi3Go860ECxxK0DFAQ769wVgeZDPUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710280986; x=1710885786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFZkOPzjUiG9hBeGxmULl/XMqNk9IbEaqEvdeXcgD8s=;
        b=cyLSJBw7E8s7pKLEWu2/osPjqMM0b4RvD/A7I9Fcp4QSePweIT6MRNpdn2eTU+MIiX
         twELdJ6GnGsnB7iMlT/4M9yK6FfAyIRYbqHKXr795ZTHBKCUe+NhOpiZnV+8pptdjFVm
         L16nPmwHgjQ722b+dZEy/jUlT5HUlWfoGnUuVb6yspwal/Lz5mna5sZHVxXAwG/cNMxV
         92oFp5yXvPXORV8TgHNqyfkKNk5CbNfpBVd7L+qORVuiZbKABv8D9tpSNiG2JpfBIptj
         xztAL5pEJ+1eB462DJjeBL1ZDTsleDRNHjuUqKp2CBLmkQzxKqcCP80caWA7HozzSSSR
         Eh4g==
X-Forwarded-Encrypted: i=1; AJvYcCV/sT8iWlk5HysMm8pR2l7DxefVBra0hLXANZk7H2VHcMp9DJkvZJu1klLL9IGatqo9DmSvOz4d/zx3xN+95yKmTs7GpCZdNtLT
X-Gm-Message-State: AOJu0YxiSpFjYR/Hej/tlU8FOAWxZQJKEdQNIi/8ZiHJlbj86XNmvpns
	ahj1zBaeJ16IB/pJQjO4ZeqY8JDXtKEab//8bxLZslrzES9cvLyOw1XlYQWpqQ==
X-Google-Smtp-Source: AGHT+IEdwN1SY2GeciEHPDmRWgTgdPa04evl6KEFQYoPJeYQSV2BmWI4216WoCmzy6l7zJDsrZVhNw==
X-Received: by 2002:a6b:e719:0:b0:7c8:bf15:5653 with SMTP id b25-20020a6be719000000b007c8bf155653mr4918871ioh.20.1710280986087;
        Tue, 12 Mar 2024 15:03:06 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id m14-20020a63ed4e000000b005dc816b2369sm6650251pgk.28.2024.03.12.15.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 15:03:05 -0700 (PDT)
Date: Tue, 12 Mar 2024 15:03:05 -0700
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
Subject: Re: [PATCH 04/14] kunit: Add documentation for warning backtrace
 suppression API
Message-ID: <202403121503.B97DE8A60E@keescook>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <20240312170309.2546362-5-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-5-linux@roeck-us.net>

On Tue, Mar 12, 2024 at 10:02:59AM -0700, Guenter Roeck wrote:
> Document API functions for suppressing warning backtraces.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
