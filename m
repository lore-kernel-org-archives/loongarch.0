Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B599189F56
	for <loongarch@lists.linux.dev>; Thu, 13 Mar 2025 18:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741890676; cv=none; b=alXWBzq6k0nmE7RePPEIdnB0BdxpL1qM48KpGej4b2bB8ykpWtsA6a3mgaIP2chUEpCcoYUFyLjThXAxmoCPLkg6uTM5OFrHqX/jmWcBarUv6RL2fL143mepJmrZrmCR9XktwdWYNJE5E2BXoaGZ6ivk2uymbekSxToZ4Ctze6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741890676; c=relaxed/simple;
	bh=R7IKmWAfEV6dguBunqVGGqHpFRfFDM8SuXUyyQU9jxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGlOWe324XwVpGMBJ6QFPV52UW2QfT7liW2i03E35dmYoDPRWY7X20f6GVSJ52DeggmO8muwDFHfvzIF+0Dy69vtLnVZTHmJ4AJQekAsJZg6Cec2tg14sWOEH2oWtxmRC+4qtbRSKwBrFyY9EmPqbGLqbSb5Dmwmcyn8Y7V5kjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6QOfHNG; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6QOfHNG"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22438c356c8so26680335ad.1
        for <loongarch@lists.linux.dev>; Thu, 13 Mar 2025 11:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741890674; x=1742495474; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jt5WSssG+OEvsuPkFz6BZY4vYElG8JeyaALVDa3jMX0=;
        b=O6QOfHNGB58g/CKAlgYC5AkPwpCIgNmmteNL19Wfslh6Kce2UGAJYToV5bVRgTtCFa
         WJawkdPt9JamQOwRakjGsFbPG8iVoRnTadA9TVonUVkgzC85fa8bLpsdXd0qJhshWUnT
         EfOKTJabZjQyZ9yED2BWc7Rg9wpRPuKn2StjjWqVdzfSCCR812E3LH3aG7n3VxeQAC8i
         Sxm3ee/jqQrCUauac6xKjF0o+b1mSYU2U/D8aYwJKYn67uGNGTyDGiJh8aXE8adYCGCk
         27UVdfcj5gIdJSJCWsmH4+lgVeqEj1BFm1IlioHj2kze45YG6eLX05smQjge1GHjD/6G
         JAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741890674; x=1742495474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jt5WSssG+OEvsuPkFz6BZY4vYElG8JeyaALVDa3jMX0=;
        b=f4Y2UiR2ZJ3FDs3ybj/A/TGE4upQQwV6AlW3mTufvhAmD3jyry4qFuELD/1lmqP44F
         f5q6yjHM/rCRYSnGB2zvhVO4hxFlFO/GeQOFAdr/PbvA6ARDI47LbzjE+56Irn63trqZ
         LXy132lrXfc2lCotb8nrr6FNwipk2q9jfyWlDIyAvlIaCWI2lHtimOqpiMvE/WtzhnLx
         h7UNOIQAIcaToy37BrIwnvrQacKrnnQC+ZFta0duXspl4DVuiniaBVdTQ3Nzi1fJAp0c
         hDgeaxS6f47kcYyBVp8/RjylNZ4Rwr9KSsTHhIhtlPRmWdiVGfzDgiIOOYPg2RZiWgG6
         dN4w==
X-Forwarded-Encrypted: i=1; AJvYcCXq/xP8nM00tv/r0oPML2xNwBkJMlD9Ag2xHyPp35peGQ3s/dyxDjT5bdN+e46d3CgnBlPG773HSpc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo6qXMbGuaVf8PEUlO6+LYrXI4bMDRbK1+TWANSxRJCae8K6L7
	8UDtzbKC4kNejgkdyaeTwgZ1kwg7pVPnn+uVFx13ziiX5JnD05r0
X-Gm-Gg: ASbGncuflm6gBwv7VmUDUkSTjED2JiEFb1ojZGZEv3R0UobsFzATKZix2/EoTCPca3T
	xtfc3Z/KYlOklFb2NFybWWBQiTROixOd5GloBLWN2SKlnzBgUhx0loCwc7wVDYN/OY+2gVV4ebS
	+XYcz8AQXTV22aWb3X32rUh+aXn145e/Fsl75zInuGHwuLoCoMJRDyGiTZxJN6gpI2j5NpwxeAf
	suDKF/WPn3NgF3Z/bXbQttJ5c8J33U2jyF1Yv4oFRf/AuTFRudnfcNoUckgok/s0tw9pqdKKRqH
	qgvVFSMEMTEGaiZVyl5lyXu1/pTka4Pl9T6PqJWQvMcwP2sqXZ+Vxl/ydw==
X-Google-Smtp-Source: AGHT+IHUyL3JZBiKaHL1hLSTeQrgywlLwwEUN5of1N0Gy8TC0X3IRTq509SX5+fcaAZt7Xsc6jRvwQ==
X-Received: by 2002:a17:902:d48f:b0:220:fb23:48df with SMTP id d9443c01a7336-225dd8ed442mr5472005ad.36.1741890673680;
        Thu, 13 Mar 2025 11:31:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm4185647a91.35.2025.03.13.11.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 11:31:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 13 Mar 2025 11:31:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Maxime Ripard <mripard@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Alessandro Carminati <acarmina@redhat.com>,
	linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
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
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
Message-ID: <c8287bde-fa1c-4113-af22-4701d40d386e@roeck-us.net>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <202503131016.5DCEAEC945@keescook>
 <20250313-abiding-vivid-robin-159dfa@houat>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313-abiding-vivid-robin-159dfa@houat>

On Thu, Mar 13, 2025 at 06:24:25PM +0100, Maxime Ripard wrote:
> > 
> > Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
> > very noisy tests much easier to deal with.
> 
> And for the record, we're also affected by this in DRM and would very
> much like to get it merged in one shape or another.
> 

I was unable to get maintainers of major architectures interested enough
to provide feedback, and did not see a path forward. Maybe Alessandro
has more success than me.

Guenter
