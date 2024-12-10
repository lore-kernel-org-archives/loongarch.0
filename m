Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EB5230D25
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 09:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733821522; cv=none; b=iFQjLCJY6GOId4QcUi3abPzZD7sa7A1SriJwk2NPgjm3cxazJqnfmcUOcLXinDeAdocpA4pLoTKU0i8cAixpQgLU9FQIlg+AyQA9BDPU6TDu0UVabUB9U1slC8M26/uYZQcpJDI/oMK+sZbSlHFOOueJE9QGIgcrC5qKqV/GlyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733821522; c=relaxed/simple;
	bh=3NtIMl1DjCiUo8OeDU2MLnM1AfkfRHex0Tmo2GMo9SI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iblestn6ojBU1rxsUgYO4DDzluzcp0SnulwLtixp9aKv82y/7gbTI2Actkhb3xauxO2az6n3FEFvhBl+8hpPYWNNcDrVzheidmhtqp/ZWlX7cQ26z9kEvDwgyF61fB+pxhHoiF2/tNzpMMeI0QMhoWcn35s7TMTEjJ73sBjK3KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Zn3FTys; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Zn3FTys"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385e3621518so3551258f8f.1
        for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 01:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733821519; x=1734426319; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ep5OKFJpfszekExX4/IRcefemdiT8s+lNUZhAL6lYhw=;
        b=3Zn3FTysgQcNKGIgg4rHsl3s96GbGShyDSamLdM17YFa01TPTouO624jk3zDXfvB1c
         kS3SHQOYA3H8UEud1YRU5lRn6uvJ0dWNUfYGjqAZahxF2ozA3ypfpBzrxDDFiIWTxR2I
         V8zY29u2T00p+8kfwCNPFi4hlcTXpVkh3mehpZELRm0XOAT5Rj2obWgyOnUD3HcYj8v1
         1mYPaKpPda2R1J95mOiLn0+kCbVlDEyg/tTiMaYWGAomx1rsJJGIybbW59ZC++95uVtS
         QuRkKM3CUWtoMiPKv5/jfwmTzf0HFOfIzbRGTA9/JSx5kISp0NrahdbocR8YoNIU6WzU
         lNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733821519; x=1734426319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ep5OKFJpfszekExX4/IRcefemdiT8s+lNUZhAL6lYhw=;
        b=gnpr2Ip+Q+orP2dWEbZsuvp55H7dr24XSl73t+QnzaaaSUG0/WsFcsAvdTxnVkwlJJ
         ln9hYDzGpmFhyR5pQQ4DWfTx1Ack8mdPlIOE1EaRyrcjqSHKH4S7D5vDa3AnGVo1jmry
         H7ZdRgmCrpw6Yq8YY0Wj6dtWwz38qvHqRDlDEGz0B71lX1RQQ8w1kjRXvHTLuV6o03F5
         DBYArNwGW5poKtNrcJBb1JJ8eCnst9GTBkSPmiXccT179GT1UCzKz4n3qzQf9R7/4OgM
         zLWsvSGgwsohFE3ADxsxPV8zlY9VI05/rey8L8ycQ/9EnFOsIzriDnqywg8tcucZAJ0o
         XHwg==
X-Forwarded-Encrypted: i=1; AJvYcCWnuFRbpZ/iIHDuctO71moSBIq3ejwuaOkx49PU8GkdomGlE5+GACA1FwOsxzkbxjeC999bsQbubFA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsHqxBgW4l4Or8wJAYXgb/lBuLy+4VSaEgmPyJgEnYb7HYa81Q
	2LyyXhXdfaXpXz3H0AWK9wkGuVVHPaB8M52h6jiqZuJzRcR1TJbtACcd/Q8nclkKNerrg/Z+wCH
	azWQ5TUHNz2fvPISGB9fEZn8+26o4mooPFnLw
X-Gm-Gg: ASbGnctMdq+DM2dBBcm/tuSH8/bwSDuankiTk+oIZV0U3+ZLWBifkgWVegIiyZ0mcdX
	Jk7BIo5+rkPTRitleygpjp+VZ9Tqa4/Nj4TMMpv3Z456O7vwjxR5R63n9qgbqJn9Scw==
X-Google-Smtp-Source: AGHT+IGIVjgo6xFN35HYB1TgvILbI9Al6TSHNEWYp3ypNeyi+o9RjYaXrxzLsc97Z2zDVdAJ5OXIaoQOhG2vsZwboeY=
X-Received: by 2002:a05:6000:156f:b0:374:c4e2:3ca7 with SMTP id
 ffacd0b85a97d-3862b33e3cemr11655971f8f.5.1733821519043; Tue, 10 Dec 2024
 01:05:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241210001802.228725-1-fujita.tomonori@gmail.com> <20241210001802.228725-6-fujita.tomonori@gmail.com>
In-Reply-To: <20241210001802.228725-6-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 10 Dec 2024 10:05:07 +0100
Message-ID: <CAH5fLgiShKMGo6AYWM-4S8JK+iDA+tUfz9uxkns82g0nLW--NQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] rust: Add warn_on and warn_on_once
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 1:19=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add warn_on and warn_on_once macros. Wrapping the C's WARN_* and BUG_*
> macros doesn't work so this uses the assembly code exported by the C
> side via ARCH_WARN_ASM macro. Like the static branch code, this
> generates the assembly code for rust dynamically by using the C
> preprocessor.
>
> file()! macro doesn't work for the Rust inline assembly in the same
> way as __FILE__ for the C inline assembly. So the code to handle a
> file name is different from the C assembly code (similar to the
> arm64/loongarch assembly).
>
> ASM_REACHABLE definition works in the same way to get objtool's
> reachable asm code. The architectures which use objtool (x86 and
> loongarch) needs it.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
> +#[cfg(any(target_arch =3D "x86_64", target_arch =3D "riscv64"))]

> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
> +#[cfg(any(target_arch =3D "aarch64", target_arch =3D "loongarch64"))]

What's the reason for this arch-specific code? The file!()/line!()
invocations? Could they be passed as an argument to the asm instead so
that we don't need target_arch cfgs? I understand that they don't work
exactly the same way, but maybe it could still work?

> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, CONFIG_UML))]
> +macro_rules! warn_flags {
> +    ($flags:expr) =3D> {
> +        // SAFETY: Just an FFI call.
> +        unsafe {
> +            $crate::bindings::warn_slowpath_fmt(
> +                $crate::c_str!(::core::file!()).as_ptr() as *const ::cor=
e::ffi::c_char,
> +                line!() as i32,
> +                $flags as u32,
> +                ::core::ptr::null() as *const ::core::ffi::c_char,

I wonder if this could be written to utilize Location::caller()
instead so that `#[track_caller]` works?

Alice
