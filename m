Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130D81865E3
	for <loongarch@lists.linux.dev>; Mon, 28 Oct 2024 10:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112586; cv=none; b=LySWJ2gOD9E5BzppIe17yF3FiPRA1qQLbQjm3uLtMQIoZ63hrFGg39Dt44eZbh/x4r7hVBdRSUzA8fs1MH7SEXkeofX/4ZxWxUmcSYZGENtLIWOqWXXPCjzKzPZ1Ldb/sr2fDh55wKj5vmg0aQCSNyVrA81ZMCeaMGV60jjhFT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112586; c=relaxed/simple;
	bh=OIlWErpCErhhvqC1O/BLstj0Os973FkT8FU9m2dF2y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEjNt2vW7yzcAZOZ95Ax0a00bT4+d9lsLhrsMMLDPllzJrBtucYD09PUKnEsIrg/2HJuQIfsWxKg80lsi26BJ0O7Uq0cBzX7pJN/4dyIAjTsshtYb+ZSkjMz5JQU5aKw4R3SMUOc7pbyb5UjVX/F/dbQHJdwA+cyw1qtNM/S5Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUpRibwb; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUpRibwb"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cbb0900c86so3105474a12.0
        for <loongarch@lists.linux.dev>; Mon, 28 Oct 2024 03:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730112582; x=1730717382; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BADti5TEboUpz7hQZAwm95LJ4r/iBnqor7lFpH91gUs=;
        b=gUpRibwbuGBgDfEuPdoWOpbGM30uHF1CQEQyoEYpiePX4paZhWEgjT3iF37MJyF1DO
         kIbRO5+DucQh9kMGGfceSgKQlp1iPj6mZQuGceuP0n6fesxcjIrckTg4TFkdbMHcstE1
         JNbT5LxuIbEsoEY5QjQ0PenxRTEnbCm94/Sr3muBPY5sIwFiMljDMlRQIt6yFFNEP3ZS
         aKqo8rdzoNZucOGVORDxFmAmHwKPgCw3GGyealTxP1LmtVQNSKhlfmxAJ4bO2pFYB4ie
         519Yfhmx/oy0ils4q4mA7ZLXGIrYsbE2iAdxCHd3sdbJ7+ZGpJv61AP5II/3fyh68ivZ
         sRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730112582; x=1730717382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BADti5TEboUpz7hQZAwm95LJ4r/iBnqor7lFpH91gUs=;
        b=OL15wVFqfJiFD9aCVIg7S5EQuM/kYWGDhPuEYRYcY/3B7tXgHD2UWVgDimMtwVuxwQ
         BCyBljUB0ww6BoX14olWInHYo7t7vA6BAgUQZnPoTFdxbKELMwcTErT0dnFgZ6OQsS0e
         xDchu91idzV2K1RWSUcwABqxZf+0RRXJLpOtLtzYK5sd/xbzwf7zqDoQ+LVVXC7FUsDZ
         YvdS/Nru7vb0N0AMfZ6/hLh1tbcCjlYA0HHBsmNiW7rwxyNZqlvMqYLGug+oSe7PvH4g
         djZqdOqRc4cVfYm8rrJagDbD4fTIfRAUnhL300gjCb1dQN6QMJKkHVlJQenj3Hsw9P9x
         ROgw==
X-Forwarded-Encrypted: i=1; AJvYcCVyMLm2hYQF1wxNf1yWgabRijOJE7l2B8a8IUYNS7yRCt3WJngwXaXU76b4BPWGvK68OqRPnYrpV7U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQZnbP6XtKIPUjPpc4R4fdvGe1kF0J0aJxA+zeqrlo0ufsZqw/
	AqEPBmg4ODB/afBbkmDR8zzncMTioW++5nPxwLGLehUAy0yUPwUY
X-Google-Smtp-Source: AGHT+IEm+HFLbPsaDOWlAHThJ3+XtoGjdhXujglmfhVMP7yNqtZqIoTJpMUXVSYjXbaSqnnT3/SHtw==
X-Received: by 2002:a05:6402:5202:b0:5c9:5cff:3cc2 with SMTP id 4fb4d7f45d1cf-5cbbfa71a66mr5776613a12.29.1730112582021;
        Mon, 28 Oct 2024 03:49:42 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:eb:d0d0:c7fd:c82c? ([2620:10d:c092:500::5:1494])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb6258683sm3063919a12.20.2024.10.28.03.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 03:49:41 -0700 (PDT)
Message-ID: <71decb01-4241-4fb0-bc38-187e180d6ee5@gmail.com>
Date: Mon, 28 Oct 2024 10:49:40 +0000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] of/fdt: add dt_phys arg to early_init_dt_scan and
 early_init_dt_verify
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, will@kernel.org, leitao@debian.org,
 catalin.marinas@arm.com, tglx@linutronix.de, chris@zankel.net,
 saravanak@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, loongarch@lists.linux.dev,
 linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-openrisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-csky@vger.kernel.org
References: <20241023171426.452688-1-usamaarif642@gmail.com>
 <CAL_JsqLBuzRYgnYHCdbdO4wneFNPe5_iEfbehvKK5M7bBuiyfA@mail.gmail.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <CAL_JsqLBuzRYgnYHCdbdO4wneFNPe5_iEfbehvKK5M7bBuiyfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 25/10/2024 23:15, Rob Herring wrote:
> On Wed, Oct 23, 2024 at 12:14 PM Usama Arif <usamaarif642@gmail.com> wrote:
>>
>>  __pa() is only intended to be used for linear map addresses and using
>> it for initial_boot_params which is in fixmap for arm64 will give an
>> incorrect value. Hence save the physical address when it is known at
>> boot time when calling early_init_dt_scan for arm64 and use it at kexec
>> time instead of converting the virtual address using __pa().
>>
>> Reported-by: Breno Leitao <leitao@debian.org>
>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>> Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_fdt()")
> 
> This looks fine, but what is the symptom without this compared to
> before the above change? The original code in the referenced commit
> above didn't remove the reservation at all. Unless the current code
> does something worse, this is new functionality more than a fix (for
> stable).
> 
> Rob

After the series in [1] was merged, we always get a warning when kexecing
a debug kernel, which was reported by Breno in [2].
The issue is using __pa for a fixmap address in arm64 as described in [2],
which could result in removing a memory reservation for a completely
unrelated area.
That was introduced by the patch just before 
"arm64: Use common of_kexec_alloc_and_setup_fdt" [3], but arm64 switched to
using the common kexec fdt function in that commit. This commit is trying
to fix removing and corrupting any random memory reservation (and get rid
of the warning) that was introduced by [1], not adding a new functionality.

[1] https://lore.kernel.org/all/20210221174930.27324-7-nramas@linux.microsoft.com/ 
[2] https://lore.kernel.org/all/ZnFKEtqfqJkYflwL@gmail.com/
[3] https://lore.kernel.org/all/20210221174930.27324-6-nramas@linux.microsoft.com/

Thanks,
Usama
