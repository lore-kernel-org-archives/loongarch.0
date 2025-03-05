Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01FA1C701C
	for <loongarch@lists.linux.dev>; Wed,  5 Mar 2025 05:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741151598; cv=none; b=cE2h61BsoiSIY7fXnuJ0Ne56rueezTSbopK8OhWbVhZOn0Bx6UdkwUlAPwaqG5ODhmIcZTRfcxINQZfl+mNlKPck3GVyDSZP7Y/erHh/q3T/8+pylIbBZRsYQReYpYBg/HJqc0e1/hM+fovSVJqZdExX+YUsSP4nPugFFJ6PB8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741151598; c=relaxed/simple;
	bh=q0BhGC6HUxOE4XplZuS/4jndjnSHZQ5oqFPeN6Mlcss=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=HMyWY3sHgLdnGM4gWwdxshFUC5I1rAyuTKhJD8jjjO1x8Jc3nOYAZJtQIFhjtP5CYyuQj7IX149m0DU1gZOObIpsKd6wQMJvQ6M1a6/NAJ086t18RUCepwyYVqNGQqahpiPNYrWHhzHF3H8QKLurXrUfAlk7p0rJQfGGk7MOajw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aP0SVv1U; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aP0SVv1U"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f44353649aso10219460a91.0
        for <loongarch@lists.linux.dev>; Tue, 04 Mar 2025 21:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741151595; x=1741756395; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iI2i5cV2QPSlpE280H3wgvcz67NO3pUTtRCcIr6Aq80=;
        b=aP0SVv1Ub3fggQ5EimkSn20s7Ae+IN+3cPnfKNqqid1IVyeLotDI5qr0dgUyddP7vD
         OienN3GuBa77rTnan9zqDsEUg01n2AzQO1U5em1EzDb4afY1Fy0LqNzURZ2LPPayTbPc
         EXXEgKdpcHFVr4cwakMK2Wxl9ccIq6jYgk3GHgDi/vpv8RCkm/xOgGblQxDHltnHPYlA
         z/DuL1fBLarY8Ko2wuo39/TY5UiaBL3JIpK7y230Xy/QKhqZLJchBY0QE/L5tYNL9a4H
         KkvN/wZEJfgoSInDgs7pSIvsKsKr5k2NsqDwOjmoEnCg+kbRTazOoX748+qqFzIEv3Qz
         DaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741151595; x=1741756395;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iI2i5cV2QPSlpE280H3wgvcz67NO3pUTtRCcIr6Aq80=;
        b=e3rIINZcrsBGOUKLg4tmiAlVhQFNoMDISu8YV+nEwe+HmkWfAR8lUw2zzvhCURw/Bz
         ug8vu0Aoa0EdT8Z0S0ACOv0sM3SEo+nbP3e840cJXUA1L/HhFQ1aTgVPow83CioHnqjT
         LEPyCSa50MXcRTrLoajgENUWsdefchFdCJjhi05gCqhIIQQJcB4IjXN9Qj+rM4oa+7a0
         EJRTBE1HJh3kK1++oF1vmQARXRCSRlrZiXX7e1wv+nTnrH3IxvSbhJOyw2/+qtekwWT+
         nJTVj0LdFs8agtql9YZXKnKymVGql5XM46Znmj5Mm2NntiiOKtRsloYbVtyz5atIWUxn
         otwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJHCtHJgwcsp194hECYn+yI+iDKwcV8rn07D80scgaRTi2/avDLjpEoKcgOwzVpsvGfqy1oqdXH10=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf4B/cqJo7FFxKAdJNDhHmdN81rvFazwx6HbAcr11LreYdF5NO
	yFR7tUO8856gIL5Mwa5uxBcYUxypGEVL0oWEQMoXDMeNXNjHe4Sy
