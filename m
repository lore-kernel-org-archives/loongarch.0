Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3465E242902
	for <loongarch@lists.linux.dev>; Mon, 21 Jul 2025 22:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753138799; cv=none; b=SJPNgneeN+I3u1u2OBv152Oa+REqmmoM5rWbqiagA/SjksmLqKE8R8ds19kfKKYfMove/J4mjs0nTeLNp/IeEe9FSEBllWBdVyUiAz0iO7kNcHxYT4hFnfchWz5aPjt/Srzk6S+OEX32ISvXA1oA/GrCV26tThWwH+/Mmzi01fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753138799; c=relaxed/simple;
	bh=1l1qCq8RhRHOce1Tf8sw0XBDQPRKflzH3Beo70vl88s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hbDCYpS5AE4hYT+piBXDVVoe+mkdAYCHF9iqzyJrOaYY59IEVA2CAk2rkieHJB3j3QTDy03gGaoFDYN8ZrEDj04oZTOAZjjev5/TVfw7EZM17LpGFgU+oybTqFj8q+Q3/yQ/WkCeiwh1auc+RFA22PV/Xk7b18sazaPWE81Blfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WClLdi4u; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WClLdi4u"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-608964359f9so523532a12.1
        for <loongarch@lists.linux.dev>; Mon, 21 Jul 2025 15:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753138796; x=1753743596; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k6qH8mhMJUNtpiP5ZkZtwmZQrunIQJlcyvnjoj0lgTw=;
        b=WClLdi4ulpieSBHPn7sguNlgxKsEBk6ME6UYqJZ01YoeXmpWEp06pTKhTWIj8Tte24
         76mgrTYsbp12FtrjMB4We9kUyleJJvCCAwrr7ejoAvpRoOr4xuW3SjdncvWBBtFWQE5h
         gCBZ4+tAGdsoZ5iq8iIONOEoc3AJp0VsHlnB9YZxWMRusnCXPKY+h5cjdtFS3U/TasNP
         yqgcoLEgiXdK7pXG/4ZpewwpTvB8odJ9FICFVeXBH19IHSK1/hqVid9SQ8N8RDdcB8uo
         mAyN2l2Momys7dtV6SKu5SlblJId+xa7PcqR8Lp1ghrubZglsrLTV09mvLAPb3nzaVAa
         Zegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753138796; x=1753743596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k6qH8mhMJUNtpiP5ZkZtwmZQrunIQJlcyvnjoj0lgTw=;
        b=fAoZg7siLKwY5WWU5/7gaIBVXJddGW94PhD4+rLAR2P0jHtpmDHsjTW+zIurj09u1x
         u7I3a8eXzSYsZuyOyvjhYUw2NKx5JV2FcUanx6XLsJkUxtxTzXaKjoeORV4uyyFIpd8f
         tPE79SPQvl10XVNraj8SVPAO8TLog8uObfn1pDfZyEZt37Kk4OwflCbYF3kB2vwrzgmZ
         ZL33zC/zA5qgmczuOEZTEteLiK2zbcgoVyYcR7QEye728pAGZGkdBiUbK3VxfVBCWHFd
         93jafAyTIT6yhu6KC7RYQbxdTECaCBWFb2flvmslqgs9sCqvmqGt9hGqHMk25LB2Uba3
         AunQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkpJycxiGZGqRjhQTcCvIVuDsGCEF50hHezcglSPH2QMAA+b0OEMfjtIfo+MBbtxKiWAgdcGNP/Ro=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+DAXw83rYcUqjW6v3SmwWrnWAbKqnIoIZG+plBxRYz5t3OXtD
	8sOCEK0vI6CyR12NSIXX6pK1sdfR6GOM91TZW+MtAmZJjDfoThoXLwBh
