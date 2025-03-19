Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7659253B78
	for <loongarch@lists.linux.dev>; Wed, 19 Mar 2025 10:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742379619; cv=none; b=XLMQ8wwQgY8gjpIy9Tbl9v2jkW7BuIOll0UDoEy6sJg9DdR2+sghtapy9gdicg0Lqcef6uXEIL7ZVsiQFy0fVpfTqT1LqCy9FO85gUtgztAcV9XVcryVNRjDR518xaIm/rVDR9jCPSi2wAw0N1UpSStOjIWzjiXsuNcU4JPxP5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742379619; c=relaxed/simple;
	bh=tK60PvB18wBvxWYt9lvP7XZvyX62+1Eh/q18fiab6Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WsWkz+FhJYqGIW5KsH1IsYVXjOebR15cvMZDMpYE1mugLLmL+MdIyy4Jt2JOw58fT3F5CrHS57i1YTGoDsGmehFgNYYVD/6vauCEE83e5sGCv1Wm7DEZp4smWwQbSKt7X1WdeeHVytxccVn/XxBbdrFwdHSF2a9+iYZLuVwGDNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DEVk4eC+; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DEVk4eC+"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3914a5def6bso3645426f8f.1
        for <loongarch@lists.linux.dev>; Wed, 19 Mar 2025 03:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742379616; x=1742984416; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWxtYxkS3ZmfTDBR3Ubow/eGPhpGRxs9B2tOpbPHly4=;
        b=DEVk4eC+SwbbR5y+huFekVmqI7YykNMMjnMillfSubanV1xxpujlqw0X5qLQ+qg36E
         bDK9ux6YE2MniE4K/CBE1lj3WV6oS0VPsy87C19NwoQVbYUsiwWHV2KCSsmO3chz03Ns
         EBX/3HO2ypyyydkQbu6MWMTLvTkblqMawKI1u/4PsAUn2EqllWuxZjX31u/Y3Z0IhH0g
         rKY4FqLqB74mKT3NWHPvvifht96A68gcHTnipBLwDxkLe2qok7IB67kOdXW/ihwzQj00
         kgTvjvddaziYij7T18+oVOREww8igGaGM5JXZGnUc80P6uRQ0PsN510G0dilCQcJ7I4w
         rBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379616; x=1742984416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWxtYxkS3ZmfTDBR3Ubow/eGPhpGRxs9B2tOpbPHly4=;
        b=xF8dXu+I9UcWqBynQWrsXCeaHOakW6w3IrA0+9KHxll9FhoWPspwVeCjckiu7PxPZw
         6LyTKxTbKTXoEcl/yb9SpnjAbw+WXj8UXcuqlmnCbKOL3p33n7p8XtuvOLSHzY8hpC+p
         cdO96S42MECpTabofdAVLbk+IS6skwVoL3SBW+QwOQ0J3uOC+M+19WmajOe75IwBK0Xd
         3LsSJNjlKiGTvlCN2WIsSpyhuNhs2hXgeP2UlNQXaYN+UKqWBhNvu4Fk0Pt/8sgISTWU
         furu/exyW6R6qHxsPvPrapQnYpEg/NVFo+rFA9kICpStzHVd2Ost4FAzy90vArT7OO43
         OgsA==
X-Forwarded-Encrypted: i=1; AJvYcCWHK26e+T37Ja6Lx9pF2Vuy1a0dxMzVH6QqaVrE+kr/71icx5RB7Sq9j1GSCEwpwz0WgCuBVgg/QGo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUAUp8wonqHAnL9PbtIwGp0BfIzG/L14miLWyuZBW9UlrtAeuE
	b74x3Si4+x68JwG0w4PFRdNdTyQpGaONDfQ83Dbl/Dfxrogg5a/dTWoTV75nlbQ=
X-Gm-Gg: ASbGncv1MidN4qNbVy6FmZvVX/oyc1wyrhSUlbEcxU8NR4q70PwVG0GyWbnjWSWP+Vq
	tH3TvWBBi3y4rQuAbV/F6wYJoW6k3AZc18eFDASSiWCKsKvG0HCQd0BCKGl2TydpR96fQQ7wKp2
	UlR8tD+oBXqrf2HMB9VP+AbsyE91Ru/j4Mcr7YU+u3jsxl9r2mYpvrEkokyYZ0n1nEzsZ33d1L+
	oTbIq87jmnfqYSPJP607LAHZ83glaRTA6vJPvhWHYS5zSqu4MblwKOMJ4sEHfxwxkwJa2thfp4r
	43+wr6muR6ssoV0irNzicRN9XzSlZUZQJ6BKxX4q/HaqRkPfcQ==
X-Google-Smtp-Source: AGHT+IHjcG6/IeV2BOfDblPqcpvGjw3L7kajd7hg9EDti/4DwNoU0L0nZRG8X9Tat0FLH2nt55nwLg==
X-Received: by 2002:a05:6000:1541:b0:390:e655:f998 with SMTP id ffacd0b85a97d-399739ca2a8mr1441536f8f.26.1742379615798;
        Wed, 19 Mar 2025 03:20:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395c7df3506sm21189338f8f.11.2025.03.19.03.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:20:15 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:20:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Will Deacon <will@kernel.org>,
	Alessandro Carminati <acarmina@redhat.com>,
	linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Kees Cook <keescook@chromium.org>,
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
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning
 backtraces
Message-ID: <fc197abf-e65a-439f-9d35-83f4665519f3@stanley.mountain>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
 <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
 <20250318155946.GC13829@willie-the-truck>
 <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>

On Wed, Mar 19, 2025 at 09:05:27AM +0100, Christophe Leroy wrote:
> 
> Doesn't sparse and/or checkpatch complain about 0 being used in lieu of NULL
> ?

Sparse does have a "Using plain integer as NULL pointer" warning, yes.

I can't apply this patchset and I haven't been following the conversation
closely (plus I'm pretty stupid as well) so I'm not sure if it will
trigger here...

regards,
dan carpenter

