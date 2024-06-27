Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8109C7BB14
	for <loongarch@lists.linux.dev>; Thu, 27 Jun 2024 08:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719477296; cv=none; b=lyJ8gzONcljGPWJhfqFVYRNC0Nd3DLUbwdO5fDibzdCIbggAr5E1/sgURieB9dqRjSb3SZrUCN8O2VqyOsOIDOMBSJkWkfKR+QMcZkRC6CcKiev5NZFyX65YMQM2jgvozEp6yzaiw+ow91hH7jPoCz1rzgygleSgxrJ/WYs6/i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719477296; c=relaxed/simple;
	bh=jaHYq9qHI0Bww45jO0JOW2KKMuvYkD8u1X20gL+6tFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CqMhivQUP8FFBNdjYGXBxGYn0ehx6yZnS55eTFd90qZsmJuh7jHkB8CYX/Gl9ANhvnahNYFeh3oXSK1UY0KTnDTgMtzJwN5+e0N9mIapsV1uN2vdusYEElhrUIKKeS2v0IDVbsS48R/t4udd9bJttyPt85z1MMz9SSHwbdf1wgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BJGoc350; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BJGoc350"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52cdea1387eso5378955e87.0
        for <loongarch@lists.linux.dev>; Thu, 27 Jun 2024 01:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719477292; x=1720082092; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaHYq9qHI0Bww45jO0JOW2KKMuvYkD8u1X20gL+6tFY=;
        b=BJGoc3502XS/biBu5Wg2Qm0Zy5jjVMDFImE11mHq+lJ0FkM6P8gHe2ZYyO4HJ1Ozj4
         uy6cH7x3oE3QHjtiN9PySoUN6sUEWRC9Y26Vzv/z5ZjGCL4kzsOxIcX6IURcxqZ07LdX
         4VwU2uTOSJyqp3InWiN9bixRTL4xRZrE27J9whViUkSBUrVm1HJJDhlovHlZXXNbhrQx
         QJPVkeDLT5qyUOJTfrz1ghwYEOsYdmcOcywEeLgtCpineejTrdN32t3rNLal44BqACZS
         u3pzYiJZrSF5i5nKzownPQQMu9R/YlyP382DygFWtYbpi56qilo4ZBhjkF71Bd3xcYPf
         Xvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719477292; x=1720082092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaHYq9qHI0Bww45jO0JOW2KKMuvYkD8u1X20gL+6tFY=;
        b=gbFfJWilxcZANV58yUD/GirRI5X7XdSwMoUn11wkjMf3q1I0tc+IhScHcIftK3tQJv
         cG/GrcAvyfKD2fYs8FLpWshloLXHNQzguxIHRO7t/+nKwT2bdUCephvmjQ1QMTtvSvuY
         MSqbjhVa+ldlsuJmiG9nGQjOTPSIyB52nNW2AZeiIVBu189DcGrJM6U/wtUplGsp9sd/
         tmIlnq93nqZWx+m0vC7coZTpmqr768sWDsEP7aUnYw1Eh0wNEB45IrUZxgk0C7npVrhH
         /wBsmWpIAROX1+4adhl5gUQ871w+Y3teVDOnrp1FuhEo5pRi6PP9I9kZJQMBMw4GZYW8
         EM5w==
X-Forwarded-Encrypted: i=1; AJvYcCVHHJY+s41dGTfNOifKgol31cvYwFyW5yPCS+nijmfykuvnP4s+k0c0d8A757ry8U0+dIPiuKxAC/VAnZYEMcoo0fCEM7c40mXE
X-Gm-Message-State: AOJu0YzlUPXutFpfcDmfr/tVUoZxDdsf6XQhsPhtL8Y0FlTeEs5s4qvU
	gVQaIFzKt9El9pEOm1PXqeGW/9/dhfwL47z43nSQ4QVjzxY6rQMTG5zdghQ68AAeKIVaSEHNlpJ
	9i9NOkZHvjyjGaX17I+t8FIdsnzBoEmaCgeb/
X-Google-Smtp-Source: AGHT+IHlfk5WkDZhxtSr6xoYbVkipq/AGMIGI9Dxm9ats0II6c5lJlSMjq4hKwrgepsNKkozKV3mIVOymMLBYvUkPo4=
X-Received: by 2002:a05:6512:203b:b0:52c:df55:e112 with SMTP id
 2adb3069b0e04-52ce1832119mr6963173e87.6.1719477291466; Thu, 27 Jun 2024
 01:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240621-tracepoint-v3-0-9e44eeea2b85@google.com>
 <20240621-tracepoint-v3-1-9e44eeea2b85@google.com> <ZnrtuaUByT70tJY5@boqun-archlinux>
In-Reply-To: <ZnrtuaUByT70tJY5@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 27 Jun 2024 10:34:39 +0200
Message-ID: <CAH5fLgjCAbz39-8EzBxxrWFXFg6VK=ts98BBvpEk8=RZoMuBSA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: add static_key_false
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)" <peterz@infradaed.org>, 
	Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 6:18=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Hi Alice,
>
> On Fri, Jun 21, 2024 at 10:35:26AM +0000, Alice Ryhl wrote:
> > Add just enough support for static key so that we can use it from
> > tracepoints. Tracepoints rely on `static_key_false` even though it is
> > deprecated, so we add the same functionality to Rust.
> >
> > It is not possible to use the existing C implementation of
> > arch_static_branch because it passes the argument `key` to inline
> > assembly as an 'i' parameter, so any attempt to add a C helper for this
> > function will fail to compile because the value of `key` must be known
> > at compile-time.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> [Add linux-arch, and related arch maintainers Cced]
>
> Since inline asms are touched here, please consider copying linux-arch
> and arch maintainers next time ;-)

Will do.

> For x86_64 and arm64 bits:
>
> Acked-by: Boqun Feng <boqun.feng@gmail.com>
>
> One thing though, we should split the arch-specific impls into different
> files, for example: rust/kernel/arch/arm64.rs or rust/arch/arm64.rs.
> That'll be easier for arch maintainers to watch the Rust changes related
> to a particular architecture.

Is that how you would prefer to name these files? You don't want
static_key somewhere in the filename?

> Another thought is that, could you implement an arch_static_branch!()
> (instead of _static_key_false!()) and use it for static_key_false!()
> similar to what we have in C? The benefit is that at least for myself
> it'll be easier to compare the implementation between C and Rust.

I can try to include that.

Alice
