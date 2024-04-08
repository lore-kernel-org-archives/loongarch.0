Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22EE1442F2
	for <loongarch@lists.linux.dev>; Mon,  8 Apr 2024 16:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712594075; cv=none; b=C62xvoXIlheYMS6Oi9+D6KynFVcH2llPKUTBUFyd20vWFGviPJqDWHKfjMKfQ5QaqXk5BYZqhqX9FCsy2E9GaiNDMyApMA1cdqww/XF3l9neHw80cLAD5IM7XshLpycRqpwtK/zR18nIRMckx20en8GGSpAWPqqhz4V1fy2h99w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712594075; c=relaxed/simple;
	bh=GDjg6EBXUVwAARwkkfl8HCARLRaI322ITo8J7xf4XpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgVbKgNqFb+5c5UnJ81yzx0OzQeZ5UcVuGtgFu2a9rE7AIO68vhhZFMsA0kDkBrTSfxHwGzT6DXpiT6DPeQ4UqBSETJ3X4F2ho2K29L6PgQVVoZtr40Kjynlr4CWRokeHzjKyO8gLerfBtYDvWALuBjcTqiHfhZLo9X6S0iWNtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q64tdBz4; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q64tdBz4"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e2b1cd446fso33546715ad.3
        for <loongarch@lists.linux.dev>; Mon, 08 Apr 2024 09:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712594073; x=1713198873; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8W6JiQXMJlyRVh6G0P1/xRBUWDgR2AudHru0aHPOuY=;
        b=Q64tdBz4CQNnjuIOInhN+F7zQhfO1PPrsE1xq48RzT2OoLginL4ewLceowDRoxo6WC
         PvJGerLqhvLD1GmnpT3Mm5acBeD9V6u6ur/eoBs5yK8vo+VCsswUOFSfj6zV+Z2nZ+x5
         7FSct2A2IBjTO/YuaNBOtS0WDTg9ndRnpNhkAZkwtTmgoHaPCo2iXAlDNLmT/HFZ54d/
         CpL8JT3MeqUnkjYDTc/d/MwU0n9yB3fI8aKWdahUMqz9D1JCKwGgQGSbX+PGInpSv3Nh
         a8f/6XamsC6D++kR+fmbaQKKVQVCmszEcEWpA69Qc2Jn1RwFEQDjqOQy2dy8kKS2ok1R
         sn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712594073; x=1713198873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8W6JiQXMJlyRVh6G0P1/xRBUWDgR2AudHru0aHPOuY=;
        b=OT6hWK5B8UYpqaK2kOxRotO7uL2TZ5qFhMs8YTYXBXetvi2dfHOydpDoLkUsCe4UXW
         6Y9v5f8O1mK8NMPokzAfF7dBffcgpZ4ezTVQoV8cLxNqmd6nWj2Ymp3F6qMIvEXM4djt
         MJR2G6QHPWR4a2mb4R5Jng+tDaBuCHIWOqTQmm9piB3vmY9aFT/2mPT7JifKIdEuaDdY
         xWRJM3sOz91YTvCeehH8Hd/2iygzuVhkbyOT1WRQ8B77i5GsTM/hI8a5/gGVhJaWcd+m
         1KVHHIcuqnF91H4El7iGEFU4IuIeGPkromfs2Oi3EYecwyEq9X+D/tqzQbcdJZjqyl2C
         MAUw==
X-Forwarded-Encrypted: i=1; AJvYcCWiIHQAr9fBc3bFFvAHBew2V6loFbVOj+sUVvu6oCPJYHBwTx9036aZ1OBb3Q9smJHTClJgZS6vOapRVEioedgzbQGGrm4Laz6f
X-Gm-Message-State: AOJu0Yzp2srAe1NnJu2/pgNNp/HAB2NZ/DILF7WpbXmUBSk1ZUeBLA8S
	Fpbc239ZLKMJ7FUAMwmNQMVBWL4wxE72f6/i2zkycg/pi6q7ePI6
X-Google-Smtp-Source: AGHT+IHjgwPwZy3e5AEopzEIQpEcmD2hcpsHcoA+sLwIBYMIqqkK3bLGAgIh/jDVDgJdWRaZ9xWs0g==
X-Received: by 2002:a17:902:cec7:b0:1e3:f911:22b2 with SMTP id d7-20020a170902cec700b001e3f91122b2mr6050960plg.7.1712594073047;
        Mon, 08 Apr 2024 09:34:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b001e2b36d0c8esm7189331plf.7.2024.04.08.09.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 09:34:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 8 Apr 2024 09:34:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
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
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH v3 06/15] net: kunit: Suppress lock warning noise at end
 of dev_addr_lists tests
Message-ID: <9e8718bf-da81-463b-9436-6c8b0881a045@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
 <20240403131936.787234-7-linux@roeck-us.net>
 <20240403183412.16254318@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403183412.16254318@kernel.org>

On Wed, Apr 03, 2024 at 06:34:12PM -0700, Jakub Kicinski wrote:
> On Wed,  3 Apr 2024 06:19:27 -0700 Guenter Roeck wrote:
> > dev_addr_lists_test generates lock warning noise at the end of tests
> > if lock debugging is enabled. There are two sets of warnings.
> > 
> > WARNING: CPU: 0 PID: 689 at kernel/locking/mutex.c:923 __mutex_unlock_slowpath.constprop.0+0x13c/0x368
> > DEBUG_LOCKS_WARN_ON(__owner_task(owner) != __get_current())
> > 
> > WARNING: kunit_try_catch/1336 still has locks held!
> > 
> > KUnit test cleanup is not guaranteed to run in the same thread as the test
> > itself. For this test, this means that rtnl_lock() and rtnl_unlock() may
> > be called from different threads. This triggers the warnings.
> > Suppress the warnings because they are irrelevant for the test and just
> > confusing and distracting.
> > 
> > The first warning can be suppressed by using START_SUPPRESSED_WARNING()
> > and END_SUPPRESSED_WARNING() around the call to rtnl_unlock(). To suppress
> > the second warning, it is necessary to set debug_locks_silent while the
> > rtnl lock is held.
> 
> Is it okay if I move the locking into the tests, instead?
> It's only 4 lines more and no magic required, seems to work fine.

I don't think it is that simple. Unit tests run in a kernel thread
and exit immediately if a test fails. While the unit test code _looks_
sequential, that isn't really the case. Every instance of KUNIT_ASSERT_x
or KUNIT_FAIL() results in immediate kernel thread termination. If
that happens, any rtnl_unlock() in the failed function would not be
executed. I am not aware of an equivalent of atexit() for kernel threads
which would fix the problem. My understanding is that the kunit system
doesn't support an equivalent either, but at least sometimes executes
the exit function in a different thread context.

Guenter
