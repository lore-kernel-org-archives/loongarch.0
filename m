Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297F41C460A
	for <loongarch@lists.linux.dev>; Tue,  8 Apr 2025 13:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120555; cv=none; b=hRJdArieNvcLRpNuB4tz7YfELpneMhJghWQfQVwZ5oeIBLyluRfsa70X1FUzjk2Tkg6shB9PUvxr9Jz/ciZyeJJTobpF7b4wnlCW9dHYPrU986XgGa4eTs8Yj84DTI/ce+AC+Anmt3ql4HbQB7UFIARuMlYmL/H4HAVuR8i/mRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120555; c=relaxed/simple;
	bh=A6oBXcNkDqEcBwguJfqIOppUobE7Rt7ruRENVRB7a+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/ruwzgSvDpeQYWGppyQd1W+MtZMNWySYbdFof+weJ6o/dU6L9hblkui93cZoEoD938/KzspQOJlpvGLwLDfilB2Xmz3Bguoc1PLQUHh/afltbHNnEslEPeZuRP4U5dRQAa9PfCXnWVIUTSAivGgZ77OCCDha4Nr72yILuDDB+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=raS+SSrM; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="raS+SSrM"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39149bccb69so5247679f8f.2
        for <loongarch@lists.linux.dev>; Tue, 08 Apr 2025 06:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744120551; x=1744725351; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKIKzdAk3P2Y6YQbz9/8N2BLD9HfzvL0US6679wvjAc=;
        b=raS+SSrMUua7ejYp0geiTnWfbID/0Vx5dHk9vQPMxUFxMcl1RC/uaC21RG8t1boB3h
         xdsWV8GMhfT3wI/Z6ZyJr6ITXRiwewDkrDXVStMS/pkzzExOK2olaKNAu5BJDcglTNrM
         ZFGvopXLfCK1UDt22eZHS4/zZBqRoK8ooypvIKgcX0fBbopPXNVyyMKCrDw8vVTFmRlH
         gFLbkZsEH1vXmbbiJGBzLZh0AibUQMXM9kB+kX/8FX5DbHjiZzrVXvLNjLhOi4hkWN42
         oqAI5j5HaHF2hyPT6vdMzzDPm7apAQxsbxPGsLm7n+sEZTifd3hFsK7b8v0gnQRbDX73
         Jo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744120551; x=1744725351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKIKzdAk3P2Y6YQbz9/8N2BLD9HfzvL0US6679wvjAc=;
        b=o/PUJsi7O8aiTycFuP/TIx25lUo/NPxyfr9YPmF/5vOC2tGNblrBN4qFVhk6PQF/H5
         ljWjIBUbtBhoNyH8Gfv6VVMHknFkzvwCcy+k50AdYi1Ikvagzy1yPukoC53ytgKsiCzO
         sVFm6FjDPj8uOcFxzjvGORjGTzZzZoJETKfk+tNCGqxFCh8uZYBezU7rJJ+oPSDM6lOV
         EH1M6tFeVkQTHZXOnk/0YOY4D5FZVRKrXiQaoLlKoujRUz8UpykuKd6ot9df1p1q5VeV
         HPtVnx4glwa39JuqrjTGToRwjuOMVPUTxBwGAgxrOyPzxV+WwqdibKN1VMWeN4vm1lRP
         DaUA==
X-Forwarded-Encrypted: i=1; AJvYcCWgCkEsgCD+rW64QevvjnPXPk0MFdgl8mtNpW1YQOPJUg1AcVmMydz4RbZ8lriCSaXwV2PdHx9EbFs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhGXgDMXGKotGGyrXmP52cAGNNLp8yROP9TZQNWt307+k5MO0U
	5QZ4I5A9Mmh745DcY2JgnUMPeAgPJxGinEbEgelMRTBNGfwr4cwxsIi77O4vIjVDeXP7AVztoMy
	YNfXRmYKbWvwm0XRNYmynZq52l7Zjfcx8NZTa
X-Gm-Gg: ASbGncvlf5fRLF8rWde6YhgXKYU3we6JyRhVT6lsM9KK9zEzjaQZDCF4vd1/T4zx5nl
	DsnI5FpZ09aVisOlfntiT0Z9JNBImWK1sOCUNqEMO0HPC1JOF44T4PrvWfEitACXBcf7QE5RNt1
	8enNkhrb200nhmw+hgHiuH143ogU7kC0wS3jzZKbdscBkMUnYosybWsfZW
