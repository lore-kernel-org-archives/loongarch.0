Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46C1284B22
	for <loongarch@lists.linux.dev>; Thu, 10 Apr 2025 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288462; cv=none; b=D3o3jguV7xBMZ89JK8RrjD5CqYaYcMKvPzI769lRKBQIucxj7z4SjVkll/XklNBtgXvXL4LU7xpoq3q7/Sqg1LN2N1yTml+zaFzsrBGMC+uEKPYYen8/7vi6PjxwlFYNl1PdO+hrX7sldW5175CiWuWbc7K6Ec+who2R1SLCEcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288462; c=relaxed/simple;
	bh=aYnz96tviR6JkjQrvqHBO9WzzIuRSa6ZnA54LbzQIXI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sQgWKx00lZwrAHY8Ejn0H8hx+3N1S/+tyLZv0nbyGJxyqurre+Oiyg8WJwkTYBWOPfRCvWPkcMqx7TQBNRRIieSsgjsi+C6FnEQTyw7OglOsT7Gd1H3wXHbIDvxOvpgli79MijjwFUM3ljgwnmEJV/XymkizRj5y0Q7LiRvnaSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWoTU3uf; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWoTU3uf"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736c277331eso1750752b3a.1
        for <loongarch@lists.linux.dev>; Thu, 10 Apr 2025 05:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744288460; x=1744893260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYYB8xWXXp3NrY8EvpLd9vo2DOULWKf7nlbTH+Fs28E=;
        b=PWoTU3ufhWTZWVD/yb97sQ6TrI5zvjP47XiP0UfKeZQPgC3WP2vJhtlRxjEoi2kI3T
         9bQlKCinoj2rdBbCIl97cYKD2OVjMw0xMse8o8UVxM5ROis86RJLVYwsAiMMlWVTzQF+
         mAgIMVB7OE6F429z/1bi25P2CbKfrLZTU31lrMoJf3FJV4fB/z9iyWetd3HnPze8Rccw
         t+3ccvBadyedSsJs9BNV+eoRCsfqATH5z47w4iSQSivYpamsgDQDQblcn0bSt2AEBuP5
         yKnma8pV7s9SxvIa6demQuDBarEwVTVY02q+MX8XwEyL+cMUPUCCvAxiem/U6wHUbBJ6
         wDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288460; x=1744893260;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CYYB8xWXXp3NrY8EvpLd9vo2DOULWKf7nlbTH+Fs28E=;
        b=Wj1VcyB6NanassCMCPa3RJ3PhchsX+AHjvtpg4wei+AWlaVJdKiiPSZGkBj8nIE6Cg
         c/em/bijFJyAHZ3k/2RAPxBeuzGuxAkd9pG7Pn3PV2xIRO7gG3yjfiS4Ode+CUdhc4Rd
         CWjHdAU38eqUO72CnVcrtwtNQ4x+oCPJWHX9GmAVuwMWbVTtfJVy4QgU7cyXLJZ75t4k
         /X5DotsZfQq/grEC13DIS9PiFgfcJDZQr6zSiT7xGYAXByMDmaETwDW2KeZHa9q6ON0e
         I/gjkHV46gib4+6/5mTVL38sM2PrKwGRAgZWm6uA3md8GL56A2tHSBEVqz0uqKRWWoK0
         XWBg==
X-Forwarded-Encrypted: i=1; AJvYcCUvihoKR21fFaB92VVjCq8Tc85BsEsvLZX3bFPjGePZNvJelbEHxJfYCuwquEXTKY95Qukml7fguqM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd3wnnIAiSUOzkyab9xw3sPLcTUb6jXXYCFR2MHbahWNJXscRL
	flYONUpCKahLbWjBr9dUiE+lzQ9m+06OcfKD3GQJApPOQJ0txwNi
X-Gm-Gg: ASbGnctpiofJ7kjxByQ1WmP6xwml/ggqTJdFRot/f1EIzhxB1qlFvH1XU6nqVCdRGWK
	iUquIbuYpunVGjIxmZk9lnfsOQyf9SG/7hIyfmlrH/VdDmWEdwE9NG0cR08Azcez7BpjAehdw57
	P3xG45tPNckmeO1B9x3GZCaNo2KnMSgfm99/fFNV3ZTpogMEHaFVf+ERK7cIfaiztABq9d1dn1N
	UHGIuJQH/qE+9yJHwwOOEBT1nmHLcTUXHXJr02PuyMmnAcQ8cayFDLERmnJyNu94KnLBi2vTf4I
	YY4sVqkhOiQ2xtv8L1RviZPl+c4Cj8NjBstjY1HIYs/v5YUbicAXG56EhkxERz9qdu2fKxNoghw
	cpgWVjjc8AscPLmxQPf0AjJc=
X-Google-Smtp-Source: AGHT+IGl2utS2unvYHRMdT2RP9ueZqQhdCzDP3jwZyYMjQoG9MrpSlL23CvVNg2kZbwezJItYp/l0w==
X-Received: by 2002:a05:6a00:1487:b0:732:1ce5:4a4c with SMTP id d2e1a72fcca58-73bbf869048mr3236065b3a.1.1744288459852;
        Thu, 10 Apr 2025 05:34:19 -0700 (PDT)
Received: from localhost (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e69ae9sm3206479b3a.173.2025.04.10.05.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 05:34:19 -0700 (PDT)
Date: Thu, 10 Apr 2025 21:34:02 +0900 (JST)
Message-Id: <20250410.213402.1373597003035091247.fujita.tomonori@gmail.com>
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
Subject: Re: [PATCH v5 4/4] rust: Add warn_on macro
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <Z_d1xAAptnfzqg1l@google.com>
References: <20250409065802.136971-1-fujita.tomonori@gmail.com>
	<20250409065802.136971-5-fujita.tomonori@gmail.com>
	<Z_d1xAAptnfzqg1l@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 10 Apr 2025 07:39:48 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

>> diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
>> new file mode 100644
>> index 000000000000..761f0c49ae04
>> --- /dev/null
>> +++ b/rust/kernel/bug.rs
>> @@ -0,0 +1,114 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +// Copyright (C) 2024, 2025 FUJITA Tomonori <fujita.tomonori@gmail.com>
>> +
>> +//! Support for BUG and WARN functionality.
>> +//!
>> +//! C header: [`include/asm-generic/bug.h`](srctree/include/asm-generic/bug.h)
>> +
>> +#[macro_export]
>> +#[doc(hidden)]
>> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
>> +#[cfg(CONFIG_DEBUG_BUGVERBOSE)]
>> +macro_rules! warn_flags {
>> +    ($flags:expr) => {
>> +        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
>> +        const _FILE: &[u8] = file!().as_bytes();
>> +        // Plus one for null-terminator.
>> +        static FILE: [u8; _FILE.len() + 1] = {
>> +            let mut bytes = [0; _FILE.len() + 1];
>> +            let mut i = 0;
>> +            while i < _FILE.len() {
>> +                bytes[i] = _FILE[i];
>> +                i += 1;
>> +            }
>> +            bytes
>> +        };
>> +        // SAFETY: Just an FFI call.
> 
> Safety comments could be improved. This being an FFI call is not the
> reason why it's okay. Furthermore, it's not an FFI call.
> 
> Otherwise, this series LGTM.

SAFETY: It's always safe to embed metadata such as the source file
name, line number, and flags into the .bug_table ELF section.

Looks good?
