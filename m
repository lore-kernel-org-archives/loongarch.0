Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DBD1FC119
	for <loongarch@lists.linux.dev>; Wed,  5 Mar 2025 08:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741164183; cv=none; b=U7zFSN13vj0UXUJxOI7JzGY1lg3ubfoRkcOICkmkQpYXPwgWSnIHBSoirJ+UfPE5mip4WJLRIO1gbY43526EsIJnte4z1n3cz4DeUsdozFuSppoj2/I5V48yvWL1pKNUgldIqlwkSPsJKnD3eD/ppgCthXx4f/sE6IHMnYWGFI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741164183; c=relaxed/simple;
	bh=SAf7h5gbxMINcuKvSl8+lprJ6OvJxNewbzasDdhpwHk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PWjBeocdi4t41YBP8LnoKHlKS0s9ZFV35PrZIUlWK0f8eBYsug0Pn3ci46t/jxvBjj09MxA7d6BQBSXKlIMv7n9ziBNfZxnNZrusyN2Myn+U4Ic3o+bkGZTYWa+uJXGd/nXDMnvEg546zA5TfZjxnvFRhqJ+eZGGVOq8G6hD0NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FzMssoU0; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FzMssoU0"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43942e82719so47509925e9.2
        for <loongarch@lists.linux.dev>; Wed, 05 Mar 2025 00:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741164179; x=1741768979; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fbv4NmRo8rWuhx/VklrPSnRlTJS9K51A0iqhEMUSP14=;
        b=FzMssoU0TAazY8PlmtP13C+88+QN6xDVfB0anmvqjqd0xSS8NC537I6TIyTo89wqiO
         oz36FSFSEaMnLRmINV2LAEq3cfIZWIPGxQYoWmy+ZqgH0s9u16gOUGQmbhoWx+X8ZHck
         0aFNUKg+XEQ2v6+lQA2ADuArkWhc0slrVH/BcY9fwf4F1PnG1T/CBXFVzEwVfY6atAJO
         zV/84X4zh/EOEYSczVvlyRC1GfDWJf4Z7znctKZ8ojDgXE3bUKKRzSRQy5jGyvGSWxeg
         6CR4IvSMuWev0HNR1rEQ6AbZINOhU7sKa47ggkily6lQGgp3yCDa9OZRMt4cEuWw9OTm
         NBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741164179; x=1741768979;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fbv4NmRo8rWuhx/VklrPSnRlTJS9K51A0iqhEMUSP14=;
        b=vLrTTuGY5x1uG4Zo+Te6tSEfZ2RZOPM4yyP8R6Z0Y++C9q6j5fqlFKh62k5LEW6eVg
         gg360Jn8pJIC6k6CKjqgWe21a2+/RtYEzczhM9IMnTHA453h9/jyXAC8ZyS67KJVaX/D
         +LMfpbHGGpE8r6w1i1O0Daq1iXL+pNVafCmkOZP2odang7SiUZyRJnyp1fEA0g+ZBVop
         UsUnGtvGizDjqLeHRAun6cSjkkL/7+2E3+ETFDzGFOk4VkMZjZ1ORZm7VAk2TQutTeAK
         ifYzD9bT81DS8ZC36YoG8djiI2WICUlDvi7n5P2F1cVZMXxx09eiEOrj3cFw9wt9sTGe
         QFpA==
X-Forwarded-Encrypted: i=1; AJvYcCWeIU0B/YwagT40iuzfeOfxFgTJrs2VTUhZC2OsIl5WMlgTiAIJZff5kHcSxwCk4wQLf4UnJMNyAiU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu0fYJAYeZrqlxuq1p+5kHZRAClsj7K7PBX11QfvXJbkJPKflv
	A2qnUmNPFSvOzYXmuxFjUfAp1s/XKsB5rCqBY5PITeDUJVv1/TakZJUk3DM8dG6WgumemDBJQ88
	WBms3NqryXLnCCw==
