Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92FD205E2B
	for <loongarch@lists.linux.dev>; Wed,  5 Mar 2025 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741170253; cv=none; b=BSSFEk+lO2rd96aZOui+gE0J28kFb3kvINQgSfqGw6bH5KIELx8msgaPA02IquZOD/GWIiPttHHWZ4c0ogYIcAnQEEtjbcv/4eSN06++bIj9AGdnsJ/21SRL6s1L8w7ZpPwr4q5F+iFAJZGqXrv92bc51dXkTRwab2MUc463QzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741170253; c=relaxed/simple;
	bh=rpJFe0wOfuGvVfafJ6fYA8p3MFl5W10FP6UIBHcWyxc=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=MR981brjQlakpkBFABuNhDi+CwVpxZWXuvwOTMkIdeVxCJRLVVCb46ug+zTs7NGWp9MPitFrCfAhWoMZA2PoK9aTIlXmL8weWsSpLaWR+7k28JMo4cpuFlHlOrrb+14xpiTRSLf+XH49od8OhozCstheZXRi3HUGWVC4doB1Eo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuU0GkHc; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuU0GkHc"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223959039f4so76284285ad.3
        for <loongarch@lists.linux.dev>; Wed, 05 Mar 2025 02:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741170251; x=1741775051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlN/L4AefYvDeS0mxE9WdsKwZ74h8HubhxsXCuRQhvs=;
        b=BuU0GkHce9rrBeRFopP8sKZ4iUelwwaPRJypel6WgQRW/BOJe+Z2TjGjkP7//8wRCr
         nPcWrUOSo+UGXCscEocnBWASEUmZQ+Hz23a0XsggkH74SsjLkAxUE2GcfhlrU/b6S/i5
         kWNYXz9QWN6q1qLeRZM3LORtN+q7rarLgSEW4ARSCad0RswCEezjexHA/f6byKQKub7e
         G5LcwQ/U0xoONHiolqIrfRg1NiMqQOJEILmI98YNtCM8A2FeWbIIDl5yXXk8SsKARUGj
         Q4DU083k94+ePtV+LT/vfNQQD3hoMMRdMyKDdHlD87QfjeUnrSaNvLqiGBvNnw9BLxhW
         TiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170251; x=1741775051;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vlN/L4AefYvDeS0mxE9WdsKwZ74h8HubhxsXCuRQhvs=;
        b=WPOx33h4JSO1yqfDswoaHHa0nomaj1PVO2pdX84EftVz1/ajnd8TqgFFoNsj+o6YQC
         GewM2Zjcffg6NHV/OXmQY2AvD4Tb1T5GT1amVgJi5r+Hig8Qt1xP8txon6nqI+ld67U5
         7v9ltmN3WQn76XNV6bgjIhDBssmmAnQHJI2kKx+KYzZb6fIrGnQs0OpRqO8bu1kOEBTl
         ZxPM4nxA1+mmpjdiUIEB2nGcIwAJTeswsdHm5z7S3vk73LXpJJsi9RfY/c5Ep4FF8HTz
         uCwh2Rvfc73C60seyd3Vj11oQCkd/sUpHQCtgWdCDafFKJUc3eNkZHUf4k9Qqdia8JQJ
         G2LA==
X-Forwarded-Encrypted: i=1; AJvYcCV0i0/Q9bRfDF6FtNdmJB5wmUUz6ycURC/qQ+wAWyCmnTRod6Eb3sZ9MfgAioqbs6ZZpKitPYW7yeY=@lists.linux.dev
X-Gm-Message-State: AOJu0YydkUUN4Qx8bNqouHRRcKBB95pZMzScqjYKiAJl5KVUbpadGtr/
	eSRGPQ0lt39xnF169J4x4lzjuVBBZiqeXTSZiIf1u+g/Z/oU7RJS
X-Gm-Gg: ASbGncvzr5MyUstYDJUm+9l7IFl+Gfw1fQ7PZA4HUD9QVg+KpEtyUpALYdQqwIPR1hG
	oYnKoQAHnOe8HSrD1adl/K2agfYrAGCbQ7+ddXNH6cH5LSC0xEmqPyaPKmeozf5UMORjd0Zr6Tq
	rkflri4ri+ch5xkZZDMy9k/jMnr/2UsMfQOdg+7c5aUSA3sqTrnZ/8JJjKE8KLKAlWjhV2wVEWv
	OqjNHNmTJx3IpgMDdvP1DVgEHk2ETxuqBY8VmRUCikk14mDCfa1Gj17URemeeHPuoWvcFRKHoXT
	KVJKn7hHgiedLtCtfRRD34VSuEQc9ZqOFQvlRTUG68TQHet/yVvYzE8pbk/IrrSqWIY19MHzUOO
	27hDFosZtYihvte0Ww2X+cfsHX4g=
