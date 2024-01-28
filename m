Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CC710F4
	for <loongarch@lists.linux.dev>; Sun, 28 Jan 2024 01:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706405314; cv=none; b=r5eBgU+4lk/07cPLSwwSMDRnS7HOTpFp9yMjMNEDRVjH53MyK5S5Gu1b/OPqvNF7bMhB+GtLTgI9muyRBfFaLcTHYvqzTB8axJhlfO8NyH9PGwWq3eSlZoT//4hmprjlxee3xVOfTd3+mxHd7DaTm+kn40yyyebtjAan+YAKGqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706405314; c=relaxed/simple;
	bh=+4n89C+gEBtsQDw1jUm0K1mb6NFfpf8Q6IFymcXODF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BD7z5VTrQGkGADBhcms8mLrH38xzj+VJXarU8unfKhl491nSTJVz7SiYFV26dKH/XKaZC/b8s4gEMhncFDuadBSoqNsQIh6qqCgyiCFthoZi+fHcAw3dmauq3L7YKJVJfg9Co6EGx0P+t6hQDVE86iKGiljl9zUgEjfZ/JLnSVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NovSLQRI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NovSLQRI"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40e8fec0968so26177335e9.1
        for <loongarch@lists.linux.dev>; Sat, 27 Jan 2024 17:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706405311; x=1707010111; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oUXUIxIBKb7yXVS8ERVW4fwa4sKRyx0T69mWwoqQkWg=;
        b=NovSLQRINfxKPQK9KlT7w96DDiLvbUW/byIDvwlBNKx1KMkiHHeF3AQxFKQBGN7Eru
         2ciyodLVoNA+fvrliQaSwK26ZWw1qg9YZr7KcYmGbqzzPR4XgJ5XqSlgTF9bnvfnpfhE
         gu2McYY1bb28K97SrnsEpqs2IdYNFKoZBjGhk4+0NOS2gzXcH+7BoTPYPU/sfftc8/+o
         WMHjSYcYxxCAK0AKMoel2u4mXfTxh7aSIoU/SdjLrQf6pvExeZFaPmeZzY3SaekQyBRZ
         /clzJbTytOfRUPmIF264jYGjsabWuCQ+jUlmGiYDKifOzz++XXWm6ChTtaOfnHFmGIHU
         nKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706405311; x=1707010111;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUXUIxIBKb7yXVS8ERVW4fwa4sKRyx0T69mWwoqQkWg=;
        b=Zcm454uKxBImW6NPU+axDmQuMPbHXNGS9EZ7sheGuJLma/1OnAupz4txz08YADq+Iy
         pc23lBmGCop55KRCzq5Qk5Mfws70rnXyMd1979uEbWdKBMKQ3cuYBQbEG6dnZ0UPByN9
         k7gB/SD7xor0k/yvYxQiztNi68AJNtguueU2vCI8LeXCbWfGadCDJ8LGm4uLff64ZqiG
         98p65JvCNTLXIyDS+v/4eT0UgwyGfB+I+7mPE++fzbtAn5Q1kntuBwwqQ2LJqjxcMwED
         XWZ+IgQRhMuGuoYY3BdN/4hJB/hrA+FpB6MwYh6zJblDDtjCsPBc9xlXAkGhtCVW0yo+
         b7Cw==
X-Gm-Message-State: AOJu0YzEMecWxnJpyPLiICmyAM58lQBPyets7EkWQtg/naOsiufGiNxd
	agwksents8ryi/yhKzCXtKnnTdR/933vW7H73BJerktT6CIBKUut
X-Google-Smtp-Source: AGHT+IHept3nMUj4LCYzYJiT9LNHHbS9INXuvww5u4glPmCjjXCtKxmvIBnhSwXHbRZoEWgm1HAkmA==
X-Received: by 2002:a05:600c:1396:b0:40e:a569:3555 with SMTP id u22-20020a05600c139600b0040ea5693555mr2037091wmf.35.1706405310998;
        Sat, 27 Jan 2024 17:28:30 -0800 (PST)
Received: from ?IPV6:2001:678:a5c:1204:db7b:6df3:1a86:f66a? (soda.int.kasm.eu. [2001:678:a5c:1204:db7b:6df3:1a86:f66a])
        by smtp.gmail.com with ESMTPSA id p6-20020a05600c1d8600b0040ee76ae773sm4537228wms.19.2024.01.27.17.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jan 2024 17:28:30 -0800 (PST)
Message-ID: <0b14826b-9373-4458-919d-1da2a62d4226@gmail.com>
Date: Sun, 28 Jan 2024 02:28:28 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next v3 01/14] kexec: split crashkernel reservation
 code out from crash_core.c
Content-Language: en-US, sv-SE
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, akpm@linux-foundation.org, ebiederm@xmission.com,
 hbathini@linux.ibm.com, piliu@redhat.com, viro@zeniv.linux.org.uk
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-2-bhe@redhat.com>
From: Klara Modin <klarasmodin@gmail.com>
In-Reply-To: <20240124051254.67105-2-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2024-01-24 06:12, Baoquan He wrote:
> And also add config item CRASH_RESERVE to control its enabling of the
> codes. And update config items which has relationship with crashkernel
> reservation.
> 
> And also change ifdeffery from CONFIG_CRASH_CORE to CONFIG_CRASH_RESERVE
> when those scopes are only crashkernel reservation related.

> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 502986237cb6..a9243e0948a3 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2106,7 +2106,7 @@ config ARCH_SUPPORTS_CRASH_HOTPLUG
>   	def_bool y
>   
>   config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
> -	def_bool CRASH_CORE
> +	def_bool CRASH_RESEERVE
>   
>   config PHYSICAL_START
>   	hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_DUMP)

CRASH_RESEERVE is probably a typo and should be CRASH_RESERVE (with the 
former ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION isn't defined in my 
.config and `crashkernel=...` parameter has no effect).

Kind regards,
Klara Modin
