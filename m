Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372148634C
	for <loongarch@lists.linux.dev>; Mon,  3 Mar 2025 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741008836; cv=none; b=OHAMkLEjiZMEz+Lc5MvYqjmbSy+HwNcBseWb3JpSsp9Jv3YQOo/k16Im/NK9p641sTJeGLy0CcXhNd1ULgNuZ9HKw2Hyb8ukPe60aPt500cMZz0ctks4r1GrnAm9KYO3J5ki/QFH5Ox59CzQ3CIADxAr4zVQmGLYoaICDp1RVCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741008836; c=relaxed/simple;
	bh=0CT7Dtja27wpKuPK0J3uUyCc6Y5dVR1K8M0npmQguYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PvA826M6SO6lvs8vFrPeBVcgeqoszqC6H3HkM2J6TFDe3KndFL0e6/EbmvrqJlbRoqRCebpZVezOweyH5cJkTCzEaFac7ggH3EJGu8klrkros4VVx0PMYwWOgm0aGpL9UV29H5RQOGyootqqgiEkEolMli9i9DErWA0xE70bhgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EBycazUP; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EBycazUP"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso2308439f8f.3
        for <loongarch@lists.linux.dev>; Mon, 03 Mar 2025 05:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741008831; x=1741613631; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98OQ8wvaJ9wtoqY/FnFWTw/2aTBVHaqyurEF1+7THsM=;
        b=EBycazUPtiOS0jxUoc7+rx0za6WsDcWyXA39bsFVqp5l04Wf18P5LpuD03hSO/uFbK
         c3BO0IQGzYZig41zHTOVggcXHLO7IO5Sb/a5BQgJPx5vE6BKrJ/aPnU4ZtMyeKYT7TUu
         zROmi+OjrZjLZQYzCF9OQYh5yg9Ph4zToWp8UaS3encMBXw7CY4HnkoSZrNoK6iHGRPJ
         6/fIUKwGVp3PUo79f3UwuCTPH8oAiDPImvy9IPxNXK6ejO66gj57meHrQ1FgdUrF69m9
         CRo22dmsfriWD0UA7mF/pUo1/s9ZDc2y/1zFlUhOhlUY3xSn5OD1nuq7r3zG6LzK0fm8
         S74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741008831; x=1741613631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98OQ8wvaJ9wtoqY/FnFWTw/2aTBVHaqyurEF1+7THsM=;
        b=E+QJEiUyMb0/uMgIKBOEe6g0TkN/kf//aS1C63NH34sHEHLT5gbKwDGBNdjzziQKGO
         U7EsDoyU7iMxXS1h3OKwpNTWGi/AeuISY1bBBlDyQUwSLa0Z/HKB0Sq8q6c3mgycRX2t
         WflM8dnnJkiaBmbZ5hwPGJObr5wvA6QaIZD0aZP2okD+GH3UhwhIbjqap1aOZD7eVCx0
         FQiaFgbidlvTL/hTRt8ArdguFLiNkRj6j1BdUA7Bcgte9cwyXhbDUCxiy12hrdEIOp4b
         CbEfXK6Ejq4D2AHG/x+t4zNRUOFnJIPL3aXSa+/hoM+gO2G5fiWuvEkB5DDieUSUQ2+8
         1Eyg==
X-Forwarded-Encrypted: i=1; AJvYcCWhWF4DVtOYiHy+faTKkXmMNtDBOnP1D/6hIOXiwrM5XZAbb6NKewlg6VHnjxgyjB/DcNqvBn8eSDw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/w8QT5DNDemwq37RzcMv0AVDxDIKQ4Z+Gm0yJBX67hWpymPOK
	0rcNJC3cCD1OpF2epVy46E7773GYdg3wY2ir8/rbeionrLm9QBHNhVFP1QTnqda/cn2gGkOCiM8
	Tkd5+pPqQBnBcERpoFIUyt9xp5k/udmUK55n1
X-Gm-Gg: ASbGncsd4SzfVSu5Zyyvt4cljnjHpJArR9ch+Arujdy60Bx/IjFQ2Nhb39nFuulJHDa
	3+/jj1SewdVPa9XgGPcXMY8dvkGtm2fO+k3XaoTy9T39LKRJCCiZLl2bTGH+JiHBfLTlDU5avqN
	ykkedH22ZbDxOYqsJ1ON/cdy6HScLb0DT6sPrAXKnbOabAenDN5IRQbeE5