X-Google-Smtp-Source: AGHT+IGsFQfHQjvkNE241Y4wnmDmNDBQSHQivxyIM52U3bSLm+KCunMmDVV2E0sVtyiSSMpJSKWLRA==
X-Received: by 2002:a17:902:d2c1:b0:220:fb23:48df with SMTP id d9443c01a7336-223f1cf320amr40589935ad.36.1741170250886;
        Wed, 05 Mar 2025 02:24:10 -0800 (PST)
Received: from localhost (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d4e9fsm110731105ad.28.2025.03.05.02.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:24:10 -0800 (PST)
Date: Wed, 05 Mar 2025 19:24:03 +0900 (JST)
Message-Id: <20250305.192403.996225631653343672.fujita.tomonori@gmail.com>
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
In-Reply-To: <Z8gOkeJ8o2pMCwGu@google.com>
References: <20250213135759.190006-1-fujita.tomonori@gmail.com>
	<20250213135759.190006-6-fujita.tomonori@gmail.com>
	<Z8gOkeJ8o2pMCwGu@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 5 Mar 2025 08:42:57 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Thu, Feb 13, 2025 at 10:57:59PM +0900, FUJITA Tomonori wrote:
>> Add warn_on and warn_on_once macros. Wrapping the C's WARN_* and BUG_*
>> macros doesn't work so this uses the assembly code exported by the C
>> side via ARCH_WARN_ASM macro. Like the static branch code, this
>> generates the assembly code for rust at compile time by using the C
>> preprocessor.
>> 
>> file()! macro doesn't work for the Rust inline assembly in the same
>> way as __FILE__ for the C inline assembly. So the code to handle a
>> file name is different from the C assembly code (similar to the
>> arm64/loongarch assembly).
> 
> Nit: Should be file!() not file()!.

Ops, thanks.

Actually, the above comment is obsolete. With your solution in the
previous mail, I can remove the asm code for the file name. I'll
remove the comment.


>> diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
>> index 6ba39a178f30..f1d7f4225332 100644
>> --- a/rust/kernel/.gitignore
>> +++ b/rust/kernel/.gitignore
>> @@ -1,3 +1,5 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  
>>  /generated_arch_static_branch_asm.rs
>> +/generated_arch_warn_asm.rs
>> +/generated_arch_reachable_asm.rs
>> \ No newline at end of file
> 
> There should be a newline.

Ah, I'll fix.

>> +++ b/rust/kernel/bug.rs
>> @@ -0,0 +1,100 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +// Copyright (C) 2024 FUJITA Tomonori
> 
> 2025?

I'll add.

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
>> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
>> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
>> +            line = const line!(),
>> +            flags = const FLAGS,
>> +            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
>> +            );
>> +        }
>> +        // SAFETY: Just an FFI call.
>> +        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
>> +        unsafe {
>> +            $crate::asm!(
>> +            concat!(
>> +                "/* {size} */",
>> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
>> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
>> +            flags = const FLAGS,
>> +            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
>> +            );
>> +        }
> 
> I generally prefer to have the cfgs on the macro rather in its
> expansion. That avoids emitting a lot of code that is not actually used.

You prefer the following?

#[cfg(all(CONFIG_BUG, CONFIG_DEBUG_BUGVERBOSE, not(CONFIG_UML)))]
macro_rules! warn_flags {
...
}

#[cfg(all(CONFIG_BUG, not(CONFIG_DEBUG_BUGVERBOSE), not(CONFIG_UML)))]
macro_rules! warn_flags {
...
}

>> +#[doc(hidden)]
>> +#[macro_export]
>> +macro_rules! bugflag_taint {
>> +    ($taint:expr) => {
>> +        $taint << 8
>> +    };
>> +}
> 
> This could just be a const fn.

Yeah, would a const fn be preferable?

>> +/// Report a warning only once.
>> +#[macro_export]
>> +macro_rules! warn_on_once {
>> +    ($cond:expr) => {
>> +        if $cond {
>> +            $crate::warn_flags!(
>> +                $crate::bindings::BUGFLAG_ONCE
>> +                    | $crate::bugflag_taint!($crate::bindings::TAINT_WARN)
> 
> Or maybe a constant?
> 
> const WARN_ON_ONCE_FLAGS: u32 = bindings::BUGFLAG_ONCE | (bindings::TAINT_WARN << 8);

Ok, but you prefer "<< 8" than using const fn bugflag_taint()?

> $crate::warn_flags!($crate::bug::WARN_ON_ONCE_FLAGS);
