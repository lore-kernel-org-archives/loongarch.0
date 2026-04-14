Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CF03E7157
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 14:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175421; cv=none; b=WKoANaPjwXSzYDsemcQMIAQtknquXmycx5lQhhjb1iDo844QWJMoOuKmR/dfm7f6Lg/Jzl197dkzDHF1QqINWPFZNgCKHtlYnt1PmdW3R04x5P2flB2slReYiZT+D4Jjy72sabznkuU2jNfVHNrmFLSSOj+1zeLU/FB9vcPJOAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175421; c=relaxed/simple;
	bh=dn7cwF6qtgGFLiqp0cvEjfsbZaGhIy7LmJ2lctcWX4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9OcDgaseO/e9CiLa7NZFMWR6dD25zGdSJ23ML8An54z7SrkgAgMf7jaXFQ+fC4IDDKN9S+D8RGF3R526bgJFziUknndhHNDxrDPPG4bqbsLGWvrX8ZLKSdWGtx/I/zt0ff998G6vzQgkt6/XmC3W2Pvo4KM4RNmTuebqIh97yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVsEFisz; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVsEFisz"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b941762394aso694628466b.1
        for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 07:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776175418; x=1776780218; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wAO2a8iejOd3UMUmzAscWYPPXFzcVg9pYpLVhKBtzBc=;
        b=PVsEFisz4BvCEeo9Fng6Ht8eZA9T8QDc8iGo/ImL3aWIk1i/iwv9djGS8TKI94ptGY
         RNQYIM31o4oYF8y+F1TyUuJh+5EbgKxHP9gps70dJnw+sF9bSperXQgD5rWJwBNs7gHP
         QXjfigfFy+gD26/itJKvNsKCR40piPn8R/I6biNce00fnLA0pYcAAgIazKgfqt3IxcAY
         moKcDmRhZknWuij9acapt2NIRnha92F8kLKXkxvrbNHv8zKtPL9LxOaxCP28ZXQNAGZH
         Xrm+lkoKNLL/1Y5BDN/IFQEKDUCEngPRcr2qzj2Rpycaou52ixAkyrW66zKTlYZCqoKS
         VJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175418; x=1776780218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAO2a8iejOd3UMUmzAscWYPPXFzcVg9pYpLVhKBtzBc=;
        b=LZX21QjlnFpWVErnHRSAY+GBbGSy6pq2cpOUc5RvKR0KUflZZVFo+o8qW0Az1Ab4PD
         9HxQs94uBfzCZDzqw4j25VLXc9XlDc9U9UGL5tlu+qifsygzyEADr1gUq+QEJDYEJhYm
         hJKfD12AcegQaI2PhGNwwGCqTAUm/daTN52YZjfRpuCRBQUbiU6Qk0jP3NX0UO5k38hW
         jOcuqGV9UVKUfW9uRDCL0zXFeZk89Hek45pvd/3sZ3ruRnm4Be3vlyJvIbUogI4ECy0N
         IULR0+a5BkNFiXTp9UWNSFv715XycApLD0fld34+18O9QHP5jtbHUAg5fCpQp/8cEWtU
         2enQ==
X-Forwarded-Encrypted: i=1; AFNElJ9snnVQMNax06y7/S2uuwUUoFGbbPUHgUpYHPSEMJ2huYN9FJAk3go7Stuv0af3u5HuQyhBYXK/LQo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2jAtH/axr0wDfouhY1IWpZiHHq14I2/7EZa0V/BKwyAUrgkHI
	dGXDKK9I54PvkRgm1NQPt+EP9E7GSQl3266qB2hR/2VYreqzoJ9QRlwI
X-Gm-Gg: AeBDieu/njqqkTQs9fyByVQV+VDEMFOTE2QMbBb0pu71Gm5grUNxAw7ukAvEnhdDlUW
	u+WiNbcKFY8AFlpalspS1uM/mQQ6pUYsQ3BMKfLEcIpVI+usQsH41BXDLZI7EeDhdESQ9LrH6eF
	QTJpAWIO5pHBdBnwOKFtSe85XsX6WlmbY7Wvt7KiGmOE1cuZHxfiUf4SJzFvf6FS3Nl1Mb98413
	Bfr6aA6fDfras8zTNRl3vWxHmfxmoZ5td40rj9wJ94qqNqQLwhZ0zB3QeKlWX4SgUzX/m34l3fi
	pBNhmxthBXhIEbMhKYGxss20YBySeKnhT+OSJS7Pct56P+aDoDi54IpjakstvMR0OK1XH8pAZ01
	rfTXPYbowZl97aKwXWYSKHSkSJ+XqhsWawJhSgpRDw3Lcp9sk/IK352mxoaKGJ3JeeTdStmxyzh
	esi1iszw6Q+fRybfBsefEZWbIRtoD+W4P8L/gKqfFF6R0nmtTLGsr4Lm9vl0cqTtE4ZgZjw8tQM
	veDHgCw+EKTFe9brm27OwvqC+Fg6Ff0JUDuCkUH6bE8L6h2ut7UGYqg1G4=
X-Received: by 2002:a17:907:1ca5:b0:b9c:b3b5:bbf0 with SMTP id a640c23a62f3a-b9d724995a8mr1009594866b.6.1776175417496;
        Tue, 14 Apr 2026 07:03:37 -0700 (PDT)
Received: from ddolgov-thinkpadt14sgen1.rmtde.csb (dslb-084-056-106-044.084.056.pools.vodafone-ip.de. [84.56.106.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dffcd7bsm384122866b.27.2026.04.14.07.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:03:36 -0700 (PDT)
Date: Tue, 14 Apr 2026 16:03:32 +0200
From: Dmitry Dolgov <9erthalion6@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: WANG Rui <r@hev.cc>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, loongarch@lists.linux.dev, 
	Haiyong Sun <sunhaiyong@loongson.cn>
Subject: Re: [PATCH] perf build: Add clang and rust target flags for loongarch
Message-ID: <63jg2bzhv3udm6meehux5ssxcd5gfdksamuzhjw6cnxptztbph@wtwbe56az2vi>
References: <20260414080500.320095-1-r@hev.cc>
 <CANiq72=c2wniA2piByZNUVzSUA2YPhRPKBq7e_bBP-69Lo+wCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=c2wniA2piByZNUVzSUA2YPhRPKBq7e_bBP-69Lo+wCw@mail.gmail.com>

> On Tue, Apr 14, 2026 at 12:03:31PM +0200, Miguel Ojeda wrote:
> 
> FWIW, sounds good. I guess the commit that added the list should have
> had it to begin with? Cc Dmitrii.

Yep, it should have -- as far as I can tell perf supports loongarch in
all the other ways. Unfortunately I based my patch on
CLANG_TARGET_FLAGS, which turned out to be missing this arch as well.

Acked-by: Dmitrii Dolgov <9erthalion6@gmail.com>