X-Google-Smtp-Source: AGHT+IE8JWpQtarWwp+2hNt/MR6epGuJDDazTrc2gMvmQUZSN/QRsDdQQeOGHqHvxcXWjRP0+QCxyieUoVOMPKqMUFM=
X-Received: by 2002:a05:6000:1f8a:b0:390:fc83:a070 with SMTP id
 ffacd0b85a97d-390fc83a160mr6688529f8f.0.1741008831435; Mon, 03 Mar 2025
 05:33:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250213135759.190006-1-fujita.tomonori@gmail.com> <20250213135759.190006-6-fujita.tomonori@gmail.com>
In-Reply-To: <20250213135759.190006-6-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 14:33:39 +0100
X-Gm-Features: AQ5f1JoT3yLvXrcqi1UY1px9Dirgxz3oFETPYn_JBDKUcmKVulP6_KvtwihScxI
Message-ID: <CAH5fLgjX9hh+QRrKggOKr+6p+UwqHSavzu4UXy9iGNL2wSJXtg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] rust: Add warn_on and warn_on_once
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

On Thu, Feb 13, 2025 at 3:01=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
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
>
> Similarly, ARCH_WARN_REACHABLE is also used at compile time to
> generate the assembly code; objtool's reachable anotation code. Only
> architectures that use objtool (x86 and loongarch) need it.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/Makefile                                 |   8 ++
>  rust/kernel/.gitignore                        |   2 +
>  rust/kernel/bug.rs                            | 100 ++++++++++++++++++
>  rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
>  rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
>  rust/kernel/lib.rs                            |   1 +
>  6 files changed, 125 insertions(+)
>  create mode 100644 rust/kernel/bug.rs
>  create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
>  create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 8fcfd60447bc..a295b65c43f3 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -34,6 +34,9 @@ obj-$(CONFIG_RUST_KERNEL_DOCTESTS) +=3D doctests_kernel=
_generated.o
>  obj-$(CONFIG_RUST_KERNEL_DOCTESTS) +=3D doctests_kernel_generated_kunit.=
o
>
>  always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) +=3D kernel/genera=
ted_arch_static_branch_asm.rs
> +ifndef CONFIG_UML
> +always-$(subst y,$(CONFIG_RUST),$(CONFIG_BUG)) +=3D kernel/generated_arc=
h_warn_asm.rs kernel/generated_arch_reachable_asm.rs
> +endif
>
>  # Avoids running `$(RUSTC)` when it may not be available.
>  ifdef CONFIG_RUST
> @@ -481,5 +484,10 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_e=
rror.o \
>  ifdef CONFIG_JUMP_LABEL
>  $(obj)/kernel.o: $(obj)/kernel/generated_arch_static_branch_asm.rs
>  endif
> +ifndef CONFIG_UML
> +ifdef CONFIG_BUG
> +$(obj)/kernel.o: $(obj)/kernel/generated_arch_warn_asm.rs $(obj)/kernel/=
generated_arch_reachable_asm.rs
> +endif
> +endif
>
>  endif # CONFIG_RUST
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
> diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
> new file mode 100644
> index 000000000000..7ffd9cb1ad75
> --- /dev/null
> +++ b/rust/kernel/bug.rs
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2024 FUJITA Tomonori
> +
> +//! Support for BUG_* and WARN_* functionality.
> +//!
> +//! C header: [`include/asm-generic/bug.h`](srctree/include/asm-generic/=
bug.h)
> +
> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
> +macro_rules! warn_flags {
> +    ($flags:expr) =3D> {
> +        const FLAGS: u32 =3D $crate::bindings::BUGFLAG_WARNING | $flags;
> +        // SAFETY: Just an FFI call.
> +        #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> +        unsafe {
> +            $crate::asm!(concat!(
> +                "/* {size} */",
> +                ".pushsection .rodata.str1.1, \"aMS\",@progbits, 1\n",
> +                "111:\t .string ", "\"", file!(), "\"\n",
> +                ".popsection\n",

It looks like you're doing this so that you can reference the filename
with "111b", but could you do this instead:

const _FILE: &[u8] =3D file!().as_bytes();
// Plus one for nul-terminator.
static FILE: [u8; 1 + _FILE.len()] =3D {
    let mut bytes =3D [0; 1 + _FILE.len()];
    let mut i =3D 0;
    while i < _FILE.len() {
        bytes[i] =3D _FILE[i];
        i +=3D 1;
    }
    bytes
};

and then use

asm!(
    concat!(
        "/* {size} */",
        include!(concat!(env!("OBJTREE"),
"/rust/kernel/generated_arch_warn_asm.rs")),
        include!(concat!(env!("OBJTREE"),
"/rust/kernel/generated_arch_reachable_asm.rs")));
    file =3D sym FILE,
    line =3D const line!(),
    ...
);

with
::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}",
"{flags}", "{size}")),

That would be a lot simpler to understand than what you are doing.


Alice
