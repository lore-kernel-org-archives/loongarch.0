Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4509014389A
	for <loongarch@lists.linux.dev>; Thu, 18 Jul 2024 21:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721339185; cv=none; b=ZYeoDcsMFkl/UHwvFSTD34ufegqfFPKUWhYUZfmEA4fsklDKUvnB9Ai4WBaNVvCIKudGXObVU8aAo1DVdXXnEXRVpTKAc3NCVoYcjzfVKzzmCcb3rNoHNDKEQFknDo+O+6i4YjH4Knr7QH3PYTRx7FjmVcRyPoklWjmsVwnECzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721339185; c=relaxed/simple;
	bh=QIe/2kbFHCA11Q9TL7mLMduOjYNsGQd/Tv+tn4jIdAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyw5vbXbtYM3Yw776fPfo0GomzEIlVa+yc38nJkgjEkJqtfmKMpnu2AUYodcSCUQayVIIJlTXOpiP61MyHAGh5O11ycQFUxobP5JZc/tQdQrcnkEg6uBTqasnqxHimOYkXyXLWAII3lbAasZuNIzFhYIqEujOG/EEVikQojIZKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=CfyAxKJ/; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CfyAxKJ/"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-8036ce660e5so55319239f.1
        for <loongarch@lists.linux.dev>; Thu, 18 Jul 2024 14:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721339181; x=1721943981; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b/3KVXgmf69sNo7YCAFBU75fVyP3kLvsv8BGm2iEjzc=;
        b=CfyAxKJ/JYzR68lxClzwM4Q6ekAa997oR0FUYvTkOUV85juOUxRrciOrsYgFoCdn6T
         gYoIlhE9cSmYskFWSIWSzAqB9FmP8RENvI6+1wx9iDWYrMBRtWU1VmJhe+Tu1cGT+bLK
         PUfMeRcP/dHvWc7ZPKqyBkXM37IqsYUBcEjsN+T01vOiCBNEi1LQN0yXJoopNyJxpNks
         hN0o6G2TxVR8RX9t5VuAIV5lvoravTobU1t4nwPcZ8jvnkkmEQ0/S8WDDKAelIziana7
         /yuHbnNs17lIoBErIDWgjKtx6VwuqmSZVeyETYy3fpiCpGSD7Rfpjq+Baue/fCEpeokz
         uHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721339181; x=1721943981;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b/3KVXgmf69sNo7YCAFBU75fVyP3kLvsv8BGm2iEjzc=;
        b=Bc9jcW6K38nBMHkdvBr9+t/eTddUD2ILEoPIxAOFBNf4qo4pArwNcZMC/lVEQv9mIZ
         GNe1MYc4+Ru6+Jx4Q7TUUiG+Pk9KltEbdhbgx2aLJL0aSgF9W/fTHsKhvoOzwsRAyaqL
         7jJKBGtLNYGmnLjAVjJCzh72QWqhGsItOgVcLkpm2FiEKiKOVx256zvCeF2AnBtwE7Wv
         iNptD3JriSxSH1DuRqQ6ozINHhoPtpq/GnBaEOD+Tgge+8MLIYZx6F83QUc1FbfYkVFc
         5PgW2KKakWDbo13oBe6ksdGk3twW9dNZxyuYOoLvzvVE0gYuxkEXsUREqW9WaMzTFrAq
         M6Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVAPArKIsjesVYMUkHTvvQnRECzzyTZSBIz3d4FRJBmUbQajcWEoDamIvcC6tSQ0Hnkpsrx7+BOQLDVCS22pU3wll9kRnGETS7d
X-Gm-Message-State: AOJu0YwKkJniRqie7f3JGV/UZUxu9WknDV2W+zgazOs0i048/x2ERP8c
	bvediFW8z2PPC6i8OKbSCcRbKsYHgQ9svn7kdsbiIKQgI/Pme/tMNpx9/9YMDAM=
X-Google-Smtp-Source: AGHT+IFfmYe/UsMSfgkCsdMUFOYZdCp937Ia8bMlaDCUPuHT0PtpOJmSb9jac6FVvVir80F2WXRXbQ==
X-Received: by 2002:a05:6602:26c7:b0:806:7f5a:1fb7 with SMTP id ca18e2360f4ac-81710605dacmr801576939f.5.1721339181354;
        Thu, 18 Jul 2024 14:46:21 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c2342f164esm35433173.69.2024.07.18.14.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 14:46:20 -0700 (PDT)
Message-ID: <8b402e92-d874-4b30-9108-f521bd20d36c@sifive.com>
Date: Thu, 18 Jul 2024 16:46:17 -0500
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/17] mm: move numa_distance and related code from x86 to
 numa_memblks
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org,
 x86@kernel.org
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-14-rppt@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20240716111346.3676969-14-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-07-16 6:13 AM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Move code dealing with numa_distance array from arch/x86 to
> mm/numa_memblks.c
> 
> This code will be later reused by arch_numa.
> 
> No functional changes.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/x86/mm/numa.c                   | 101 ---------------------------
>  arch/x86/mm/numa_internal.h          |   2 -
>  include/linux/numa_memblks.h         |   4 ++
>  {arch/x86/mm => mm}/numa_emulation.c |   0
>  mm/numa_memblks.c                    | 101 +++++++++++++++++++++++++++
>  5 files changed, 105 insertions(+), 103 deletions(-)
>  rename {arch/x86/mm => mm}/numa_emulation.c (100%)

The numa_emulation.c rename looks like it should be part of the next commit, not
this one.

