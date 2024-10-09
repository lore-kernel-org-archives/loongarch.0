Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2AC5103F
	for <loongarch@lists.linux.dev>; Wed,  9 Oct 2024 20:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728504951; cv=none; b=LLSNImUkGPg59+vQ0XtbkWOCXAwGYVkcDQ1jf0cCcqZ11JB7y0f0F/YTQdriuC/9/2ASfpmkbMHabq/q5dYoEbFlAl/gvPJ5GL+mi+jV1eKv/WA+fcEnrTt9I4uf13UhY6rC0cdpyk775C/ckO3ktt1uIMMm0AGWBsIKUxSJW7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728504951; c=relaxed/simple;
	bh=hDUR54sV7mPX+rddCrnMseo+c7xhgh8efJh15DV0obo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gl/qBbGsJTB9R2O26IbUACkn1S85oiJib/dUiXedllTu/LX5FnvJCQfsm0FAepRLt/fbWd5kAqhg9nCKpwIwzql7hO/gvbiImUwiuUzYYUla/ACp1qI6lBqPcQlabcuubEv8+9eSMxiHPN5G+6u6GZ4sQwNy8FFTH7Pky/HARgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tvHSEyYn; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tvHSEyYn"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d447de11dso86659f8f.1
        for <loongarch@lists.linux.dev>; Wed, 09 Oct 2024 13:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728504948; x=1729109748; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDUR54sV7mPX+rddCrnMseo+c7xhgh8efJh15DV0obo=;
        b=tvHSEyYn6envQUG1JM9th0mYu7c7T9/X+VShZiv8dI0Aet3TREN94VBfUyxb8EXdP1
         1ot3VS0QWNGXs+MXmfihFtDzJ9I4qlVM+PMQDKV2gZ8oXnh1u/5RrASuKanlvnvksJsT
         S+E127/BXXcbu5xVy2UToB/i5y8CCTFQNE6OXiO4zkS5FIoVS0zOBlJ/2ECKaPXjaOYy
         3PeqzVfDXoDiHecK6307YdFEWEkpTIjcPUHSKk2Kr+QRzKCiGgeJg4eph9cd/+umvCrl
         RWRr3QvJWWIWmY/Vyu7duA87CdI28qXrhJdbjNoZTBISxhl94yDpuUs+EZ+Mf2EjUBAR
         bmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728504948; x=1729109748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDUR54sV7mPX+rddCrnMseo+c7xhgh8efJh15DV0obo=;
        b=ugR6H2dP9B8zPdShoffFWRds2r8adgkFNkXdeoxstrKrv/V5vpfXv1/mMpYyw5LMy8
         GAaf8O76TzffCfu8+dm8wliQKo6mM+kTwy6hNE9Rrd6fHETWkkf0N30eTEsbnP9e2GPR
         JCLrUbM+AXj2DetlbUCGpMsg+qYKPHrNDam79AlAEDGhXzQ54oH8CodFu6ivigT6X24b
         tBrGAF66vKJJxr/XOV1U6Bv9YvbXwulbEIXnNh8PC7eHfegudzf+R8vaIOSZ0U/Z4kRM
         cvxs0rzVgFxMYXd2Zp2q89sa0mqV4173jQuDN1Rq6NivyjI8Fdl6UQoBMpaAf0C5vJMp
         h2lw==
X-Forwarded-Encrypted: i=1; AJvYcCVkRRVxDj4qPfneEXM/C4Tc39j3XrYYFGpfHwy9IIpdbgaXIXshPWUeRiuxaIHqG9/CY/qxuhwRuk0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEF133nhPDL7XoIu2MdhNVs4EoO1Hq2PsGwj0+l/Hk732GvqaM
	VBLGa3OVjcawtP88sJFt13nFkK3fXa6sLceiLnUQoemzV8awlTj9n1EzEvbcKkvdAOtHpum6wG5
	OpZ7IltO2poZeRGAM9RgNoYt/p4PflWxX6EDM
X-Google-Smtp-Source: AGHT+IG4D5AOPjh6lAXMstFdrhAhrdd7L2vLhW6l3Khj2c6DWfn6O2lqOxYWrYJyoYoq7CXtYj1MgecC9kXuRRTO+64=
X-Received: by 2002:a5d:4b8c:0:b0:37c:d4f8:3f2e with SMTP id
 ffacd0b85a97d-37d3aacddcfmr2403355f8f.55.1728504947756; Wed, 09 Oct 2024
 13:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com> <ZwbAvEnrzu6UUgGl@J2N7QTR9R3>
In-Reply-To: <ZwbAvEnrzu6UUgGl@J2N7QTR9R3>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 9 Oct 2024 22:15:35 +0200
Message-ID: <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all architectures
To: Mark Rutland <mark.rutland@arm.com>, Matthew Maurer <mmaurer@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 7:43=E2=80=AFPM Mark Rutland <mark.rutland@arm.com> =
wrote:
>
> Hi Alice,
>
> On Tue, Oct 08, 2024 at 05:37:16PM +0000, Alice Ryhl wrote:
> > The KCFI sanitizer stores the CFI tag of a function just before its
> > machine code. However, the patchable-function-entry flag can be used to
> > introduce additional nop instructions before the machine code, taking u=
p
> > the space that normally holds the CFI tag.
>
> To clarify, when you say "before the machine code", do you mean when
> NOPs are placed before the function entry point? e.g. if we compiled
> with -fpatchable-function-entry=3DM,N where N > 0? I'll refer tho this as
> "pre-function NOPs" below.
>
> There's an existing incompatibility between CFI and pre-function NOPs
> for C code, because we override -fpatchable-function-entry on a
> per-function basis (e.g. for noinstr and notrace), and we don't
> currently have a mechanism to ensure the CFI tag is in the same place
> regardless. This is why arm64 has CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
> depend on !CFI.
>
> For C code at least, just using regular -fpatchable-function-entry=3DM or
> -fpatchable-function-entry=3DM,0 shouldn't change the location of the CFI
> tag relative to the function entrypoint, and so should have no adverse
> effect on CFI.
>
> Is Rust any different here?

Ah, no it shouldn't be. Sami can you confirm?

> > In this case, a backwards offset is applied to the CFI tag to move
> > them out of the way of the nop instructions. To ensure that C and Rust
> > agree on the offset used by CFI tags, pass the
> > -Zpatchable-function-entry to rustc whenever it is passed to the C
> > compiler.
>
> As above, I suspect this isn't necessary to make CFI work, for any case
> that works with C today, due to -fpatchable-funtion-entry being
> overridden on a per-function basis. Are you seeing a problem in
> practice, or was this found by inspection?
>
> However IIUC this will allow rust to be traced via ftrace (assuming rust
> records the instrumented locations as gcc and clang do); is that the
> case? Assuming so, is there any ABI difference that might bite us? On
> arm64 we require that anything marked instrumented with
> patchable-function-entry strictly follows the AAPCS64 calling convention
> and our ftrace trampolines save/restore the minimal set of necessary
> registers, and I don't know how rust whether rust will behave the same
> or e.g. use specialized calling conventions internally.

Well, I was told that it's a problem and was able to trigger a failure
on x86. I didn't manage to trigger one on arm64, but I wasn't sure
whether that was me doing something wrong, or whether the problem only
exists on x86. We already have the flag on x86 for FINEIBT, but I
thought on the off chance that it's not a problem in practice on arm,
it still doesn't hurt to add the flag.

Regarding the AAPCS64 calling convention thing ... rustc uses the Rust
calling convention for functions internally in Rust code and I don't
know whether that changes anything relevant for what you mention.
Matthew/Sami do you know?

Alice
