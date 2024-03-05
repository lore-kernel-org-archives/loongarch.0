Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4925BAE6
	for <loongarch@lists.linux.dev>; Tue,  5 Mar 2024 19:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709668449; cv=none; b=UViwD4iRzBtJWJKQbBBS4HZzel50Ofl/nTo16uwHemJ6BELC5ix2d5PudwYkImyItxrpEmBZ/A59Smi34UkxEsJvxaoznK/PgkvKbU9mzRflqsoDyjSyLPxo0oTMglIqcct6PCrcUwRKxGiwcicIUAX2XkTn2LCStNxLpITsDtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709668449; c=relaxed/simple;
	bh=Thh+og9vWfifMZ7QUJajbgXYm3QoY+CJHcawNAefhMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXlF50d9uALb60EFtkWilPke5aKS2dWfsBe5aRgddureQEB7Ioxh2xdfo7Y/WcII6aXCj/E572k0Q5KYbBH+sHBp6j71i09ylOmXTSsJyAfoocAZ+aQbW/MyXMJFgvMMVkS3lkH2Ej+ET+VSPYImqjnZPHN18ZwG2ijq6e2xpOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E57OAP7e; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E57OAP7e"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e5a232fe80so100435b3a.0
        for <loongarch@lists.linux.dev>; Tue, 05 Mar 2024 11:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709668448; x=1710273248; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8OJiIuppva2X62G3XuKOpZ18Of2oWMu+/RVVvODtp4M=;
        b=E57OAP7eZPCWE+iRijCD7i0wCltqQJqRawgH5kufMarzozOUMUL/QchtOtdOhefR38
         yRvu3n0XcH67gypv8tavWmm5lR2jjtG0CHHB0M5RsIfbKT12i+f2oSycqIk6bXGKGC1q
         n4ctLQT4jucpcByp4INdwMoezvPE2a4p24Dww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709668448; x=1710273248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OJiIuppva2X62G3XuKOpZ18Of2oWMu+/RVVvODtp4M=;
        b=U8XlfmAKDJyKNeCjggyS6uq73oYQTdlxoNazvWkeK5r7iRBXtQWyFGxtL04p84kmhi
         53D1SPEb/cADH2g9pRFKtE0jp9BIjlVk2I3DfOhVa0n2QppVu81yiR/nTm/bnACtiGBZ
         N+esLHxw1nbBbZI4GTNzZJaVUrA9JswPEzv2QSccOI/3s8PLBeTpVdbiqm0MP5Mtqk7g
         jOz9SBoubIietM1MeZEhPbJof79wotzKkPp5aOcXXpg0ovnRodo6ucje043h/ilHBJ0Z
         TvLDzOFJWq2icBHCY6h7s9413OHxxyo0sXd/K4+zNDpC/EbKtot35OhcCPNhfzKwh//Z
         in6A==
X-Forwarded-Encrypted: i=1; AJvYcCU2ewHdXlSN8aqxqByrQhTFQmsIodcRS2CVlOuvWj5o2jS7HjZ623JfDy/9gOn6hkN7LZlF+lpW6EaolMI80DzaUfy8SNkQrY59
X-Gm-Message-State: AOJu0YwN9DIwgP/4SgKgVydnqG0JzlDNAlAQyFMzGF0P6w1r/UHO3wbv
	DnsgYScyk8GjjtCs8f23hdFoaikwrgAriSYB4GBnqYyY2ifBp2ZiV6qRvddd7A==
X-Google-Smtp-Source: AGHT+IEPSGoV+PaXRY7JI9uSPnapXCs52p1ILPTe+H1wv+UxrhqJWz+AChv6CTzYH5Lp5odgHWXRGQ==
X-Received: by 2002:a05:6a00:8cc:b0:6e6:1df9:af92 with SMTP id s12-20020a056a0008cc00b006e61df9af92mr4909513pfu.14.1709668447845;
        Tue, 05 Mar 2024 11:54:07 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id h5-20020aa786c5000000b006e52ce4ee2fsm9391340pfo.20.2024.03.05.11.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 11:54:07 -0800 (PST)
Date: Tue, 5 Mar 2024 11:54:06 -0800
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
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kunit-dev@googlegroups.com, linux-arch@vger.kernel.org
Subject: Re: [RFC PATCH 1/5] bug: Core support for suppressing warning
 backtraces
Message-ID: <202403051149.547235C794@keescook>
References: <20240305184033.425294-1-linux@roeck-us.net>
 <20240305184033.425294-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305184033.425294-2-linux@roeck-us.net>

On Tue, Mar 05, 2024 at 10:40:29AM -0800, Guenter Roeck wrote:
> [...]
>  	warning = (bug->flags & BUGFLAG_WARNING) != 0;
>  	once = (bug->flags & BUGFLAG_ONCE) != 0;
>  	done = (bug->flags & BUGFLAG_DONE) != 0;
>  
> +	if (warning && IS_SUPPRESSED_WARNING(function))
> +		return BUG_TRAP_TYPE_WARN;
> +

I had to re-read __report_bug() more carefully, but yes, this works --
it's basically leaving early, like "once" does.

This looks like a reasonable approach!

Something very similar to this is checking that a warning happens. i.e.
you talk about drm selftests checking function return values, but I've
got a bunch of tests (LKDTM) that live outside of KUnit because I haven't
had a clean way to check for specific warnings/bugs. I feel like future
changes built on top of this series could add counters or something that
KUnit could examine. E.g. I did this manually for some fortify tests:

https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/hardening&id=4ce615e798a752d4431fcc52960478906dec2f0e

-Kees

-- 
Kees Cook
