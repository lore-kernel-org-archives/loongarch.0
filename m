Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1062E171BF
	for <loongarch@lists.linux.dev>; Wed, 13 Mar 2024 07:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710315577; cv=none; b=nKX/Nay5sw6hx4Z9pBLgI9bsSWH9VK8GuBMWgH2J1332v3UYHrVMDlzCb1AxsFVJ/G0GSM9ymzNJyp7hwS6os1fArfezxRvPqI76R/nJyMzwXwbETWm6eBqoLh0BvfY6QzkIFbCovTCR9vq+NF+abrMAEuQR/L+Y07VrH+czrjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710315577; c=relaxed/simple;
	bh=AvANucvrZ/fsPo2yOI31iWo1FDKNiABMfD22ldNz5dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f46uC6xpTb3wPHYhtSzPqm/cqVnhIIV5zEvG91FWFc0lMZRkVOoeEBbNDmjZfDoZ7Riolm0d0euFCXtVKwf2txrTR2K23+JVu8MbHnuDWsPUJafUoPOPOFa+1PHvlakuOijgJ+QV/aFkqmeWkkGhIQKltO2L4Gm6q6D+KZF+YZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kYo4PAXF; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kYo4PAXF"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a44e3176120so817004166b.1
        for <loongarch@lists.linux.dev>; Wed, 13 Mar 2024 00:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710315572; x=1710920372; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AvANucvrZ/fsPo2yOI31iWo1FDKNiABMfD22ldNz5dc=;
        b=kYo4PAXFdauICJQwTCByYmxTR+aS2vZORhO27fhjbmFp300wwxAU8ENVF7sDZc/KIZ
         fIr67DFGgGXNlGBBzbzxz2XDD5YSmPOpwkHjyBkQJas34sjTwaVUDNaOhLwvWWeADYQv
         XLRUvYEa4K8ReHkAxdBLCKbYKCSvqN2wLc58ZbcXEn+edgNRT25rzvqI0dItCKLV1R9P
         stksNnjMZxbFYw3UbKJGv4SrqcjEH/LCiBXQnEQ8WWPdUJkCEVpcxKvI+t8/Grfyt3XD
         am9EOR/CHTCYYaa+gHdZHl9HBLGBZ0wv64+POBaZJxdhI/W2DVpCdm7lZz4/zMk2oRhU
         nEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710315572; x=1710920372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvANucvrZ/fsPo2yOI31iWo1FDKNiABMfD22ldNz5dc=;
        b=QYQk4N4F8zl8uFApLNebzFXBw6FujEtfk+vaz+xztOuOhi6o1fo39V4d2sp/rA6rGz
         /sk83/rHZ8VUizFs5zWcJraDIz+gZE3oPpbf+3Wwrk3YHfcgk16vg7PfC7CS9MgcCwYY
         lseYZZB3/K9peaDtFeWX2UWFizHXHbXu5b2kKEelxDiEnDW0bRU9sYV9bA4mPFccQGZn
         1M+PF2zCP05cbiz+mwnwBqiBxqBqtI92XGwSFKfcZjgO97OXqG/rsOfRDT1d7o8ngCK7
         q9fvkzabLbVNbCZhUkt1MvK/VxbyU2biPsx7GARQV2wOGJOQLxU5qcsHLGhgXNP4+iWD
         eC1A==
X-Forwarded-Encrypted: i=1; AJvYcCVjFu99zehDrhFyBrbQK9Xp1a40ftJ1rlofEu2ssFUIqAB1ABqJbYAlsY7HN50uzgLyPJm2/2O+3f9fCu9y+HTPsXj131pSvj5e
X-Gm-Message-State: AOJu0YxS3fVGEA+P84KN3loTn8VRiaMKAVxJJ88vku+ykTCVBsAswBdC
	eNGamD2Sahf0f5xpRrcte/capv+Hvc+IfTwJLHr44DWiUHy/QlDOfp7p+Y/er/8=
X-Google-Smtp-Source: AGHT+IH38GneADkyKtRbEkb8+HLK5ZsZNpyhD22lE4uk6eUmiwmdHa00scLatPQEFNYx/T2Y2VkSUg==
X-Received: by 2002:a17:906:2ccb:b0:a41:3e39:b918 with SMTP id r11-20020a1709062ccb00b00a413e39b918mr7484516ejr.24.1710315572226;
        Wed, 13 Mar 2024 00:39:32 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qx26-20020a170906fcda00b00a45a687b52asm4578781ejb.213.2024.03.13.00.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 00:39:31 -0700 (PDT)
Date: Wed, 13 Mar 2024 10:39:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
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
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
	netdev@lists.linux.dev
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
Message-ID: <43ef4ef4-303b-45c6-aa50-3e0982c93bd7@moroto.mountain>
References: <20240312170309.2546362-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>

Thanks!

Acked-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

