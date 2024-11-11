Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51796145B18
	for <loongarch@lists.linux.dev>; Mon, 11 Nov 2024 04:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731298284; cv=none; b=lsf4KIXGADHdwyVOkeUHx1qlVw4XRmluohGd8QypwQJJsIXXHtijIXvg4bKaQS+9MwLhreD/lublUz/cMbKSwdKLRQxtmDIU/v0TqYFAugmzhILxxTvTiVeR9gSUezig7nP+XepUOHROIObi4TWKo4J0XTTyjtkCdOEOhPBg1nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731298284; c=relaxed/simple;
	bh=9O0Ab0snlQqU/aOeDbp4uxXowWB39iX0K9xXwo2W1X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRScw+DgL43TiCFnC+Br4cFnGbDtIJjktKil/nX48GPS3UrJopDdi28/MVxbHIRfsfr0/Cmql7ik3hVaLpg0VEoo8cv+S8K2Q+Y+KgZCxNlVkYYdOTrrBlRf5WJW4sRuTsf7L3JonIbexO8sI3CkcGHnm9UifidXXm9xqfnde3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kYmYvK5g; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kYmYvK5g"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cb47387ceso41755315ad.1
        for <loongarch@lists.linux.dev>; Sun, 10 Nov 2024 20:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731298282; x=1731903082; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CYw7alURWqiNGBAIOXjLelZmQpmzN91EzRD/rQ4H6Os=;
        b=kYmYvK5gkIynBAZMwaFfOlrCUnw6nmurjO8NNrrIyUkWjSblb1wAlvQKlejGi4EfW7
         yv2QBtglkuRXapjZhThvH+YtzATf9M/Xld36fdtXKl5ErvUqZ0Y/uuq33xhedntHyO9j
         levMDdZaJ0VYxowPBK9qGTzS26xcrZLRUlL+qWJ9DGYwrowQHXXUes2GIBFhlBTjporC
         iKBX0mis//5Jf3/hbkMfEyELlX6VdC4dBKk4J9QysGAdgVRuI8sZkB2AFkyMb1ZzsITW
         QKaN4pXHX2eJzPNrOlcGYX5QC9fjzqTrLFQZORo5B80oXPnwYgZR6tGreemKOfTC5+Pv
         8dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731298282; x=1731903082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYw7alURWqiNGBAIOXjLelZmQpmzN91EzRD/rQ4H6Os=;
        b=Ky80IUK8Ak/x6/GJ1l9lNnbzaEFkbbpkJG51c3IfwIUjvBkNv6nLtWq+1LKt74LL+x
         hxjK0yB2EfXlcgn6OYxproNWg6+f8xodZuJRtCpywWUIt7HNMCmdAUO0oxxXHpuS2XAo
         B2NmTbyBkHnhbiy8MnUEuuPubl0bKgMVvrDX3OwsbtRkxcX5qOrCNa0p48ScOOFEwdDN
         VW62/jI5XqM8JuUsVdmXy1r55sHUT+17wQv6k5FerjrlMkL5F840d78AVAHhlw7yV6vR
         NvkdJ8cVkpdwt3AARjxMIDH+Wbfac/EM1+KfMIlTs/1E3+KLoPprrX4oI0AeUheKnow3
         /DSA==
X-Forwarded-Encrypted: i=1; AJvYcCXvLls50rgpnORYliCVLaH3QnYzevGOq8tlY0pGac5+EFAmbKuWB8rw3ZcJPPUe78Qh3KF+r5KcFzQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwygbnNGpQg6X0hZUB1BZ7Ynu/JCwjsKx9kHS/VWPt4pDibXsyv
	CTRxjjnBeJr/MZ4662X5wunaDLlrBNnGSE412sx9/j63n2F5jnIv5ccW+lqKaPU=
X-Google-Smtp-Source: AGHT+IFRGzEI71Hdu+luB1BFZRo3jerd07YG2aEwXqJww2mjVFtZo+80VCzdP3gEwUJj6Och9TmB5w==
X-Received: by 2002:a17:902:e750:b0:20e:57c8:6ab3 with SMTP id d9443c01a7336-211834e6e10mr139163805ad.4.1731298282609;
        Sun, 10 Nov 2024 20:11:22 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e6c343sm66805845ad.241.2024.11.10.20.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 20:11:21 -0800 (PST)
Date: Mon, 11 Nov 2024 09:41:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	WANG Xuerui <kernel@xen0n.name>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 1/1] cpufreq: loongson3: Check for error code from
 devm_mutex_init() call
Message-ID: <20241111041120.olx5xcwo6pom5enm@vireshk-i7>
References: <20241031134719.2508841-1-andriy.shevchenko@linux.intel.com>
 <Zy3Za5JvLjk-OYjp@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zy3Za5JvLjk-OYjp@smile.fi.intel.com>

On 08-11-24, 11:27, Andy Shevchenko wrote:
> On Thu, Oct 31, 2024 at 03:46:34PM +0200, Andy Shevchenko wrote:
> > Even if it's not critical, the avoidance of checking the error code
> > from devm_mutex_init() call today diminishes the point of using devm
> > variant of it. Tomorrow it may even leak something. Add the missed
> > check.
> 
> Any comments? Can this be applied now for fixes, please?

Applied. Thanks.

-- 
viresh