X-Gm-Gg: ASbGncv7V5Fi2nlKEtqzHSUwtzg4DF4YZ8p4aezj8T8EveSMz9TMYMAMuY665zvv6Xi
	1X1dRFnXxczMlTpLvqUYwVckp5SIJe2+8mSomFEvof8G7pfyPwy50Jto3f/CDWFbc6ePX0nhS33
	S55Oq2NR5orlIZGF5KQvq0WY8V4GrXiKVCRskcZ8BbqKPlH/wu75YY6iq+xiM2xyvgsMVye1lUi
	rv5cfh74YuWR+HpNmIUx04GdPWrXbq/fS5+zYqKndFMXI63uDDKXChkrvFMXKfpWABb7zVS/lmI
	MEdPgE9a/Fbn+ewgQ81WvUpr+EgZzZPLnvpOeZ/JljdCqQiUKyV2//1wPUaNRn+u9yPBSQLIMrg
	prg0k7m5LrSJ3th7xH42KLnQ9PgGcuqibd4VROxJ3nAdJZT55lu9zrQPiVy+Eor9IskIwxOsN5C
	OE7nk=
X-Google-Smtp-Source: AGHT+IEnEupELw4ajNrlfkyI1uQuImlm2WT9jEJPd1nte24ZB52Dcj+jDrjKRG7BtovOALnxWEn+Rg==
X-Received: by 2002:a05:6402:3582:b0:612:b0d9:3969 with SMTP id 4fb4d7f45d1cf-612b0d93f03mr5896841a12.8.1753138796402;
        Mon, 21 Jul 2025 15:59:56 -0700 (PDT)
Received: from [192.168.0.18] (cable-94-189-142-142.dynamic.sbb.rs. [94.189.142.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f543ddsm5962670a12.30.2025.07.21.15.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 15:59:55 -0700 (PDT)
Message-ID: <bc47c08b-fbc7-4954-8e81-c22bce654556@gmail.com>
Date: Tue, 22 Jul 2025 00:59:34 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] lib/kasan: introduce CONFIG_ARCH_DEFER_KASAN
 option
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, hca@linux.ibm.com,
 christophe.leroy@csgroup.eu, andreyknvl@gmail.com, agordeev@linux.ibm.com,
 akpm@linux-foundation.org
Cc: glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250717142732.292822-1-snovitoll@gmail.com>
 <20250717142732.292822-2-snovitoll@gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250717142732.292822-2-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/17/25 4:27 PM, Sabyrzhan Tasbolatov wrote:
> Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures that need
> to defer KASAN initialization until shadow memory is properly set up.
> 
> Some architectures (like PowerPC with radix MMU) need to set up their
> shadow memory mappings before KASAN can be safely enabled, while others
> (like s390, x86, arm) can enable KASAN much earlier or even from the
> beginning.
> 
> This option allows us to:
> 1. Use static keys only where needed (avoiding overhead)
> 2. Use compile-time constants for arch that don't need runtime checks
> 3. Maintain optimal performance for both scenarios
> 
> Architectures that need deferred KASAN should select this option.
> Architectures that can enable KASAN early will get compile-time
> optimizations instead of runtime checks.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> ---
> Changes in v3:
> - Introduced CONFIG_ARCH_DEFER_KASAN to control static key usage
> ---
>  lib/Kconfig.kasan | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index f82889a830f..38456560c85 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -19,6 +19,14 @@ config ARCH_DISABLE_KASAN_INLINE
>  	  Disables both inline and stack instrumentation. Selected by
>  	  architectures that do not support these instrumentation types.
>  
> +config ARCH_DEFER_KASAN
> +	bool
> +	help
> +	  Architectures should select this if they need to defer KASAN
> +	  initialization until shadow memory is properly set up. This
> +	  enables runtime control via static keys. Otherwise, KASAN uses
> +	  compile-time constants for better performance.
> +
>  config CC_HAS_KASAN_GENERIC
>  	def_bool $(cc-option, -fsanitize=kernel-address)
>  

This needs to be merged with the next patch where this option at least has some users.

