Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431C62F50
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 15:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711726811; cv=none; b=LWANx1awBk2CMy1Q7osQ2gbybtzDKGOVNwV8adpmQ933mtGvEmC9NuvL5v2ZhP1c6HVm6r7G56W9Pl9hOAGt/FlJ1anlWvs+RyaDPwurKHq3lJMTFSiA1/Hky8sSPytPSwf1IjN0A/yHlHLXZ3V1H1ms+ZUmfo2ncobeeJsERrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711726811; c=relaxed/simple;
	bh=XCgoZLnAXnGDp3scNF5htnbob5J7JStC8D45eQoM9R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHchog1nPQgw98ZcRCqVzY4Ot7wiPoMlZ0BtR6MwCq/ETIrUmttepsy/c4utqDXk32GqTkiBE7r6NBskr8dFEipZnnfg6H7EBmnId5Gx7J92SQdob8M1YxXjK1NKLfxGddL43FNkHqJ7TM4LJzspX0b9GfXB3JuUx4hbhIjwg2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKnBEHe/; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKnBEHe/"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso1172198b3a.2
        for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 08:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711726808; x=1712331608; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iN31wd2vCkiTGMz1OBtEaB4JW8VyiA1XbISlyEebr3E=;
        b=iKnBEHe/IuL5d0WcNdwdX9kJ1MsgXf2od3Jyr9o4BTPqiq2GyTOnMOu72GYxai3mif
         UVX6heLwjgI4rTV+1tgWRYGT7T3qJ+vkh/VYOlRvb0w2Ylb8TmNmBmkaPVlxiHlTdzr5
         GY9t1zyv27wgf90CJA+oXDLOlPDuMEiP7ixJsu+4n8gJc7/tbd8mkemcj1+UmuljyNrd
         hvpt3unGtZ0Pmn1j1nkCzHvCNXGJNS3nLV5/Bmzv57+6BmZHhKHAJt4lXo7qnpLShjA1
         PHFCofq9hi0qlWBP53/97c/E2XeEJjZYKGxsiNxiPxw3TLcAWcBwLsLDMChjN+2g32wi
         Wwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711726808; x=1712331608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iN31wd2vCkiTGMz1OBtEaB4JW8VyiA1XbISlyEebr3E=;
        b=d/hYQVylMoOCdjufp1B5rEtS638d84DxdaKsNPXEDyNCN1NiSdSvcRfrh8ZPz9Lh41
         Ez3FCTtli3kqkmuEN4C/u4pZnEgIMHbk69rgOX39TSLAIGtUjoeK7xkRSAaE3tdysL0M
         HIbNnG1TQxxO0V+jImwoFjAoKBn+qjrwPWtNVXezON6xBXl0+IGVwY0o4nfL3pAp+ABD
         1FA7qYqUup7ifD1MNG2QO+W62PZKG1S7zVxkJCP0+M20w6jNpLrkyNWshaZdCfC8uCBq
         wGq7fDTC67SWIc28Bmz9jq73dcEQ5W8OoojpY0tPFCIkNdmXem73CSsn3AP0+aNB/qhG
         nrOw==
X-Forwarded-Encrypted: i=1; AJvYcCWuD4ICUihG+cX4TvHl1ffXN7JqJeuGPuA0eXHeedIQgB3QtcV+JmiVJVv4rSNEOPACCKwLAotHgRw+4mCkubK4HgPlrUmd+bsu
X-Gm-Message-State: AOJu0Yxt9eDp48C3DeRM3PidW96dQlOfA+Un8sFjSHMYfLmCnEhCsQ50
	VKpfv0TcOZDmKsXhMgPHbWLeQjuWGAe5KvwE+DVfEDP4F8N4NTa1
X-Google-Smtp-Source: AGHT+IF0O7HII5MYlv2g0E+BHBSm5qRGKAR+0KxI+xwk6+g8c7fXn65jtKX0C7ci+tZdnr/ge20LGw==
X-Received: by 2002:a05:6a20:3c90:b0:1a5:6bfb:76de with SMTP id b16-20020a056a203c9000b001a56bfb76demr2694088pzj.2.1711726808383;
        Fri, 29 Mar 2024 08:40:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902db0900b001dd578121d4sm3581907plx.204.2024.03.29.08.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 08:40:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 29 Mar 2024 08:40:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Simon Horman <horms@kernel.org>
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
	netdev@vger.kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH v2 12/14] sh: Add support for suppressing warning
 backtraces
Message-ID: <d7663e19-74d5-478d-becc-0a080075e7d6@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
 <20240325175248.1499046-13-linux@roeck-us.net>
 <20240327144431.GL403975@kernel.org>
 <320aacc6-b7e5-4c3d-948e-d0743ab26c5d@roeck-us.net>
 <20240327193920.GV403975@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327193920.GV403975@kernel.org>

On Wed, Mar 27, 2024 at 07:39:20PM +0000, Simon Horman wrote:
[ ... ]
> > > 
> > > Hi Guenter,
> > > 
> > > a minor nit from my side: this change results in a Kernel doc warning.
> > > 
> > >       .../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY(). Prototype was for HAVE_BUG_FUNCTION() instead
> > > 
> > > Perhaps either the new code should be placed above the Kernel doc,
> > > or scripts/kernel-doc should be enhanced?
> > > 
> > 
> > Thanks a lot for the feedback.
> > 
> > The definition block needs to be inside CONFIG_DEBUG_BUGVERBOSE,
> > so it would be a bit odd to move it above the documentation
> > just to make kerneldoc happy. I am not really sure that to do
> > about it.
> 
> FWIIW, I agree that would be odd.
> But perhaps the #ifdef could also move above the Kernel doc?
> Maybe not a great idea, but the best one I've had so far.
> 

I did that for the next version of the patch series. It is a bit more
clumsy, so I left it as separate patch on top of this patch. I'd
still like to get input from others before making the change final.

Thanks,
Guenter
