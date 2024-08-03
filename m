Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9909B29414
	for <loongarch@lists.linux.dev>; Sat,  3 Aug 2024 05:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722662093; cv=none; b=mvLX2Zv8b9IZ3fs2rpUG3wyE70FC1cMTv+Dfe5z36hhBvHnbvIKgdbu8gXTfBtkOVklSdJsmc9rW1GBOWWDFrm1F1CoCvYwQUbMhCEoDpvn6Ib06xIGyYseLpGZiRsJNuJGDLHCEJsr9BlpY78wQc+Fwhbxpv7w1H5d1Q+LaosU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722662093; c=relaxed/simple;
	bh=y/G0q6vSGh56Cm0FF0nqqRrgKaaLLgJrjCyqE6ot6iE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1iT2m9EwGw3zVkcGh8ecWA+geeBvqbLKZHVVufbB2b0etmxN414c7lC8pjkq2jYWLNJbJsmEfudJsnsr/T0PZrmsP+/BhXhzU+nTCgAn9ZdKQbKsKrp6fhRLKsRQ/Xn1B/4N//54zZdzOUWULZCTu5I8jFyQJkJhTOqTMlOimI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; dkim=pass (1024-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b=A5lqlbay; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b="A5lqlbay"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70d399da0b5so7593544b3a.3
        for <loongarch@lists.linux.dev>; Fri, 02 Aug 2024 22:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=heitbaum.com; s=google; t=1722662090; x=1723266890; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BmvtDB3s2cR8UrreA9la38N0r8HdMO9IViXvEFHt/Nw=;
        b=A5lqlbayzTq0dE4jJqG3mNvIEse2JwRP4BG8cnATpyWvG/0g5K0XoNpeNbgIcs0qJC
         NlAqvsxyLIFSVmp8FzxdoyplwTwxcM3vHeq8ncj4HBDf3MxTjPOG3nSpT8Pg1BITa6Eb
         jeopAJPG6Vkb7E48W4klRAyt5VCd8W8Svt76c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722662090; x=1723266890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmvtDB3s2cR8UrreA9la38N0r8HdMO9IViXvEFHt/Nw=;
        b=iGn80EbZw9GMVbj3bN/0Shx5Ki0wdIKuJDRMb4Ogoton4A87dsrwoqzJFzOQEKyW8o
         LWv9NqsueUBUjzj7LzJ/0FbDvuPufN75ut9bS26Eljf6jlKe+dKmO0AgOOoyWFgijg8M
         fBqAUOtB94pacpAN6DHammgDNrkK7oZy4tCwPq8uFufcpLwjqbCEPXlRXbBuSrZJwO1H
         t7Un/4Lxu9mpmOkVrhiXL+vbKkWLrskKDi3Bn2uyhUPyXQ8ITQSm8j54S/utX3m+ZXj5
         UxJSbHNzTfbAn4JohLd4WsXuM0lMGJHWFG1/xZCl9QdVBqOsQ9C8fPGNM/nF7HSfi/FG
         AGXA==
X-Forwarded-Encrypted: i=1; AJvYcCVzVm2/z0VJ0ZaUk810nsFlDRm+qsrpGH4u+F1NXs6R27PKMmYCmAykq9hsdhDKAv5p2KjQsfFkrXLIYwNTl8xv1O5Hop9Or321
X-Gm-Message-State: AOJu0YwUYimLO3RMX3RpDtSWWEDhwu31cNx4bjw05XanMyecMtWhbtye
	FIudW3WJX9Tsg/r+mnnfJoipiEFBKiMjlB+dP4Xxwwi0b5r/3b/aD3jpW5Z+Qcs=
X-Google-Smtp-Source: AGHT+IFtk7L8k8Q3OP5IS2+A9RpjMYCUcoWx/gWA5UpNjio/ITBkqtqn6ebqg37Slew3B08+KAqPog==
X-Received: by 2002:a05:6a20:a11f:b0:1c4:944c:41e2 with SMTP id adf61e73a8af0-1c699683bdbmr8888959637.51.1722662089837;
        Fri, 02 Aug 2024 22:14:49 -0700 (PDT)
Received: from faede8dcc269 ([122.199.11.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f57176sm26262095ad.80.2024.08.02.22.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 22:14:49 -0700 (PDT)
Date: Sat, 3 Aug 2024 05:14:41 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
	Florian Weimer <fweimer@redhat.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-api@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, WANG Xuerui <kernel@xen0n.name>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH] syscalls: fix syscall macros for newfstat/newfstatat
Message-ID: <Zq28wejX3U9J1_JV@faede8dcc269>
References: <20240801123305.2392874-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801123305.2392874-1-arnd@kernel.org>

On Thu, Aug 01, 2024 at 02:32:33PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The __NR_newfstat and __NR_newfstatat macros accidentally got renamed
> in the conversion to the syscall.tbl format, dropping the 'new' portion
> of the name.
> 
> In an unrelated change, the two syscalls are no longer architecture
> specific but are once more defined on all 64-bit architectures, so the
> 'newstat' ABI keyword can be dropped from the table as a simplification.
> 
> Fixes: Fixes: 4fe53bf2ba0a ("syscalls: add generic scripts/syscall.tbl")
> Closes: https://lore.kernel.org/lkml/838053e0-b186-4e9f-9668-9a3384a71f23@app.fastmail.com/T/#t
> Reported-by: Florian Weimer <fweimer@redhat.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Hi Arnd,

With this patch to kernel 6.11-rc1 the error whilst compiling gcc-14.2 for
aarch64 with libsanitizer has changed from '__NR_newfstatat' to
'__NR_fstat', so some change, but still fail8ng.

sanitizer_syscall_linux_aarch64.inc:13:23: error: '__NR_newfstatat' was not declared in this scope
   13 | #define SYSCALL(name) __NR_ ## name
      |                       ^~~~~

sanitizer_syscall_linux_aarch64.inc:13:23: error: '__NR_fstat' was not declared in this scope
   13 | #define SYSCALL(name) __NR_ ## name
      |                       ^~~~~

Regards
Rudi
