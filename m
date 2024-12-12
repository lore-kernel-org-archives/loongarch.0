Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B1C2A1CA
	for <loongarch@lists.linux.dev>; Thu, 12 Dec 2024 02:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733969923; cv=none; b=k/3Br8g43u+b+FeAaY9bNLvvd5zjbN44wes+eRPz1duPKf9I8CW2KA0m/oUUKk34Uc7rFgydW7DBhOe/ddsi2LNFPkUoppsEnevfjmDhMTcq9Z5H+cKcvRURudr1KHly1f3J13hjCKD7usHeVG/8JsSki7nrtQPfzb0nBenNWH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733969923; c=relaxed/simple;
	bh=1cTM3LwGI+0flNcl0+4rI+EB1o9GyLuExi3gE7uPYYw=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bOyyJFFGYCd5HvsSlgwYsOk5b+MINKdJxuIZDFurOevztzYdouqF+MlkeYx37kAqfgqhA5YWkNQQ58+wAPHrGD9AnNQJKunQvhHhkh/+JuLfrItMwn24rnWdZA1FvTvk/ZHAV3iefanfSn6ZMw/o1bjqTUe2BqbNNxZhNXp/Yn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPC4YDsv; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPC4YDsv"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-725f2f79ed9so79918b3a.2
        for <loongarch@lists.linux.dev>; Wed, 11 Dec 2024 18:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733969922; x=1734574722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQvLLQO2Dcgk3hcePdj0knsnbyn081D+yRxJJ0jbm94=;
        b=jPC4YDsvR6xC8kKvuTZPUQ9qwJ92/MymWzkWn1zZOwsEjp3S7Te+YYxp0KOjzWr9N8
         FKod3S2F3Wd+D3pCAtW7doWatuOpTMVeHNub8tbTmjvxHX8C6qolXbgQfPt20XZi36Cx
         cpbz1bqoqtdFx7JJFWilmS6hpvON3xDhLYvlD+z1+aez1qNRZIv6ukt7kRP/IROcsTTA
         Ox4AWPSvGbTjGf3sha3WFTOkl13Sf8D0XYFnmANjJY816wQuBOZzLlUzU3qcWJQLBoj5
         4859GyFZpQ7+yZ7nuCrsuSsTAvcyXrTGatB6nfu0OTDaliGXfLI6ffkbBvuU1zTuhTRe
         EImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733969922; x=1734574722;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oQvLLQO2Dcgk3hcePdj0knsnbyn081D+yRxJJ0jbm94=;
        b=MKH3jEruPH3VSPYVdanqsRCb2aJPedqyCNng5WiCRfdH4bKmc2wGCxSUv8c4YJxD/3
         5oUGHd+ASpsSeyFy2EmZCcvg7F1uEPHgyZ3jUKZ+sWTPY0+djb6V5fuBBf/wKGb+Oj9H
         JSJpCVmHPXZaSrU5XvMTjML9mu7ElH3xBZHT7SNUg9jya85os4ZTP7ia5rcMLlTeFhvL
         7EjDIrVPw9WzF3BlNCNa5UQzuhtb8aIAT7JmzLbq6kaenvyVlt9hcwuwRbSGvIQzYOkG
         3aPvueVwU6nBI4b9bzUY99oKL2+eXAKj8OOXcFITRivbpmtW8YM+RTu2EKkYfbDx5D/w
         lmkw==
X-Forwarded-Encrypted: i=1; AJvYcCX8lCZ5zoasbX95Qk3O+7eKDHh9+PqNotqto63t5PYjgEpZF+ImOOvIgRAQ+8H18Q9e19+aOQqUwRY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBMeVVxGemjOnx/8Xy7oiu6L5hSYyWu6p9fHiakYNez9e7jv3W
	C5mb2JddNL3Nk5LITZd1pYnhmOEr4nfjh0X//l7OfH5HIy+yBcJy
X-Gm-Gg: ASbGncu+gFsawBR+CHOkYIJrBVGJlrpt5Wssa9hpzwUmMRy/Gn6ofPJ66f48cJ9Ekvv
	8COsQKbbkIZSqxS20if2H8Wze0v4JrfbQrw0q/Mb6VJ06sThypq8C4FFHzTnWuVbdW+W+s1Gaec
	W5vNa/xNaCbMOfvRM3239/dnwSsDW0gyGvcWUvYIFUIw28ICNSnd0V12VmdQyHLvAc2trAD101W
	i2NqTX4BfrgCZ8nBiGzzxsxTzYLNluahTeZSw5PcWIBafoMXSvvpjgJacDHAp3jtO+y9ohIB1LL
	yhpnd2t0u3+Knwz6FZUCPpHX01wMNKveBt9J