X-Google-Smtp-Source: AGHT+IGe1he6VcB1HjanCrhxVAfQjIesMa6esygphkYmjhBdMP180Rn3O9/cuFUiPeqzOl258PSQo96dNzHqinw3Rqo=
X-Received: by 2002:a05:6000:1888:b0:39a:c80b:8288 with SMTP id
 ffacd0b85a97d-39d6fc83ac7mr10495756f8f.33.1744120551236; Tue, 08 Apr 2025
 06:55:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250305110814.272792-1-fujita.tomonori@gmail.com> <20250305110814.272792-5-fujita.tomonori@gmail.com>
In-Reply-To: <20250305110814.272792-5-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 8 Apr 2025 15:55:38 +0200
X-Gm-Features: ATxdqUHiYJtkNt0G-spjemExiwLroDOvAjC-UywxGL0GYlMeas4Df-5aHcFmNEQ
Message-ID: <CAH5fLgiDx5CQQMv=k=ejFYGM=ey1-dgQ44s1Ej1k2+mL7vnZaA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] rust: Add warn_on macro
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

On Wed, Mar 5, 2025 at 12:10=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add warn_on macro, uses the BUG/WARN feature (lib/bug.c) via assembly
> for x86_64/arm64/riscv.
>
> The current Rust code simply wraps BUG() macro but doesn't provide the
> proper debug information. The BUG/WARN feature can only be used from
> assembly.
>
> This uses the assembly code exported by the C side via ARCH_WARN_ASM
> macro. To avoid duplicating the assembly code, this approach follows
> the same strategy as the static branch code: it generates the assembly
> code for Rust using the C preprocessor at compile time.
>
> Similarly, ARCH_WARN_REACHABLE is also used at compile time to
> generate the assembly code; objtool's reachable anotation code. It's
> used for only architectures that use objtool.
>
> For now, Loongarch just uses a wrapper for WARN macro.
>
> UML doesn't use the assembly BUG/WARN feature; just wrapping generic
> BUG/WARN functions implemented in C works.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Overall looks reasonable. A few nits below:

> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH)))]
> +#[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> +macro_rules! warn_flags {
> +    ($flags:expr) =3D> {
> +        const FLAGS: u32 =3D $crate::bindings::BUGFLAG_WARNING | $flags;
> +        const _FILE: &[u8] =3D file!().as_bytes();
> +        // Plus one for null-terminator.
> +        static FILE: [u8; _FILE.len() + 1] =3D {
> +            let mut bytes =3D [0; _FILE.len() + 1];
> +            let mut i =3D 0;
> +            while i < _FILE.len() {
> +                bytes[i] =3D _FILE[i];
> +                i +=3D 1;
> +            }
> +            bytes
> +        };
> +        // SAFETY: Just an FFI call.
> +        unsafe {
> +            $crate::asm!(concat!(
> +                "/* {size} */",
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generate=
d_arch_warn_asm.rs")),
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generate=
d_arch_reachable_asm.rs")));
> +            file =3D sym FILE,
> +            line =3D const line!(),
> +            flags =3D const FLAGS,
> +            size =3D const ::core::mem::size_of::<$crate::bindings::bug_=
entry>(),

The indentation here is odd. Shouldn't the arguments be indented one more?

> +            );
> +        }
> +    }
> +}
> +
> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH)))]
> +#[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
> +macro_rules! warn_flags {
> +    ($flags:expr) =3D> {
> +        const FLAGS: u32 =3D $crate::bindings::BUGFLAG_WARNING | $flags;
> +        // SAFETY: Just an FFI call.
> +        unsafe {
> +            $crate::asm!(
> +            concat!(
> +                "/* {size} */",
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generate=
d_arch_warn_asm.rs")),
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generate=
d_arch_reachable_asm.rs")));
> +            flags =3D const FLAGS,
> +            size =3D const ::core::mem::size_of::<$crate::bindings::bug_=
entry>(),

Same thing here.

> +            );
> +        }
> +    }
> +}
> +
> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, CONFIG_UML))]
> +macro_rules! warn_flags {
> +    ($flags:expr) =3D> {
> +        // SAFETY: Just an FFI call.
> +        unsafe {
> +            $crate::bindings::warn_slowpath_fmt(
> +                $crate::c_str!(::core::file!()).as_ptr() as *const ::cor=
e::ffi::c_uchar,
> +                line!() as i32,
> +                $flags as u32,
> +                ::core::ptr::null() as *const ::core::ffi::c_uchar,

Why unsigned char? I think this should be ::kernel::ffi::c_char to
utilize the custom integer type definitions in kernel rather than the
faulty ones in core.

(Maybe $crate rather than kernel)

Alice
