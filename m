Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0265B1A00EE
	for <loongarch@lists.linux.dev>; Thu,  4 Jul 2024 07:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720079324; cv=none; b=gE3mNUtNNqSObvC24LXPkkbvxwDSgLFOvuZta1PpPSYHT4LUXGvxuM9E97dowWTO9yJswHXEg9+FQWQ30AaXvlw4TmO7+pAyXdeTQF5aFFLgZDTiPRILWf/UijQ0Vmjk3l4e6PaxhO1PGohDTezisiGTgfHQ+b9jUEJwemBPMpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720079324; c=relaxed/simple;
	bh=4uRnWDBv1UfRpH57XzEtOTniVSipc3ghYR5WXxJ2mWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpXn6GjamrAewuhOUFJJjn2naI+5pd0zae7wSCSljP/98VHfUMySX+4RFkSHH3VfOtcfvwiNOYVcqjxEAdEIQghgcAAIdxFWIXWgBG0mEAWlZ2F7HvL3G9q99yzCOtHU1viXpZYxu2J2vIBdp+ILDNlHgcu8bdDDToyOK7dh8rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eivws8+e; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eivws8+e"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3d55e2e032dso233266b6e.3
        for <loongarch@lists.linux.dev>; Thu, 04 Jul 2024 00:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720079322; x=1720684122; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pWnn67dS9Y/zsDt+wd6xJaG7sYvUiWiKDh8I/p6oVR0=;
        b=eivws8+esWvWYGFHk6onh8/3aK5yfGLc5+LIpjPgniWES+uu2kCvM42MzRmYzm55k+
         XG5UbA1LS2fI1up3H8seEDtBT9Pj9PM7QIV/VCsKLLyUOKh5IESoQUmdFYY1syZshcn+
         mmFIsZZzQNRc3J1aUxWaxt0muRU1nNMFh33FWC+bF8SYnQiZ9gQIWY0p/dhXuPqaTQMD
         dvf7E2SPDiN5pdR8GymuUuDgJyEAJmzXSndzZhFSNxmULQ8NUdEbkrkfOe+jrKLg+VY1
         x6h+GlJkh3vHNnm/cmu8KemVHbOV6NgWR6Utp4sRf/VRjU0Wvca4Pcc6xVF2HHOjZ+1n
         2I5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720079322; x=1720684122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWnn67dS9Y/zsDt+wd6xJaG7sYvUiWiKDh8I/p6oVR0=;
        b=xJsf1PcI1QDbaTL6I35dP0oHKUklLdrLmFfqTqIwgY9zE/1ivDpRWQvK30QLU89W+u
         LW0bro7pQSTVmTJKKof1lKWYI9FAfuzgjzKWcIO7BEe12Al85NK6V4ucI90D5ZFxcEJ9
         NkwAIt1px6QnxK/WuEc7j32RYYxc96dNFD4QJA4YYUoaSmj63NzIB55/HxaJQWMz+eQ/
         OIN7IpQRcRxjGYzYxmuWavQUAQWcXSYmZYUumDajAAJjnZ6If2g03TKlZq+QWCbGo0M7
         0K/pkpkkYOeRxP5Ht8rOm7Y/k4uMQa7Pae7f3pB2ebMaSz9hbTJZKygSp7oFBPMDrNZC
         7INQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkbTlBbCLu/bDJB+wSvTu+6IVzJVOk/1g2lgNj8xRveoP3Zbq3GjU8j+6h7ZbQYx9XGhke5tCzjj+EuPm/dy634j8z+QvbeUAF
X-Gm-Message-State: AOJu0Ywc9SeGrRjPyBLzsf5pQ+6++zZ3C++FRbcZL6UukLuRAEQ7jmwL
	JUZbcn6XXsJ2lkZK0geUed0dsrhUUeGaBks6nw/mrBJPD6G1y2rmCzO0ZYDBxHM=
X-Google-Smtp-Source: AGHT+IG+/k3hB6mC74yudiI0NAU7cypsceC+qk0xYaI1l1jTz+jeizKu61E+H+7sjtNqQfkXVGLPwQ==
X-Received: by 2002:a05:6808:201e:b0:3d6:2c71:ca0 with SMTP id 5614622812f47-3d914da93ecmr916919b6e.42.1720079322063;
        Thu, 04 Jul 2024 00:48:42 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708044af3bbsm11626597b3a.159.2024.07.04.00.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 00:48:41 -0700 (PDT)
Date: Thu, 4 Jul 2024 13:18:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	"Rafael J . Wysocki" <rafael@kernel.org>, loongarch@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: Re: [PATCH V2 2/2] cpufreq: Add Loongson-3 CPUFreq driver support
Message-ID: <20240704074839.eg2enuj5xtsl7bif@vireshk-i7>
References: <20240702152737.1184244-1-chenhuacai@loongson.cn>
 <20240702152737.1184244-3-chenhuacai@loongson.cn>
 <20240703101850.dtck223pleiiwfxp@vireshk-i7>
 <CAAhV-H74HJr0=8g0GtHj=zZH5nJijRpc90zLLRY_sXJfKFVtHA@mail.gmail.com>
 <20240704031532.5bkh4nr7d3vcvzwq@vireshk-i7>
 <CAAhV-H4HbZ02BdtE47gVyZGdNKj4QWzMSuZgHR6d9RHE36Nv=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H4HbZ02BdtE47gVyZGdNKj4QWzMSuZgHR6d9RHE36Nv=A@mail.gmail.com>

On 04-07-24, 15:37, Huacai Chen wrote:
> OK, I have learned that devm_kzalloc() allocated memory will be
> automatically freed at driver dettach.
> But I have another question: can the "kfree(table)" after
> do_service_request() fail be removed?  Because I think in this case
> the probe will fail, then no driver detach happens.

Yes that will be taken care of.

-- 
viresh
