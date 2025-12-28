Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FCD25DB1A
	for <loongarch@lists.linux.dev>; Sun, 28 Dec 2025 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766928602; cv=none; b=aQ9RolbZHjKnibsO+t4KLfUp+bfmgivyPHH9x9ot9TuhXzbjLAD/sglHXfScGCw1bXj2I8Ckv6Pf/XqTBVid30v0phAlFCDCL6g5WVoRdBNAfUq/lDfaaLPCmilLqz3InOTDuNEHOJ32OsOoQjfl9RDIDujLGpYW27+B1JKBHCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766928602; c=relaxed/simple;
	bh=wzDS29pPv16SN5nJL5o+rnuk9lYuas+/v91h2NRmxn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=seofU4ofHrf70EsLeDZuByr1mJ12xvSlnLJBFMkASsJvGLHy3OJM4bxBNfiC4NuG78gV0dZxJc+w8CGq89JC2Jqy3AckvHkfabeW5berH4GyIntvLjmwR6Rb40UG2bJfE2b7wyAp9+xbUyDGepKP6R/NQn1JI95a6dto1Q6OucI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Beo6rsdj; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Beo6rsdj"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5959187c5a9so7259876e87.1
        for <loongarch@lists.linux.dev>; Sun, 28 Dec 2025 05:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766928597; x=1767533397; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lWyQqsYJqWc7lm9cTjRQLwXSVE/IuAz3ei2okz3340=;
        b=Beo6rsdjYEUQ0LKx6uN6EwiRXv+yczxZPTUYfIuekCXZDlZHFAJ6RL8Y7G0s0ZxnzJ
         h1TdKblBguKby3g7LKXaaZfYvOxB6jOTA6dV4FG0bHyjUP36NGTmwg+6UFDEsnObkbi7
         Xc1bDKOAccSCLUpGMUkioGZiAzyiSafKCEsBv0jrIJu5PUAqA8XdRYdSAlPMVDLb/lmT
         xRMq/GnJCsUaMnMdI/ogmX3cgxLWMNIGlpNvkFNFVGGWHMWJaRSgKeGVgJ0oAVyE7EUW
         MA5ZiCbOtD8gRfYhE4dfOwUVymXoNi/LCf3/W11eC6ZmBEfPenmU+CDdPf+pAP7DVlAZ
         Ivkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766928597; x=1767533397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lWyQqsYJqWc7lm9cTjRQLwXSVE/IuAz3ei2okz3340=;
        b=cgzaSqmatNkfLPPmzI1Sfr3EmEMB7Bl59bdjPqNS9llpSr6cdTljmOAvn6pgxzXV+O
         j4UT6u+0iKIYFm0ZxcBW4OmqYNEzvzx7vkKzj/YBz0LyVW3GpW44ubh2VvBJz9tsJfKf
         XCZqZ2KWIu8Bk/hfFW+N7nGINPDc47K44GB7clM6yQqUR9ozfkIGW0gHbscR/Y1gAYVd
         Tu/OINA8ZYhhEQ4mZdZhGSRx08d23hldxGkH4b8rkGH9777Ymam09t/3xSTwG69o9EJy
         okR8TIYYhcbaxxhrbktIFH+Vb8xkky5IKE4DMoGFSiMt1Enw2NDBAkStvOSsafUrwWFd
         KXjA==
X-Forwarded-Encrypted: i=1; AJvYcCXF4uI7q1jnFCvnNOlyuaCId28qhrQLjH4ECJj+cb6dOO1sQp5vHX0KS2+BpXyLnG6p9D+AhmZgtmE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJYVr3t3mOZyhgFKw/ytgJDp666aXLVXynjGUgdpSKmKvi3fKE
	6sCeX7/W6Co6MbaC4lJuUCiQMhbIkQSOySrGTNk4zOaB43ogcLZYvccq
X-Gm-Gg: AY/fxX5Thhrhg6/yEKsYsse4IoVhpdtGAmNg37Bu3o8eVf1oX6WsqDxGQihZ8dffDTR
	1E/+8UWmAAuc6mX1e0toEpdGdZgaKah/11jsyYRY8hM5DV0z8qie2RDtBPTa+ffz0iSqvD/oFzU
	c2eWKTpGFzlGKfY4r6qR6uZDqjiJR/31ekQDz3OawaBs1fDgt0eylZRgQZ7p03HZ67bU2GKqc+e
	J3vWHoOce4OoGbdoStNkJmcX2DRHqUo23loA/Mjwwo3RtaIDLgiH529xSTVAZSkM6h2NWyyA0c0
	8CGaXtFjszjC3TBhAfV9Kt61hdVQV5sIBtFDd50M5lksVeQ5jtAkZtY+HKDK6rZWa50rIqit9C6
	jsXs61gJ4dLkEcBSpKl9WLZsdTrq+ythyA3/wOXRSypUuYHh3f3d1tCYq/k6Kz2m4plDV9jzLnK
	mcFCXUWcp8m/gAxX/N+7iNz32cR3hyJkdIWFbtYKP9EqpNkXuvP5HOV05lvttvux6ryct7zlHSQ
	3tUlZy8
X-Google-Smtp-Source: AGHT+IGo/pr+AQ2VNaaG2TyhewLh2BG0nsRAoXdF/d33J1EZZvYOr8FxE2Re2WZCgj4kGCoIAYrr8g==
X-Received: by 2002:a05:6512:3b0c:b0:59a:11b2:2c08 with SMTP id 2adb3069b0e04-59a17dd5fb7mr9312428e87.43.1766928596662;
        Sun, 28 Dec 2025 05:29:56 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:425c:b771:d34f:d055:3147:bcd9? ([2a00:1fa0:425c:b771:d34f:d055:3147:bcd9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d602fsm8238417e87.11.2025.12.28.05.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 05:29:55 -0800 (PST)
Message-ID: <d58d6cfa-d9d1-47fd-91e4-533756f3b3bd@gmail.com>
Date: Sun, 28 Dec 2025 16:29:49 +0300
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/28] x86: don't reserve hugetlb memory in setup_arch()
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20251228124001.3624742-1-rppt@kernel.org>
 <20251228124001.3624742-26-rppt@kernel.org>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20251228124001.3624742-26-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/28/25 3:39 PM, Mike Rapoport wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Commit 665eaf313314 ("x86/setup: call hugetlb_bootmem_alloc early")
> added an early call to hugetlb_bootmem_alloc() to setup_arch() to allow
> HVO style pre-initialization of vmemmap on x86.
> 
> With the ordering of hugetlb reservation vs memory map initiaization
> sorted out in core MM this no longer needs to be an architecture specific
> quirk.
> 
> Drop the call to hugetlb_bootmem_alloc() from x86::setup_arch().
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/x86/kernel/setup.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 1b2edd07a3e1..e2318fa9b1bb 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -1191,7 +1191,6 @@ void __init setup_arch(char **cmdline_p)
>  
>  	if (boot_cpu_has(X86_FEATURE_GBPAGES)) {
>  		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
> -		hugetlb_bootmem_alloc();
>  	}

   You need to drop {} now, no? But seeing that this *if* gets dropped
altogether in the next patch, you may as well ignore me... :-)

[...]

MBR, Sergey