X-Gm-Gg: ASbGnctWBvMteOp1PWwTvFFLr7ZjP6saPv+hx6EChmkocD4EeCFk3V26NzqpuGjgZf5
	GPjGwIm/+qqiSK5AZMsLqbQXh0gaJf7jJ8irBFB13/u4YyqWI2w3Kcc6Mzk8KzvLP00PLXNQduj
	Li4NRC0VQJPC78RW/CS8NeIjeLjtrgkZ9kkTch2iRKo9MD4DhKddarAosgybub+abl8F7GBNtvN
	78Wuf43d4NIT1/GmLLxwJUFsOvyDrpKvfTWhj/CZI0l+MeSBtEStzTXpxDCeeNbULkPvBw7mp4D
	T8Ba+qJPQvQwXmsNI6A1u963mPq47LG7SiRc3RVjKlevRj/f71cCvtvA//7Qp6sVu+EOyuQQmad
	YaXdyebQ9Qa8XVVf36GMPXQzQ0hE=
X-Google-Smtp-Source: AGHT+IFMSQhAQ13isO5dfJNAPGUjk16diS7qR+TcB+buuYoTv6JifWXgE+o5nAJ3u7mlLeqgq39i1g==
X-Received: by 2002:a17:90b:5688:b0:2ee:bc7b:9237 with SMTP id 98e67ed59e1d1-2ff4979cee1mr3291553a91.27.1741151594826;
        Tue, 04 Mar 2025 21:13:14 -0800 (PST)
Received: from localhost (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e78a991sm380662a91.24.2025.03.04.21.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 21:13:14 -0800 (PST)
Date: Wed, 05 Mar 2025 14:13:07 +0900 (JST)
Message-Id: <20250305.141307.586794213367343251.fujita.tomonori@gmail.com>
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
Subject: Re: [PATCH v3 5/5] rust: Add warn_on and warn_on_once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAH5fLgjX9hh+QRrKggOKr+6p+UwqHSavzu4UXy9iGNL2wSJXtg@mail.gmail.com>
References: <20250213135759.190006-1-fujita.tomonori@gmail.com>
	<20250213135759.190006-6-fujita.tomonori@gmail.com>
	<CAH5fLgjX9hh+QRrKggOKr+6p+UwqHSavzu4UXy9iGNL2wSJXtg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 3 Mar 2025 14:33:39 +0100
Alice Ryhl <aliceryhl@google.com> wrote:

>> +#[macro_export]
>> +#[doc(hidden)]
>> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
>> +macro_rules! warn_flags {
>> +    ($flags:expr) => {
>> +        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
>> +        // SAFETY: Just an FFI call.
>> +        #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
>> +        unsafe {
>> +            $crate::asm!(concat!(
>> +                "/* {size} */",
>> +                ".pushsection .rodata.str1.1, \"aMS\",@progbits, 1\n",
>> +                "111:\t .string ", "\"", file!(), "\"\n",
>> +                ".popsection\n",
> 
> It looks like you're doing this so that you can reference the filename
> with "111b", but could you do this instead:
> 
> const _FILE: &[u8] = file!().as_bytes();
> // Plus one for nul-terminator.
> static FILE: [u8; 1 + _FILE.len()] = {
>     let mut bytes = [0; 1 + _FILE.len()];
>     let mut i = 0;
>     while i < _FILE.len() {
>         bytes[i] = _FILE[i];
>         i += 1;
>     }
>     bytes
> };

Neat! I will use this in the next version.

> and then use
> 
> asm!(
>     concat!(
>         "/* {size} */",
>         include!(concat!(env!("OBJTREE"),
> "/rust/kernel/generated_arch_warn_asm.rs")),
>         include!(concat!(env!("OBJTREE"),
> "/rust/kernel/generated_arch_reachable_asm.rs")));
>     file = sym FILE,
>     line = const line!(),
>     ...
> );
> 
> with
> ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}",
> "{flags}", "{size}")),
> 
> That would be a lot simpler to understand than what you are doing.

Indeed.

Thanks a lot!