X-Google-Smtp-Source: AGHT+IGNc0nObqBIdB7e0pv2I7PeyN0NrbTAt23TRGJiElvbDtYcA/dcph5rmLVDajCFRggPb9cddtoV966/r0s=
X-Received: from wmgg24.prod.google.com ([2002:a05:600d:18:b0:43b:c99a:4af8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c09:b0:43b:d04a:3506 with SMTP id 5b1f17b1804b1-43bd2ad9527mr12625425e9.25.1741164179002;
 Wed, 05 Mar 2025 00:42:59 -0800 (PST)
Date: Wed, 5 Mar 2025 08:42:57 +0000
In-Reply-To: <20250213135759.190006-6-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250213135759.190006-1-fujita.tomonori@gmail.com> <20250213135759.190006-6-fujita.tomonori@gmail.com>
Message-ID: <Z8gOkeJ8o2pMCwGu@google.com>
Subject: Re: [PATCH v3 5/5] rust: Add warn_on and warn_on_once
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 13, 2025 at 10:57:59PM +0900, FUJITA Tomonori wrote:
> Add warn_on and warn_on_once macros. Wrapping the C's WARN_* and BUG_*
> macros doesn't work so this uses the assembly code exported by the C
> side via ARCH_WARN_ASM macro. Like the static branch code, this
> generates the assembly code for rust at compile time by using the C
> preprocessor.
> 
> file()! macro doesn't work for the Rust inline assembly in the same
> way as __FILE__ for the C inline assembly. So the code to handle a
> file name is different from the C assembly code (similar to the
> arm64/loongarch assembly).

Nit: Should be file!() not file()!.

> diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
> index 6ba39a178f30..f1d7f4225332 100644
> --- a/rust/kernel/.gitignore
> +++ b/rust/kernel/.gitignore
> @@ -1,3 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  /generated_arch_static_branch_asm.rs
> +/generated_arch_warn_asm.rs
> +/generated_arch_reachable_asm.rs
> \ No newline at end of file

There should be a newline.

> +++ b/rust/kernel/bug.rs
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2024 FUJITA Tomonori

2025?

> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
> +macro_rules! warn_flags {
> +    ($flags:expr) => {
> +        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
> +        // SAFETY: Just an FFI call.
> +        #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> +        unsafe {
> +            $crate::asm!(concat!(
> +                "/* {size} */",
> +                ".pushsection .rodata.str1.1, \"aMS\",@progbits, 1\n",
> +                "111:\t .string ", "\"", file!(), "\"\n",
> +                ".popsection\n",
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
> +            line = const line!(),
> +            flags = const FLAGS,
> +            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
> +            );
> +        }
> +        // SAFETY: Just an FFI call.
> +        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
> +        unsafe {
> +            $crate::asm!(
> +            concat!(
> +                "/* {size} */",
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
> +            flags = const FLAGS,
> +            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
> +            );
> +        }

I generally prefer to have the cfgs on the macro rather in its
expansion. That avoids emitting a lot of code that is not actually used.

> +#[doc(hidden)]
> +#[macro_export]
> +macro_rules! bugflag_taint {
> +    ($taint:expr) => {
> +        $taint << 8
> +    };
> +}

This could just be a const fn.

> +/// Report a warning only once.
> +#[macro_export]
> +macro_rules! warn_on_once {
> +    ($cond:expr) => {
> +        if $cond {
> +            $crate::warn_flags!(
> +                $crate::bindings::BUGFLAG_ONCE
> +                    | $crate::bugflag_taint!($crate::bindings::TAINT_WARN)

Or maybe a constant?

const WARN_ON_ONCE_FLAGS: u32 = bindings::BUGFLAG_ONCE | (bindings::TAINT_WARN << 8);

$crate::warn_flags!($crate::bug::WARN_ON_ONCE_FLAGS);

Alice
