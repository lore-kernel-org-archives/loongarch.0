Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0769318EA1
	for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 19:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711394685; cv=none; b=X1gPzMgWvCoI6N1OH7jR9PKtFCHZo6GTAafZGah9Z99WfuqlEk+iS+4QFGFxJArEKoHORI/A7KRQOicyzHLDnWGN8acuNGy1wlD9TOi+NAva+s3IYLNzTcaPpWgDeKg0NTfeahQbT8mEFCaGLX3Vps9IyJmxQFaJzo5fTnA3y2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711394685; c=relaxed/simple;
	bh=TkGuL+w7G+3t6UUem74ucq9Zu8Hv0WBY2IBJlQ7xZQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEI9kccaAzouUrU/fbFbh0x2blCh+FJUS9EYj/WLgu51ksfTYBxH+n/w0AU5ZQPE+eSuLCpvU4SNInVSfLTJXgMNdVLNHX7nDF/LkdeaBzGTPQxae7DyN+/p3+OWwZXPm4RFkJwdfLILyfdTVfWolqWicFN+4icIAx4sx9vxzk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJZf5Lcj; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJZf5Lcj"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5f034b4dcecso2350908a12.1
        for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 12:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711394683; x=1711999483; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P8SlcQVDmaEWiOte6mDmefSXrzEKVOFtuPmb7V2Kzic=;
        b=dJZf5LcjRphWnnLfg6DJhKOfVQ+K0588p5d9VJMvjLagQL7NeSqWEMzW8xgap02/bG
         SoptNrsZW/r7TOfeonm7zXR8YNqHmlVvK/TZQD4APj+UskeX02JIvMhHU6yHtMlVwypJ
         DwcxN3Bb3phZsfb+sxRkJ1okVW9t0JPi9bO52PLIWQSc9RlZd4LbgmWoCBGbDrHrCNro
         GSrorspT6aQ91Wtcl+YgcP11c85NAJ/sYbYZWA6r2W1GCyeXFTikXc2Jb1ODI6JeOjPO
         qqk3kbiTv+20qxb8G4YaPBd5l8hlCVcstbr5q9e0SCwjuV7Fm5joBTceMXwOzVDEIxG3
         igig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711394683; x=1711999483;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P8SlcQVDmaEWiOte6mDmefSXrzEKVOFtuPmb7V2Kzic=;
        b=ts50p6PCDSUG0a4NPsbJdrG9m1R2VjImll5FkV5xXl0hVUxr9y3OdJ0i8mP/T6G8Kh
         AyEwZ0Lua7Q4H6hNaisiICO367Stv61nvoPEJ2KHqw9ESF4W+nbrE/ApEeWUeRoMjmY6
         2ViUsSy31NbaFB1SXEcbEmsFu1lCBr3Idn6q/gt+zDgHG5HlR17C7/MqHXZaF3rsZSsc
         6lKLhERo8t8KfYrl+ShXYBekAr3V/NFo7rBrpPcG7P3Im04ewW8KRzd+0bKrjkqPc+06
         XwKpT/4httiVXPrW1gSaqaijqLqNI+xmxplk+k53MUy23d8XbxTRL22Fx3k5NN9Za3Ue
         bO9A==
X-Forwarded-Encrypted: i=1; AJvYcCUhBy3H9OhTblB9yKTwfuiaYhhg+b87lDEPGDa3tCzXW1Se/Plqh/09ggcvSkPMv6qLoszTfg1sWV/R/9MmTKCXvQd+3vUPsrZW
X-Gm-Message-State: AOJu0Yy7xE9zJWewny4N3YqKI2sg2w0bOHJ14um1GKOTj1PMqbJ/e+7T
	dv9s9kQlgHn+uDPb//iZOos9r39sLZM+37zc5OcfAQuc+cd1fmv6
X-Google-Smtp-Source: AGHT+IFwrImv53xAJXZaDSLJtn5nAAXYRWdj5wAShxC6nIYkDeejlGCGK79rEKa0DnGROBP9wWQclw==
X-Received: by 2002:a17:90b:3d8:b0:29b:a345:620a with SMTP id go24-20020a17090b03d800b0029ba345620amr10896738pjb.20.1711394683229;
        Mon, 25 Mar 2024 12:24:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090a304700b0029bf9969afbsm10113710pjl.53.2024.03.25.12.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 12:24:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 25 Mar 2024 12:24:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
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
	netdev@vger.kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH v2 05/14] drm: Suppress intentional warning backtraces in
 scaling unit tests
Message-ID: <e880828b-552e-488e-9f31-3989bec276ae@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
 <20240325175248.1499046-6-linux@roeck-us.net>
 <0729b218-53f1-4139-b165-a324794a9abd@igalia.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0729b218-53f1-4139-b165-a324794a9abd@igalia.com>

Hi,

On Mon, Mar 25, 2024 at 04:05:06PM -0300, Maíra Canal wrote:
> Hi Guenter,
> 
> On 3/25/24 14:52, Guenter Roeck wrote:
> > The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
> > intentionally trigger warning backtraces by providing bad parameters to
> > the tested functions. What is tested is the return value, not the existence
> > of a warning backtrace. Suppress the backtraces to avoid clogging the
> > kernel log.
> > 
> > Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> > - Rebased to v6.9-rc1
> > - Added Tested-by:, Acked-by:, and Reviewed-by: tags
> > 
> >   drivers/gpu/drm/tests/drm_rect_test.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
> > index 76332cd2ead8..75614cb4deb5 100644
> > --- a/drivers/gpu/drm/tests/drm_rect_test.c
> > +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> > @@ -406,22 +406,28 @@ KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_cases, drm_rect_scale_case_desc
> >   static void drm_test_rect_calc_hscale(struct kunit *test)
> >   {
> > +	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
> >   	const struct drm_rect_scale_case *params = test->param_value;
> >   	int scaling_factor;
> > +	START_SUPPRESSED_WARNING(drm_calc_scale);
> 
> I'm not sure if it is not that obvious only to me, but it would be nice
> to have a comment here, remembering that we provide bad parameters in
> some test cases.

Sure. Something like this ?

        /*
         * drm_rect_calc_hscale() generates a warning backtrace whenever bad
         * parameters are passed to it. This affects all unit tests with an
         * error code in expected_scaling_factor.
         */

Thanks,
Guenter