X-Google-Smtp-Source: AGHT+IGZbwuLBjXASZPibFhGLGJG7cajkpWLsR5RDRJ+xwbynfB6B9HK8IIuBtNdFreyTAaUTycqxQ==
X-Received: by 2002:a05:6a20:1594:b0:1e1:a434:295e with SMTP id adf61e73a8af0-1e1cec4579fmr2405581637.43.1733969920834;
        Wed, 11 Dec 2024 18:18:40 -0800 (PST)
Received: from localhost (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725d16e7132sm8390441b3a.152.2024.12.11.18.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 18:18:40 -0800 (PST)
Date: Thu, 12 Dec 2024 11:18:22 +0900 (JST)
Message-Id: <20241212.111822.2107715832201318415.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, peterz@infradead.org,
 hpa@zytor.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, tangyouling@loongson.cn,
 hejinyang@loongson.cn, yangtiezhu@loongson.cn, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v1 5/5] rust: Add warn_on and warn_on_once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAH5fLgj9rBOrcQa193RpuA708CFK1ojMqhmiNWF7dbyNFPJcJA@mail.gmail.com>
References: <CAH5fLgiShKMGo6AYWM-4S8JK+iDA+tUfz9uxkns82g0nLW--NQ@mail.gmail.com>
	<20241211.094054.1429837669366274024.fujita.tomonori@gmail.com>
	<CAH5fLgj9rBOrcQa193RpuA708CFK1ojMqhmiNWF7dbyNFPJcJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 11 Dec 2024 10:48:27 +0100
Alice Ryhl <aliceryhl@google.com> wrote:

>> >> +#[macro_export]
>> >> +#[doc(hidden)]
>> >> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
>> >> +#[cfg(any(target_arch = "x86_64", target_arch = "riscv64"))]
>> >
>> >> +#[macro_export]
>> >> +#[doc(hidden)]
>> >> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
>> >> +#[cfg(any(target_arch = "aarch64", target_arch = "loongarch64"))]
>> >
>> > What's the reason for this arch-specific code? The file!()/line!()
>> > invocations? Could they be passed as an argument to the asm instead so
>> > that we don't need target_arch cfgs? I understand that they don't work
>> > exactly the same way, but maybe it could still work?
>>
>> Because of "error: named argument never used" in Rust inline assembly:
>>
>> All the archs define ARCH_WARN_ASM macro in the same way:
>>
>> #define ARCH_WARN_ASM(file, line, flags, size)
>>
>> However, only x86 and risc-v asm code use the size argument. Without
>> the cfgs, I'll get the following on arm64/loongarch:
>>
>> error: named argument never used
>>   --> /home/fujita/git/linux-rust/drivers/block/rnull.rs:54:9
>>    |
>> 54 |         warn_on!(true);
>>    |         ^^^^^^^^^^^^^^ named argument never used
>>    |
>>    = help: if this argument is intentionally unused, consider using it in an asm comment: `"/* {size} */"`
>>    = note: this error originates in the macro `$crate::warn_flags` which comes from the expansion of the macro `warn_on` (in Nightly builds, run with -Z macro-backtrace for more info)
>>
>>
>> Any way to make the compiler to ignore this?
> 
> The error message suggests adding an asm comment. Does that not work?

Ah, works! I didn't understand what "an asm comment" is..

> You could even add the comment unconditionally on the Rust side. It's
> not like the comment hurts on the platforms that *do* use the size
> parameter.

Yeah, I confirmed that this also works for the architectures that
do use the size.

I'll remove the target_arch cfg in v2. Thanks!

>> >> +#[macro_export]
>> >> +#[doc(hidden)]
>> >> +#[cfg(all(CONFIG_BUG, CONFIG_UML))]
>> >> +macro_rules! warn_flags {
>> >> +    ($flags:expr) => {
>> >> +        // SAFETY: Just an FFI call.
>> >> +        unsafe {
>> >> +            $crate::bindings::warn_slowpath_fmt(
>> >> +                $crate::c_str!(::core::file!()).as_ptr() as *const ::core::ffi::c_char,
>> >> +                line!() as i32,
>> >> +                $flags as u32,
>> >> +                ::core::ptr::null() as *const ::core::ffi::c_char,
>> >
>> > I wonder if this could be written to utilize Location::caller()
>> > instead so that `#[track_caller]` works?
>>
>> You meant that we could make warn_flags() function instead of macro
>> with Location::caller()?
>>
>> If so, we need to add cfgs to warn_on and warn_on_once because both macro
>> and function of warn_flags are necessary?
> 
> Well, I'm not sure! I don't know if it's feasible at all, since using
> Location::caller() would mean that the file/line is not a compile-time
> constant. But if we can, then I think #[track_caller] support would be
> nice.

I think that using Location::caller() makes the code complicated
(needs more cfgs for UML). All the callers (warn_* and bug_*) of
warn_flags and warn_flags itself must be macro for all the archs
execpt for UML. We don't want to have the UML version of all the
callers.
