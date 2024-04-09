Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EE215665B
	for <loongarch@lists.linux.dev>; Tue,  9 Apr 2024 18:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712686266; cv=none; b=aedi0QvnnoIdeP2Pr8vFzQItIv/BCScuu7EblTaP7YtpfcomB5B+p2zYdxJ0wwBkrWxB0pCuea2hSuRjH75NVfUaeDN9cexlZpc4+LY3dupa4+XGaQZSHTqV9tc4N3dAXXXMJu96RJw6Ntyj3npZT1pRzq/jXe+JzsmCtXzLet4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712686266; c=relaxed/simple;
	bh=HqaMdhT5LRYjCxR6gMHB6EOhgxJSaOa8vauHB4zv+2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VEcXLkEQW6JyFiEwmibcC3WtjFMfD79IkVnGtESa8JlYs4ay5DUpopaCaLfXmKFzko6SIUQtdxstnBUDafbxRBsJKoGPCrdA7Vk860hmUqt0Am/x1Qg+YQ4VBolz/2UF1AjyYYVKUKz3CWRCQ2HF0kScy+9Ca0RDkS80k4Y0/YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImjJMFO5; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImjJMFO5"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e411e339b8so19227535ad.3
        for <loongarch@lists.linux.dev>; Tue, 09 Apr 2024 11:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712686264; x=1713291064; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9dSAKFdynyhKujjaxO9n/FtMdq9OcS8F/T8JeifJ1k=;
        b=ImjJMFO5D7Za5qC/+eJ8uucqq7eMdsCUo2FykmtYmGGWEKwiWMakd68kWnQWTEV62n
         YKATOOTHTFgw2qi3AvUNCTyvTohWrJdiKOLmWKBRclVHYtpy72ztXEhZ0tBTUUCXn8QY
         xOGPSu3tDKySBSxmcYu8OpDeLqZAQCROHsN1edymErhXGvcWqNYUYpkyhI9v0jLqBqyI
         mHz2xwFuOy1IyyG2VthhG1k0fS5sWRFbhdf+8ir5oGPhqi01hX6VEG4jCImASjxDeOVh
         bK8ajV07IgvSf4eU3m2I1K/BLfUawp/1TkxI+ZZEXXbRy8J4zftzAq3hS90QL1jlk3dz
         /bSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712686264; x=1713291064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9dSAKFdynyhKujjaxO9n/FtMdq9OcS8F/T8JeifJ1k=;
        b=OCOJ6yZ3DF6+jFa3XcNe7K9pZc0NoyBIzfIr5rDjvS4mMSIHlt647vaaq/FwRIAIok
         UTXZciY351Q+/ogh8oXBTabampvYxEkKYaC4mu39lJ5gAn4tys46ZmCDHoOTs/IZy0Ts
         TjigvJSi96mSYPo5tCjtYah2y2QRCwdJ8e5JWgYEhuhGSBacGZHs65eVCuZ8PcXeDXvE
         P6iUFlB3t+ay5n2A4hIDDNHatZ0eO4qOmeW15c6ocYxcDUal3HABmzP7jHExo4yNDiTx
         gNPiyFNwuPbFOaEu1yMcCJn+5Z2ehog6iFrgS/IhO1iRdPtHWTN+1adnFK2DO4fogM+r
         iMRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUweda3VsyFGJQ2DXFqyFuiX4f0q0aDVICXKvjhgXYU28/uPGg74aCyxcjXq1dQoKughr4gaOQf5m69ukO6ELZ9HEERQgGTgUl3
X-Gm-Message-State: AOJu0YwzuI7eVlOXLaJIpfIH3Nyfz/EhAHOa7YJwQY7jlTK6NUuqkVa/
	mKQfRb4wULg1UrOhjaI/yugXn1aZjHWv12J84M+oMrPuGKynEGa6
X-Google-Smtp-Source: AGHT+IGrjPVdFECKS3becNGGDDo38peM0R3uLnfzfKLi+hNrIYGQpqn6EkGBto25qlTyktqlNq6njg==
X-Received: by 2002:a17:902:82c8:b0:1e2:3e1e:3d9 with SMTP id u8-20020a17090282c800b001e23e1e03d9mr529751plz.63.1712686263974;
        Tue, 09 Apr 2024 11:11:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902f25200b001e256cb48f7sm9195770plc.197.2024.04.09.11.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 11:11:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Apr 2024 11:11:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: David Gow <davidgow@google.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
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
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH v3 03/15] kunit: Add test cases for backtrace warning
 suppression
Message-ID: <aad25d52-83ed-492f-9d56-71d26895173b@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
 <20240403131936.787234-4-linux@roeck-us.net>
 <CABVgOSknXkT=WU-fwi5wP4bWv04DKByxSYAPmhYhC--FaQH-PQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABVgOSknXkT=WU-fwi5wP4bWv04DKByxSYAPmhYhC--FaQH-PQ@mail.gmail.com>

On Tue, Apr 09, 2024 at 04:29:42PM +0800, David Gow wrote:
> > +ifeq ($(CCONFIG_KUNIT_SUPPRESS_BACKTRACE),y)
> 
> s/CCONFIG_/CONFIG_/ ?
> 
> 
Odd, I know I tested this (and it still works ;-).
The additional "C" must have slipped in at some point.
Thanks for noticing!

Guenter
